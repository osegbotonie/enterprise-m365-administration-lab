# Privileged Access Management

## 1. Overview

Privileged Access Management (PAM) defines how administrative access to the Microsoft 365 environment of Tonie-Osegbo Technologies Limited is controlled, protected, monitored, and reviewed.

Privileged accounts can make significant changes to the organization's:

* Identities.
* Security policies.
* Devices.
* Applications.
* Data.
* Collaboration services.
* Microsoft 365 tenant configuration.

Because of the potential impact of privileged access, administrative permissions must be carefully controlled.

The primary objective is to ensure that:

> **Administrative access is granted only to authorized personnel, for a legitimate purpose, and for no longer than necessary.**

---

# 2. Privileged Access Risk

A permanently active privileged account creates a significant security risk.

For example, an administrator with an active **Global Administrator** role has extensive control over the Microsoft 365 tenant.

If that administrator's credentials are compromised, an attacker could potentially make widespread changes to:

* User accounts.
* Authentication settings.
* Security policies.
* Administrative roles.
* Applications.
* Data.
* Tenant configuration.

The risk can be represented as:

```text
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

The organization should therefore minimize the number of permanently active highly privileged roles.

---

# 3. Principle of Least Privilege

Administrators should receive only the permissions required to perform their responsibilities.

Examples include:

| Administrative Responsibility | Appropriate Role         |
| ----------------------------- | ------------------------ |
| Manage users                  | User Administrator       |
| Manage groups                 | Groups Administrator     |
| Manage devices                | Intune Administrator     |
| Manage security configuration | Security Administrator   |
| Manage Exchange Online        | Exchange Administrator   |
| Manage SharePoint             | SharePoint Administrator |
| Manage the entire tenant      | Global Administrator     |

The **Global Administrator** role should not be used for routine administrative activities when a more specific role is sufficient.

The principle is:

> **Use the least powerful role capable of completing the task.**

---

# 4. Role Separation

Administrative responsibilities should be separated where practical.

For example:

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

Role separation reduces the number of individuals with unrestricted administrative access.

It also supports separation of duties and reduces the potential impact of a compromised administrator account.

A user responsible for identity administration does not necessarily need permission to manage devices, Exchange Online, SharePoint, or the entire Microsoft 365 tenant.

---

# 5. Separation of Normal and Administrative Activities

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

Separating normal and administrative activities reduces the exposure of privileged credentials and makes administrative activity easier to identify during investigation and auditing.

---

# 6. Privileged Role Assignment States

Privileged roles may exist in different assignment states.

## 6.1 Permanent Active Assignment

The administrator has the role continuously active.

Permanent assignment should be minimized for highly privileged roles.

This is particularly important for roles such as:

* Global Administrator.
* Privileged Role Administrator.
* Security Administrator.

Permanent assignment may still be appropriate in specific circumstances, but it should be justified and regularly reviewed.

---

## 6.2 Eligible Assignment

The administrator is authorized to activate the role when required but does not have the role continuously active.

This is the preferred model for many privileged roles where the organization's licensing and configuration support it.

An eligible assignment reduces standing privilege while still allowing an authorized administrator to perform required administrative tasks.

---

## 6.3 Temporary Active Assignment

The administrator activates the role for a defined period to perform an administrative task.

The role remains active only for the configured duration and should automatically expire where possible.

The general model is:

```text
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

The recommended model is:

```text
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

The activation requirements should depend on the sensitivity of the role.

Possible controls include:

* Multi-factor authentication.
* Phishing-resistant authentication where available.
* Approval.
* Justification.
* Activation duration limits.
* Conditional Access requirements.

The objective is to reduce unnecessary standing privilege.

---

# 8. Privileged Role Example

## Normal State

```text
Administrator
      │
      ▼
Eligible for Privileged Role
```

The role is not permanently active.

## During an Approved Task

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
Approval Where Required
      │
      ▼
Temporary Role Activation
      │
      ▼
Administrative Task
```

## After the Task

```text
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

Their credentials should be protected using appropriate organizational controls, and any use should generate an immediate review.

The organization should be able to determine:

* Who used the account.
* When it was used.
* Why it was used.
* What administrative actions were performed.

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

Privileged access should be subject to a higher level of security assurance because of the potential impact of account compromise.

---

# 11. Administrative Role Assignment

Administrative roles should be assigned according to actual responsibility.

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

> **A senior employee should not automatically receive Global Administrator access simply because they hold a senior organizational position.**

The required permission should be determined by the actual administrative responsibilities of the individual.

---

# 12. Privileged Access Review

Administrative access should be reviewed regularly.

The review should verify:

* Who has administrative access.
* Which role they have.
* Whether the role is still required.
* Whether the role is permanent or eligible.
* Whether the administrator still holds the relevant responsibility.
* Whether the assigned permissions remain appropriate.
* Whether privileged access is still being used appropriately.

Unused or unnecessary administrative access should be removed.

The review should give particular attention to:

* Global Administrator.
* Privileged Role Administrator.
* Security Administrator.
* Exchange Administrator.
* SharePoint Administrator.
* Intune Administrator.

Privileged role assignments should also be reviewed when an administrator:

* Changes role.
* Changes department.
* Leaves the organization.
* No longer performs the administrative function.

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

This supports investigation, accountability, and incident response.

---

# 14. Administrative Access Model

The recommended model is:

```text
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

This model reduces the amount of time that highly privileged permissions remain active.

---

# 15. Example Administrative Scenario

## Scenario

An Identity Administrator needs to create 20 new user accounts.

## Recommended Process

1. The administrator uses the appropriate administrative account.
2. The administrator activates the required privileged role if the role is eligible.
3. Additional authentication requirements are completed.
4. Approval is completed if required by policy.
5. The administrator creates the user accounts.
6. The privileged role is deactivated or expires.
7. The administrative activity remains available for auditing.

The administrator does not need permanent Global Administrator access to perform this task.

---

# 16. Emergency Access Scenario

## Scenario

Normal administrative access is unavailable because of an authentication or configuration problem.

## Recommended Process

1. An authorized administrator follows the emergency access process.
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

# 18. Practical Lab Validation

The Privileged Access Management design was validated against the Microsoft Entra ID environment used for the Tonie-Osegbo Technologies Limited enterprise lab.

The validation focused on:

* Administrative role assignment.
* The current Global Administrator assignment.
* Role assignment type.
* Role assignment state.
* Administrative access scope.
* Microsoft 365 licensing relevant to privileged access management.

The environment is designed as a simulated enterprise environment supporting approximately 250 employees, with the potential to scale toward 1,000 employees.

---

## 18.1 Current Administrative Role Assignment

The lab administrator account:

```text
osegbotonie@41t8vn.onmicrosoft.com
```

was observed with the following assignment:

| Role                 | Assignment | Status | Duration  |
| -------------------- | ---------- | ------ | --------- |
| Global Administrator | Direct     | Active | Permanent |

This represents a highly privileged configuration.

The assignment is appropriate for the initial setup and administration of the lab environment, but it also demonstrates why standing Global Administrator access should be reviewed as the environment matures.

In a production environment, routine administrative activities should normally be performed using more specific administrative roles where possible.

---

## 18.2 Microsoft 365 Licensing

The administrator account was observed with:

```text
Microsoft 365 E5 Developer
```

The tenant configuration indicates:

```text
Microsoft 365 E5 Developer
Active
78/78
Direct
```

The environment therefore provides a practical basis for exploring advanced Microsoft 365 security and identity capabilities available within the lab configuration.

The availability of a licensing capability does not, by itself, mean that every control has been implemented. The relevant controls must still be configured, tested, and documented.

---

## 18.3 Administrative Role Matrix

The following role model is used as the target administrative design for the enterprise lab:

| Administrative Function    | Preferred Role           |
| -------------------------- | ------------------------ |
| User administration        | User Administrator       |
| Group administration       | Groups Administrator     |
| Device administration      | Intune Administrator     |
| Security administration    | Security Administrator   |
| Exchange administration    | Exchange Administrator   |
| SharePoint administration  | SharePoint Administrator |
| Tenant-wide administration | Global Administrator     |

The purpose of this model is to reduce unnecessary use of the Global Administrator role.

A user who only needs to manage groups, for example, should not automatically receive tenant-wide administrative permissions.

---

## 18.4 Practical Finding

The current lab environment demonstrates the following:

### Finding 1 — A Highly Privileged Role Is Assigned

The lab administrator account currently has a direct, active, permanent Global Administrator assignment.

This provides the necessary administrative capability for the current lab configuration but represents a significant standing privilege.

### Finding 2 — The Role Assignment Is Direct

The role is assigned directly to the administrator account rather than through a group-based administrative model.

This makes the assignment easy to identify, but it should still be reviewed as the lab evolves.

### Finding 3 — Role Separation Is the Target Design

The administrative role matrix establishes a future-state model in which administrative responsibilities are separated according to actual job functions.

### Finding 4 — Privileged Access Management Is a Future Implementation Area

The design establishes the target control model for:

* Eligible privileged access.
* Just-In-Time elevation.
* Strong authentication.
* Role separation.
* Administrative monitoring.
* Periodic access review.
* Emergency access.

These controls should be implemented and validated as the practical lab progresses.

---

## 18.5 Evidence to Capture

The following evidence should be captured as part of the practical lab:

* Administrative role assignment.
* Role assignment type.
* Role assignment duration.
* Role assignment status.
* Privileged role membership.
* Administrative role activation where implemented.
* Authentication requirements for privileged roles.
* Audit records for administrative activity.
* Break-glass account configuration and monitoring, where implemented.

Evidence should demonstrate both the configuration and the result of the control.

Screenshots should be captured with unnecessary tenant or personal information minimized where possible.

---

# 19. Future Enhancements

Future improvements may include:

* Microsoft Entra Privileged Identity Management.
* Eligible administrative role assignments.
* Just-In-Time role activation.
* Approval-based role activation.
* Phishing-resistant authentication.
* Privileged Access Workstations.
* Administrative session monitoring.
* Automated privileged role reviews.
* Security Operations Center integration.
* Automated alerts for privileged role activation.
* Emergency access account monitoring.

---

# 20. Conclusion

Privileged Access Management provides a structured approach to controlling the highest-risk permissions in the Microsoft 365 environment.

The design is based on the principle that privileged access should be:

> **Limited, justified, protected, temporary where possible, monitored, and regularly reviewed.**

The current lab environment demonstrates the importance of this approach through its existing permanent Global Administrator assignment.

The next stage is to progressively implement and validate more mature privileged access controls, including role separation, eligible access, time-limited elevation, stronger authentication, monitoring, and emergency access procedures.

This approach reduces the potential impact of compromised administrative credentials and supports a stronger Zero Trust security model.
