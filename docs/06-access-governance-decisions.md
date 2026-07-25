# Access Governance Decisions

## 1. Purpose

This document records the key access-management decisions for the Microsoft 365 environment of Tonie-Osegbo Technologies Limited.

The purpose of documenting these decisions is to establish a consistent basis for managing identity, group membership, and access to organizational resources.

The decisions in this document are intended to ensure that access management remains:

* Consistent.
* Auditable.
* Scalable.
* Secure.
* Aligned with business responsibilities.

These decisions provide the governance principles that guide the design and administration of identity and access within the environment.

---

# 2. Decision: Permanent Role Membership Should Reflect the Current Role

## Decision

An employee's permanent role-based group membership should generally reflect their current organizational role.

When an employee changes role, the existing role membership should be reviewed and updated.

Where the previous role no longer represents the employee's current responsibilities, the previous role group should normally be removed and the new role group assigned.

### Example

**Previous role:**

```text
GRP-ROLE-NetworkEngineer
```

**New role:**

```text
GRP-ROLE-NetworkManager
```

## Rationale

This reduces the risk of access accumulating over time as employees move between roles.

Historical role membership should not automatically become permanent access.

The objective is not to remove access blindly whenever a job title changes. The objective is to ensure that the employee's current access remains appropriate for their current responsibilities.

---

# 3. Decision: Temporary Project Responsibilities Should Be Managed Separately

## Decision

Temporary project responsibilities should be managed separately from permanent organizational roles.

For example, an employee may be promoted from:

```text
Network Engineer
        │
        ▼
Network Manager
```

The employee's permanent role membership may therefore change from:

```text
GRP-ROLE-NetworkEngineer
```

to:

```text
GRP-ROLE-NetworkManager
```

However, the employee may continue to require temporary membership in a project group such as:

```text
GRP-PROJECT-NetworkMigration
```

if the employee remains actively involved in the project.

## Rationale

Permanent organizational roles and temporary business responsibilities are different concepts.

Separating them helps prevent the organization from confusing:

* Permanent organizational roles.
* Temporary project responsibilities.
* Resource permissions.

A project assignment should not require the employee's permanent role to be changed simply because the employee is temporarily supporting another initiative.

---

# 4. Temporary Project Access Should Have a Defined Lifecycle

Temporary project groups should have a defined business purpose and lifecycle.

Where practical, project groups should have:

* A designated owner.
* A documented purpose.
* An approval process.
* A start date.
* A review date.
* An expected end date.

### Example

| Attribute         | Example                        |
| ----------------- | ------------------------------ |
| Group             | `GRP-PROJECT-NetworkMigration` |
| Owner             | Network Operations Manager     |
| Purpose           | Network migration project      |
| Start Date        | 01/07/2026                     |
| Review Date       | 01/01/2027                     |
| Expected End Date | 31/01/2027                     |

The project group should be reviewed periodically.

When the project is completed, the group should either be:

* Retired.
* Archived where appropriate.
* Have its membership removed.
* Retained only where there is a documented business or compliance reason.

Project membership should not remain indefinitely simply because the project group was never formally reviewed.

---

# 5. Decision: Identity Groups and Access Groups Should Be Separated

## Decision

Groups that describe an employee's organizational identity should be separated from groups that grant access to resources.

### Identity Group

```text
GRP-ROLE-NetworkManager
```

This describes the employee's current organizational role.

### Access Group

```text
GRP-ACCESS-NetworkManagement
```

This is used to control access to a resource or collection of resources.

## Preferred Model

```text
Identity Attributes
        │
        ▼
Identity Groups
        │
        ▼
Access Assignment Logic
        │
        ▼
Access Groups
        │
        ▼
Resources
```

The access assignment layer may be:

* Automated.
* Approval-based.
* Based on a combination of attributes.
* Managed through an access package or entitlement process.

The important principle is that membership in an identity group should not automatically mean that the user receives unrestricted access to every resource associated with that identity.

This separation improves the ability to understand and audit access decisions.

---

# 6. Decision: Direct Permissions Should Be Minimized

## Decision

Permissions should be assigned to groups wherever practical rather than directly to individual users.

### Preferred Model

```text
User
  │
  ▼
Group
  │
  ▼
Resource
```

### Avoid Where Practical

```text
User
  │
  ▼
Direct Permission
  │
  ▼
Resource
```

Group-based access generally provides:

* Easier administration.
* Better visibility.
* More consistent access reviews.
* Reduced administrative errors.
* Better scalability.

Direct permissions may still be necessary in exceptional circumstances.

Where direct permissions are used, they should be:

* Justified.
* Documented where appropriate.
* Reviewed periodically.
* Removed when no longer required.

---

# 7. Decision: HR Is the Authoritative Source for Employee Lifecycle Changes

## Decision

HR is the authoritative business source for employee lifecycle events and organizational changes.

These may include:

* New employees.
* Department transfers.
* Promotions.
* Changes in job responsibilities.
* Location changes.
* Changes in employment status.
* Employee departures.

HR does not necessarily need to make the technical changes directly in Microsoft Entra ID.

The responsibility for implementing the technical changes may belong to IT, Identity Administration, or an approved automated workflow.

### Process

```text
HR Change
    │
    ▼
Approved Notification or Workflow
    │
    ▼
Identity Attribute Update
    │
    ▼
Group Membership Review
    │
    ▼
Access Review
    │
    ▼
Access Change
```

The exact implementation may be manual, automated, or a combination of both depending on the maturity of the organization's systems.

The important principle is that technical identity changes should be based on an authorized business event.

---

# 8. Decision: Access Must Follow Current Business Need

## Decision

Access should be based on the employee's current business responsibilities.

Historical access should not remain indefinitely without a current business justification.

When an employee changes role, department, or responsibilities, existing access should be reviewed.

Where continued access is required, it should have:

* A documented business justification.
* Appropriate approval where required.
* A clear business owner.
* A review period where appropriate.

The central question should be:

> **Does this user still require this access to perform their current responsibilities?**

If the answer is no, the access should normally be removed.

---

# 9. Decision: Privileged Access Requires Additional Controls

Administrative and privileged access requires stronger controls than ordinary user access.

Examples include:

* Global Administrator.
* Privileged Role Administrator.
* Security Administrator.
* Exchange Administrator.
* SharePoint Administrator.
* Intune Administrator.

Privileged access should be:

* Limited to authorized personnel.
* Assigned only when required.
* Protected with strong authentication.
* Regularly reviewed.
* Separated from normal user activity where appropriate.
* Monitored and audited where appropriate.

Where Microsoft Entra Privileged Identity Management is available and appropriate, eligible or time-bound access should be considered instead of permanent assignment.

Permanent privileged assignments should be treated as exceptions that require appropriate justification and governance.

---

# 10. Decision: Access Reviews Are Required

Access should be reviewed periodically to confirm that:

* Users still require access.
* Group membership remains accurate.
* Former employees do not retain access.
* Role changes have been reflected.
* Temporary project access is removed when no longer required.
* Sensitive access remains justified.
* Group ownership remains valid.

Priority should be given to:

* Privileged groups.
* Finance resources.
* HR resources.
* Executive resources.
* Security systems.
* Network management systems.

The review frequency should be based on the sensitivity and risk associated with the resource.

---

# 11. Decision: Access Must Be Traceable

Access decisions should be traceable to the extent supported by the organization's systems and processes.

Where appropriate, the organization should be able to identify:

* The user.
* The user's relevant business role.
* The group through which access was granted.
* The resource involved.
* The approval authority where required.
* The date access was granted or reviewed.

The organization should be able to answer:

> **Why does this user have access to this resource?**

A mature access model should make the answer understandable without requiring an investigation across multiple unrelated systems.

---

# 12. Decision: Important Groups Must Have Business Ownership

Important groups should have an identifiable business owner.

The group owner should be responsible for:

* Confirming the business purpose of the group.
* Confirming that the group remains necessary.
* Reviewing membership where required.
* Approving access requests where appropriate.
* Requesting the removal or retirement of obsolete groups.

IT or Identity Administration remains responsible for technical administration and enforcement of applicable policies.

Business ownership and technical administration do not necessarily need to be performed by the same person.

This separation helps maintain accountability for both:

```text
Business Need
      │
      ▼
Business Owner
      │
      ▼
Technical Administration
      │
      ▼
Group and Access Control
```

---

# 13. Access Governance Model

The complete model is:

```text
HR
 │
 │ Employee or Organizational Change
 ▼
Identity Attributes
 │
 ├── Department
 ├── Job Title / Role
 ├── Organizational Level
 ├── Location
 └── Employment Status
        │
        ▼
Identity Groups
        │
        ├── Department Groups
        ├── Role Groups
        ├── Level Groups
        ├── Location Groups
        └── Project Groups
                │
                ▼
        Access Assignment Logic
                │
                ▼
            Access Groups
                │
                ▼
             Resources
                │
                ▼
             Access Review
```

The access assignment layer is important because identity membership does not necessarily mean that every user with a particular attribute should automatically receive access to every related resource.

---

# 14. Governance Decision Matrix

| Decision Area                | Governance Principle                                      |
| ---------------------------- | --------------------------------------------------------- |
| Current role group           | Should reflect the user's current permanent role          |
| Previous role group          | Reviewed and normally removed where no longer required    |
| Project group                | Separate from the permanent organizational role           |
| Project access               | Has a defined purpose and is periodically reviewed        |
| Attribute groups             | Describe the user's identity and organizational position  |
| Access groups                | Control access to resources                               |
| Direct permissions           | Minimized and documented where necessary                  |
| HR                           | Authoritative source for employee lifecycle events        |
| IT / Identity Administration | Implements technical identity and access changes          |
| Privileged access            | Requires additional security controls                     |
| Access reviews               | Required periodically                                     |
| Access decisions             | Should be traceable                                       |
| Group ownership              | Business purpose and accountability should be clear       |
| Exceptions                   | Require documented justification and appropriate approval |

---

# 15. Exception Management

The standard access model will not cover every business situation.

Exceptions may occur when:

* An employee temporarily supports another department.
* A user requires emergency access.
* A project requires cross-department access.
* A user requires continued access to a previous resource for a defined business purpose.

Exceptions should not silently bypass governance.

Where appropriate, an exception should include:

* The reason for the exception.
* The resource or access involved.
* The users affected.
* The approving authority.
* The date granted.
* The review or expiration date.

Emergency access should be handled through a controlled process and should be reviewed after the event.

Exceptions should not become permanent undocumented access.

---

# 16. Final Governance Principle

The identity and access model is based on the following principle:

> **Identity attributes describe the user. Groups organize the user's identity and responsibilities. Access groups control resources. Governance ensures that access remains appropriate over time.**

The complete model is:

```text
Identity
   ↓
Attributes
   ↓
Groups
   ↓
Access Decision
   ↓
Access Group
   ↓
Resource
   ↓
Review
```

This model provides a foundation for a secure, scalable, and auditable Microsoft 365 environment.

The objective is not simply to give users access.

The objective is to ensure that:

> **The right user has the right access, for the right reason, for the right amount of time.**
