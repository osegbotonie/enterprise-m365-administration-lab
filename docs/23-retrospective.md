# Retrospective

## What This Project Was

This lab started as a way to build and prove hands-on Microsoft 365 and Entra ID administration skills against a live tenant, not just study material in isolation. The approach throughout was the same: start from a real business need, design around it, build it, then capture evidence that it was actually implemented and tested - not just documented as a theoretical exercise.

## What Got Built

Across identity, access, security, collaboration, and monitoring:

- Full identity lifecycle (Joiner, Mover, Leaver) tested end to end against real test identities
- Privileged access with PIM, moving from standing admin access to eligible, just-in-time activation
- All five Conditional Access policies designed and configured, with a deliberate Report-only posture on two of them
- Exchange, Teams, and SharePoint governance, including a genuine security finding (tenant-wide external sharing set to "Anyone") documented with a recommendation rather than silently fixed
- Monitoring and alerting tied directly to the privileged access work
- Two PowerShell scripts using the Microsoft Graph SDK, both scoped to an explicit Object ID allowlist so nothing outside the test environment was ever touched

## What I'd Do Differently at Real Scale

A few things that were reasonable simplifications in a lab wouldn't hold up at real organizational scale:

- **The ID allowlist approach in the scripts doesn't scale.** Manually listing Object IDs works for four test users; it doesn't work for a real organization with hundreds or thousands of accounts. At scale, this would need to be replaced with a governed attribute or group-based scoping mechanism - something like a dedicated "in scope for automation" security group, managed through the same access governance process as everything else, rather than a hardcoded list in a script.
- **Report-only Conditional Access policies need a real review cadence.** Leaving CA-001 and CA-003 in Report-only was the right call for a lab with a handful of accounts, but in production that decision needs an actual owner and a scheduled review point - Report-only shouldn't become the permanent state by default, it should be a deliberate, time-boxed step toward enforcement.
- **The SharePoint external sharing finding is the clearest example of lab limits.** Identifying a real risk and writing a recommendation is good practice, but at a real organization that finding would need to go through actual change management - understanding what current sharing links depend on "Anyone" access before tightening it, not just flipping the setting.
- **Intune needed a real test device, not a production one.** Choosing not to enroll a production machine was the right call, but it means the device compliance and CA-004 evidence in this lab is incomplete. At a real organization, this would be solved with a dedicated test device or a VM from the start, not worked around after the fact.

## What This Actually Taught Me

The most useful parts of this project weren't the pieces that went smoothly - they were the moments where something real happened that a purely theoretical study plan wouldn't have surfaced: catching the license capacity limit, discovering a re-enabled account during an access review, working through a real git history conflict without losing evidence, and having to make an actual judgment call about not touching a production device. Those are the situations that come up in real administration work, and building this lab was a way to encounter them deliberately rather than for the first time on the job.
