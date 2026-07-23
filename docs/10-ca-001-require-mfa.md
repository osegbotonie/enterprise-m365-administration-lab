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

The objective of this policy is to reduce the risk of unauthorized access caused by compromised usernames and passwords.

A password alone should not be considered sufficient protection for access to organizational Microsoft 365 resources.

The policy introduces an additional authentication requirement when users access protected cloud resources.

---

## 3. Security Problem

A user account may be compromised through:

* Password reuse.
* Phishing.
* Credential theft.
* Password spraying.
* Malware.
* Social engineering.
* Data breaches.

If an attacker obtains a user's password, MFA provides an additional security barrier.

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

---

## 4. Policy Scope

### Users Included

The policy should include:

* Standard employee accounts.
* Appropriate cloud users.

### Users Excluded

The following should be carefully considered before exclusion:

* Emergency access accounts.
* Approved service accounts where applicable.
* Accounts with documented technical exceptions.

Exclusions must be minimized and documented.

---

## 5. Target Resources

The policy should protect access to organizational cloud resources.

The exact application scope should be defined according to the organization's rollout strategy.

Possible targets include:

* Microsoft 365 services.
* Exchange Online.
* SharePoint Online.
* Microsoft Teams.
* OneDrive.
* Microsoft Entra administrative portals.

---

## 6. Conditions

The policy may evaluate conditions such as:

* User identity.
* Device platform.
* Location.
* Client application.
* Sign-in risk.

The initial policy should avoid unnecessary complexity.

A simple policy is easier to test and troubleshoot.

---

## 7. Grant Control

### Primary Grant Control

Require multifactor authentication.

The user must successfully complete an approved MFA method before access is granted.

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

The policy should not immediately be enabled for all users without testing.

---

## 9. Testing Plan

Before production enforcement, the policy should be tested with a controlled pilot group.

### Test Scenarios

#### Test 1 — Standard User

Expected result:

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

#### Test 2 — MFA Failure

Expected result:

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

#### Test 3 — Excluded Emergency Account

Expected result:

```text
Emergency Account
       │
       ▼
Policy Exclusion
       │
       ▼
Access Remains Available
```

This scenario should be carefully monitored and should not be used for normal daily administration.

---

## 10. Security Considerations

The policy should consider:

* MFA registration.
* Recovery methods.
* Authentication method strength.
* Phishing-resistant authentication where available.
* Emergency access.
* Service account dependencies.
* Legacy applications.
* User support requirements.

MFA should not be treated as a complete security solution.

It should be part of a broader identity security architecture.

---

## 11. Monitoring

After deployment, administrators should monitor:

* Sign-in failures.
* MFA failures.
* Authentication method issues.
* User lockouts.
* Policy failures.
* Unexpected access blocks.

Conditional Access reporting should be used to understand the effect of the policy.

---

## 12. Documentation

The following information should be maintained:

* Policy name.
* Business objective.
* Included users.
* Excluded users.
* Target resources.
* Conditions.
* Grant controls.
* Session controls.
* Policy mode.
* Owner.
* Creation date.
* Last review date.
* Change history.

---

## 13. Rollback Plan

If the policy causes unexpected business disruption:

1. Identify the affected users.
2. Review Conditional Access sign-in results.
3. Confirm the policy causing the issue.
4. Temporarily disable or adjust the policy if necessary.
5. Resolve the underlying issue.
6. Test again.
7. Re-enable enforcement.

Emergency access procedures should be documented before broad enforcement.

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

> **MFA should protect user access while Conditional Access policies are deployed through a controlled, tested, and monitored process.**

The organization should never treat a security policy as successful merely because it has been enabled.

A successful policy must be:

* Correctly scoped.
* Tested.
* Monitored.
* Understood by administrators.
* Recoverable if problems occur.
