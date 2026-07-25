<#
.SYNOPSIS
    Exports a user, license, and group membership audit for the Tonie-Osegbo
    Technologies Limited tenant using the Microsoft Graph PowerShell SDK.

.DESCRIPTION
    Pulls core identity attributes, license assignments, and group membership
    for all users in the tenant and writes each to a timestamped CSV in
    /reports. Meant to back up the identity lifecycle and access governance
    docs with something that can actually be re-run, not just a one-off
    screenshot.

.NOTES
    Requires the Microsoft.Graph PowerShell SDK module.
    Run Connect-MgGraph interactively before running unattended, or set up
    an app registration with the scopes below if this needs to run on a
    schedule later.

    Required scopes: User.Read.All, Group.Read.All, GroupMember.Read.All,
    Directory.Read.All

.EXAMPLE
    .\Get-M365UserAndGroupAudit.ps1
    .\Get-M365UserAndGroupAudit.ps1 -OutputPath "..\reports"
#>

param(
    [string]$OutputPath = "..\reports"
)

# Make sure we're actually connected before doing anything else.
$context = Get-MgContext
if (-not $context) {
    Write-Host "Not connected to Microsoft Graph. Connecting now..." -ForegroundColor Yellow
    Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All", "GroupMember.Read.All", "Directory.Read.All"
}

$timestamp = Get-Date -Format "yyyy-MM-dd"
if (-not (Test-Path $OutputPath)) {
    New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
}

# ---------------------------------------------------------------------------
# 1. User attribute export
# ---------------------------------------------------------------------------
# This is the "who is this employee" report - department, job title,
# manager, location, account status. Maps directly to the required
# attributes listed in docs/03-identity-lifecycle-management.md.

Write-Host "Pulling user attributes..." -ForegroundColor Cyan

$users = Get-MgUser -All -Property Id, DisplayName, UserPrincipalName, Department, `
    JobTitle, OfficeLocation, AccountEnabled, CreatedDateTime, `
    OnPremisesExtensionAttributes | Select-Object `
    DisplayName, UserPrincipalName, Department, JobTitle, OfficeLocation, `
    AccountEnabled, CreatedDateTime

# Manager isn't returned in the same call - it's a separate relationship
# lookup per user, so pull it in a second pass and merge it in.
$userReport = foreach ($user in $users) {
    $managerName = $null
    try {
        $manager = Get-MgUserManager -UserId ($users | Where-Object { $_.UserPrincipalName -eq $user.UserPrincipalName }).Id -ErrorAction Stop
        $managerName = $manager.AdditionalProperties["displayName"]
    }
    catch {
        # No manager set - not an error, just leave it blank
    }

    [PSCustomObject]@{
        DisplayName       = $user.DisplayName
        UserPrincipalName = $user.UserPrincipalName
        Department        = $user.Department
        JobTitle          = $user.JobTitle
        OfficeLocation    = $user.OfficeLocation
        Manager           = $managerName
        AccountEnabled    = $user.AccountEnabled
        CreatedDateTime   = $user.CreatedDateTime
    }
}

$userReportPath = Join-Path $OutputPath "user-attributes-$timestamp.csv"
$userReport | Export-Csv -Path $userReportPath -NoTypeInformation
Write-Host "User attribute report written to $userReportPath" -ForegroundColor Green

# ---------------------------------------------------------------------------
# 2. License assignment export
# ---------------------------------------------------------------------------
# Shows who has what assigned - useful for the "license reclaimed on
# departure" and "license assigned on join" steps in the lifecycle docs.

Write-Host "Pulling license assignments..." -ForegroundColor Cyan

$skuLookup = Get-MgSubscribedSku | Select-Object SkuId, SkuPartNumber
$skuMap = @{}
foreach ($sku in $skuLookup) { $skuMap[$sku.SkuId] = $sku.SkuPartNumber }

$licenseReport = foreach ($user in (Get-MgUser -All -Property DisplayName, UserPrincipalName, AssignedLicenses)) {
    if ($user.AssignedLicenses.Count -eq 0) {
        [PSCustomObject]@{
            DisplayName       = $user.DisplayName
            UserPrincipalName = $user.UserPrincipalName
            Licenses          = "None"
        }
    }
    else {
        $licenseNames = $user.AssignedLicenses | ForEach-Object { $skuMap[$_.SkuId] }
        [PSCustomObject]@{
            DisplayName       = $user.DisplayName
            UserPrincipalName = $user.UserPrincipalName
            Licenses          = ($licenseNames -join "; ")
        }
    }
}

$licenseReportPath = Join-Path $OutputPath "license-assignments-$timestamp.csv"
$licenseReport | Export-Csv -Path $licenseReportPath -NoTypeInformation
Write-Host "License report written to $licenseReportPath" -ForegroundColor Green

# ---------------------------------------------------------------------------
# 3. Group membership export
# ---------------------------------------------------------------------------
# One row per group-member pair, so it's easy to filter in Excel by either
# group or user. Also pulls the group owner, since group ownership is one
# of the governance points called out in doc 03 and doc 06.

Write-Host "Pulling group membership and ownership..." -ForegroundColor Cyan

$groups = Get-MgGroup -All -Property Id, DisplayName

$groupReport = foreach ($group in $groups) {
    $owners = Get-MgGroupOwner -GroupId $group.Id
    $ownerNames = ($owners | ForEach-Object { $_.AdditionalProperties["displayName"] }) -join "; "

    $members = Get-MgGroupMember -GroupId $group.Id

    if ($members.Count -eq 0) {
        [PSCustomObject]@{
            GroupName = $group.DisplayName
            Owners    = $ownerNames
            Member    = "No members"
        }
    }
    else {
        foreach ($member in $members) {
            [PSCustomObject]@{
                GroupName = $group.DisplayName
                Owners    = $ownerNames
                Member    = $member.AdditionalProperties["displayName"]
            }
        }
    }
}

$groupReportPath = Join-Path $OutputPath "group-membership-$timestamp.csv"
$groupReport | Export-Csv -Path $groupReportPath -NoTypeInformation
Write-Host "Group membership report written to $groupReportPath" -ForegroundColor Green

Write-Host "`nAudit complete. Reports saved to $OutputPath" -ForegroundColor Green
