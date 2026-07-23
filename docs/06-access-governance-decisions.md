# Access Governance Decisions

## 1. Purpose

This document records the key access-management decisions for the Microsoft 365 environment of Tonie-Osegbo Technologies Limited.

The purpose of documenting these decisions is to ensure that access management remains:

* Consistent.
* Auditable.
* Scalable.
* Secure.
* Aligned with business responsibilities.

These decisions establish the governance principles that guide the design and administration of identity, group membership, and resource access.

---

# 2. Decision: Permanent Role Membership Must Reflect the Current Role

## Decision

An employee's permanent role-based group membership should reflect their current organizational role.

When an employee changes role, the previous permanent role group should normally be removed and the new role group assigned.

### Example

**Before:**

```text
GRP-ROLE-NetworkEngineer
```

**After promotion:**

```text
GRP-ROLE-NetworkManager
```

## Rationale

This prevents unnecessary accumulation of role-based membership and helps ensure that access reflects the employee's current responsibilities.

Historical role membership should not automatically become permanent access.

---

# 3. Decision: Temporary Project Access Must Be Managed Separately

## Decision

Temporary project responsibilities must be managed separately from permanent organizational roles.

### Example

An employee is promoted from:

```text
Network Engineer
        ↓
Network Manager
```

The following permanent role changes should occur:

### Remove

```text
GRP-ROLE-NetworkEngineer
```

### Add

```text
GRP-ROLE-NetworkManager
```

The employee may, however, retain temporary membership in:

```text
GRP-PROJECT-NetworkMigration
```

if the employee continues to have an active responsibility in the project.

## Rationale

An employee's permanent organizational role and temporary business responsibilities are separate concepts.

Separating them prevents the organization from confusing:

* Permanent organizational roles.
* Temporary project responsibilities.
* Resource access.

---

# 4. Temporary Project Access Requirements

Temporary project groups should have a defined lifecycle.

Where practical, project groups should have:

* A defined business purpose.
* A designated owner.
* An approval process.
* A start date.
* A review date.
* An expected end date.

### Example

| Attribute    | Value                          |
| ------------ | ------------------------------ |
| Group        | `GRP-PROJECT-NetworkMigration` |
| Owner        | Network Operations Manager     |
| Purpose      | Network migration project      |
| Start Date   | 01/07/2026                     |
| Review Date  | 01/01/2027                     |
| Expected End | 31/01/2027                     |

Project access should be reviewed periodically.

When the project is completed, the project group should be retired or membership should be removed according to the organization's retention and governance requirements.

---

# 5. Decision: Attribute Groups and Access Groups Must Be Separated

## Decision

Groups that describe an employee should be separated from groups that grant access to resources.

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

The access assignment may be:

* Automated.
* Approval-based.
* Based on a combination of attributes.
* Managed through an entitlement or access package.

This separation improves the ability to understand and audit access decisions.

---

# 6. Decision: Direct Permissions Should Be Minimized

## Decision

Permissions should be assigned to groups wherever possible rather than directly to individual users.

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

### Avoid Where Possible

```text
User
  │
  ▼
Direct Permission
  │
  ▼
Resource
```

## Rationale

Group-based access generally provides:

* Easier administration.
* Better visibility.
* Easier access reviews.
* Reduced administrative errors.
* Improved scalability.

Direct permissions may still be necessary in exceptional circumstances, but they should be documented and reviewed.

---

# 7. Decision: HR Is the Authoritative Source for Employee Changes

## Decision

Human Resources is the authoritative source for employee lifecycle events and organizational changes.

HR is responsible for communicating changes such as:

* New employees.
* Department transfers.
* Promotions.
* Demotions.
* Location changes.
* Changes in employment status.
* Employee termination.

IT and Identity Administration are responsible for implementing the resulting identity and access changes.

### Process

```text
HR Change
    │
    ▼
IT Notification
    │
    ▼
Identity Attribute Update
    │
    ▼
Group Membership Update
    │
    ▼
Access Review
    │
    ▼
Access Change
```

The exact implementation may be manual, automated, or a combination of both depending on the maturity of the environment.

---

# 8. Decision: Access Must Follow Current Business Need

## Decision

Access should be based on the employee's current business responsibilities.

Historical access should not automatically remain indefinitely.

Where continued access is required, it should have:

* A documented business justification.
* Appropriate approval.
* A defined review period where appropriate.

The question should be:

> Does this user still require this access to perform their current responsibilities?

If the answer is no, the access should normally be removed.

---

# 9. Decision: Privileged Access Requires Additional Controls

Administrative and privileged access requires additional security controls.

Examples include:

* Global Administrator.
* Privileged Role Administrator.
* Security Administrator.
* Exchange Administrator.
* SharePoint Administrator.
* Intune Administrator.

Privileged access should be:

* Limited.
* Assigned only when required.
* Regularly reviewed.
* Protected with strong authentication.
* Governed through appropriate administrative controls.
* Separated from normal user activity where appropriate.

Where available and appropriate, privileged access should be eligible or time-bound rather than permanently assigned.

---

# 10. Decision: Access Reviews Are Required

Access should be periodically reviewed to ensure that:

* Users still require access.
* Group membership remains accurate.
* Former employees do not retain access.
* Role changes have been reflected.
* Temporary project access is removed when no longer required.
* Sensitive access remains justified.

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

Access decisions should be traceable to:

* The employee.
* The employee's business role.
* The relevant group.
* The resource.
* The approval authority where required.
* The date the access was granted or reviewed where available.

The organization should be able to answer:

> **Why does this user have access to this resource?**

A mature access model should make the answer understandable without requiring an investigation across multiple unrelated systems.

---

# 12. Access Governance Model

The complete model is:

```text
HR
 │
 │ Employee or Organizational Change
 ▼
Identity Attributes
 │
 ├── Department
 ├── Job Title
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
```

The access assignment layer is important because identity membership does not necessarily mean that every user with a particular attribute should automatically receive access to every related resource.

---

# 13. Governance Decision Matrix

| Decision Area                | Governance Principle                                     |
| ---------------------------- | -------------------------------------------------------- |
| Current role group           | Reflects the user's current permanent role               |
| Previous role group          | Normally removed after a role change                     |
| Project group                | Separate from the permanent organizational role          |
| Project access               | Time-bound and periodically reviewed                     |
| Attribute groups             | Describe the user's identity and organizational position |
| Access groups                | Control access to resources                              |
| Direct permissions           | Minimized and documented where necessary                 |
| HR                           | Authoritative source for employee changes                |
| IT / Identity Administration | Implements identity and access changes                   |
| Privileged access            | Requires additional controls                             |
| Access reviews               | Required periodically                                    |
| Access decisions             | Must be traceable                                        |
| Exceptions                   | Must have documented justification and approval          |

---

# 14. Exception Management

The standard access model may not cover every business situation.

Exceptions may occur when:

* An employee temporarily supports another department.
* A user requires emergency access.
* A project requires cross-department access.
* A user requires access to a previous resource for a defined business purpose.

Exceptions should not silently bypass governance.

Where appropriate, an exception should include:

* The reason for the exception.
* The resource involved.
* The approving authority.
* The users affected.
* The date granted.
* The review or expiration date.

This ensures that exceptions do not become permanent undocumented access.

---

# 15. Final Principle

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
