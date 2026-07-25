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

The purpose of this policy is to ensure that access to organizational resources is not determined solely by user identity.

A legitimate user account may still present a security risk if the device used to access organizational resources is:

* Unmanaged.
* Compromised.
* Unencrypted.
* Outdated.
* Missing required security controls.

The organization should therefore consider the security posture of the device as part of the overall access decision.

---

## 3. Zero Trust Principle

This policy supports the Zero Trust principle:

> **Never trust, always verify.**

Access decisions should consider multiple security signals, including:

```text
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

The identity of the user alone should not be considered sufficient to establish trust.

---

## 4. Security Problem

A valid username and password do not guarantee that the device being used to access organizational resources is secure.

### Example

```text
Legitimate User
      │
      ▼
Compromised Personal Device
      │
      ▼
Successful User Authentication
      │
      ▼
Potential Organizational Data Exposure
```

A compromised device may expose organizational credentials, data, or sessions even when the user account itself is legitimate.

Conditional Access can help reduce this risk by evaluating the compliance status of the device before granting access.

---

## 5. Device Compliance Model

The device should first be evaluated by the organization's device management platform.

For example:

```text
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

The device compliance status is then used as a security signal in the Conditional Access decision.

---

## 6. Possible Compliance Requirements

The organization may define device compliance requirements based on its security needs and risk appetite.

### Security Requirements

These may include:

* Device encryption.
* Secure password or PIN.
* Screen lock.
* Supported operating system.
* Required security software.
* Firewall enabled.

### Device Management Requirements

These may include:

* Enrollment in organizational device management.
* Registration with the organization.
* Required configuration profiles applied.
* Required security settings enabled.

### Compliance Status

The device may also be required to:

* Have no critical compliance issues.
* Not be marked as compromised.
* Maintain all required security controls.

The specific requirements should be defined according to the sensitivity of the resources being protected.

---

## 7. Conditional Access Decision Model

```text
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
          or Remediation Required
```

---

## 8. Policy Scope

The organization should clearly define:

* Users included.
* Applications protected.
* Supported device platforms.
* Device types.
* Exclusions.
* Business exceptions.

The policy should initially be tested with a controlled group before broader enforcement.

The scope should also reflect the sensitivity of the applications and data being protected.

---

## 9. Deployment Lifecycle

The policy should follow a controlled deployment process:

```text
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

This approach helps identify technical and operational issues before the policy is broadly enforced.

---

## 10. Testing Plan

### Test 1 — Compliant Device

```text
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

### Expected Result

The user should be able to access the protected resource, provided all other applicable Conditional Access requirements are satisfied.

---

### Test 2 — Non-Compliant Device

```text
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

### Expected Result

Access should be blocked or the user should be directed to remediate the compliance issue, depending on the configured policy.

---

### Test 3 — Unmanaged Device

The organization should define how unmanaged devices are handled.

Possible outcomes include:

* Block access.
* Require access through an approved browser.
* Allow limited access.
* Require device enrollment.
* Apply application-level protection controls.

The appropriate decision should depend on the sensitivity of the resource being accessed.

---

## 11. Application Sensitivity

Not all applications and resources necessarily require the same level of device control.

For example:

```text
Low-Sensitivity Resource
        │
        ▼
Basic Access Controls
```

```text
Sensitive Corporate Data
        │
        ▼
Stronger Device Requirements
```

The organization should consider applying stronger device requirements to sensitive applications, confidential information, and critical business resources.

---

## 12. BYOD Considerations

Bring Your Own Device (BYOD) environments require careful consideration because personal devices may not be fully managed by the organization.

Possible controls include:

* Application protection policies.
* Browser-based access.
* Limited data access.
* Data Loss Prevention controls.
* Device enrollment requirements.

The organization should balance:

* Security.
* Employee privacy.
* Business requirements.
* Employee productivity.

The appropriate control should depend on the sensitivity of the data and the level of risk associated with the personal device.

---

## 13. Monitoring

After deployment, administrators should monitor:

* Non-compliant devices.
* Access blocks.
* Compliance failures.
* Device enrollment issues.
* Operating system problems.
* User support incidents.
* Repeated policy failures.

Monitoring should help determine whether the policy is improving security without creating unnecessary operational disruption.

---

## 14. Exception Management

Exceptions should be:

* Documented.
* Approved.
* Time-limited where possible.
* Assigned to an owner.
* Reviewed regularly.

The exception process should follow a controlled approach:

```text
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

Exceptions should not become a permanent way to bypass the organization's security requirements.

---

## 15. Relationship with Intune

The overall architecture is:

```text
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

Microsoft Intune evaluates and manages device compliance.

Conditional Access uses the compliance signal as part of the access decision.

---

## 16. Rollback Plan

If unexpected business disruption occurs:

1. Identify the affected users and devices.
2. Review Conditional Access sign-in logs.
3. Review the device compliance status.
4. Identify the failed compliance requirement.
5. Remediate the device where possible.
6. Adjust the policy if necessary.
7. Re-test the affected scenario.
8. Continue enforcement after successful validation.

Any temporary policy adjustment should be documented and reviewed.

---

## 17. Final Policy Model

```text
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
