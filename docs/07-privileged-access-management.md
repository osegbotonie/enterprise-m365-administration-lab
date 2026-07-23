# Privileged Access Management

## 1. Overview

Privileged Access Management defines how administrative access to the Microsoft 365 environment of Tonie-Osegbo Technologies Limited is controlled, protected, monitored, and reviewed.

Privileged accounts can make significant changes to the organization's:

* Identities.
* Security policies.
* Devices.
* Applications.
* Data.
* Collaboration services.
* Microsoft 365 tenant configuration.

Because privileged access can have a significant impact on the environment, administrative permissions must be carefully controlled.

The primary objective is to ensure that:

> **Administrative access is granted only to authorized personnel, for an appropriate purpose, and for no longer than necessary.**

---

# 2. Privileged Access Risk

A permanently active privileged account creates a significant security risk.

### Example

An administrator has an active:

```text id="r8v4xa"
Global Administrator
```

role.

If the administrator's credentials are compromised, an attacker may gain extensive control over the Microsoft 365 tenant.

### Risk Model

```text id="k93d6n"
Compromised Administrator Account
              │
              ▼
Active Privileged Role
              │
              ▼
Unauthorized Administrative Activity
              │
              ▼
Potential Tenant-Wide Impact
```

The organization should therefore minimize the number of permanently active privileged roles.

---

# 3. Principle of Least Privilege

Administrators should receive only the permissions required to perform their responsibilities.

### Examples

| Administrative Responsibility | Appropriate Role         |
| ----------------------------- | ------------------------ |
| Manage users                  | User Administrator       |
| Manage groups                 | Groups Administrator     |
| Manage devices                | Intune Administrator     |
| Manage security configuration | Security Administrator   |
| Manage Exchange Online        | Exchange Administrator   |
| Manage SharePoint             | SharePoint Administrator |
| Manage the entire tenant      | Global Administrator     |

The Global Administrator role should not be used for routine administrative activities when a more specific role is sufficient.

The principle is:

> **Use the least powerful role capable of completing the task.**

---

# 4. Role Separation

Administrative responsibilities should be separated where practical.

### Identity Administration

```text id="f8d6ad"
Identity Administration
        │
        ▼
User Administrator
```

### Device Administration

```text id="m0y9ij"
Device Administration
        │
        ▼
Intune Administrator
```

### Security Administration

```text id="9p1xjs"
Security Administration
        │
        ▼
Security Administrator
```

Role separation reduces the number of individuals with unrestricted administrative access.

It also supports separation of duties and reduces the potential impact of a compromised administrator account.

---

# 5. Normal User Account and Administrative Account

Where appropriate, administrative personnel should separate normal business activities from privileged administration.

## Normal User Account

Used for:

* Email.
* Microsoft Teams.
* Normal business activities.
* Routine productivity tasks.

## Administrative Account

Used for:

* Administrative tasks.
* Configuration changes.
* Security management.
* Privileged operations.

Administrative accounts should not be used for routine activities where avoidable.

Separating normal and administrative activities can reduce the exposure of privileged credentials.

---

# 6. Privileged Role Assignment States

Privileged roles may exist in different assignment states.

## Permanent Active Assignment

The administrator has the role continuously active.

This should be minimized for highly privileged roles.

## Eligible Assignment

The administrator is authorized to activate the role when required but does not have the role continuously active.

This is the preferred model for many privileged roles where supported and appropriate.

## Active Assignment

The administrator has temporarily activated the role to perform an administrative task.

The role remains active only for the configured duration.

### Model

```text id="t0t2op"
Eligible Administrator
        │
        ▼
Role Activation
        │
        ▼
Temporary Active Role
        │
        ▼
Administrative Task
        │
        ▼
Role Deactivation or Expiration
```

---

# 7. Just-In-Time Privileged Access

Privileged access should be activated only when required.

### Recommended Model

```text id="4j7a9e"
Eligible Administrator
        │
        ▼
Request Role Activation
        │
        ▼
Additional Authentication
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

The specific activation requirements should depend on the sensitivity of the role.

Possible controls include:

* Multi-factor authentication.
* Approval.
* Justification.
* Activation duration limits.
* Conditional Access requirements.

The objective is to prevent unnecessary standing privilege.

---

# 8. Privileged Role Example

## Normal State

```text id="9p8jjk"
Administrator
      │
      ▼
Eligible for Privileged Role
```

The role is not permanently active.

## During an Approved Task

```text id="4f13ve"
Administrator
      │
      ▼
Request Activation
      │
      ▼
Additional Authentication
      │
      ▼
Approval Where Required
      │
      ▼
Temporary Role Activation
      │
      ▼
Administrative Task
```

## After the Task

```text id="j8j1sl"
Administrative Task Completed
      │
      ▼
Role Deactivated or Expires
      │
      ▼
Administrator Returns to Normal Access
```

---

# 9. Break-Glass Emergency Accounts

The organization should maintain emergency access accounts for exceptional circumstances.

These accounts provide an emergency path to administrative access when normal privileged access mechanisms are unavailable.

Break-glass accounts should be:

* Highly protected.
* Used only during emergencies.
* Monitored.
* Tested periodically.
* Subject to strict governance.

### Example Emergency Scenarios

* Loss of normal administrator access.
* Failure of normal authentication methods.
* Critical tenant configuration problems.
* Emergency security response.
* Loss of access to normal privileged administration.

Break-glass accounts should not be used for routine administration.

Their credentials should be protected using appropriate organizational controls, and their use should generate immediate investigation and review.

---

# 10. Privileged Access Security Requirements

Privileged accounts should receive stronger security controls than ordinary user accounts.

These controls may include:

* Multi-factor authentication.
* Phishing-resistant authentication where available.
* Conditional Access policies.
* Sign-in monitoring.
* Risk detection.
* Administrative activity logging.
* Regular access reviews.
* Device security requirements.

Privileged access should be subject to a higher level of security assurance because of the potential impact of compromise.

---

# 11. Administrative Role Assignment

Administrative roles should be assigned according to actual responsibility.

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

Administrative role assignment should be based on business need rather than job title alone.

For example:

> A senior employee should not automatically receive Global Administrator access simply because they hold a senior organizational position.

---

# 12. Privileged Access Review

Administrative access should be reviewed regularly.

The review should verify:

* Who has administrative access.
* Which role they have.
* Whether the role is still required.
* Whether the role is permanent or eligible.
* When the role was last used.
* Whether the administrator still holds the relevant responsibility.
* Whether the assigned permissions remain appropriate.

Unused or unnecessary administrative access should be removed.

The review should give particular attention to:

* Global Administrator.
* Privileged Role Administrator.
* Security Administrator.
* Exchange Administrator.
* SharePoint Administrator.
* Intune Administrator.

---

# 13. Privileged Access Monitoring

Administrative activity should be monitored and logged.

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
* Emergency account usage.

The organization should be able to answer:

> **Who performed this administrative action?**

Where possible, administrative actions should be traceable to:

* The administrator.
* The role used.
* The action performed.
* The time of the action.
* The affected resource.

---

# 14. Administrative Access Model

The recommended model is:

```text id="j6i9hb"
Administrator
      │
      ▼
Normal User Account
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
      │
      ▼
Normal Access
```

---

# 15. Example Scenario

## Scenario

The Identity Administrator needs to create 20 new user accounts.

## Recommended Process

1. The administrator uses the appropriate administrative account.
2. The administrator activates the required privileged role if the role is eligible.
3. Additional authentication requirements are completed.
4. Approval is completed if required by policy.
5. The administrator creates the user accounts.
6. The privileged role expires or is deactivated.
7. The activity remains available for auditing.

The administrator does not need permanent Global Administrator access to perform this task.

---

# 16. Emergency Access Scenario

## Scenario

Normal administrative access is unavailable due to an authentication or configuration problem.

## Recommended Process

1. An authorized administrator uses the emergency access process.
2. The break-glass account is used only when necessary.
3. The emergency activity is monitored.
4. The underlying issue is investigated.
5. The emergency account usage is reviewed.
6. Any required credentials or controls are rotated according to organizational policy.

Emergency access should be treated as a security event requiring appropriate review.

---

# 17. Governance Principles

Privileged access should follow these principles:

1. Minimize the number of privileged administrators.
2. Use the least powerful role required.
3. Avoid permanent privileged access where possible.
4. Use time-limited elevation.
5. Require strong authentication.
6. Require approval where appropriate.
7. Monitor privileged activity.
8. Review privileged access regularly.
9. Maintain emergency access capability.
10. Separate administrative and normal user activities where appropriate.
11. Ensure privileged actions are auditable.
12. Document exceptions.

---

# 18. Summary

Privileged access represents one of the highest-risk areas of the Microsoft 365 environment.

The organization should therefore implement:

* Least-privilege administrative roles.
* Eligible privileged assignments where appropriate.
* Just-In-Time access.
* Strong authentication.
* Role separation.
* Break-glass emergency accounts.
* Administrative monitoring.
* Regular access reviews.

The central principle is:

> **Administrative access should be granted only when required, for only as long as required, with appropriate security controls and auditing.**

---

# 19. Future Enhancements

Future improvements may include:

* Microsoft Entra Privileged Identity Management.
* Access Reviews.
* Approval workflows.
* Phishing-resistant authentication.
* Privileged Access Workstations.
* Administrative session monitoring.
* Automated privileged role reviews.
* Security Operations Center integration.
* Automated alerts for privileged role activation.
* Emergency access account monitoring.

---

## Conclusion

Privileged Access Management provides a structured approach to controlling the highest-risk permissions in the Microsoft 365 environment.

The design is based on the principle that privileged access should be:

> **Limited, justified, protected, temporary where possible, monitored, and regularly reviewed.**

This approach reduces the potential impact of compromised administrative credentials and supports a stronger Zero Trust security model.
