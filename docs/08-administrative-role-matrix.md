# Administrative Role Matrix

## 1. Overview

The Administrative Role Matrix defines the administrative responsibilities and access boundaries for the Microsoft 365 environment of Tonie-Osegbo Technologies Limited.

The purpose is to:

* Apply least privilege.
* Separate administrative responsibilities.
* Reduce excessive privileges.
* Support accountability.
* Improve security.
* Establish clear ownership of Microsoft 365 services.

Administrative access should be assigned based on job responsibilities and should not be granted simply because an individual is part of the IT department.

---

## 2. Administrative Access Principles

The following principles apply:

1. Administrators should receive only the permissions required for their responsibilities.
2. Global Administrator should not be used for routine administrative activities.
3. Administrative responsibilities should be separated where possible.
4. Privileged access should be reviewed regularly.
5. Strong authentication should be required for administrative accounts.
6. Administrative actions should be logged and auditable.
7. Temporary elevation should be preferred where appropriate.
8. No single administrator should unnecessarily control every aspect of the environment.

---

## 3. Administrative Roles

The following administrative roles are included in the design.

### Global Administrator

**Primary Responsibility:**

Tenant-wide administration and emergency configuration.

**Typical Responsibilities:**

* Manage tenant-wide settings.
* Manage administrative roles.
* Manage major Microsoft 365 configurations.
* Respond to critical incidents.
* Perform emergency administration.

**Access Level:**

Highest level of administrative access.

**Governance:**

* Very limited membership.
* Strong authentication required.
* Regular access review.
* Not used for routine administration.

---

### User Administrator

**Primary Responsibility:**

Identity and user account administration.

**Typical Responsibilities:**

* Create users.
* Update user attributes.
* Disable user accounts.
* Reset passwords where permitted.
* Manage user lifecycle tasks.

**Access Level:**

User administration.

---

### Groups Administrator

**Primary Responsibility:**

Group administration.

**Typical Responsibilities:**

* Create groups.
* Manage group properties.
* Manage group membership where authorized.
* Review group ownership.
* Manage group lifecycle.

**Access Level:**

Group administration.

---

### Intune Administrator

**Primary Responsibility:**

Device management.

**Typical Responsibilities:**

* Manage device enrollment.
* Configure compliance policies.
* Manage configuration profiles.
* Deploy applications.
* Manage device security policies.

**Access Level:**

Device and endpoint administration.

---

### Security Administrator

**Primary Responsibility:**

Security administration.

**Typical Responsibilities:**

* Manage security settings.
* Investigate security alerts.
* Review security recommendations.
* Manage security policies where authorized.
* Support security incident response.

**Access Level:**

Security administration.

---

### Exchange Administrator

**Primary Responsibility:**

Exchange Online administration.

**Typical Responsibilities:**

* Manage mailboxes.
* Configure mail flow.
* Manage Exchange policies.
* Investigate email-related issues.
* Manage Exchange security configurations.

**Access Level:**

Exchange administration.

---

### SharePoint Administrator

**Primary Responsibility:**

SharePoint Online administration.

**Typical Responsibilities:**

* Manage SharePoint sites.
* Configure SharePoint settings.
* Manage site administration.
* Support SharePoint governance.

**Access Level:**

SharePoint administration.

---

### Teams Administrator

**Primary Responsibility:**

Microsoft Teams administration.

**Typical Responsibilities:**

* Manage Teams policies.
* Configure Teams settings.
* Manage Teams governance.
* Support collaboration administration.

**Access Level:**

Teams administration.

---

### Compliance Administrator

**Primary Responsibility:**

Compliance and data governance.

**Typical Responsibilities:**

* Manage compliance settings.
* Support retention policies.
* Support data governance.
* Manage compliance-related configurations where authorized.

**Access Level:**

Compliance administration.

---

## 4. Administrative Role Matrix

| Administrative Role      | Users   | Groups  | Devices | Security | Exchange | SharePoint | Teams   | Compliance | Tenant |
| ------------------------ | ------- | ------- | ------- | -------- | -------- | ---------- | ------- | ---------- | ------ |
| Global Administrator     | Full    | Full    | Full    | Full     | Full     | Full       | Full    | Full       | Full   |
| User Administrator       | Full    | Limited | No      | No       | Limited  | No         | No      | No         | No     |
| Groups Administrator     | Limited | Full    | No      | No       | No       | No         | Limited | No         | No     |
| Intune Administrator     | No      | No      | Full    | Limited  | No       | No         | No      | No         | No     |
| Security Administrator   | Limited | Limited | Limited | Full     | Limited  | Limited    | Limited | Limited    | No     |
| Exchange Administrator   | Limited | Limited | No      | Limited  | Full     | No         | Limited | Limited    | No     |
| SharePoint Administrator | Limited | Limited | No      | Limited  | No       | Full       | Limited | Limited    | No     |
| Teams Administrator      | Limited | Limited | No      | Limited  | Limited  | Limited    | Full    | Limited    | No     |
| Compliance Administrator | Limited | Limited | No      | Limited  | Limited  | Limited    | Limited | Full       | No     |

---

## 5. Separation of Duties

Administrative responsibilities should be separated where practical.

### Example

A User Administrator should not automatically receive:

* Global Administrator
* Security Administrator
* Intune Administrator

unless there is a documented business requirement.

The objective is to prevent unnecessary concentration of administrative power.

---

## 6. Role Combination Risks

Certain combinations of administrative privileges create increased risk.

### High-Risk Combination

```text
Global Administrator
        +
Security Administrator
        +
Compliance Administrator
```

This combination provides significant control over the tenant, security configuration, and compliance systems.

Administrative role combinations should therefore be reviewed carefully.

---

## 7. Privileged Access Model

The preferred model is:

```text
Administrator
      │
      ▼
Eligible Administrative Role
      │
      ▼
Request Activation
      │
      ▼
Strong Authentication
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

---

## 8. Administrative Account Separation

Where appropriate, administrators should maintain separate accounts for:

### Standard Account

Used for:

* Email
* Teams
* OneDrive
* Normal business activities

### Administrative Account

Used for:

* Administrative tasks.
* Privileged configuration.
* Security administration.
* Tenant management.

The administrative account should not be used for routine activities where avoidable.

---

## 9. Emergency Administration

The organization should maintain emergency access capability.

Emergency administrative accounts should:

* Be highly protected.
* Be used only during emergencies.
* Be monitored.
* Be tested periodically.
* Be subject to strict governance.

Emergency accounts should not be used for daily administration.

---

## 10. Administrative Access Review

Administrative access should be reviewed regularly.

The review should confirm:

* The administrator still requires access.
* The assigned role is appropriate.
* The administrator still holds the relevant responsibility.
* Excessive privileges are removed.
* Unused administrative roles are removed.

---

## 11. Administrative Activity Monitoring

Administrative activity should be logged and monitored.

Important events include:

* Role assignments.
* Role activations.
* Role removals.
* User creation.
* User deletion.
* Group membership changes.
* Security policy changes.
* Conditional Access changes.
* Device policy changes.
* Compliance policy changes.

---

## 12. Administrative Responsibility Model

The recommended responsibility model is:

```text
HR
 │
 ▼
Employee and Organizational Changes
 │
 ▼
Identity Administration
 │
 ├── User Administrator
 ├── Groups Administrator
 └── Identity Governance
        │
        ▼
Service Administration
        │
        ├── Intune Administrator
        ├── Security Administrator
        ├── Exchange Administrator
        ├── SharePoint Administrator
        └── Teams Administrator
                │
                ▼
        Specialized Administration
                │
                ▼
        Global Administrator
```

The Global Administrator should coordinate tenant-wide administration and handle situations that cannot be addressed by more specific administrative roles.

---

## 13. Summary

The Administrative Role Matrix establishes a structured approach to privileged administration.

The model is based on:

* Least privilege.
* Role separation.
* Strong authentication.
* Just-in-time access.
* Administrative monitoring.
* Regular access reviews.
* Emergency access capability.

The central principle is:

> **No administrator should have more privilege than required to perform their current responsibilities.**

---

## 14. Future Enhancements

Future improvements may include:

* Microsoft Entra Privileged Identity Management.
* Approval-based role activation.
* Access reviews.
* Privileged Access Workstations.
* Phishing-resistant authentication.
* Automated administrative role reviews.
* Security Operations Center integration.
* Administrative activity alerting.
