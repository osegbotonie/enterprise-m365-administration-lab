# Administrative Role Matrix

## 1. Overview

The Administrative Role Matrix defines the administrative responsibilities and access boundaries for the Microsoft 365 environment of Tonie-Osegbo Technologies Limited.

The purpose of this matrix is to establish a clear separation between administrative functions and reduce unnecessary concentration of privilege.

The design supports:

* Least-privilege administration.
* Separation of duties.
* Clear ownership of Microsoft 365 services.
* Accountability for administrative actions.
* Reduced exposure to excessive privilege.
* Regular review of administrative access.

Administrative access should be assigned based on actual job responsibilities and business need.

Membership in the IT department, seniority, or job title alone should not automatically result in privileged access.

---

# 2. Administrative Access Principles

The following principles apply to the administrative role model:

1. Administrators should receive only the permissions required to perform their responsibilities.
2. The Global Administrator role should not be used for routine administration where a more specific role is sufficient.
3. Administrative responsibilities should be separated where practical.
4. Privileged access should be reviewed regularly.
5. Strong authentication should be required for administrative accounts.
6. Administrative activity should be logged and auditable.
7. Temporary elevation should be preferred where appropriate and supported.
8. No individual should unnecessarily control every aspect of the Microsoft 365 environment.
9. Administrative role assignments should be based on business need rather than seniority alone.
10. Role combinations that create excessive privilege should be reviewed and justified.

---

# 3. Administrative Roles

The following administrative roles form part of the target administrative design for the Microsoft 365 environment.

## 3.1 Global Administrator

### Primary Responsibility

Tenant-wide administration and exceptional or emergency configuration.

### Typical Responsibilities

* Manage tenant-wide settings.
* Manage administrative role assignments.
* Perform major Microsoft 365 configuration changes.
* Respond to critical incidents.
* Perform tasks that cannot be completed using a more specific administrative role.

### Access Level

The highest level of administrative access within the tenant.

### Governance Requirements

* Membership should be highly restricted.
* Strong authentication is required.
* Access should be reviewed regularly.
* Permanent assignment should be minimized where practical.
* The role should not be used for routine administration when a more specific role is sufficient.

---

## 3.2 User Administrator

### Primary Responsibility

Identity and user account administration.

### Typical Responsibilities

* Create and manage user accounts.
* Update user attributes.
* Disable user accounts.
* Support Joiner, Mover, and Leaver processes.
* Reset passwords where permitted by the role and applicable policy.

### Access Boundary

User identity administration.

---

## 3.3 Groups Administrator

### Primary Responsibility

Group administration and group lifecycle management.

### Typical Responsibilities

* Create and manage groups.
* Manage group properties.
* Manage group membership where authorized.
* Review group ownership.
* Support group lifecycle management.

### Access Boundary

Group administration.

---

## 3.4 Intune Administrator

### Primary Responsibility

Device and endpoint management.

### Typical Responsibilities

* Manage device enrollment.
* Configure compliance policies.
* Manage configuration profiles.
* Deploy applications.
* Manage device security policies.
* Support endpoint management operations.

### Access Boundary

Device and endpoint administration.

---

## 3.5 Security Administrator

### Primary Responsibility

Security administration and security operations support.

### Typical Responsibilities

* Manage security settings.
* Investigate security alerts.
* Review security recommendations.
* Manage security policies where authorized.
* Support security incident response.
* Monitor security-related activities.

### Access Boundary

Security administration.

---

## 3.6 Exchange Administrator

### Primary Responsibility

Exchange Online administration.

### Typical Responsibilities

* Manage mailboxes.
* Configure mail flow.
* Manage Exchange policies.
* Investigate email-related issues.
* Manage Exchange security configurations where authorized.

### Access Boundary

Exchange Online administration.

---

## 3.7 SharePoint Administrator

### Primary Responsibility

SharePoint Online administration.

### Typical Responsibilities

* Manage SharePoint sites.
* Configure SharePoint settings.
* Support site administration.
* Support SharePoint governance.

### Access Boundary

SharePoint Online administration.

---

## 3.8 Teams Administrator

### Primary Responsibility

Microsoft Teams administration.

### Typical Responsibilities

* Manage Teams policies.
* Configure Teams settings.
* Support Teams governance.
* Manage collaboration-related configuration.

### Access Boundary

Microsoft Teams administration.

---

## 3.9 Compliance Administrator

### Primary Responsibility

Compliance and data governance administration.

### Typical Responsibilities

* Manage compliance-related settings.
* Support retention and data governance activities.
* Manage compliance configurations where authorized.
* Support compliance investigations and governance activities.

### Access Boundary

Compliance and data governance administration.

---

# 4. Administrative Role Matrix

The following matrix represents the intended administrative boundary for the organization's design.

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

### Matrix Definitions

* **Full** — Broad administrative control within the relevant service or administrative area.
* **Limited** — Some administrative capability may exist as a result of the role's actual permissions or service dependencies.
* **No** — The role is not intended to provide administrative responsibility for that area.

> **Note:** This matrix represents the intended governance boundary and not a complete technical description of Microsoft's built-in role permissions. The actual permissions available to each role depend on the Microsoft Entra and Microsoft 365 role definitions assigned in the tenant. The matrix should therefore be validated against the actual permissions during implementation.

---

# 5. Separation of Duties

Administrative responsibilities should be separated where practical.

For example, a User Administrator should not automatically receive:

* Global Administrator.
* Security Administrator.
* Intune Administrator.

unless there is a documented business requirement and appropriate approval.

The objective is to prevent unnecessary concentration of administrative power.

For example:

```text
User Administration
        │
        ▼
User Administrator
```

should not automatically result in:

```text
User Administration
        +
Security Administration
        +
Device Administration
        +
Tenant-Wide Administration
```

unless the individual's responsibilities genuinely require those additional privileges.

---

# 6. Role Combination Risks

Certain combinations of administrative roles create a higher level of risk.

For example:

```text
Global Administrator
        +
Security Administrator
        +
Compliance Administrator
```

provides extensive control over the tenant, security configuration, and compliance environment.

Other combinations may also create significant risk depending on the specific responsibilities involved.

Administrative role combinations should therefore be reviewed carefully.

Where multiple privileged roles are required, the organization should document:

* Why the combination is necessary.
* What responsibilities require the access.
* Who approved the assignment.
* Whether the access can be separated.
* Whether temporary elevation could be used instead.

The objective is not to prevent every administrator from having more than one role. The objective is to prevent unnecessary accumulation of privilege.

---

# 7. Privileged Access Model

Where supported and appropriate, the preferred model is:

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

This reduces the amount of time that privileged roles remain active.

Permanent assignments may still be required in certain circumstances, but they should be justified and reviewed.

---

# 8. Administrative Account Separation

Where appropriate, administrators should maintain separate accounts for normal business activity and privileged administration.

## Standard Account

Used for:

* Email.
* Microsoft Teams.
* OneDrive.
* Normal business activities.

## Administrative Account

Used for:

* Administrative tasks.
* Privileged configuration.
* Security administration.
* Tenant management.

Administrative accounts should not be used for routine activities where avoidable.

The purpose of this separation is to reduce the exposure of privileged credentials and make administrative activity easier to identify and investigate.

---

# 9. Emergency Administration

The organization should maintain emergency access capability for situations where normal administrative access is unavailable.

Emergency administrative accounts should:

* Be highly protected.
* Be used only when necessary.
* Be monitored.
* Be tested periodically.
* Be subject to strict governance.

Emergency accounts should not be used for daily administration.

Any use of emergency administrative access should be reviewed to confirm:

* Who used the account.
* Why it was used.
* What actions were performed.
* Whether any follow-up action is required.

---

# 10. Administrative Access Review

Administrative access should be reviewed regularly.

The review should confirm:

* The administrator still requires the access.
* The assigned role remains appropriate.
* The administrator still performs the relevant function.
* Excessive privileges are removed.
* Unused administrative roles are removed.
* Role combinations remain justified.
* Access remains aligned with current business need.

Administrative access should also be reviewed when an administrator:

* Changes role.
* Changes department.
* No longer performs the administrative function.
* Transfers to another location where responsibilities change.
* Leaves the organization.

---

# 11. Administrative Activity Monitoring

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
* Tenant configuration changes.

The organization should be able to determine:

> **Who performed an administrative action, what action was performed, when it occurred, and what resource was affected?**

This supports accountability, auditing, investigation, and incident response.

---

# 12. Administrative Responsibility Model

The administrative responsibility model should follow the organization's business and technical structure.

```text
HR
 │
 ▼
Employee and Organizational Changes
 │
 ▼
Identity and Access Administration
 │
 ├── User Administration
 ├── Group Administration
 └── Identity Governance
        │
        ▼
Service Administration
        │
        ├── Device Administration
        ├── Security Administration
        ├── Exchange Administration
        ├── SharePoint Administration
        └── Teams Administration
                │
                ▼
        Specialized Administration
                │
                ▼
        Tenant-Wide Administration
                │
                ▼
        Global Administrator
```

HR is the authoritative source for employee and organizational changes.

IT and Identity Administration are responsible for implementing the resulting technical changes.

The Global Administrator role should be reserved for:

* Tenant-wide administration.
* Exceptional situations.
* Critical incidents.
* Tasks that cannot be completed through more specific administrative roles.

---

# 13. Practical Lab Validation

The Administrative Role Matrix was validated against the Microsoft Entra ID environment used for the Tonie-Osegbo Technologies Limited enterprise lab.

The validation focused on:

* Administrative role assignments.
* Role assignment type.
* Role assignment duration.
* Role assignment status.
* Separation of administrative responsibilities.
* The relationship between the current environment and the target administrative model.

The lab environment is designed as a simulated enterprise environment supporting approximately 250 employees, with the potential to scale toward 1,000 employees.

---

## 13.1 Current Administrative Role

The current lab administrator account was observed with a direct, active, permanent **Global Administrator** assignment.

This configuration provides the required administrative capability for the current lab environment.

However, it also represents a significant standing privilege.

The current assignment therefore provides a useful practical example of the difference between:

```text
Current Lab Configuration
```

and:

```text
Target Enterprise Governance Model
```

The target model is to reduce unnecessary use of Global Administrator and separate administrative responsibilities wherever practical.

---

## 13.2 Target Administrative Model

The target model is based on the following administrative structure:

| Administrative Function    | Preferred Role           |
| -------------------------- | ------------------------ |
| User administration        | User Administrator       |
| Group administration       | Groups Administrator     |
| Device administration      | Intune Administrator     |
| Security administration    | Security Administrator   |
| Exchange administration    | Exchange Administrator   |
| SharePoint administration  | SharePoint Administrator |
| Teams administration       | Teams Administrator      |
| Compliance administration  | Compliance Administrator |
| Tenant-wide administration | Global Administrator     |

The purpose of this structure is to ensure that administrators receive permissions based on the services they are responsible for managing.

For example, an administrator responsible only for group management should not automatically receive tenant-wide administrative access.

---

## 13.3 Practical Findings

### Finding 1 — A Highly Privileged Role Is Currently Assigned

The lab environment currently contains a direct, active, permanent Global Administrator assignment.

This is appropriate for the current stage of the lab but represents a significant standing privilege.

### Finding 2 — The Current Configuration Does Not Yet Represent the Target Model

The current lab configuration provides broad administrative access.

The target design is to progressively implement more granular administrative roles and reduce unnecessary reliance on Global Administrator.

### Finding 3 — Administrative Responsibilities Can Be Separated

The role matrix provides a practical framework for assigning administrative responsibility according to service ownership.

### Finding 4 — Privileged Access Should Be Reviewed as the Lab Matures

As additional Microsoft 365 services and security controls are implemented, administrative access should be reviewed and adjusted to reflect actual responsibilities.

---

# 14. Evidence to Capture

The following evidence should be captured as part of the practical lab:

* Administrative role assignments.
* Role assignment type.
* Role assignment duration.
* Role assignment status.
* Administrative role activation where implemented.
* Administrative role review results.
* Authentication requirements for administrative accounts.
* Audit records for administrative activity.
* Emergency access configuration and monitoring where implemented.

Evidence should demonstrate both the configuration and the outcome of the control.

Screenshots should be captured with unnecessary tenant or personal information minimized wherever possible.

---

# 15. Future Enhancements

Future improvements may include:

* Microsoft Entra Privileged Identity Management.
* Approval-based role activation.
* Access Reviews.
* Privileged Access Workstations.
* Phishing-resistant authentication.
* Automated administrative role reviews.
* Security Operations Center integration.
* Administrative activity alerting.
* Regular review of high-risk role combinations.
* Automated reporting of excessive administrative privilege.

---

# 16. Summary

The Administrative Role Matrix establishes a structured approach to assigning and governing administrative privileges across the Microsoft 365 environment.

The model is based on:

* Least privilege.
* Role separation.
* Strong authentication.
* Just-In-Time access.
* Administrative monitoring.
* Regular access reviews.
* Emergency access capability.
* Documented governance decisions.

The central principle is:

> **No administrator should have more privilege than required to perform their current responsibilities.**

---

## Conclusion

The Administrative Role Matrix provides a framework for assigning administrative responsibilities according to business need and technical function.

By separating administrative responsibilities and limiting access according to actual job requirements, Tonie-Osegbo Technologies Limited can reduce unnecessary privilege, improve accountability, and limit the potential impact of compromised administrative accounts.

The guiding principle is:

> **Administrative access should be limited to the minimum level required, activated only when necessary where practical, and regularly reviewed to ensure that it remains appropriate.**
