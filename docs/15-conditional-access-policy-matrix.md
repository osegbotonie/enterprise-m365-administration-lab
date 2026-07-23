# Conditional Access Policy Matrix

## 1. Overview

This document provides a consolidated view of the core Conditional Access policies designed for the Microsoft 365 environment of Tonie-Osegbo Technologies Limited.

The purpose of the matrix is to show how individual policies work together to create a layered identity and access security architecture.

---

## 2. Core Policy Matrix

| ID     | Policy                        | Primary Objective                                | Primary Control                               |
| ------ | ----------------------------- | ------------------------------------------------ | --------------------------------------------- |
| CA-001 | Require MFA                   | Protect user accounts from compromised passwords | Require MFA                                   |
| CA-002 | Protect Administrative Access | Protect privileged accounts                      | Strong authentication and additional controls |
| CA-003 | Block Legacy Authentication   | Reduce weak authentication attack surface        | Block legacy authentication                   |
| CA-004 | Require Compliant Devices     | Restrict access from insecure devices            | Require compliant device                      |
| CA-005 | Risk-Based Access             | Respond to suspicious access attempts            | Additional verification or block              |

---

## 3. Policy Relationship

The policies should not be viewed as isolated controls.

They form a layered security model:

```text id="6idqdy"
                 ┌──────────────────────┐
                 │       USER           │
                 └──────────┬───────────┘
                            │
                            ▼
                 ┌──────────────────────┐
                 │  AUTHENTICATION      │
                 │      REQUEST         │
                 └──────────┬───────────┘
                            │
       ┌────────────────────┼────────────────────┐
       │                    │                    │
       ▼                    ▼                    ▼
   User Identity        Device Status         Risk
       │                    │                    │
       ▼                    ▼                    ▼
    CA-001              CA-004              CA-005
       │                    │                    │
       └────────────────────┼────────────────────┘
                            │
                            ▼
                 ┌──────────────────────┐
                 │   ADMINISTRATIVE     │
                 │      CONTEXT         │
                 └──────────┬───────────┘
                            │
                            ▼
                         CA-002
                            │
                            ▼
                 ┌──────────────────────┐
                 │ AUTHENTICATION       │
                 │ PROTOCOL CHECK       │
                 └──────────┬───────────┘
                            │
                            ▼
                         CA-003
                            │
                            ▼
                 ┌──────────────────────┐
                 │   ACCESS DECISION    │
                 └──────────────────────┘
```

---

## 4. Decision Matrix

| Scenario                         | MFA            | Admin Controls | Legacy Auth | Compliant Device         | Risk Evaluation | Outcome             |
| -------------------------------- | -------------- | -------------- | ----------- | ------------------------ | --------------- | ------------------- |
| Standard user, trusted sign-in   | Required       | Not applicable | Modern      | Compliant                | Low             | Allow               |
| Standard user, risky sign-in     | Required       | Not applicable | Modern      | Compliant                | Medium          | Additional controls |
| Standard user, high-risk sign-in | Required       | Not applicable | Modern      | Compliant                | High            | Block or remediate  |
| Administrator, trusted sign-in   | Required       | Required       | Modern      | Compliant where required | Low             | Allow               |
| Administrator, high-risk sign-in | Required       | Required       | Modern      | Compliant where required | High            | Block or remediate  |
| Legacy authentication attempt    | Not applicable | Not applicable | Blocked     | Not applicable           | Any             | Block               |
| Non-compliant device             | Required       | May apply      | Modern      | Not compliant            | Any             | Block or remediate  |

---

## 5. Access Decision Framework

The overall decision process is:

```text id="tr5n9w"
Access Request
      │
      ▼
Identify User
      │
      ▼
Is MFA Required?
      │
      ▼
Is the User an Administrator?
      │
      ▼
Is Modern Authentication Used?
      │
      ▼
Is the Device Compliant?
      │
      ▼
Is the Sign-In Risk Acceptable?
      │
      ▼
Conditional Access Decision
      │
      ├── Allow
      │
      ├── Require Additional Controls
      │
      └── Block
```

---

## 6. Layered Security Model

The architecture applies multiple security layers:

### Layer 1 — Identity

**CA-001 — Require MFA**

Protects against password compromise.

---

### Layer 2 — Privilege

**CA-002 — Protect Administrative Access**

Applies stronger controls to privileged users.

---

### Layer 3 — Authentication Protocol

**CA-003 — Block Legacy Authentication**

Reduces exposure to weaker authentication methods.

---

### Layer 4 — Device

**CA-004 — Require Compliant Devices**

Ensures that device security is considered during access decisions.

---

### Layer 5 — Risk

**CA-005 — Risk-Based Access**

Responds to suspicious users and sign-in attempts.

---

## 7. Policy Deployment Model

All policies should follow a controlled deployment process:

```text id="z7f8ar"
Business Requirement
        │
        ▼
Policy Design
        │
        ▼
Documentation
        │
        ▼
Report-Only Testing
        │
        ▼
Pilot Group
        │
        ▼
Monitoring
        │
        ▼
Production Enforcement
        │
        ▼
Periodic Review
```

---

## 8. Policy Interaction

Multiple policies may apply to a single access request.

For example:

```text id="dj5c4o"
Administrator
     │
     ▼
Modern Authentication
     │
     ▼
MFA
     │
     ▼
Compliant Device
     │
     ▼
Acceptable Risk
     │
     ▼
Access Granted
```

If any critical security requirement is not satisfied:

```text id="q1ot2u"
Security Requirement Not Satisfied
             │
             ▼
      Additional Control
             │
             OR
             ▼
          Block
```

---

## 9. Policy Governance

Every policy should have:

* A documented business objective.
* A defined owner.
* A clear scope.
* Documented exclusions.
* A testing plan.
* A monitoring plan.
* A rollback plan.
* A review date.

Policies should be reviewed when:

* The organization changes its technology environment.
* New applications are introduced.
* Security threats change.
* Business requirements change.
* The organization's risk appetite changes.

---

## 10. Exceptions

Exceptions should be:

* Justified.
* Approved.
* Documented.
* Assigned an owner.
* Reviewed periodically.
* Removed when no longer required.

A security exception should never become a permanent undocumented bypass.

---

## 11. Reporting and Monitoring

The organization should monitor:

* Conditional Access results.
* Authentication failures.
* MFA failures.
* Risky sign-ins.
* Non-compliant devices.
* Legacy authentication attempts.
* Administrative access.
* Policy changes.

Monitoring should help identify both:

* Security threats.
* Unintended business disruption.

---

## 12. Final Architecture

```text id="i2oq0w"
                    ACCESS REQUEST
                          │
                          ▼
                  ┌───────────────┐
                  │ USER IDENTITY │
                  └───────┬───────┘
                          │
                          ▼
                  ┌───────────────┐
                  │      MFA      │
                  │    CA-001     │
                  └───────┬───────┘
                          │
                          ▼
                  ┌───────────────┐
                  │ ADMIN CONTEXT │
                  │    CA-002     │
                  └───────┬───────┘
                          │
                          ▼
                  ┌───────────────┐
                  │ AUTH PROTOCOL │
                  │    CA-003     │
                  └───────┬───────┘
                          │
                          ▼
                  ┌───────────────┐
                  │ DEVICE STATUS │
                  │    CA-004     │
                  └───────┬───────┘
                          │
                          ▼
                  ┌───────────────┐
                  │     RISK      │
                  │    CA-005     │
                  └───────┬───────┘
                          │
                          ▼
                  ┌───────────────┐
                  │ ACCESS DECISION│
                  └───────────────┘
```

---

## 13. Final Principle

Conditional Access should be designed as a coordinated security architecture rather than a collection of unrelated policies.

The organization should continuously evaluate:

> **Who is requesting access?**

> **What are they trying to access?**

> **How are they authenticating?**

> **What device are they using?**

> **Where are they connecting from?**

> **What is the current risk?**

The final access decision should be based on the total security context of the request.

> **Trust should be continuously evaluated rather than permanently assumed.**
