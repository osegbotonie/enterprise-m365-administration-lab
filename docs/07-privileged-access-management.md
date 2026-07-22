# Privileged Access Management

## 1. Overview

Privileged Access Management defines how administrative access to the Microsoft 365 environment is controlled, protected, monitored, and reviewed.

Privileged accounts have the ability to make significant changes to the organization's:

* Identities
* Security policies
* Devices
* Applications
* Data
* Collaboration services
* Microsoft 365 tenant configuration

Because of the potential impact of privileged access, administrative permissions must be carefully controlled.

---

## 2. Privileged Access Risk

A permanently assigned privileged account creates a significant security risk.

### Example

An administrator has permanent:

`Global Administrator`

permissions.

If the administrator's credentials are compromised, an attacker may gain extensive control over the tenant.

### Risk Model

```text
Compromised Admin Account
          │
          ▼
Permanent Privileged Role
          │
          ▼
Potential Tenant-Wide Impact
```

The organization should therefore minimize permanent privileged access.

---

## 3. Principle of Least Privilege

Administrators should receive only the permissions required to perform their responsibilities.

For example:

| Administrative Task      | Appropriate Role         |
| ------------------------ | ------------------------ |
| Manage users             | User Administrator       |
| Manage groups            | Groups Administrator     |
| Manage devices           | Intune Administrator     |
| Manage security          | Security Administrator   |
| Manage Exchange          | Exchange Administrator   |
| Manage SharePoint        | SharePoint Administrator |
| Manage the entire tenant | Global Administrator     |

The Global Administrator role should not be used for routine administrative activities when a more specific role is sufficient.

---

## 4. Role Separation

Administrative responsibilities should be separated where possible.

### Example

```text
Identity Administration
        │
        ▼
User Administrator
```

```text
Device Administration
        │
        ▼
Intune Administrator
```

```text
Security Administration
        │
        ▼
Security Administrator
```

This reduces the number of individuals with unrestricted administrative access.

---

## 5. Normal User Account and Administrative Account

Where appropriate, administrative personnel should separate normal business activities from privileged administration.

### Normal Account

Used for:

* Email
* Microsoft Teams
* Web browsing
* Normal business activities

### Administrative Account

Used for:

* Administrative tasks
* Configuration changes
* Security management
* Privileged operations

The administrative account should not be used for routine activities where avoidable.

---

## 6. Just-In-Time Access

Privileged access should be activated only when required.

### Recommended Model

```text
Eligible Administrator
        │
        ▼
Request Role Activation
        │
        ▼
Authentication Requirements
        │
        ▼
Approval Where Required
        │
        ▼
Temporary Role Activation
        │
        ▼
Administrative Task
        │
        ▼
Automatic Expiration
```

The administrator should not hold unnecessary elevated privileges when not actively performing administrative work.

---

## 7. Privileged Role Example

### Normal State

```text
Administrator
      │
      ▼
Eligible for:
Global Administrator
```

The role is not permanently active.

### During Approved Task

```text
Administrator
      │
      ▼
Request Activation
      │
      ▼
Additional Authentication
      │
      ▼
Temporary Activation
      │
      ▼
Global Administrator
```

### After Task

```text
Administrative Task Completed
      │
      ▼
Role Expires
      │
      ▼
Administrator Returns to Normal Access
```

---

## 8. Break-Glass Emergency Accounts

The organization should maintain emergency access accounts for exceptional circumstances.

These accounts should be:

* Highly protected.
* Used only during emergencies.
* Monitored.
* Tested periodically.
* Subject to strict governance.

### Example Emergency Scenarios

* Loss of normal administrator access.
* Authentication service failure.
* Critical tenant configuration problem.
* Emergency security response.

Break-glass accounts should not be used for routine administration.

---

## 9. Privileged Access Security Requirements

Privileged accounts should have strong security controls.

These may include:

* Multi-factor authentication.
* Phishing-resistant authentication where available.
* Conditional Access policies.
* Sign-in monitoring.
* Risk detection.
* Administrative activity logging.
* Regular access reviews.

Privileged accounts should receive stronger controls than ordinary user accounts.

---

## 10. Administrative Role Assignment

Administrative roles should be assigned according to responsibility.

### Example

| Responsibility             | Role                     |
| -------------------------- | ------------------------ |
| Identity Administration    | User Administrator       |
| Group Management           | Groups Administrator     |
| Device Management          | Intune Administrator     |
| Security Operations        | Security Administrator   |
| Exchange Administration    | Exchange Administrator   |
| SharePoint Administration  | SharePoint Administrator |
| Tenant-Wide Administration | Global Administrator     |

The principle is:

> **Use the least powerful role capable of completing the task.**

---

## 11. Privileged Access Review

Administrative access should be reviewed regularly.

The review should verify:

* Who has administrative access.
* Which role they have.
* Whether the role is still required.
* When the role was last used.
* Whether the access is permanent or eligible.
* Whether the administrator still holds the relevant job responsibility.

Unused or unnecessary administrative access should be removed.

---

## 12. Privileged Access Monitoring

Administrative activities should be monitored and logged.

Important events include:

* Role activation.
* Role assignment.
* Role removal.
* Security policy changes.
* Conditional Access changes.
* User creation.
* User deletion.
* Group membership changes.
* Administrative configuration changes.

The organization should be able to answer:

> Who performed this administrative action?

---

## 13. Administrative Access Model

The recommended model is:

```text
Administrator
      │
      ▼
Normal Account
      │
      ▼
Eligible Privileged Role
      │
      ▼
Activation Request
      │
      ▼
Authentication / Approval
      │
      ▼
Temporary Elevated Access
      │
      ▼
Administrative Task
      │
      ▼
Automatic Expiration
```

---

## 14. Example Scenario

### Scenario

The Identity Administrator needs to create 20 new user accounts.

### Recommended Process

1. The administrator uses their normal account.
2. The administrator activates the required privileged role.
3. Additional authentication is performed.
4. The administrator completes the task.
5. The privileged role expires.
6. The activity is recorded for auditing.

The administrator does not need permanent Global Administrator access to perform this task.

---

## 15. Governance Principles

Privileged access should follow these principles:

1. Minimize the number of privileged administrators.
2. Use the least powerful role required.
3. Avoid permanent privileged access where possible.
4. Use time-limited elevation.
5. Require strong authentication.
6. Monitor privileged activity.
7. Review privileged access regularly.
8. Maintain emergency access capability.
9. Separate administrative and normal user activities where appropriate.
10. Ensure privileged actions are auditable.

---

## 16. Summary

Privileged access represents one of the highest-risk areas of the Microsoft 365 environment.

The organization should therefore implement:

* Least-privilege administrative roles.
* Just-In-Time access.
* Strong authentication.
* Role separation.
* Break-glass emergency accounts.
* Administrative monitoring.
* Regular access reviews.

The central principle is:

> **Administrative access should be granted only when required, for only as long as required, with appropriate security controls and auditing.**

---

## 17. Future Enhancements

Future improvements may include:

* Microsoft Entra Privileged Identity Management.
* Access reviews.
* Approval workflows.
* Phishing-resistant authentication.
* Privileged access workstations.
* Administrative session monitoring.
* Automated privileged role reviews.
* Security Operations Center integration.
