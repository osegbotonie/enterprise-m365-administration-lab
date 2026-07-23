# CA-004 — Require Compliant Devices

## 1. Policy Overview

| Field              | Value                                     |
| ------------------ | ----------------------------------------- |
| Policy Name        | CA-004-Require-Compliant-Devices          |
| Policy Type        | Conditional Access                        |
| Security Objective | Restrict access from insecure devices     |
| Status             | Design                                    |
| Owner              | IT / Identity and Security Administration |

---

## 2. Business Objective

The purpose of this policy is to ensure that access to organizational resources is not based solely on user identity.

A legitimate user account may still represent a security risk if the device used to access organizational resources is:

* Unmanaged.
* Compromised.
* Unencrypted.
* Out of date.
* Missing required security controls.

The organization should therefore consider the security posture of the device as part of the access decision.

---

## 3. Zero Trust Principle

The policy supports the Zero Trust principle:

> **Never trust, always verify.**

The access decision should consider:

```text id="s9jylh"
User Identity
      +
Device Security
      +
Application
      +
Location
      +
Risk
      │
      ▼
Access Decision
```

---

## 4. Security Problem

A valid username and password do not guarantee that the device is safe.

### Example

```text id="e4vrna"
Legitimate User
      │
      ▼
Compromised Personal Device
      │
      ▼
User Signs In Successfully
      │
      ▼
Potential Organizational Data Exposure
```

Conditional Access can help reduce this risk by evaluating device compliance.

---

## 5. Device Compliance Model

The device must first be evaluated by the organization's device management platform.

For example:

```text id="0h4xoj"
Device
  │
  ▼
Microsoft Intune
  │
  ▼
Compliance Evaluation
  │
  ├── Compliant
  │      │
  │      ▼
  │   Access Allowed
  │
  └── Non-Compliant
         │
         ▼
      Access Blocked
      or Remediation Required
```

---

## 6. Possible Compliance Requirements

The organization may define requirements such as:

### Security

* Device encryption.
* Secure password or PIN.
* Screen lock.
* Supported operating system.
* Security software.
* Firewall enabled.

### Device Management

* Device enrolled in management.
* Device registered with the organization.
* Required configuration profiles applied.

### Compliance Status

* No critical compliance issues.
* Device not marked as compromised.
* Required security controls active.

The exact requirements should reflect the organization's risk appetite.

---

## 7. Conditional Access Decision Model

```text id="n5l9xv"
User Attempts Access
        │
        ▼
Device Compliance Evaluated
        │
        ├── Compliant
        │      │
        │      ▼
        │   Access Granted
        │
        └── Non-Compliant
               │
               ▼
          Access Blocked
          or Remediation
```

---

## 8. Policy Scope

The organization should carefully define:

* Users included.
* Applications protected.
* Device platforms.
* Device types.
* Exclusions.
* Business exceptions.

The policy should initially be tested with a controlled group.

---

## 9. Deployment Lifecycle

The policy should follow:

```text id="2x2qjz"
Define Compliance Requirements
          │
          ▼
Configure Device Compliance
          │
          ▼
Test Devices
          │
          ▼
Enable Report-Only Mode
          │
          ▼
Review Results
          │
          ▼
Pilot Deployment
          │
          ▼
Production Enforcement
```

---

## 10. Testing Plan

### Test 1 — Compliant Device

```text id="y6rq88"
User
 │
 ▼
Compliant Device
 │
 ▼
Conditional Access Evaluation
 │
 ▼
Access Granted
```

---

### Test 2 — Non-Compliant Device

```text id="x6v9go"
User
 │
 ▼
Non-Compliant Device
 │
 ▼
Conditional Access Evaluation
 │
 ▼
Access Blocked
or Remediation Required
```

---

### Test 3 — Unmanaged Device

The organization should define its policy for unmanaged devices.

Possible outcomes include:

* Block access.
* Require approved browser access.
* Allow limited access.
* Require device enrollment.

The decision should be based on the sensitivity of the resource.

---

## 11. Application Sensitivity

Not all applications necessarily require the same level of device control.

For example:

```text id="a2b6jy"
Low-Sensitivity Resource
        │
        ▼
Basic Access Controls
```

```text id="0g9fse"
Sensitive Corporate Data
        │
        ▼
Stronger Device Requirements
```

The organization should consider applying stronger controls to sensitive resources.

---

## 12. BYOD Considerations

Bring Your Own Device environments require careful consideration.

A personal device may not be fully managed by the organization.

Possible controls include:

* Application protection policies.
* Browser-based access.
* Limited data access.
* Data loss prevention controls.
* Device enrollment requirements.

The organization should balance security, privacy, and employee productivity.

---

## 13. Monitoring

After deployment, administrators should monitor:

* Non-compliant devices.
* Access blocks.
* Compliance failures.
* Device enrollment issues.
* Operating system problems.
* User complaints.
* Repeated policy failures.

The goal is to identify whether the policy is improving security without causing unnecessary disruption.

---

## 14. Exception Management

Exceptions should be:

* Documented.
* Approved.
* Time-limited where possible.
* Assigned an owner.
* Reviewed regularly.

Example:

```text id="i6f5vw"
Business Requirement
        │
        ▼
Exception Request
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

---

## 15. Relationship with Intune

The overall architecture is:

```text id="3bslr3"
Device
  │
  ▼
Microsoft Intune
  │
  ├── Configuration
  ├── Compliance
  ├── Applications
  └── Device Management
        │
        ▼
Microsoft Entra ID
        │
        ▼
Conditional Access
        │
        ▼
Access Decision
```

Intune determines device compliance.

Conditional Access uses that compliance signal as part of the access decision.

---

## 16. Rollback Plan

If unexpected disruption occurs:

1. Identify affected users and devices.
2. Review Conditional Access sign-in logs.
3. Review device compliance status.
4. Identify the failed compliance requirement.
5. Remediate the device.
6. Adjust the policy if necessary.
7. Re-test.
8. Continue enforcement after successful validation.

---

## 17. Final Policy Model

```text id="p7wn0d"
User
 │
 ▼
Device
 │
 ▼
Intune Compliance Evaluation
 │
 ├── Compliant ────────► Conditional Access
 │                             │
 │                             ▼
 │                          Access Granted
 │
 └── Non-Compliant ────► Conditional Access
                               │
                               ▼
                          Block or Remediate
```

---

## 18. Final Principle

> **Access should depend not only on who the user is, but also on the security condition of the device being used.**

The organization should combine:

**Identity + Device Management + Compliance + Conditional Access**

to create a stronger Zero Trust security architecture.
