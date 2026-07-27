<#
.SYNOPSIS
    Exports a user, license, and group membership audit for a manually
    curated list of test objects only, using the Microsoft Graph
    PowerShell SDK.

.DESCRIPTION
    Pulls core identity attributes, license assignments, and group
    membership - but only for the exact Object IDs listed in
    $IncludeUserIds and $IncludeGroupIds below. Nothing else in the
    tenant is queried or written out. This is deliberate: this tenant is
    real, not a sandbox, so the script does not do any pattern or
    name-based filtering - only an explicit allowlist of IDs you've
    added yourself.

    Group membership rows are also filtered against $IncludeUserIds, so
    even a listed test group's real owners/members won't show up unless
    their ID is also in the allowlist.

.NOTES
    Requires the Microsoft.Graph PowerShell SDK module.
    Required scopes: User.Read.All, Group.Read.All, GroupMember.Read.All,
    Directory.Read.All

    To find Object IDs: Entra admin center > each user/group's Overview
    page, or run this once (prints to screen, nothing exported):
        Get-MgUser -All | Where-Object { $_.DisplayName -like "*Tonie*" } | Select-Object DisplayName, Id
        Get-MgGroup -All | Where-Object { $_.DisplayName -like "*Tonie*" } | Select-Object DisplayName, Id

.EXAMPLE
    .\Get-M365UserAndGroupAudit.ps1
#>

param(
    [string]$OutputPath = "..\reports",

    # Object IDs of the exact test users to include. Nothing else gets
    # queried. Add IDs here before running.
    [string[]]$IncludeUserIds = @(
        "31fcd5e7-82f5-486c-863a-ff165b2231ac",  # Tonie-Test Support
        "e38c7523-7fad-40e7-a3a7-b9b4951f0d7f",  # Tonie Four
        "c1df85a3-3773-4803-b57c-9164dd4bdc2c",  # Tonie Three
        "19c73ce3-cd47-404c-b585-e0c18696a873"   # Tonie Two
    ),

    # Object IDs of the exact test groups to include.
    [string[]]$IncludeGroupIds = @(
        "2fd3926f-620f-47bf-83ff-674e2c8e0ad6",  # Tonie Finance Team
        "b559b37d-61ee-46cd-b8ad-1949b7bed86a",  # TonieGruppo
        "f603d794-bdf8-484c-b423-e1951d2c5fa0",  # Tonie_Test Project Team
        "fc88b3d0-6aed-4522-ab2c-148128c748c7"   # TonieTeknikal
    )
)

if ($IncludeUserIds.Count -eq 0 -and $IncludeGroupIds.Count -eq 0) {
    Write-Host "STOP: `$IncludeUserIds and `$IncludeGroupIds are both empty. Add the Object IDs of your test users/groups before running this. Aborting." -ForegroundColor Red
    return
}

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

Write-Host "Pulling attributes for $($IncludeUserIds.Count) listed test user(s)..." -ForegroundColor Cyan

$users = foreach ($id in $IncludeUserIds) {
    try {
        Get-MgUser -UserId $id -Property Id, DisplayName, UserPrincipalName, Department, `
            JobTitle, OfficeLocation, AccountEnabled, CreatedDateTime -ErrorAction Stop
    }
    catch {
        Write-Host "  Could not find user with ID $id - skipping." -ForegroundColor Yellow
    }
}

# Manager isn't returned in the same call - it's a separate relationship
# lookup per user, so pull it in a second pass and merge it in.
$userReport = foreach ($user in $users) {
    $managerName = $null
    try {
        $manager = Get-MgUserManager -UserId $user.Id -ErrorAction Stop
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

Write-Host "Pulling license assignments for listed test user(s)..." -ForegroundColor Cyan

$skuLookup = Get-MgSubscribedSku | Select-Object SkuId, SkuPartNumber
$skuMap = @{}
foreach ($sku in $skuLookup) { $skuMap[$sku.SkuId] = $sku.SkuPartNumber }

$licenseReport = foreach ($user in $users) {
    $fullUser = Get-MgUser -UserId $user.Id -Property DisplayName, UserPrincipalName, AssignedLicenses
    if ($fullUser.AssignedLicenses.Count -eq 0) {
        [PSCustomObject]@{
            DisplayName       = $fullUser.DisplayName
            UserPrincipalName = $fullUser.UserPrincipalName
            Licenses          = "None"
        }
    }
    else {
        $licenseNames = $fullUser.AssignedLicenses | ForEach-Object { $skuMap[$_.SkuId] }
        [PSCustomObject]@{
            DisplayName       = $fullUser.DisplayName
            UserPrincipalName = $fullUser.UserPrincipalName
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

Write-Host "Pulling membership and ownership for $($IncludeGroupIds.Count) listed test group(s)..." -ForegroundColor Cyan

$groups = foreach ($id in $IncludeGroupIds) {
    try {
        Get-MgGroup -GroupId $id -Property Id, DisplayName -ErrorAction Stop
    }
    catch {
        Write-Host "  Could not find group with ID $id - skipping." -ForegroundColor Yellow
    }
}

$groupReport = foreach ($group in $groups) {
    # Even for a listed test group, only report owners/members whose ID is
    # also in $IncludeUserIds - a test group can still have a real account
    # attached as owner (e.g. you, since you created it).
    $owners = Get-MgGroupOwner -GroupId $group.Id |
        Where-Object { $IncludeUserIds -contains $_.Id } |
        ForEach-Object { $_.AdditionalProperties["displayName"] }
    $ownerNames = if ($owners) { $owners -join "; " } else { "(none in allowlist)" }

    $members = Get-MgGroupMember -GroupId $group.Id |
        Where-Object { $IncludeUserIds -contains $_.Id } |
        ForEach-Object { $_.AdditionalProperties["displayName"] }

    if (-not $members) {
        [PSCustomObject]@{
            GroupName = $group.DisplayName
            Owners    = $ownerNames
            Member    = "No members in allowlist"
        }
    }
    else {
        foreach ($member in $members) {
            [PSCustomObject]@{
                GroupName = $group.DisplayName
                Owners    = $ownerNames
                Member    = $member
            }
        }
    }
}

$groupReportPath = Join-Path $OutputPath "group-membership-$timestamp.csv"
$groupReport | Export-Csv -Path $groupReportPath -NoTypeInformation
Write-Host "Group membership report written to $groupReportPath" -ForegroundColor Green

Write-Host "`nAudit complete. Reports saved to $OutputPath" -ForegroundColor Green