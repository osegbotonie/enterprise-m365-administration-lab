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

The objective of this policy is to block authentication methods that do not support modern security controls such as Multifactor Authentication (MFA) and other Conditional Access requirements.

Legacy authentication protocols can increase the risk of unauthorized access because they may rely primarily on usernames and passwords and may not support modern identity security controls.

The organization should therefore reduce and, where operationally possible, eliminate legacy authentication from the environment.

The goal is to ensure that authentication requests are processed through modern authentication methods that support the organization's wider identity security architecture.

---

## 3. Security Problem

Traditional authentication methods may allow an attacker to attempt authentication without completing modern security controls.

### Risk Model

```text id="q6m0kp"
Attacker
   │
   ▼
Obtains User Password
   │
   ▼
Attempts Legacy Authentication
   │
   ▼
Modern Security Controls May Not Apply
   │
   ▼
Increased Risk of Unauthorized Access
```

Blocking legacy authentication reduces the available authentication attack surface and supports the organization's broader identity security strategy.

---

## 4. Modern Authentication Model

The preferred authentication model is:

```text id="j1r4bw"
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

Modern authentication enables the organization to apply additional security controls based on the context of each access request.

---

## 5. Policy Scope

This policy should identify and block authentication attempts that use legacy authentication protocols.

Before enforcement, the organization should evaluate:

* Users.
* Applications.
* Devices.
* Existing authentication dependencies.
* Automated systems and services.

The policy should initially be tested in a controlled manner to identify legitimate dependencies and reduce the risk of unexpected business disruption.

The scope should also be reviewed periodically as new applications, devices, and services are introduced into the environment.

---

## 6. Policy Condition

The policy should identify authentication attempts using legacy authentication protocols.

The intended control is:

```text id="g5v8nc"
Legacy Authentication Attempt
          │
          ▼
Conditional Access Evaluation
          │
          ▼
            Block
```

Authentication attempts using modern authentication should continue through the applicable Conditional Access policies.

---

## 7. Authentication Protocol Considerations

Before enforcement, the organization should identify whether legitimate business applications, devices, or services depend on older authentication methods.

Potential dependencies may include:

* Older email clients.
* Legacy applications.
* Older mobile devices.
* Older multifunction printers.
* Older automated systems.
* Applications using outdated authentication methods.

Each identified dependency should be evaluated to determine whether it can be:

* Upgraded.
* Reconfigured.
* Replaced.
* Migrated to modern authentication.
* Retired.

The preferred approach should be to remediate the dependency rather than permanently maintain an exception to the security policy.

Any exception must be documented, approved where appropriate, and periodically reviewed.

---

## 8. Deployment Lifecycle

The policy should follow a controlled deployment process:

```text id="z3k6yd"
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

The organization should avoid immediate broad enforcement without first understanding existing authentication dependencies.

---

## 9. Testing Plan

### Test 1 — Modern Authentication

**Expected Result:**

```text id="p4v7as"
Modern Authentication
        │
        ▼
Conditional Access Evaluation
        │
        ▼
Access Granted
```

The request should continue through the applicable Conditional Access policies.

Additional controls, such as MFA or device requirements, may then be applied according to the wider Conditional Access architecture.

---

### Test 2 — Legacy Authentication

**Expected Result:**

```text id="w9x2fe"
Legacy Authentication
        │
        ▼
Conditional Access Evaluation
        │
        ▼
Access Blocked
```

The authentication attempt should be blocked by the policy.

---

### Test 3 — Existing Application Dependency

If an existing application is found to depend on legacy authentication:

```text id="h6n1ru"
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

Any exception should be time-bound where possible and should not become permanent without formal review.

---

## 10. Monitoring

Following deployment, administrators should monitor:

* Blocked legacy authentication attempts.
* Applications generating legacy authentication attempts.
* Users affected by the policy.
* Authentication errors.
* Helpdesk incidents.
* Security alerts.
* Repeated authentication attempts from the same source.

Monitoring should be used to confirm that the policy is achieving its security objective without causing unexpected business disruption.

The organization should also use monitoring data to identify applications or services that require remediation.

---

## 11. Exception Management

Any approved exception should document:

* The affected application, user, device, or service.
* The business justification.
* The associated security risk.
* The exception owner.
* Required compensating controls.
* Approval details.
* Expiry date or review date.

### Exception Process

```text id="u8c3pk"
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
Compensating Controls
   │
   ▼
Periodic Review
```

Exceptions should be minimized and should remain in place only for as long as necessary.

A temporary exception should not become a permanent workaround for an application that should have been upgraded or replaced.

---

## 12. Relationship with MFA

Blocking legacy authentication and requiring MFA are complementary security controls.

### Modern Authentication

```text id="r2m7vx"
Modern Authentication
        │
        ▼
MFA Required
        │
        ▼
Additional Security Control
```

### Legacy Authentication

```text id="c5p9ks"
Legacy Authentication
        │
        ▼
Blocked
```

The organization should not assume that MFA alone eliminates the risks associated with legacy authentication.

Legacy authentication should be blocked because it may prevent the consistent application of modern authentication and Conditional Access controls.

---

## 13. Policy Conflict Considerations

This policy may interact with:

* CA-001 — Require MFA.
* CA-002 — Protect Administrative Access.
* Device-based Conditional Access policies.
* Risk-based Conditional Access policies.

The combined effect of these policies should be tested before production enforcement.

The organization should verify that:

* Modern authentication continues to function as expected.
* MFA requirements are applied correctly.
* Administrative access remains appropriately protected.
* Legitimate applications are not unexpectedly blocked.
* Approved emergency access procedures remain available.

Conditional Access policies should be tested together where multiple policies apply to the same users and resources.

---

## 14. Rollback and Remediation Plan

If unexpected business disruption occurs:

1. Identify the affected authentication attempt.
2. Review the relevant sign-in logs.
3. Confirm that legacy authentication blocking caused the issue.
4. Identify the affected application, user, device, or service.
5. Remediate the application or authentication dependency where possible.
6. Use a documented temporary exception only where necessary.
7. Apply appropriate compensating controls.
8. Review the exception regularly.
9. Return to full legacy authentication blocking once remediation is complete.

The objective should be to resolve the underlying dependency rather than permanently weaken the security policy.

---

## 15. Final Policy Model

```text id="b8s4yn"
Authentication Attempt
        │
        ▼
Is Modern Authentication Used?
        │
        ├── Yes
        │     │
        │     ▼
        │  Continue Conditional Access Evaluation
        │
        └── No
              │
              ▼
            Block
```

---

## 16. Final Principle

> **Legacy authentication should be eliminated wherever possible because authentication methods that do not support modern security controls prevent the consistent application of stronger identity protections.**

The organization should follow a controlled process:

**Discover → Test → Remediate → Enforce → Monitor**

The objective is to reduce the authentication attack surface while maintaining a controlled process for identifying and resolving legitimate business dependencies.

This policy should form part of the wider Conditional Access architecture and should be reviewed periodically as the organization's applications, devices, and authentication requirements evolve.
