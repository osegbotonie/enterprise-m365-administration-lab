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

A compromised administrative account could therefore have a significant impact on the organization.

The purpose of this policy is to apply stronger access controls to privileged administrative accounts and ensure that administrative access is subject to enhanced authentication and security requirements.

This policy forms part of the organization's broader **Privileged Access Management** and **Zero Trust** security model.

The objective is to ensure that administrative access is:

* Strongly authenticated.
* Appropriately scoped.
* Accessed from an appropriate environment where required.
* Evaluated against relevant security signals.
* Monitored and reviewed.

---

## 3. Security Problem

A compromised administrative account can provide an attacker with the ability to make changes that affect the wider Microsoft 365 environment.

Depending on the role assigned, an attacker may be able to:

* Create, modify, or delete user accounts.
* Modify security policies.
* Change Conditional Access policies.
* Assign administrative roles.
* Access sensitive organizational information.
* Modify Microsoft 365 configurations.
* Disable or weaken security controls.

The potential impact of a compromised privileged account is therefore significantly greater than that of a standard user account.

### Risk Model

```text
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

Administrative accounts must therefore receive stronger protection than ordinary user accounts.

---

## 4. Policy Scope

This policy should apply to users assigned privileged administrative roles within the Microsoft 365 environment.

Examples include:

* Global Administrator.
* Privileged Role Administrator.
* Security Administrator.
* User Administrator.
* Intune Administrator.
* Exchange Administrator.
* SharePoint Administrator.
* Teams Administrator.
* Other privileged roles identified through the organization's administrative role model.

The scope should be reviewed periodically to ensure that newly introduced administrative roles and privileged accounts are not unintentionally excluded.

Administrative access should be based on the actual privileges assigned to an account rather than the user's department or job title.

For example, membership in the IT department alone should not automatically place a user within the scope of privileged administrative controls.

---

## 5. Emergency Access Accounts

Emergency access accounts require special consideration when designing this policy.

A Conditional Access policy that unintentionally blocks every administrative account could result in tenant lockout. Emergency access accounts should therefore be designed to provide a controlled recovery path where normal administrative access is unavailable.

Where an emergency access account is excluded from this policy, the exclusion must be:

* Limited to the specific emergency account.
* Documented.
* Closely monitored.
* Periodically tested.
* Protected by appropriate organizational controls.

Emergency access accounts must not be used for routine administration.

Any use of an emergency access account should generate appropriate monitoring, investigation, and review.

---

## 6. Authentication Requirements

Administrative access should require stronger authentication than standard user access.

The policy should consider requiring:

* Multifactor Authentication.
* Strong authentication methods.
* Phishing-resistant authentication where available and appropriate.
* Additional authentication requirements for high-risk administrative access.

The required authentication strength should reflect the level of privilege being protected.

For example, highly privileged roles such as Global Administrator should receive stronger protection than lower-risk administrative roles where the organization's security capabilities support this distinction.

The objective is to ensure that possession of an administrator's password alone is not sufficient to access privileged administrative interfaces.

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
      ├── Requirements Satisfied
      │        │
      │        ▼
      │     Access Granted
      │
      └── Requirements Not Satisfied
               │
               ▼
       Additional Authentication
               │
               ▼
      Requirements Satisfied?
               │
          ┌────┴────┐
          ▼         ▼
        Yes         No
          │         │
          ▼         ▼
       Allow      Block
```

Access should only be granted when the requirements defined by the applicable Conditional Access policies have been satisfied.

---

## 8. Device Considerations

Administrative access should, where practical, be performed from appropriately secured and trusted devices.

Depending on the organization's device-management capabilities, administrative access may require:

* A compliant device.
* A managed device.
* An appropriately secured administrative workstation.
* Required security configuration.
* Supported operating system and security updates.

This reduces the risk of privileged credentials being used from unmanaged, insecure, or compromised devices.

Device requirements should be introduced according to the organization's administrative access model and operational requirements.

The objective is to balance security with the practical requirements of administering the environment.

---

## 9. Location and Network Considerations

The organization may evaluate administrative sign-ins using location and network context.

Examples may include:

* Approved corporate locations.
* Approved remote-access locations.
* Unusual geographic locations.
* High-risk sign-in locations.
* Unexpected network locations.

Location should not be treated as a standalone trust mechanism.

A legitimate administrator may travel or work remotely, while an attacker may attempt to bypass location-based controls.

Location and network context should therefore be evaluated alongside other signals, including:

* User identity.
* Device status.
* Authentication strength.
* Sign-in risk.
* User risk.
* Application being accessed.

---

## 10. Policy Deployment Lifecycle

The policy should follow a controlled deployment process.

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

The policy should not be broadly enforced until its potential impact has been tested and reviewed.

Before enforcement, administrators should confirm:

* The correct administrative accounts are included.
* Emergency access accounts remain available where required.
* Legitimate administrative workflows continue to function.
* Authentication requirements can be completed successfully.
* Other Conditional Access policies do not create unintended conflicts.

---

## 11. Testing Plan

### Test 1 — Administrator Meets Authentication Requirements

**Scenario:**

An administrator attempts to access an administrative portal and successfully completes the required authentication controls.

**Expected Result:**

```text
Administrative Sign-In
        │
        ▼
Required Authentication
        │
        ▼
Conditional Access Requirements Satisfied
        │
        ▼
Access Granted
```

---

### Test 2 — Administrator Does Not Meet Authentication Requirements

**Scenario:**

An administrator attempts to access an administrative portal without completing the required authentication requirements.

**Expected Result:**

```text
Administrative Sign-In
        │
        ▼
Required Authentication Not Completed
        │
        ▼
Additional Authentication Required
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

### Test 3 — Emergency Access Account

**Scenario:**

Normal administrative access is unavailable and the documented emergency access process is required.

**Expected Result:**

The emergency access process remains available in accordance with the organization's emergency access design.

The use of the emergency account must be:

* Monitored.
* Investigated.
* Documented.
* Reviewed after the event.

Emergency access must not be used for routine administration.

---

## 12. Monitoring

After deployment, administrators should monitor:

* Administrative sign-in attempts.
* Failed authentication attempts.
* Conditional Access failures.
* Unusual sign-in locations.
* Risky sign-ins.
* Unexpected access blocks.
* Conditional Access policy changes.
* Administrative activity following successful sign-in.

Particular attention should be given to unexpected administrative sign-ins because of the potential impact of a compromised privileged account.

The organization should be able to determine:

> **Who attempted administrative access, whether access was granted or blocked, what conditions were evaluated, and whether any administrative activity followed the sign-in.**

---

## 13. Relationship with Privileged Access Management

Conditional Access should operate together with the organization's broader Privileged Access Management model.

The preferred model is:

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

This model combines:

* Least privilege.
* Just-in-time access.
* Strong authentication.
* Conditional Access.
* Administrative monitoring.

The objective is to reduce unnecessary standing privilege and ensure that elevated access is only available when it is required.

---

## 14. Administrative Account Separation

Where appropriate, administrators should separate normal business activities from privileged administrative activities.

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

Separating these activities reduces the exposure of privileged credentials during routine business activities.

It also makes it easier to distinguish normal user activity from administrative activity during monitoring and investigations.

---

## 15. Policy Documentation Requirements

The following information should be documented for this policy:

* Policy name.
* Business objective.
* Administrative roles included.
* Emergency access exclusions.
* Authentication requirements.
* Device conditions.
* Location and network conditions.
* Grant controls.
* Session controls, where applicable.
* Policy mode.
* Policy owner.
* Creation date.
* Last review date.
* Change history.
* Approved exceptions.

The documentation should be maintained alongside the Conditional Access policy inventory and updated whenever the policy is significantly changed.

---

## 16. Potential Policy Conflicts

This policy may interact with other Conditional Access policies.

For example:

```text
CA-001 — Require MFA
        +
CA-002 — Protect Administrative Access
        │
        ▼
Combined Access Requirements
```

An administrator may therefore be subject to multiple policies during the same sign-in.

The combined requirements should be reviewed to ensure that:

* Administrative access is not unintentionally blocked.
* Authentication requirements are not unnecessarily duplicated.
* Emergency access remains available.
* Security requirements are appropriately enforced.
* The combined policy outcome matches the intended security design.

Conditional Access policies should therefore be tested together where multiple policies apply to the same users and resources.

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
* Accessed from an appropriate environment where required.
* Evaluated using relevant security signals.
* Monitored.
* Regularly reviewed.
* Limited to the period and purpose required.

Protecting administrative access is a foundational component of the organization's Zero Trust security architecture.

The policy should therefore be implemented as part of a wider security model that includes:

```text
Least Privilege
      │
      ▼
Privileged Access Management
      │
      ▼
Conditional Access
      │
      ▼
Strong Authentication
      │
      ▼
Secure Devices
      │
      ▼
Monitoring and Review
```

This layered approach reduces the likelihood and potential impact of compromised administrative credentials while maintaining a practical and manageable administration model for the Microsoft 365 environment.
