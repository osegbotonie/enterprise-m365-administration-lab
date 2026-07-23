# Conditional Access Architecture

## 1. Overview

Conditional Access is a policy-based access control capability that evaluates contextual signals before determining whether a user should be allowed to access organizational resources.

Rather than relying solely on a username and password, Conditional Access enables the organization to make access decisions based on the circumstances surrounding each sign-in attempt.

The Microsoft 365 environment of Tonie-Osegbo Technologies Limited should consider signals such as:

* User identity.
* User risk.
* Sign-in risk.
* Device status.
* Application being accessed.
* Sign-in location.
* Authentication method and strength.
* Access requirements.
* Other relevant security signals.

The outcome of the evaluation may be to:

* Allow access.
* Require additional authentication.
* Require a compliant device.
* Require a specific authentication strength.
* Block access.
* Require the user to remediate a security risk.

The objective is to ensure that access decisions are appropriate to the security context of each request.

---

## 2. Conditional Access Decision Model

The general decision model is:

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
  ├── What application is being accessed?
  ├── Where is the sign-in occurring?
  └── What authentication method is being used?
          │
          ▼
  Conditional Access Evaluation
          │
          ▼
      Access Decision
          │
     ┌────┼────┬──────────┐
     ▼    ▼    ▼          ▼
   Allow  MFA  Compliant  Block
             Device
```

Conditional Access policies are evaluated based on the conditions and controls configured by the organization.

Multiple policies may apply to the same sign-in. The combined requirements of the applicable policies must therefore be considered when designing and testing the environment.

---

## 3. Core Conditional Access Principles

Conditional Access policies should follow the following principles:

1. Each policy should address a clearly defined business or security requirement.
2. Policies should apply the least restrictive control capable of achieving the required security objective.
3. Access should be based on the principle of least privilege.
4. Emergency access accounts should be protected from accidental tenant lockout.
5. Policies should be tested before broad enforcement.
6. Report-only mode should be used where appropriate during testing.
7. Policy results should be monitored after deployment.
8. Policies should be reviewed regularly.
9. Policy exclusions should be documented and justified.
10. The combined effect of multiple policies should be considered during testing.

Conditional Access should not be implemented as a collection of isolated policies. The policies should operate as part of a coherent access control architecture.

---

# 4. Policy: Require Multifactor Authentication

## Objective

The objective of this policy is to reduce the risk of unauthorized access resulting from compromised passwords.

A password alone should not be considered sufficient protection for access to important organizational resources.

### Policy Concept

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

### Recommended Scope

The policy should be designed to protect:

* Standard users.
* Administrative users.
* Sensitive applications.
* High-value organizational resources.

Privileged administrators should receive stronger authentication requirements where supported and appropriate.

The exact authentication requirement should be based on the sensitivity of the resource and the level of risk associated with the sign-in.

---

# 5. Policy: Protect Administrative Access

Administrative accounts have the ability to make changes that may affect the entire Microsoft 365 environment.

They should therefore receive stronger protection than ordinary user accounts.

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
Additional Controls
        │
        ▼
Access Granted
```

Additional controls may include:

* Multifactor authentication.
* Strong authentication methods.
* Phishing-resistant authentication where available.
* Compliant device requirements.
* Restricted administrative access conditions.
* Risk-based controls.

Administrative access should also be reviewed and monitored regularly.

---

# 6. Policy: Require Compliant Devices

Where device management has been implemented, access to selected corporate resources may require the device to meet defined compliance requirements.

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
* Minimum password or authentication requirements.
* Security software requirements.
* Organizational configuration requirements.

The requirement for a compliant device should be applied according to the sensitivity of the resource and the organization's business requirements.

Not every resource necessarily requires the same device controls.

---

# 7. Policy: Block Legacy Authentication

Legacy authentication methods may not support modern security controls such as multifactor authentication and modern authentication policies.

The organization should therefore evaluate blocking legacy authentication methods where technically and operationally appropriate.

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

Blocking legacy authentication can reduce exposure to authentication methods that do not support modern security protections.

Before enforcement, the organization should identify any legitimate business applications or services that may still depend on legacy authentication.

Any exceptions should be documented, reviewed, and minimized.

---

# 8. Policy: Risk-Based Access

The organization should use available identity and sign-in risk signals to make more informed access decisions.

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
* Change a compromised credential.
* Complete a security remediation process.
* Wait for an investigation.
* Be blocked from accessing the resource.

Risk-based policies should be implemented carefully and monitored to reduce false positives and unnecessary disruption to legitimate users.

---

# 9. Emergency Access Considerations

Emergency access accounts require special consideration when designing Conditional Access policies.

A poorly designed policy could unintentionally block all administrators from accessing the tenant.

This could create a tenant lockout situation.

Therefore:

* Emergency access accounts should be protected.
* Emergency access accounts should be monitored.
* Emergency access accounts should be excluded from policies where necessary to prevent administrative lockout.
* Exclusions should be limited and documented.
* Emergency access procedures should be documented.
* Emergency access should be tested periodically.

Emergency accounts should not be treated as normal user accounts.

Their use should generate appropriate monitoring and review.

---

# 10. Policy Deployment Lifecycle

Conditional Access policies should follow a controlled deployment process.

```text
Business Requirement
        │
        ▼
Policy Design
        │
        ▼
Identify Users and Exclusions
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
* Who should be excluded?
* What applications are affected?
* What user experience will result?
* Could the policy create administrative lockout?
* Could the policy disrupt business operations?
* What is the rollback or recovery procedure?

---

# 11. Policy Naming Convention

Conditional Access policies should use a consistent naming convention.

The following format is recommended:

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

A consistent naming convention makes it easier for administrators to identify the purpose of a policy during administration, troubleshooting, and security investigations.

---

# 12. Policy Documentation Requirements

Each Conditional Access policy should be documented.

The documentation should include:

* Policy name.
* Business objective.
* Users and groups included.
* Users and groups excluded.
* Cloud applications covered.
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

A policy should be understandable to another administrator who was not involved in its original creation.

---

# 13. Policy Conflict Considerations

Multiple Conditional Access policies may apply to the same sign-in.

The final access decision may therefore be affected by the combined requirements of several policies.

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

Policies should therefore be designed and tested as part of the wider Conditional Access architecture.

Testing policies individually is not always sufficient.

The organization should avoid:

* Unexpected access blocks.
* Conflicting requirements.
* Excessive authentication prompts.
* Administrative lockout.
* Unnecessary user friction.
* Unintended gaps in protection.

---

# 14. Recommended Initial Policy Set

The initial Conditional Access architecture should consider the following policies.

## CA-001 — Require MFA

**Objective:**

Protect user accounts from the impact of compromised passwords.

---

## CA-002 — Protect Administrative Access

**Objective:**

Apply stronger authentication and access requirements to administrative accounts.

---

## CA-003 — Block Legacy Authentication

**Objective:**

Reduce exposure to authentication methods that do not support modern security controls.

---

## CA-004 — Require Compliant Devices

**Objective:**

Restrict access to selected organizational resources from devices that do not meet defined compliance requirements.

---

## CA-005 — Risk-Based Access

**Objective:**

Respond appropriately to risky users and sign-in attempts.

---

## 15. Governance

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

---

## 16. Final Principle

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

The objective is to provide the appropriate level of access based on the security context of each request while maintaining a balance between security, usability, and business requirements.
