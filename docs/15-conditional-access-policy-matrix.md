# Conditional Access Policy Matrix

## 1. Overview

This document provides a consolidated view of the core Conditional Access policies designed for the Microsoft 365 environment of Tonie-Osegbo Technologies Limited.

The purpose of this matrix is to demonstrate how the individual policies operate together to establish a layered identity and access security architecture.

Conditional Access policies should not be treated as isolated controls. Their effectiveness is achieved through the combined evaluation of user identity, privilege, authentication method, device security, and risk context.

---

## 2. Core Policy Matrix

| ID     | Policy                        | Primary Objective                                | Primary Control                               |
| ------ | ----------------------------- | ------------------------------------------------ | --------------------------------------------- |
| CA-001 | Require MFA                   | Protect user accounts from compromised passwords | Require MFA                                   |
| CA-002 | Protect Administrative Access | Protect privileged accounts                      | Strong authentication and additional controls |
| CA-003 | Block Legacy Authentication   | Reduce exposure to weak authentication methods   | Block legacy authentication                   |
| CA-004 | Require Compliant Devices     | Restrict access from insecure devices            | Require compliant device                      |
| CA-005 | Risk-Based Access             | Respond to suspicious access attempts            | Additional verification or block              |

---

## 3. Policy Relationship

The policies should be viewed as interconnected layers within a broader security architecture.

The access decision may consider multiple factors, including:

* User identity.
* Administrative privilege.
* Authentication method.
* Device compliance.
* Sign-in risk.

The relationship between the core policies is illustrated below:

```text
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

| Scenario                         | MFA      | Admin Controls | Authentication | Device Status            | Risk Evaluation | Outcome             |
| -------------------------------- | -------- | -------------- | -------------- | ------------------------ | --------------- | ------------------- |
| Standard user, trusted sign-in   | Required | Not applicable | Modern         | Compliant                | Low             | Allow               |
| Standard user, risky sign-in     | Required | Not applicable | Modern         | Compliant                | Medium          | Additional controls |
| Standard user, high-risk sign-in | Required | Not applicable | Modern         | Compliant                | High            | Block or remediate  |
| Administrator, trusted sign-in   | Required | Required       | Modern         | Compliant where required | Low             | Allow               |
| Administrator, high-risk sign-in | Required | Required       | Modern         | Compliant where required | High            | Block or remediate  |
| Legacy authentication attempt    | N/A      | N/A            | Legacy         | N/A                      | Any             | Block               |
| Non-compliant device             | Required | May apply      | Modern         | Non-compliant            | Any             | Block or remediate  |

---

## 5. Access Decision Framework

The overall access decision process is:

```text
Access Request
      │
      ▼
Identify User
      │
      ▼
Determine MFA Requirement
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

The exact evaluation order may vary depending on the applicable policies and Microsoft Entra configuration. The key principle is that the final access decision should reflect the combined security requirements applicable to the request.

---

## 6. Layered Security Model

The Conditional Access architecture applies multiple security layers.

### Layer 1 — Identity

**CA-001 — Require MFA**

Protects user accounts against unauthorized access resulting from compromised passwords.

---

### Layer 2 — Privilege

**CA-002 — Protect Administrative Access**

Applies stronger authentication and security requirements to privileged users and administrative access.

---

### Layer 3 — Authentication Protocol

**CA-003 — Block Legacy Authentication**

Reduces exposure to authentication methods that do not support modern identity security controls.

---

### Layer 4 — Device

**CA-004 — Require Compliant Devices**

Ensures that the security condition of the device is considered as part of the access decision.

---

### Layer 5 — Risk

**CA-005 — Risk-Based Access**

Responds to suspicious users, risky sign-ins, and other relevant risk signals.

---

## 7. Policy Deployment Model

All Conditional Access policies should follow a controlled deployment process:

```text
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

Policies should not be broadly enforced without appropriate testing and validation.

---

## 8. Policy Interaction

Multiple Conditional Access policies may apply to a single access request.

For example:

```text
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

If a critical security requirement is not satisfied:

```text
Security Requirement Not Satisfied
             │
             ▼
      Additional Control
             │
             OR
             ▼
          Block
```

Policy interactions should be tested collectively to identify unexpected conflicts, excessive authentication requirements, or unintended access blocks.

---

## 9. Policy Governance

Every Conditional Access policy should have:

* A documented business objective.
* A defined owner.
* A clearly defined scope.
* Documented exclusions.
* A testing plan.
* A monitoring plan.
* A rollback plan.
* A defined review date.
* A documented change history.

Policies should be reviewed when:

* The organization's technology environment changes.
* New applications or services are introduced.
* Security threats change.
* Business requirements change.
* The organization's risk appetite changes.
* The policy no longer achieves its intended security objective.

---

## 10. Exceptions

Exceptions should be:

* Justified.
* Approved.
* Documented.
* Assigned an owner.
* Reviewed periodically.
* Removed when no longer required.

Each exception should include a defined business justification, risk assessment, compensating controls, and review or expiry date where appropriate.

A security exception should never become a permanent, undocumented bypass of the organization's security controls.

---

## 11. Reporting and Monitoring

The organization should monitor:

* Conditional Access results.
* Authentication failures.
* MFA failures.
* Risky users and sign-ins.
* Non-compliant devices.
* Legacy authentication attempts.
* Administrative access activity.
* Conditional Access policy changes.

Monitoring should help the organization identify both:

* Potential security threats.
* Unintended business disruption.

The results of monitoring should support continuous improvement of the Conditional Access architecture.

---

## 12. Final Architecture

```text
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
                  ┌────────────────┐
                  │ ACCESS DECISION│
                  └────────────────┘
```

---

## 13. Final Principle

Conditional Access should be designed as a coordinated security architecture rather than as a collection of unrelated policies.

The organization should continuously evaluate:

> **Who is requesting access?**

> **What are they trying to access?**

> **How are they authenticating?**

> **What device are they using?**

> **Where are they connecting from?**

> **What is the current risk?**

The final access decision should be based on the overall security context of the request.

> **Trust should be continuously evaluated rather than permanently assumed.**
