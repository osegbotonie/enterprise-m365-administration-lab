# Exchange Online Governance

## Purpose

Covers mailbox delegation and mail flow governance for Tonie-Osegbo Technologies Limited - who can act on behalf of whom, and how outbound mail from certain accounts is handled.

## Mailbox Delegation

Delegation is a common real-world need - an assistant managing an executive's inbox, a support account handling mail for a shared function - but it needs to be granted deliberately, not left open-ended.

**Practical validation:** Tonie-Test Support was granted "Send on behalf" access to Tonie Two's mailbox. This is a lighter-touch delegation than full mailbox access - Tonie-Test Support can send mail that appears as sent on Tonie Two's behalf, but doesn't get full read/write access to the mailbox contents. This distinction matters: "Send on behalf" is the more common pattern for genuine delegation scenarios, since it doesn't hand over the whole mailbox to do a narrower job.

Evidence: `evidence/collaboration-governance/01-mailbox-delegation-config.png`

## Mail Flow Rules

Mail flow rules (transport rules) apply actions to messages as they pass through Exchange Online - anything from adding a disclaimer to blocking certain attachment types.

**Scoping principle:** any rule built in this lab is explicitly scoped to the test user accounts, using a condition on sender or recipient. This is deliberate - Exchange Online mail flow rules apply live and immediately, unlike Conditional Access, which supports a Report-only mode. There's no safe "monitor before enforcing" option here, so scoping the rule tightly to test accounts is the safeguard instead.

**Practical validation:** a mail flow rule was created and scoped to the test users only.

Evidence: `evidence/collaboration-governance/02-mail-flow-rule-config.png`
