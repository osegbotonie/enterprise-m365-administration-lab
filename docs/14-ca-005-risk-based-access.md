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

Traditional access control decisions are primarily based on:

* Username.
* Password.
* User permissions.

Modern identity security requires additional context when evaluating access requests.

A legitimate user account may become a security risk if:

* The user's credentials have been compromised.
* The user is signing in from an unusual location.
* The sign-in exhibits suspicious characteristics.
* The user's credentials have been exposed in a data breach.
* The user's authentication behaviour deviates from established patterns.

The objective of this policy is to evaluate relevant risk signals and apply an appropriate security response based on the level of risk identified.

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

The access decision should be proportionate to the level of risk associated with the user and the authentication attempt.

---

## 4. User Risk and Sign-In Risk

Risk-based access should distinguish between user risk and sign-in risk.

### User Risk

User risk represents the likelihood that a user identity or account has been compromised.

Potential indicators may include:

* Compromised credentials.
* Leaked credentials.
* Suspicious account activity.
* Evidence of credential exposure.

### Sign-In Risk

Sign-in risk represents the likelihood that a particular authentication attempt is suspicious or potentially malicious.

Potential indicators may include:

* Unusual sign-in behaviour.
* Suspicious geographic location.
* Anonymous IP address.
* Unfamiliar sign-in properties.
* Other indicators associated with potentially malicious activity.

These signals can be evaluated together to support more informed access decisions.

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

The risk evaluation should consider the available security signals relevant to the access request.

---

## 6. Risk Response

The security response should be proportional to the identified level of risk.

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

A low-risk authentication attempt may proceed through the organization's normal authentication requirements.

---

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

Additional controls may be required before access is granted.

---

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

High-risk activity may require access to be blocked or the underlying risk to be remediated before access is permitted.

---

## 7. Policy Scope

The organization should define:

* Users included.
* Applications protected.
* Risk levels covered.
* Authentication requirements.
* Remediation requirements.
* Approved exceptions.

Privileged administrators may require stronger controls because compromise of an administrative account could have a significantly greater impact on the Microsoft 365 environment.

---

## 8. Deployment Lifecycle

The policy should follow a controlled deployment process:

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

This process helps the organization understand the behaviour and accuracy of risk detections before broad enforcement.

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

The organization should validate that the response is appropriate to the level of risk detected.

---

## 10. Incident Response Integration

Risk-based access should integrate with the organization's security incident response process.

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
       Credential Reset
             │
             ▼
        Security Monitoring
```

Depending on the nature of the event, remediation may include:

* Credential reset.
* Session revocation.
* Additional authentication.
* Account investigation.
* Device investigation.
* Increased security monitoring.

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

Risk monitoring should be integrated with the organization's broader security monitoring and incident response processes.

---

## 12. Exception Management

Risk-based policies should have carefully controlled exceptions.

Any exception should document:

* Affected user or group.
* Business justification.
* Risk assessment.
* Compensating controls.
* Approver.
* Review date.

Exceptions should be minimized and reviewed regularly.

---

## 13. Relationship with Other Conditional Access Policies

Risk-based access should operate alongside the other Conditional Access controls:

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

Together, these policies create a layered access control model based on:

* Identity.
* Authentication strength.
* Administrative privilege.
* Authentication protocol.
* Device security.
* Risk context.

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

1. Identify the affected user or authentication attempt.
2. Review the associated risk details.
3. Review the Conditional Access results.
4. Determine whether the event may be a false positive.
5. Resolve the underlying risk where appropriate.
6. Adjust the policy scope or configuration if necessary.
7. Continue monitoring the affected scenario.

Any temporary exception should be documented, approved where required, and reviewed regularly.

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

The organization should move beyond the question:

> **“Is the password correct?”**

and instead ask:

> **“Is this access request sufficiently trustworthy based on the available security signals?”**

Risk-based access is therefore an important component of a modern Zero Trust identity architecture.
