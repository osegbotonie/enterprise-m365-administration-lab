# CA-001 — Require Multifactor Authentication

## 1. Policy Overview

| Field       | Value                                     |
| ----------- | ----------------------------------------- |
| Policy Name | CA-001-Require-MFA-Standard-Users         |
| Policy Type | Conditional Access                        |
| Priority    | Initial Security Control                  |
| Status      | Design                                    |
| Owner       | IT / Identity and Security Administration |

---

## 2. Business Objective

The objective of this policy is to reduce the risk of unauthorized access resulting from compromised usernames and passwords.

A password alone should not be considered sufficient protection for access to the organization's Microsoft 365 resources.

This policy requires users to complete an additional authentication challenge before access is granted to protected cloud resources.

---

## 3. Security Problem

User accounts can be compromised through several methods, including:

* Password reuse.
* Phishing.
* Credential theft.
* Password spraying.
* Malware.
* Social engineering.
* Data breaches.

If an attacker obtains a user's password, Multifactor Authentication (MFA) provides an additional layer of protection before access is granted.

### Risk Model

```text
Compromised Password
        │
        ▼
Attacker Attempts Sign-In
        │
        ▼
MFA Requirement
        │
        ├── Legitimate User
        │       │
        │       ▼
        │   Completes MFA
        │       │
        │       ▼
        │   Access Granted
        │
        └── Attacker
                │
                ▼
        Cannot Complete Required Authentication
                │
                ▼
             Access Blocked
```

MFA does not eliminate the risk of account compromise, but it significantly reduces the likelihood that a stolen password alone will be sufficient to access organizational resources.

---

## 4. Policy Scope

### Users Included

The initial policy scope should include:

* Standard employee accounts.
* Other appropriate cloud user accounts included in the approved rollout.

The exact scope should be confirmed during implementation to ensure that the policy is applied consistently to the intended user population.

### Users Excluded

The following should be carefully evaluated before exclusion:

* Emergency access accounts.
* Approved service accounts, where technically necessary.
* Accounts with documented and approved technical exceptions.

Exclusions should be minimized, formally approved where appropriate, and documented.

Emergency access accounts should be excluded only where necessary to prevent administrative lockout and should be subject to separate security controls and monitoring.

---

## 5. Target Resources

The policy should protect access to organizational cloud resources.

The exact application scope should be defined according to the organization's implementation and rollout strategy.

Potential targets include:

* Microsoft 365 services.
* Exchange Online.
* SharePoint Online.
* Microsoft Teams.
* OneDrive.
* Microsoft Entra administrative portals.

The initial scope should be carefully defined to provide meaningful security protection without causing unnecessary business disruption.

The policy should be tested against the actual applications and services in scope before production enforcement.

---

## 6. Conditions

The policy may evaluate contextual conditions such as:

* User identity.
* Device platform.
* Location.
* Client application.
* Sign-in risk.

The initial implementation should avoid unnecessary complexity.

A simple and clearly defined policy is easier to test, troubleshoot, monitor, and maintain.

Additional conditions may be introduced as the organization's Conditional Access architecture matures.

---

## 7. Grant Control

### Primary Grant Control

The primary grant control is:

**Require Multifactor Authentication**

The user must successfully complete an approved MFA challenge before access is granted.

### Decision Model

```text
User
  │
  ▼
Username + Password
  │
  ▼
MFA Challenge
  │
  ├── Successful
  │      │
  │      ▼
  │   Access Granted
  │
  └── Failed
         │
         ▼
      Access Denied
```

This control provides an additional layer of protection when a user's password has been compromised.

---

## 8. Policy Mode

The policy should follow a controlled deployment lifecycle:

```text
Disabled
   │
   ▼
Report-Only
   │
   ▼
Pilot Testing
   │
   ▼
Production Enforcement
```

The policy should not be immediately enforced across all users without appropriate testing.

Report-only mode should be used where appropriate to evaluate the potential impact of the policy before enforcement.

The pilot should include representative users and applications so that the organization can identify authentication issues before the policy is broadly enforced.

---

## 9. Testing Plan

Before production enforcement, the policy should be tested with a controlled pilot group.

### Test 1 — Standard User

**Expected Result:**

```text
User Sign-In
     │
     ▼
MFA Prompt
     │
     ▼
Successful MFA
     │
     ▼
Access Granted
```

### Test 2 — MFA Failure

**Expected Result:**

```text
User Sign-In
     │
     ▼
MFA Prompt
     │
     ▼
MFA Failure
     │
     ▼
Access Denied
```

### Test 3 — Excluded Emergency Account

**Expected Result:**

```text
Emergency Account
       │
       ▼
Policy Exclusion
       │
       ▼
Access Remains Available
```

Emergency accounts should be carefully protected, monitored, and tested. They should not be used for normal daily administration.

### Test 4 — Multiple Applicable Policies

The organization should also verify how this policy behaves when other Conditional Access policies apply to the same sign-in.

For example:

```text
CA-001: Require MFA
        +
CA-004: Require Compliant Device
        │
        ▼
Combined Access Decision
```

This is important because the final access decision may be affected by the combined requirements of multiple policies.

---

## 10. Security Considerations

The policy should consider:

* MFA registration.
* Authentication method strength.
* Account recovery methods.
* Phishing-resistant authentication where available.
* Emergency access accounts.
* Service account dependencies.
* Legacy application dependencies.
* User support requirements.

MFA should not be treated as a complete security solution.

It should form part of a broader identity and access security architecture that includes appropriate authentication, device security, risk-based controls, monitoring, and governance.

---

## 11. Monitoring

Following deployment, administrators should monitor:

* Sign-in failures.
* MFA failures.
* Authentication method issues.
* User lockouts.
* Conditional Access policy failures.
* Unexpected access blocks.
* Unusual authentication activity.

Conditional Access reporting should be used to understand the policy's impact and identify unexpected outcomes.

Monitoring should continue after deployment because authentication issues, application dependencies, and business requirements may change over time.

---

## 12. Documentation Requirements

The following information should be maintained for the policy:

* Policy name.
* Business objective.
* Included users and groups.
* Excluded users and groups.
* Target resources.
* Conditions.
* Grant controls.
* Session controls, where applicable.
* Policy mode.
* Policy owner.
* Creation date.
* Last review date.
* Change history.
* Approved exceptions.

Maintaining this information improves accountability and supports future troubleshooting, audits, and security reviews.

---

## 13. Rollback Plan

If the policy causes unexpected business disruption:

1. Identify the affected users or services.
2. Review the relevant Conditional Access sign-in results.
3. Confirm the policy responsible for the issue.
4. Temporarily disable or adjust the policy where necessary.
5. Investigate and resolve the underlying issue.
6. Test the revised configuration.
7. Re-enable enforcement following successful validation.

The rollback process should be documented and accessible to authorized administrators.

Emergency access procedures should be documented and tested before broad policy enforcement.

---

## 14. Final Design

The intended control is:

```text
User
  │
  ▼
Attempts to Access Microsoft 365
  │
  ▼
Conditional Access Evaluation
  │
  ▼
MFA Required
  │
  ├── MFA Successful ──► Access Granted
  │
  └── MFA Failed ──────► Access Denied
```

---

## 15. Final Principle

> **MFA should protect user access while Conditional Access policies are deployed through a controlled, tested, monitored, and recoverable process.**

The organization should not consider a security policy successful merely because it has been enabled.

A successful Conditional Access policy must be:

* Correctly scoped.
* Properly tested.
* Continuously monitored.
* Understood by administrators.
* Properly documented.
* Recoverable if unexpected issues occur.

The objective is to improve security without creating unnecessary business disruption or administrative lockout.
