# Teams Governance

## Purpose

Covers external collaboration controls in Microsoft Teams - who can be invited as a guest, what guests can do once invited, and how that policy can vary at the individual team level versus the tenant-wide default.

## Tenant-Wide Guest Access

Guest access is enabled at the tenant level (Service default: On), including guest calling. This reflects a reasonably open collaboration posture appropriate for an organization that regularly works with external partners and contractors.

Evidence: `evidence/collaboration-governance/03-guest-access-settings.png`

## Team-Level Overrides

Tenant-wide settings define the ceiling, but individual teams can be more restrictive depending on what they handle. A team like Tonie Finance Team should lean toward tighter guest controls even where the tenant allows guests broadly, since financial data isn't something to expose to external parties by default. A general-purpose team like TonieGruppo has less reason to restrict guests, and can reasonably follow the tenant default.

**Practical validation:** TonieGruppo's guest permission was found set to Off at the team level, despite the tenant-wide default being On. TonieGruppo isn't handling sensitive data, so it made sense to switch it On to match the tenant default.

Evidence: `evidence/collaboration-governance/04-team-membership-settings.png`

## Note

Tonie Finance Team would be a good candidate to demonstrate the opposite - guest access kept off there despite the tenant default, since it handles financial data.
