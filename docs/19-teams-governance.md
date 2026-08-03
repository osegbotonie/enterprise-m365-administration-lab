# Teams Governance

## Purpose

Covers external collaboration controls in Microsoft Teams - who can be invited as a guest, what guests can do once invited, and how that policy can vary at the individual team level versus the tenant-wide default.

## Tenant-Wide Guest Access

Guest access is enabled at the tenant level (Service default: On), including guest calling. This reflects a reasonably open collaboration posture appropriate for an organization that regularly works with external partners and contractors.

Evidence: `evidence/collaboration-governance/03-guest-access-settings.png`

## Team-Level Overrides

Tenant-wide settings define the ceiling, but individual teams can be more restrictive depending on what they handle. As a practical principle: a team like Tonie Finance Team should default toward tighter guest controls even where the tenant allows guests broadly, since financial data isn't something to expose to external parties by default. A general-purpose team like TonieGruppo has less reason to restrict guests, and can reasonably follow the tenant default.

**Practical validation:** TonieGruppo's guest permission was found set to Off at the team level, despite the tenant-wide default being On. Since TonieGruppo isn't a sensitive-data team, it was switched On to align with the tenant default - a deliberate decision, not left unexamined.

Evidence: `evidence/collaboration-governance/04-team-membership-settings.png`

## Note

A team like Tonie Finance Team, if built out further, would be a good candidate to demonstrate the opposite decision - guest access deliberately kept off despite the tenant-wide default, as a data-sensitivity override.
