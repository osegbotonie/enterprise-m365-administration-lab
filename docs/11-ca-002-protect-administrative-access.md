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

The purpose of this policy is to apply stronger access controls to privileged administrators.

---

## 3. Security Problem

An attacker who compromises a Global Administrator account may be able to:

* Create or delete users.
* Modify security policies.
* Change Conditional Access policies.
* Assign administrative roles.
* Access sensitive information.
* Modify Microsoft 365 configurations.
* Disable security controls.

### Risk Model

```text
Compromised Administrator Account
            │
            ▼
Administrative Portal Access
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
* Other privileged administrative roles.

The exact scope should be reviewed according to the organization's risk model.

---

## 5. Emergency Access Exclusions

Emergency access accounts should be carefully considered.

They may need to be excluded from certain Conditional Access policies to prevent a situation where all administrative access is accidentally blocked.

However, exclusions must not become a way to bypass security controls.

Emergency access accounts should be:

* Strongly protected.
* Monitored.
* Tested periodically.
* Used only when necessary.
* Documented.

---

## 6. Authentication Requirements

Administrative access should require strong authentication.

The policy should consider requiring:

* Multifactor authentication.
* Strong authentication methods.
* Phishing-resistant authentication where available.
* Additional authentication for sensitive administrative operations.

The authentication strength should reflect the level of privilege being protected.

---

## 7. Administrative Access Decision Model

```text
Administrator
      │
      ▼
Attempts Administrative Access
      │
      ▼
Conditional Access Evaluation
      │
      ├── Trusted Authentication
      │        │
      │        ▼
      │     Access Granted
      │
      └── Authentication Requirement Not Met
               │
               ▼
            Access Denied
```

---

## 8. Device Considerations

Administrative access should ideally be performed from trusted and appropriately secured devices.

Where the organization's device management capability supports it, administrative access may require:

* A compliant device.
* A managed device.
* An appropriately secured administrative workstation.

This reduces the risk of privileged credentials being used from unmanaged or compromised devices.

---

## 9. Location Considerations

The organization may evaluate administrative sign-ins based on location.

Examples include:

* Trusted corporate locations.
* Approved remote access locations.
* Unusual geographic locations.
* High-risk sign-in locations.

Location should not be treated as the only security control because location can be spoofed or bypassed.

It should be considered alongside:

* User identity.
* Device status.
* Authentication strength.
* Sign-in risk.

---

## 10. Policy Deployment Lifecycle

The policy should follow a controlled deployment process:

```text
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

---

## 11. Testing Plan

### Test 1 — Administrator with Strong Authentication

Expected result:

```text
Administrative Sign-In
        │
        ▼
Strong Authentication
        │
        ▼
Conditional Access Satisfied
        │
        ▼
Access Granted
```

---

### Test 2 — Administrator Without Required Authentication

Expected result:

```text
Administrative Sign-In
        │
        ▼
Required Authentication Not Completed
        │
        ▼
Access Denied or Additional Authentication Required
```

---

### Test 3 — Emergency Access Account

Expected result:

The emergency access process should remain available according to the organization's documented emergency access design.

This scenario must be tested carefully and should not be used for routine administration.

---

## 12. Monitoring

After deployment, administrators should monitor:

* Administrative sign-in attempts.
* Failed authentication.
* Conditional Access failures.
* Unusual locations.
* Risky sign-ins.
* Administrative activity.
* Policy changes.

Administrative sign-ins should receive particular attention because of the potential impact of account compromise.

---

## 13. Relationship with Privileged Access Management

Conditional Access should work together with Privileged Identity Management.

The preferred security model is:

```text
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

---

## 14. Administrative Account Separation

Where appropriate, administrators should separate:

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
* Privileged tasks.

This reduces the risk of privileged credentials being exposed during routine activities.

---

## 15. Policy Documentation Requirements

The following should be documented:

* Policy name.
* Business objective.
* Administrative roles included.
* Emergency access exclusions.
* Authentication requirements.
* Device conditions.
* Location conditions.
* Grant controls.
* Session controls.
* Policy mode.
* Owner.
* Creation date.
* Review date.
* Change history.

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

The combined requirements must be reviewed to ensure that:

* Access is not unintentionally blocked.
* Administrators are not subjected to unnecessary authentication friction.
* Emergency access remains available.
* Security requirements are appropriately enforced.

---

## 17. Final Policy Model

```text
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

```text
Security Requirement Not Met
        │
        ▼
Additional Authentication
        │
        OR
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
* Monitored.
* Reviewed.
* Limited to the period and purpose required.
