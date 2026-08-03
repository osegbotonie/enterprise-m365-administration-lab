# SharePoint Governance

## Purpose

Covers external sharing controls for SharePoint and OneDrive - who content can be shared with outside the organization, and at what level that gets decided.

## External Sharing

SharePoint and OneDrive external sharing is configured on a permissiveness scale, from "Anyone" (no sign-in required) down to "Only people in your organization" (no external sharing at all). Individual sites can be further restricted below the tenant-wide ceiling.

**Practical validation:** the tenant-wide external sharing setting was found configured at "Anyone" - the most permissive option, allowing content to be shared via links that don't require the recipient to sign in at all.

Evidence: `evidence/collaboration-governance/05-sharepoint-external-sharing.png`

## Finding and Recommendation

"Anyone" is a meaningful risk for an organization like this one, which handles telecom customer and regulatory data. A link-based share with no sign-in requirement means content can end up anywhere once shared, with no way to track or revoke access to whoever it gets forwarded to.

This was left unchanged rather than tightened directly, since a setting like this affects the whole organization's ability to share files day to day - changing it needs a real conversation about what legitimate business sharing currently depends on "Anyone" access, not a unilateral change made in isolation. The recommendation is to move this to "New and existing guests" at minimum, which still allows external collaboration but requires the recipient to authenticate, and to review site-level overrides for sensitive areas (e.g. Finance) separately.
