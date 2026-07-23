# CA-002 — Protect Administrative Access

## 1. Policy Overview

| Field              | Value                                     |
| ------------------ | ----------------------------------------- |
| Policy Name        | CA-002-Protect-Administrative-Access      |
| Policy Type        | Conditional Access                        |
| Security Objective | Protect privileged accounts               |
| Status             | Design                                    |
| Owner              | IT / Identity and Security Administration |

---

## 2. Business Objective

Administrative accounts have elevated permissions that can affect users, devices, security policies, applications, data, and the Microsoft 365 tenant.

A compromised administrative account could therefore result in significant organizational impact.

The purpose of this policy is to apply stronger access controls to privileged administrative accounts and ensure that administrative access is subject to enhanced authentication and security requirements.

---

## 3. Security Problem

An attacker who compromises a highly privileged administrative account may be able to:

* Create or delete users.
* Modify security policies.
* Change Conditional Access policies.
* Assign administrative roles.
* Access sensitive information.
* Modify Microsoft 365 configurations.
* Disable security controls.

### Risk Model

```text id="6t7b3c"
Compromised Administrator Account
            │
            ▼
Administrative Portal Access
            │
            ▼
Unauthorized Administrative Activity
            │
            ▼
Potential Tenant-Wide Impact
```

The organization must therefore protect administrative accounts more strictly than standard user accounts.

---

## 4. Policy Scope

### Users Included

The policy should target users assigned privileged administrative roles.

Examples include:

* Global Administrator.
* Privileged Role Administrator.
* Security Administrator.
* User Administrator.
* Intune Administrator.
* Exchange Administrator.
* SharePoint Administrator.
* Other privileged administrative roles as determined by the organization's risk assessment.

The exact scope should be reviewed regularly to ensure that all relevant privileged accounts are appropriately protected.

---

## 5. Emergency Access Exclusions

Emergency access accounts should be carefully considered when designing this policy.

They may need to be excluded from specific Conditional Access policies to prevent a situation in which all administrative access is accidentally blocked.

However, exclusions must not become a means of bypassing security controls.

Emergency access accounts should be:

* Strongly protected.
* Monitored.
* Tested periodically.
* Used only when necessary.
* Documented and governed.

Any use of an emergency access account should trigger appropriate investigation and review.

---

## 6. Authentication Requirements

Administrative access should require strong authentication.

The policy should consider requiring:

* Multifactor Authentication.
* Strong authentication methods.
* Phishing-resistant authentication where available.
* Additional authentication requirements for sensitive administrative operations.

The required authentication strength should reflect the level of privilege being protected.

Higher-risk administrative roles should receive stronger authentication controls where technically and operationally appropriate.

---

## 7. Administrative Access Decision Model

```text id="3kjg9w"
Administrator
      │
      ▼
Attempts Administrative Access
      │
      ▼
Conditional Access Evaluation
      │
      ├── Required Authentication Satisfied
      │        │
      │        ▼
      │     Access Granted
      │
      └── Authentication Requirement Not Met
               │
               ▼
       Additional Authentication
               │
               ▼
          Access Denied
```

The final outcome should depend on whether the required security controls are satisfied.

---

## 8. Device Considerations

Administrative access should ideally be performed from trusted and appropriately secured devices.

Where the organization's device-management capabilities support it, administrative access may require:

* A compliant device.
* A managed device.
* An appropriately secured administrative workstation.
* Required device security controls.

This reduces the risk of privileged credentials being used from unmanaged, insecure, or compromised devices.

Device requirements should be implemented according to the organization's administrative access model and operational requirements.

---

## 9. Location Considerations

The organization may evaluate administrative sign-ins based on location and network context.

Examples include:

* Trusted corporate locations.
* Approved remote-access locations.
* Unusual geographic locations.
* High-risk sign-in locations.

Location should not be treated as the sole security control because location can be spoofed, bypassed, or affected by legitimate travel and remote work.

It should be evaluated alongside:

* User identity.
* Device status.
* Authentication strength.
* Sign-in risk.
* Other relevant contextual signals.

---

## 10. Policy Deployment Lifecycle

The policy should follow a controlled deployment process:

```text id="6s6j6c"
Policy Design
      │
      ▼
Report-Only Mode
      │
      ▼
Test with Administrators
      │
      ▼
Review Sign-In Logs
      │
      ▼
Resolve Issues
      │
      ▼
Pilot Enforcement
      │
      ▼
Full Enforcement
```

The policy should not be broadly enforced until its impact has been appropriately tested and reviewed.

---

## 11. Testing Plan

### Test 1 — Administrator with Strong Authentication

**Expected Result:**

```text id="7m4x1v"
Administrative Sign-In
        │
        ▼
Strong Authentication
        │
        ▼
Conditional Access Requirements Satisfied
        │
        ▼
Access Granted
```

---

### Test 2 — Administrator Without Required Authentication

**Expected Result:**

```text id="2g6w8d"
Administrative Sign-In
        │
        ▼
Required Authentication Not Completed
        │
        ▼
Additional Authentication Required
        │
        ▼
Access Granted Only After Requirements Are Satisfied
```

If the required authentication cannot be completed, access should be denied.

---

### Test 3 — Emergency Access Account

**Expected Result:**

The documented emergency access process should remain available in accordance with the organization's emergency access design.

This scenario must be tested carefully and should not be used for routine administration.

---

## 12. Monitoring

After deployment, administrators should monitor:

* Administrative sign-in attempts.
* Failed authentication attempts.
* Conditional Access failures.
* Unusual sign-in locations.
* Risky sign-ins.
* Administrative activity.
* Conditional Access policy changes.
* Unexpected access blocks.

Administrative sign-ins should receive particular attention because of the potential impact of a compromised privileged account.

---

## 13. Relationship with Privileged Access Management

Conditional Access should work together with Privileged Identity Management and the organization's broader Privileged Access Management model.

The preferred security model is:

```text id="x0h1t5"
Administrator
      │
      ▼
Eligible Privileged Role
      │
      ▼
Request Activation
      │
      ▼
Conditional Access Evaluation
      │
      ▼
Strong Authentication
      │
      ▼
Temporary Privileged Access
      │
      ▼
Administrative Task
      │
      ▼
Role Expires
```

This combines:

* Least privilege.
* Just-in-time access.
* Strong authentication.
* Conditional Access.
* Administrative monitoring.

The objective is to ensure that privileged access is not continuously available when it is not required.

---

## 14. Administrative Account Separation

Where appropriate, administrators should separate their standard business activities from privileged administrative activities.

### Standard Account

Used for:

* Email.
* Microsoft Teams.
* OneDrive.
* Normal business activities.

### Administrative Account

Used for:

* Administrative portals.
* Tenant configuration.
* Security administration.
* Privileged administrative tasks.

Separating these activities can reduce the risk of privileged credentials being exposed during routine business activities.

---

## 15. Policy Documentation Requirements

The following information should be documented:

* Policy name.
* Business objective.
* Administrative roles included.
* Emergency access exclusions.
* Authentication requirements.
* Device conditions.
* Location conditions.
* Grant controls.
* Session controls, where applicable.
* Policy mode.
* Policy owner.
* Creation date.
* Last review date.
* Change history.
* Approved exceptions.

Proper documentation supports accountability, troubleshooting, governance, and future policy reviews.

---

## 16. Potential Policy Conflicts

This policy may interact with other Conditional Access policies.

For example:

```text
CA-001 — Require MFA
        +
CA-002 — Protect Administrative Access
```

An administrator may be subject to both policies.

The combined requirements should be reviewed to ensure that:

* Access is not unintentionally blocked.
* Administrators are not subjected to unnecessary authentication friction.
* Emergency access remains available.
* Security requirements are appropriately enforced.
* Policy interactions produce the intended security outcome.

Conditional Access policies should therefore be tested together where multiple policies apply to the same users and resources.

---

## 17. Final Policy Model

```text id="7jjw4z"
Privileged Administrator
        │
        ▼
Administrative Sign-In
        │
        ▼
Conditional Access Evaluation
        │
        ├── Strong Authentication
        │
        ├── Appropriate Device
        │
        ├── Acceptable Risk
        │
        └── Approved Access Context
                │
                ▼
          Administrative Access
```

If the required security controls are not satisfied:

```text id="m6v0zt"
Security Requirement Not Met
        │
        ▼
Additional Authentication
        │
        ├── Requirements Satisfied
        │          │
        │          ▼
        │      Access Granted
        │
        └── Requirements Not Satisfied
                   │
                   ▼
               Access Denied
```

---

## 18. Final Principle

> **Administrative access requires stronger protection than ordinary user access because the potential impact of compromise is significantly greater.**

The objective is to ensure that privileged access is:

* Strongly authenticated.
* Appropriately scoped.
* Performed from an appropriate environment.
* Evaluated based on relevant risk signals.
* Monitored.
* Regularly reviewed.
* Limited to the period and purpose required.

Protecting administrative access is a foundational component of the organization's Zero Trust security architecture.
