# Monitoring and Auditing

## Purpose

Covers how activity in the tenant gets logged, reviewed, and alerted on - the visibility layer that sits underneath everything else that's been built so far.

## Audit Logs

Entra ID's audit log captures directory changes - role assignments, group membership changes, license changes, and more. Reviewing it against the test users confirmed that the activity carried out earlier in this lab (license reclaim, group changes, role assignment) is properly logged and traceable.

Evidence: `evidence/collaboration-governance/07-audit-log.png`

## Sign-In Logs

Sign-in logs capture authentication activity per user, including which Conditional Access policies evaluated against each sign-in. Test identities in this lab aren't used interactively very often, so sign-in log evidence is limited by nature - this reflects the lab setup rather than a gap in the logging itself.

Evidence: `evidence/collaboration-governance/08-signin-logs.png`

## Alert Policy

An alert policy was configured in the Microsoft Purview compliance portal to notify on admin role assignment - directly tied to the Privileged Access work covered in doc 07. Logging after the fact is useful, but an alert on a sensitive action like a role assignment closes the loop by surfacing it in near real time rather than requiring someone to go looking for it in the audit log.

Evidence: `evidence/collaboration-governance/09-alert-policy-config.png`
