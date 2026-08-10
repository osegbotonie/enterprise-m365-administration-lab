# Access Review Automation

## Purpose

Covers a second automation script built to run periodic access reviews against the test identities in this lab - checking who currently holds admin roles, and flagging any account that's been disabled but still retains group-based access. The point of this one isn't just producing a report, it's catching real drift between what access is supposed to look like and what it actually looks like at a given point in time.

## Design

Like the first script (`Get-M365UserAndGroupAudit.ps1`), this one uses an explicit Object ID allowlist rather than any name-based filtering, so nothing outside the listed test users and groups ever gets queried against this tenant.

Two checks:

1. **Admin role assignments** - which listed users currently hold which directory roles, checked directly against the tenant rather than assumed from what was set up earlier.
2. **Disabled accounts with retained group access** - any user whose account is disabled but who still shows up in one or more group memberships. This is a common real-world gap: sign-in gets blocked as part of offboarding, but nobody always goes back and removes the person from their groups at the same time.

## Practical Validation

The first run surfaced two genuine findings, not staged ones.

**Finding 1 - PIM working as intended.** Tonie-Test Support's admin role, set up as an eligible PIM assignment in the Privileged Access work (doc 07), correctly did not appear as an active role membership in this report. That's not a bug - it's PIM doing exactly what it's meant to do. An eligible assignment isn't standing access; the role only becomes active when someone deliberately activates it. This report checks *current* membership, so it correctly shows nothing until that happens.

**Finding 2 - a real access drift.** Tonie Four's account was found with `AccountEnabled: True`, despite having been disabled earlier as part of the Leaver scenario (doc 03, item 11). Somewhere between that evidence being captured and this review running, the account was re-enabled - most likely inadvertently during later work in the tenant. This is exactly the kind of thing periodic access reviews exist to catch: access states can drift over time even when the original process was followed correctly.

The account was re-disabled, and the script was run a second time the same day to confirm the fix. The second run showed both Tonie Four and Tonie-Test Support correctly disabled, with no retained group access flagged.

Evidence: `reports/admin-role-review-2026-08-10.csv`, `reports/disabled-account-access-review-2026-08-10.csv`

## Why This Matters

A script that only ever produces a clean report doesn't prove much on its own - it could just mean nothing was ever tested against a real failure state. This one caught a genuine issue in a live tenant, on its first real run, which is a better demonstration of the tool actually working than a rehearsed scenario would have been.
