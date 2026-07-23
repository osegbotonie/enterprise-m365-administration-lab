# CA-003 — Block Legacy Authentication

## 1. Policy Overview

| Field              | Value                                     |
| ------------------ | ----------------------------------------- |
| Policy Name        | CA-003-Block-Legacy-Authentication        |
| Policy Type        | Conditional Access                        |
| Security Objective | Reduce authentication attack surface      |
| Status             | Design                                    |
| Owner              | IT / Identity and Security Administration |

---

## 2. Business Objective

The objective of this policy is to prevent authentication methods that do not support modern security controls such as Multifactor Authentication.

Legacy authentication protocols can expose user accounts to increased risk because they may rely primarily on usernames and passwords.

The organization should therefore reduce or eliminate legacy authentication where operationally possible.

---

## 3. Security Problem

Traditional authentication methods may allow an attacker to attempt authentication without completing modern security controls.

### Risk Model

```text
Attacker
   │
   ▼
Obtains User Password
   │
   ▼
Attempts Legacy Authentication
   │
   ▼
Modern Authentication Controls May Not Apply
   │
   ▼
Increased Risk of Unauthorized Access
```

Blocking legacy authentication reduces this attack surface.

---

## 4. Modern Authentication Model

The preferred authentication model is:

```text
User
  │
  ▼
Modern Authentication
  │
  ▼
Conditional Access Evaluation
  │
  ├── MFA
  ├── Device
  ├── Risk
  ├── Location
  └── Application
        │
        ▼
   Access Decision
```

---

## 5. Policy Scope

The policy should be designed to block legacy authentication attempts.

The organization should carefully evaluate:

* Users.
* Applications.
* Devices.
* Existing authentication dependencies.

The policy should initially be tested in a controlled manner.

---

## 6. Policy Condition

The policy should identify authentication attempts using legacy authentication protocols.

The intended control is:

```text
Legacy Authentication Attempt
          │
          ▼
Conditional Access Evaluation
          │
          ▼
             Block
```

---

## 7. Authentication Protocol Considerations

Before enforcement, the organization should identify whether any legitimate business applications or devices depend on older authentication methods.

Potential dependencies may include:

* Older email clients.
* Legacy applications.
* Older mobile devices.
* Older multifunction printers.
* Older automated systems.
* Applications using outdated authentication methods.

Any exception must be documented and reviewed.

---

## 8. Deployment Lifecycle

The policy should follow this process:

```text
Discovery
   │
   ▼
Identify Legacy Authentication Usage
   │
   ▼
Report-Only Mode
   │
   ▼
Review Sign-In Logs
   │
   ▼
Identify Legitimate Dependencies
   │
   ▼
Remediate Dependencies
   │
   ▼
Pilot Enforcement
   │
   ▼
Production Enforcement
```

---

## 9. Testing Plan

### Test 1 — Modern Authentication

Expected result:

```text
Modern Authentication
        │
        ▼
Conditional Access Evaluation
        │
        ▼
Access Granted
```

---

### Test 2 — Legacy Authentication

Expected result:

```text
Legacy Authentication
        │
        ▼
Conditional Access Evaluation
        │
        ▼
Access Blocked
```

---

### Test 3 — Existing Application Dependency

If an existing application is found to depend on legacy authentication:

```text
Application
     │
     ▼
Legacy Authentication Dependency
     │
     ▼
Business and Security Review
     │
     ├── Remediate
     │
     └── Documented Temporary Exception
```

Exceptions should not become permanent without review.

---

## 10. Monitoring

After deployment, administrators should monitor:

* Blocked legacy authentication attempts.
* Applications generating legacy authentication attempts.
* Users affected by the policy.
* Authentication errors.
* Helpdesk incidents.
* Security alerts.

The purpose of monitoring is to ensure that the policy is achieving its security objective without creating unexpected business disruption.

---

## 11. Exception Management

Any exception should document:

* Application or user affected.
* Business reason.
* Security risk.
* Owner.
* Compensating controls.
* Approval.
* Expiry or review date.

Example:

```text
Exception
   │
   ▼
Business Justification
   │
   ▼
Risk Assessment
   │
   ▼
Approval
   │
   ▼
Compensating Control
   │
   ▼
Periodic Review
```

---

## 12. Relationship with MFA

Blocking legacy authentication and requiring MFA are complementary controls.

```text
Modern Authentication
        │
        ▼
MFA Required
        │
        ▼
Additional Security Control
```

```text
Legacy Authentication
        │
        ▼
Blocked
```

The organization should not assume that MFA alone eliminates the risks associated with legacy authentication.

---

## 13. Policy Conflict Considerations

This policy may interact with:

* CA-001 — Require MFA.
* CA-002 — Protect Administrative Access.
* Device-based Conditional Access policies.
* Risk-based policies.

The combined effect should be tested before production enforcement.

---

## 14. Rollback Plan

If unexpected business disruption occurs:

1. Identify the affected authentication attempt.
2. Review sign-in logs.
3. Confirm that legacy authentication was the cause.
4. Identify the affected application or user.
5. Remediate the application where possible.
6. Use a documented temporary exception only where necessary.
7. Review the exception regularly.

The objective should be to return to full legacy authentication blocking.

---

## 15. Final Policy Model

```text
Authentication Attempt
        │
        ▼
Is Modern Authentication Used?
        │
        ├── Yes ──► Continue Conditional Access Evaluation
        │
        └── No
              │
              ▼
            Block
```

---

## 16. Final Principle

> **Legacy authentication should be eliminated where possible because modern identity security controls cannot be consistently applied to authentication methods that do not support them.**

The organization should use a controlled process of:

**Discover → Test → Remediate → Enforce → Monitor**
