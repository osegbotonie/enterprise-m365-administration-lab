# Conditional Access Architecture

## 1. Overview

Conditional Access is a policy-based access control capability that evaluates the context of an access request before determining whether access should be granted.

Rather than relying solely on a username and password, Conditional Access enables the organization to evaluate additional signals associated with a sign-in attempt and apply appropriate security controls.

For Tonie-Osegbo Technologies Limited, Conditional Access should consider signals such as:

* User identity and group membership.
* User risk.
* Sign-in risk.
* Device state and compliance.
* Application being accessed.
* Sign-in location and network context.
* Authentication method and authentication strength.
* Session context.
* Other relevant identity and security signals.

Based on the conditions evaluated, the organization may:

* Allow access.
* Require multifactor authentication.
* Require a specific authentication strength.
* Require a compliant device.
* Require additional remediation.
* Apply session controls.
* Block access.

The objective is not to apply the same control to every access request. The objective is to apply controls that are appropriate to the security context and business sensitivity of each request.

---

## 2. Conditional Access Decision Model

The general access decision process is:

```text
User
  │
  ▼
Authentication Attempt
  │
  ├── Who is the user?
  ├── What is the user's risk level?
  ├── What is the sign-in risk?
  ├── What device is being used?
  ├── Is the device compliant?
  ├── What application is being accessed?
  ├── Where is the sign-in coming from?
  └── What authentication method is being used?
          │
          ▼
  Conditional Access Evaluation
          │
          ▼
      Access Decision
          │
     ┌────┼────────┬────────┐
     ▼    ▼        ▼        ▼
   Allow  MFA   Compliant  Block
                Device
```

A single sign-in may be affected by multiple Conditional Access policies.

For example:

```text
Policy 1: Require MFA
        +
Policy 2: Require Compliant Device
        +
Policy 3: Block High-Risk Sign-Ins
        │
        ▼
Combined Access Requirements
```

Conditional Access policies must therefore be designed and tested as part of a complete architecture rather than as isolated rules.

---

## 3. Conditional Access Design Principles

The Conditional Access architecture should follow these principles:

1. Every policy should address a clearly defined business or security requirement.
2. Policies should apply the least restrictive control capable of achieving the required security objective.
3. High-risk access should receive stronger controls than low-risk access.
4. Privileged administrative access should receive stronger protection than ordinary user access.
5. Emergency access accounts must be protected against accidental tenant lockout.
6. Policies should be tested before broad enforcement.
7. Report-only mode should be used during the initial testing phase where appropriate.
8. Policy exclusions should be limited, documented, and regularly reviewed.
9. The combined effect of multiple policies must be considered.
10. Policy changes should be documented and governed.
11. Conditional Access policies should be reviewed periodically.
12. Security should be balanced with legitimate business requirements and user experience.

Conditional Access should be treated as a coordinated access control architecture, not as a collection of unrelated security policies.

---

## 4. Policy: Require Multifactor Authentication

### Objective

The objective of this policy is to reduce the risk of unauthorized access resulting from compromised passwords.

A password alone should not be considered sufficient protection for access to important organizational resources.

### General Model

```text
User
   │
   ▼
Sign-In Attempt
   │
   ▼
Conditional Access Evaluation
   │
   ▼
MFA Required
   │
   ▼
Successful Authentication
   │
   ▼
Access Granted
```

The policy should be designed to protect:

* Standard users.
* Administrative users.
* Sensitive applications.
* Important organizational resources.

The authentication requirement should be appropriate to the sensitivity of the resource and the risk associated with the sign-in.

Privileged administrators should be subject to stronger authentication requirements where supported and appropriate.

---

## 5. Policy: Protect Administrative Access

Administrative accounts can make changes that affect the security and operation of the Microsoft 365 environment.

They should therefore be protected more strongly than ordinary user accounts.

### Example

```text
Administrative User
        │
        ▼
Access Administrative Portal
        │
        ▼
Conditional Access Evaluation
        │
        ▼
Strong Authentication
        │
        ▼
Additional Security Controls
        │
        ▼
Access Granted
```

Additional controls may include:

* Multifactor authentication.
* Strong authentication requirements.
* Phishing-resistant authentication where available.
* Compliant device requirements.
* Risk-based controls.
* Restrictions on access from untrusted conditions.

Administrative access should also be monitored and reviewed regularly.

The principle is:

> **Administrative access should be subject to a higher level of security assurance because of the potential impact of compromise.**

---

## 6. Policy: Require Compliant Devices

Where Microsoft Intune and device management have been implemented, access to selected organizational resources may require the device to meet defined compliance requirements.

### Decision Model

```text
User
 │
 ▼
Device
 │
 ▼
Device Compliance Evaluation
 │
 ├── Compliant ───────► Continue Access Evaluation
 │
 └── Non-Compliant ───► Block or Remediate
```

Possible compliance requirements may include:

* Device encryption.
* Supported operating system.
* Required security updates.
* Screen lock requirements.
* Minimum device security configuration.
* Required security software.
* Organizational configuration requirements.

The requirement for a compliant device should be based on the sensitivity of the resource.

For example, access to a highly sensitive administrative or corporate resource may require a compliant managed device, while a less sensitive resource may have different requirements.

Not every resource needs to have identical device requirements.

---

## 7. Policy: Block Legacy Authentication

Legacy authentication methods may not support modern security controls such as multifactor authentication and modern authentication policies.

The organization should therefore block legacy authentication methods where technically and operationally appropriate.

### Model

```text
Legacy Authentication Attempt
          │
          ▼
Conditional Access Evaluation
          │
          ▼
          Block
```

Blocking legacy authentication reduces exposure to authentication methods that cannot adequately support modern security controls.

Before enforcement, the organization should identify:

* Legacy applications.
* Devices.
* Services.
* Business processes.

that may still depend on legacy authentication.

Any required exception should be:

* Documented.
* Business-justified.
* Limited in scope.
* Regularly reviewed.
* Removed when no longer required.

The preferred approach should be to modernize the dependency rather than maintain a permanent exception.

---

## 8. Policy: Risk-Based Access

Where the appropriate Microsoft Entra capabilities and licensing are available, the organization should use identity and sign-in risk signals to make more informed access decisions.

### Example

```text
Sign-In
  │
  ▼
Risk Evaluation
  │
  ├── Low Risk ───────► Normal Access
  │
  ├── Medium Risk ────► Additional Authentication
  │
  └── High Risk ──────► Block or Remediation
```

Risk-based controls may require the user to:

* Complete additional authentication.
* Remediate a compromised account.
* Change a compromised credential where applicable.
* Complete a security remediation process.
* Wait for an investigation.
* Be blocked from accessing the resource.

Risk-based policies should be implemented carefully and monitored after deployment.

The organization should review false positives and legitimate business impact to ensure that the policy provides effective protection without creating unnecessary disruption.

---

## 9. Emergency Access Account Considerations

Emergency access accounts require special consideration when designing Conditional Access policies.

A poorly designed policy could unintentionally block all normal administrative access and create a tenant lockout situation.

Emergency access accounts should therefore:

* Be protected using appropriate security controls.
* Be excluded from specific policies where necessary to preserve emergency access.
* Be limited to emergency use.
* Be monitored closely.
* Be tested periodically.
* Be subject to strict governance.

Any exclusion should be carefully documented.

Emergency access accounts should not be treated as normal user accounts, and their use should trigger appropriate monitoring and investigation.

---

## 10. Policy Deployment Lifecycle

Conditional Access policies should follow a controlled deployment process.

```text
Business Requirement
        │
        ▼
Policy Design
        │
        ▼
Identify Scope and Exclusions
        │
        ▼
Report-Only Testing
        │
        ▼
Review Results
        │
        ▼
Pilot Deployment
        │
        ▼
Monitor
        │
        ▼
Production Enforcement
        │
        ▼
Periodic Review
```

Before a policy is enforced broadly, the organization should consider:

* Who will be affected?
* Which applications are affected?
* Which users or groups should be excluded?
* What user experience will result?
* Could the policy create administrative lockout?
* Could the policy disrupt a critical business process?
* What is the recovery or rollback process?

The organization should maintain a clear record of policy changes and their expected impact.

---

## 11. Conditional Access Policy Naming Convention

Conditional Access policies should use a consistent naming convention.

The recommended format is:

```text
CA-[NUMBER]-[PURPOSE]
```

### Examples

```text
CA-001-Require-MFA-All-Users
CA-002-Protect-Administrative-Access
CA-003-Block-Legacy-Authentication
CA-004-Require-Compliant-Device
CA-005-Risk-Based-Access
```

The naming convention should make the purpose of the policy clear to an administrator reviewing the environment.

A consistent naming convention also improves:

* Troubleshooting.
* Change management.
* Security investigations.
* Documentation.
* Policy reviews.

---

## 12. Conditional Access Policy Documentation

Each policy should be documented sufficiently for another administrator to understand its purpose and operation.

Documentation should include:

* Policy name.
* Business and security objective.
* Users and groups included.
* Users and groups excluded.
* Target cloud applications.
* Conditions.
* Grant controls.
* Session controls.
* Authentication requirements.
* Policy mode.
* Policy owner.
* Date created.
* Date last modified.
* Review date.
* Documented exceptions.

Policy documentation should also explain the reason for any significant exclusion.

A policy should be understandable to an administrator who was not involved in its original design.

---

## 13. Policy Interaction and Conflict Management

Multiple Conditional Access policies may apply to the same sign-in.

The final access result may therefore be affected by the combined requirements of several policies.

For example:

```text
Policy 1: Require MFA
        +
Policy 2: Require Compliant Device
        +
Policy 3: Block High-Risk Sign-In
        │
        ▼
Combined Access Decision
```

Policies should therefore be tested together where their scopes overlap.

The organization should specifically look for:

* Unexpected access blocks.
* Conflicting requirements.
* Excessive authentication prompts.
* Administrative lockout.
* Unnecessary user friction.
* Unintended protection gaps.

A policy that appears correct in isolation may still create an undesirable result when combined with other policies.

---

## 14. Recommended Initial Conditional Access Policy Set

The initial Conditional Access architecture should include the following policy areas.

### CA-001 — Require MFA

**Objective:**
Protect user accounts from the impact of compromised passwords.

---

### CA-002 — Protect Administrative Access

**Objective:**
Apply stronger authentication and access requirements to administrative accounts.

---

### CA-003 — Block Legacy Authentication

**Objective:**
Reduce exposure to authentication methods that do not support modern security controls.

---

### CA-004 — Require Compliant Devices

**Objective:**
Restrict access to selected organizational resources from devices that do not meet defined compliance requirements.

---

### CA-005 — Risk-Based Access

**Objective:**
Respond appropriately to risky users and sign-in attempts.

---

## 15. Policy Governance

Conditional Access policies should be:

* Owned.
* Documented.
* Tested.
* Monitored.
* Reviewed.
* Updated when business or security requirements change.

The organization should maintain an inventory of active Conditional Access policies.

Changes to high-impact policies should be appropriately documented and, where required, approved before implementation.

Policy exclusions should receive particular attention because an exclusion can create an unintended security gap.

The organization should also maintain a clear process for:

* Policy change requests.
* Testing.
* Approval.
* Deployment.
* Monitoring.
* Rollback.
* Periodic review.

---

## 16. Conditional Access Architecture

The overall architecture can be represented as:

```text
Access Request
      │
      ▼
User Identity
      │
      ├── User Risk
      ├── Sign-In Risk
      ├── Device State
      ├── Application
      ├── Location
      ├── Authentication Strength
      └── Other Security Signals
              │
              ▼
      Conditional Access Policies
              │
              ▼
        Access Decision
              │
      ┌───────┼────────┬────────┐
      ▼       ▼        ▼        ▼
    Allow     MFA    Compliant  Block
                      Device
```

This model supports a Zero Trust approach by requiring access decisions to be based on the context of the request rather than simply trusting a user because valid credentials were presented.

---

## 17. Final Principle

Conditional Access should not be viewed as a collection of unrelated security policies.

It should be treated as a structured access decision framework.

The organization should continuously evaluate the context of each access request, including:

* The user.
* The device.
* The application.
* The location.
* The authentication method.
* The risk associated with the request.

The central principle is:

> **Access should be evaluated according to the security context of each request rather than being automatically trusted simply because a user has valid credentials.**

The objective is not simply to block access.

The objective is to provide the appropriate level of access based on the security context of each request while maintaining a reasonable balance between security, usability, and business requirements.
