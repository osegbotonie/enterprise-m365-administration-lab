<#
.SYNOPSIS
    Runs an access review against a manually curated list of test users and
    groups, checking admin role assignments and flagging accounts that are
    disabled but still hold active group memberships.

.DESCRIPTION
    Two things this checks, both common real-world access review findings:

    1. Admin role assignments - which of the listed users hold which
       directory roles right now. Standing admin access is worth reviewing
       periodically even when PIM is in use, since not every role
       assignment necessarily goes through PIM.

    2. Disabled accounts with retained access - a user who has been
       disabled (e.g. as part of a Leaver process) but still shows up in
       group memberships. This is a common gap: sign-in gets blocked, but
       group cleanup doesn't always happen at the same time, so a
       disabled account can still be granted access through group-based
       permissions even though it can no longer sign in itself.

    Only the exact Object IDs listed in $IncludeUserIds and $IncludeGroupIds
    are ever queried, same allowlist approach as the first script in this
    repo (Get-M365UserAndGroupAudit.ps1). This tenant is real, not a
    sandbox, so nothing outside the allowlist gets touched.

.NOTES
    Requires the Microsoft.Graph PowerShell SDK module.
    Required scopes: User.Read.All, Group.Read.All, GroupMember.Read.All,
    Directory.Read.All, RoleManagement.Read.Directory

.EXAMPLE
    .\Get-M365AccessReviewReport.ps1
#>

param(
    [string]$OutputPath = "..\reports",

    [string[]]$IncludeUserIds = @(
        "31fcd5e7-82f5-486c-863a-ff165b2231ac",  # Tonie-Test Support
        "e38c7523-7fad-40e7-a3a7-b9b4951f0d7f",  # Tonie Four
        "c1df85a3-3773-4803-b57c-9164dd4bdc2c",  # Tonie Three
        "19c73ce3-cd47-404c-b585-e0c18696a873"   # Tonie Two
    ),

    [string[]]$IncludeGroupIds = @(
        "2fd3926f-620f-47bf-83ff-674e2c8e0ad6",  # Tonie Finance Team
        "b559b37d-61ee-46cd-b8ad-1949b7bed86a",  # TonieGruppo
        "f603d794-bdf8-484c-b423-e1951d2c5fa0",  # Tonie_Test Project Team
        "fc88b3d0-6aed-4522-ab2c-148128c748c7"   # TonieTeknikal
    )
)

if ($IncludeUserIds.Count -eq 0) {
    Write-Host "STOP: `$IncludeUserIds is empty. Add the Object IDs of your test users before running this. Aborting." -ForegroundColor Red
    return
}

$context = Get-MgContext
if (-not $context) {
    Write-Host "Not connected to Microsoft Graph. Connecting now..." -ForegroundColor Yellow
    Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All", "GroupMember.Read.All", "Directory.Read.All", "RoleManagement.Read.Directory"
}

$timestamp = Get-Date -Format "yyyy-MM-dd"
if (-not (Test-Path $OutputPath)) {
    New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
}

# ---------------------------------------------------------------------------
# 1. Admin role assignments
# ---------------------------------------------------------------------------
Write-Host "Checking admin role assignments for listed test user(s)..." -ForegroundColor Cyan

$roleReport = foreach ($id in $IncludeUserIds) {
    try {
        $user = Get-MgUser -UserId $id -Property Id, DisplayName, AccountEnabled -ErrorAction Stop
        $memberships = Get-MgUserMemberOf -UserId $id -All

        $roles = $memberships | Where-Object { $_.AdditionalProperties["@odata.type"] -eq "#microsoft.graph.directoryRole" }

        if ($roles.Count -eq 0) {
            [PSCustomObject]@{
                DisplayName    = $user.DisplayName
                AccountEnabled = $user.AccountEnabled
                AdminRole      = "None"
            }
        }
        else {
            foreach ($role in $roles) {
                [PSCustomObject]@{
                    DisplayName    = $user.DisplayName
                    AccountEnabled = $user.AccountEnabled
                    AdminRole      = $role.AdditionalProperties["displayName"]
                }
            }
        }
    }
    catch {
        Write-Host "  Could not find user with ID $id - skipping." -ForegroundColor Yellow
    }
}

$roleReportPath = Join-Path $OutputPath "admin-role-review-$timestamp.csv"
$roleReport | Export-Csv -Path $roleReportPath -NoTypeInformation
Write-Host "Admin role review written to $roleReportPath" -ForegroundColor Green

# ---------------------------------------------------------------------------
# 2. Disabled accounts with retained group access
# ---------------------------------------------------------------------------
# This is the actual finding this script is built to catch: an account
# that's been disabled (e.g. as part of Leaver) but is still sitting in
# one or more groups, which means it could still be granted access via
# group-based permissions even though it can't sign in directly.

Write-Host "Checking for disabled accounts with retained group access..." -ForegroundColor Cyan

$staleAccessReport = foreach ($id in $IncludeUserIds) {
    try {
        $user = Get-MgUser -UserId $id -Property Id, DisplayName, AccountEnabled -ErrorAction Stop

        if ($user.AccountEnabled -eq $true) {
            continue
        }

        $memberships = Get-MgUserMemberOf -UserId $id -All
        $groups = $memberships | Where-Object { $_.AdditionalProperties["@odata.type"] -eq "#microsoft.graph.group" }

        if ($groups.Count -eq 0) {
            [PSCustomObject]@{
                DisplayName     = $user.DisplayName
                AccountEnabled  = $user.AccountEnabled
                Finding         = "Disabled, no group memberships - clean"
                GroupName       = "N/A"
            }
        }
        else {
            foreach ($group in $groups) {
                [PSCustomObject]@{
                    DisplayName     = $user.DisplayName
                    AccountEnabled  = $user.AccountEnabled
                    Finding         = "REVIEW - disabled account still has group access"
                    GroupName       = $group.AdditionalProperties["displayName"]
                }
            }
        }
    }
    catch {
        Write-Host "  Could not find user with ID $id - skipping." -ForegroundColor Yellow
    }
}

if ($staleAccessReport.Count -eq 0) {
    Write-Host "No disabled accounts found among the listed users - nothing to report." -ForegroundColor DarkGray
    $staleAccessReport = @(
        [PSCustomObject]@{
            DisplayName    = "N/A"
            AccountEnabled = "N/A"
            Finding        = "No disabled accounts among listed users at time of review"
            GroupName      = "N/A"
        }
    )
}

$staleAccessReportPath = Join-Path $OutputPath "disabled-account-access-review-$timestamp.csv"
$staleAccessReport | Export-Csv -Path $staleAccessReportPath -NoTypeInformation
Write-Host "Disabled account access review written to $staleAccessReportPath" -ForegroundColor Green

Write-Host "`nAccess review complete. Reports saved to $OutputPath" -ForegroundColor Green