# Administrative Role Matrix

## 1. Overview

The Administrative Role Matrix defines the administrative responsibilities and access boundaries for the Microsoft 365 environment of Tonie-Osegbo Technologies Limited.

The purpose of this matrix is to:

* Apply the principle of least privilege.
* Separate administrative responsibilities.
* Reduce excessive privileges.
* Support accountability.
* Improve security.
* Establish clear ownership of Microsoft 365 services.

Administrative access should be assigned based on job responsibilities and business need. Membership in the IT department alone should not automatically result in privileged access.

---

## 2. Administrative Access Principles

The following principles apply:

1. Administrators should receive only the permissions required for their responsibilities.
2. Global Administrator should not be used for routine administrative activities.
3. Administrative responsibilities should be separated where practical.
4. Privileged access should be reviewed regularly.
5. Strong authentication should be required for administrative accounts.
6. Administrative actions should be logged and auditable.
7. Temporary elevation should be preferred where appropriate.
8. No single administrator should unnecessarily control every aspect of the environment.
9. Administrative role assignments should be based on business need rather than seniority alone.

---

## 3. Administrative Roles

The following administrative roles are included in the design.

### Global Administrator

**Primary Responsibility:**

Tenant-wide administration and exceptional or emergency configuration.

**Typical Responsibilities:**

* Manage tenant-wide settings.
* Manage administrative role assignments.
* Manage major Microsoft 365 configurations.
* Respond to critical incidents.
* Perform administrative tasks that cannot be completed through a more specific role.

**Access Level:**

Highest level of administrative access.

**Governance:**

* Membership should be highly restricted.
* Strong authentication is required.
* Access should be reviewed regularly.
* The role should not be used for routine administration where a more specific role is sufficient.

---

### User Administrator

**Primary Responsibility:**

Identity and user account administration.

**Typical Responsibilities:**

* Create and manage user accounts.
* Update user attributes.
* Disable user accounts.
* Manage user lifecycle tasks.
* Reset passwords where permitted by the assigned role.

**Access Level:**

User administration.

---

### Groups Administrator

**Primary Responsibility:**

Group administration.

**Typical Responsibilities:**

* Create and manage groups.
* Manage group properties.
* Manage group membership where authorized.
* Review group ownership.
* Support group lifecycle management.

**Access Level:**

Group administration.

---

### Intune Administrator

**Primary Responsibility:**

Device and endpoint management.

**Typical Responsibilities:**

* Manage device enrollment.
* Configure compliance policies.
* Manage configuration profiles.
* Deploy applications.
* Manage device security policies.
* Support endpoint management operations.

**Access Level:**

Device and endpoint administration.

---

### Security Administrator

**Primary Responsibility:**

Security administration and security operations support.

**Typical Responsibilities:**

* Manage security settings.
* Investigate security alerts.
* Review security recommendations.
* Manage security policies where authorized.
* Support security incident response.
* Monitor security-related activities.

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

Compliance and data governance administration.

**Typical Responsibilities:**

* Manage compliance-related settings.
* Support retention and data governance activities.
* Manage compliance-related configurations where authorized.
* Support compliance investigations and organizational governance.

**Access Level:**

Compliance administration.

---

## 4. Administrative Role Matrix

| Administrative Role      | Users   | Groups  | Devices | Security | Exchange | SharePoint | Teams   | Compliance | Tenant |
| ------------------------ | ------- | ------- | ------- | -------- | -------- | ---------- | ------- | ---------- | ------ |
| Global Administrator     | Full    | Full    | Full    | Full     | Full     | Full       | Full    | Full       | Full   |
| User Administrator       | Full    | Limited | No      | No       | No       | No         | No      | No         | No     |
| Groups Administrator     | Limited | Full    | No      | No       | No       | No         | Limited | No         | No     |
| Intune Administrator     | No      | No      | Full    | Limited  | No       | No         | No      | No         | No     |
| Security Administrator   | Limited | Limited | Limited | Full     | Limited  | Limited    | Limited | Limited    | No     |
| Exchange Administrator   | Limited | Limited | No      | Limited  | Full     | No         | Limited | No         | No     |
| SharePoint Administrator | Limited | Limited | No      | Limited  | No       | Full       | Limited | Limited    | No     |
| Teams Administrator      | Limited | Limited | No      | Limited  | Limited  | Limited    | Full    | Limited    | No     |
| Compliance Administrator | Limited | Limited | No      | Limited  | No       | Limited    | Limited | Full       | No     |

> **Note:** The exact permissions available to each administrative role depend on the Microsoft Entra and Microsoft 365 role definitions assigned in the tenant. This matrix represents the intended administrative boundary for the organization's design and should be validated against the actual permissions of each role during implementation.

---

## 5. Separation of Duties

Administrative responsibilities should be separated where practical.

### Example

A User Administrator should not automatically receive:

* Global Administrator
* Security Administrator
* Intune Administrator

unless there is a documented business requirement and appropriate approval.

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

Administrative role combinations should therefore be reviewed carefully and should only be assigned where there is a clear business requirement.

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

Where appropriate, administrators should maintain separate accounts for different types of activity.

### Standard Account

Used for:

* Email
* Microsoft Teams
* OneDrive
* Normal business activities

### Administrative Account

Used for:

* Administrative tasks
* Privileged configuration
* Security administration
* Tenant management

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
* Role assignments remain aligned with business need.

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

The organization should be able to determine:

> **Who performed an administrative action, what action was performed, when it occurred, and what resource was affected?**

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

The Global Administrator role should be reserved for tenant-wide administration, exceptional situations, and tasks that cannot be completed through more specific administrative roles.

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

---

## Conclusion

The Administrative Role Matrix provides a structured framework for assigning and governing administrative privileges across the Microsoft 365 environment.

By separating responsibilities and limiting access according to business need, Tonie-Osegbo Technologies Limited can reduce unnecessary privilege, improve accountability, and limit the potential impact of compromised administrative accounts.

The guiding principle is:

> **Administrative access should be limited to the minimum level required, activated only when necessary where practical, and regularly reviewed to ensure that it remains appropriate.**
