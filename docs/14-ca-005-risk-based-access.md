# CA-005 — Risk-Based Access

## 1. Policy Overview

| Field              | Value                                     |
| ------------------ | ----------------------------------------- |
| Policy Name        | CA-005-Risk-Based-Access                  |
| Policy Type        | Conditional Access                        |
| Security Objective | Respond to risky users and sign-ins       |
| Status             | Design                                    |
| Owner              | IT / Identity and Security Administration |

---

## 2. Business Objective

Traditional access control makes decisions primarily based on:

* Username.
* Password.
* User permissions.

Modern identity security requires additional context.

A legitimate user's account may become risky because:

* Credentials may have been compromised.
* The user may be signing in from an unusual location.
* The sign-in may show suspicious characteristics.
* The user's identity may have been exposed in a breach.
* The authentication behaviour may be abnormal.

The objective of this policy is to evaluate risk and apply an appropriate security response.

---

## 3. Risk-Based Access Model

```text id="o7s4sm"
Sign-In Attempt
      │
      ▼
Risk Evaluation
      │
      ├── Low Risk
      │      │
      │      ▼
      │   Normal Access
      │
      ├── Medium Risk
      │      │
      │      ▼
      │   Additional Verification
      │
      └── High Risk
             │
             ▼
       Block or Remediate
```

---

## 4. User Risk and Sign-In Risk

Risk-based access should distinguish between:

### User Risk

User risk represents the likelihood that an identity or account has been compromised.

Examples may include:

* Compromised credentials.
* Leaked credentials.
* Suspicious account activity.

### Sign-In Risk

Sign-in risk represents the likelihood that a particular authentication attempt may be suspicious.

Examples may include:

* Unusual sign-in behaviour.
* Suspicious location.
* Anonymous IP address.
* Unfamiliar sign-in properties.

These signals can be used to make more informed access decisions.

---

## 5. Security Decision Model

```text id="bcd5gq"
User
  │
  ▼
Sign-In Attempt
  │
  ▼
Risk Analysis
  │
  ├── Identity Risk
  ├── Sign-In Risk
  ├── Location
  ├── Device
  └── Authentication Context
        │
        ▼
Risk Level
        │
        ├── Low
        ├── Medium
        └── High
```

---

## 6. Risk Response

The response should be proportional to the level of risk.

### Low Risk

Possible action:

```text id="d86i2q"
Low Risk
   │
   ▼
Normal Authentication
   │
   ▼
Access Granted
```

### Medium Risk

Possible actions:

```text id="f1utzu"
Medium Risk
    │
    ▼
Additional Authentication
    │
    ▼
Risk Reduction
    │
    ▼
Access Granted
```

### High Risk

Possible actions:

```text id="5x4j5t"
High Risk
   │
   ▼
Block Access
   │
   OR
   ▼
Require Remediation
```

---

## 7. Policy Scope

The organization should define:

* Users included.
* Applications protected.
* Risk levels covered.
* Authentication requirements.
* Remediation requirements.
* Exceptions.

Privileged administrators may require stronger controls due to their elevated access.

---

## 8. Deployment Lifecycle

```text id="7s5o6k"
Risk Configuration
        │
        ▼
Policy Design
        │
        ▼
Report-Only Testing
        │
        ▼
Review Risk Events
        │
        ▼
Pilot Deployment
        │
        ▼
Monitor
        │
        ▼
Production Enforcement
```

---

## 9. Testing Plan

### Test 1 — Low-Risk Sign-In

Expected result:

```text id="q7fwqa"
Low-Risk Sign-In
       │
       ▼
Normal Authentication
       │
       ▼
Access Granted
```

---

### Test 2 — Medium-Risk Sign-In

Expected result:

```text id="q35k08"
Medium-Risk Sign-In
        │
        ▼
Additional Verification
        │
        ▼
Access Granted After Successful Verification
```

---

### Test 3 — High-Risk Sign-In

Expected result:

```text id="o4n5wz"
High-Risk Sign-In
        │
        ▼
Access Blocked
or Remediation Required
```

---

## 10. Incident Response Integration

Risk-based access should connect with the organization's security incident response process.

```text id="4ud4sn"
Risk Detected
     │
     ▼
Security Investigation
     │
     ├── False Positive
     │       │
     │       ▼
     │   Risk Resolved
     │
     └── Confirmed Threat
             │
             ▼
       Account Remediation
             │
             ▼
       Password / Credential Reset
             │
             ▼
        Security Monitoring
```

---

## 11. Monitoring

Administrators should monitor:

* Risky users.
* Risky sign-ins.
* Blocked sign-ins.
* Remediation events.
* False positives.
* Repeated risky activity.
* Administrative account risk.

Risk monitoring should be integrated with the wider security monitoring process.

---

## 12. Exception Management

Risk-based policies should have carefully controlled exceptions.

Any exception should document:

* User or group.
* Business reason.
* Risk assessment.
* Compensating controls.
* Approver.
* Review date.

Exceptions should be minimized.

---

## 13. Relationship with Other Conditional Access Policies

Risk-based access should work alongside:

```text id="h9b9u5"
CA-001 — Require MFA
        │
        +
CA-002 — Protect Administrative Access
        │
        +
CA-003 — Block Legacy Authentication
        │
        +
CA-004 — Require Compliant Devices
        │
        ▼
CA-005 — Risk-Based Access
```

Together, these policies create a layered access control model.

---

## 14. Overall Conditional Access Architecture

```text id="uv4h85"
User
 │
 ▼
Authentication Attempt
 │
 ▼
Identity Evaluation
 │
 ├── MFA
 ├── Administrative Privilege
 ├── Authentication Protocol
 ├── Device Compliance
 └── Risk
       │
       ▼
Conditional Access
       │
       ▼
Access Decision
       │
 ├── Allow
 ├── Require Additional Controls
 └── Block
```

---

## 15. Rollback Plan

If the policy creates unexpected business disruption:

1. Identify the affected user or sign-in.
2. Review risk details.
3. Review Conditional Access results.
4. Determine whether the event is a false positive.
5. Resolve the underlying risk where appropriate.
6. Adjust policy scope if necessary.
7. Continue monitoring.

Any temporary exception should be documented and reviewed.

---

## 16. Final Policy Model

```text id="t4v8dz"
Access Request
      │
      ▼
Risk Evaluation
      │
      ├── Low Risk ─────► Normal Access
      │
      ├── Medium Risk ──► Additional Controls
      │
      └── High Risk ────► Block / Remediate
```

---

## 17. Final Principle

> **Access decisions should respond to the level of risk associated with the user and the authentication attempt.**

The organization should move from:

> **“Is the password correct?”**

to:

> **“Is this access request sufficiently trustworthy based on the available security signals?”**

Risk-based access is therefore an important component of a modern Zero Trust identity architecture.
