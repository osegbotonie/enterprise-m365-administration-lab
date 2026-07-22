# Conditional Access Architecture

## 1. Overview

Conditional Access is a policy-based access control system that evaluates contextual signals before allowing access to organizational resources.

The objective is to ensure that access decisions are based on more than username and password authentication.

The Microsoft 365 environment of Tonie-Osegbo Technologies Limited should evaluate:

* User identity
* User risk
* Sign-in risk
* Device status
* Application
* Location
* Authentication strength
* Access requirements

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
  ├── What is the user risk?
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
     ┌────┼────┐
     ▼    ▼    ▼
   Allow  MFA  Block
```

---

## 3. Core Conditional Access Principles

Conditional Access policies should follow these principles:

1. Start with a clear business requirement.
2. Apply the least restrictive control necessary to achieve the security objective.
3. Use the principle of least privilege.
4. Exclude emergency access accounts from policies that could cause tenant lockout.
5. Test policies before broad deployment.
6. Use report-only mode where appropriate.
7. Monitor policy results.
8. Review policies regularly.

---

## 4. Policy: Require Multifactor Authentication

### Objective

Protect user accounts against compromised passwords.

### Policy Concept

```text
Users
   │
   ▼
Sign-In
   │
   ▼
MFA Required
   │
   ▼
Access Granted
```

### Recommended Scope

The policy should be designed to protect:

* Standard users
* Administrative users
* Sensitive applications
* High-risk sign-ins

Privileged administrators should receive stronger authentication controls where possible.

---

## 5. Policy: Protect Administrative Access

Administrative accounts represent a higher security risk.

Administrative access should require stronger controls than normal user access.

### Example

```text
Administrative User
        │
        ▼
Access Administrative Portal
        │
        ▼
Strong Authentication
        │
        ▼
Conditional Access Evaluation
        │
        ▼
Access Granted
```

Administrative access should be reviewed and monitored regularly.

---

## 6. Policy: Require Compliant Devices

Where device management is implemented, access to corporate resources may require the device to meet organizational compliance requirements.

### Decision Model

```text
User
 │
 ▼
Device
 │
 ▼
Device Compliance Check
 │
 ├── Compliant ──► Access
 │
 └── Non-Compliant ──► Block or Remediate
```

Possible compliance requirements include:

* Encryption
* Supported operating system
* Security software
* Screen lock
* Minimum security configuration

---

## 7. Policy: Block Legacy Authentication

Legacy authentication methods may not support modern security controls such as multifactor authentication.

The organization should evaluate blocking legacy authentication where technically and operationally appropriate.

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

This reduces exposure to authentication methods that provide weaker security controls.

---

## 8. Policy: Risk-Based Access

The organization should evaluate user and sign-in risk where appropriate.

### Example

```text
Sign-In
  │
  ▼
Risk Evaluation
  │
  ├── Low Risk ──► Normal Access
  │
  ├── Medium Risk ──► Additional Authentication
  │
  └── High Risk ──► Block or Remediation
```

Risk-based policies should be implemented carefully and monitored to reduce false positives.

---

## 9. Emergency Access Considerations

Emergency access accounts must be carefully considered when designing Conditional Access policies.

A policy that accidentally blocks every administrator can create a tenant lockout situation.

Therefore:

* Emergency access accounts should be protected.
* Emergency access accounts should be monitored.
* Emergency access accounts should be excluded from policies where necessary to prevent administrative lockout.
* Emergency access procedures should be documented.
* Emergency access should be tested periodically.

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

---

## 11. Policy Naming Convention

Conditional Access policies should use a consistent naming convention.

Example:

```text
CA-001-Require-MFA-All-Users
CA-002-Block-Legacy-Authentication
CA-003-Require-Compliant-Device
CA-004-Protect-Administrative-Access
CA-005-Risk-Based-Access
```

The naming convention should make the purpose of each policy immediately clear.

---

## 12. Policy Documentation Requirements

Each Conditional Access policy should document:

* Policy name
* Business objective
* Users and groups included
* Users and groups excluded
* Cloud applications
* Conditions
* Grant controls
* Session controls
* Mode
* Owner
* Change date
* Review date

---

## 13. Policy Conflict Considerations

Multiple Conditional Access policies may apply to the same sign-in.

The effective access decision is based on the combined controls of the applicable policies.

Therefore, policies should be designed carefully to avoid:

* Unexpected access blocks
* Conflicting requirements
* Administrative lockout
* Excessive user friction

Policies should be tested together rather than only individually.

---

## 14. Recommended Initial Policy Set

The initial Conditional Access architecture should consider:

### CA-001 — Require MFA

Protect user authentication.

### CA-002 — Protect Administrative Access

Apply stronger controls to administrative accounts.

### CA-003 — Block Legacy Authentication

Reduce exposure to weaker authentication methods.

### CA-004 — Require Compliant Devices

Protect access from unmanaged or non-compliant devices where appropriate.

### CA-005 — Risk-Based Access

Respond to risky users and sign-ins.

---

## 15. Governance

Conditional Access policies should be:

* Owned.
* Documented.
* Tested.
* Monitored.
* Reviewed.
* Updated when business or security requirements change.

The organization should maintain an inventory of active policies.

---

## 16. Final Principle

Conditional Access should not be viewed as a collection of random security policies.

It should be treated as a structured access decision framework:

> **Trust should be evaluated continuously based on the user, device, application, location, authentication method, and risk context.**

The goal is not simply to block access.

The goal is to provide the appropriate level of access based on the security context of each request.
