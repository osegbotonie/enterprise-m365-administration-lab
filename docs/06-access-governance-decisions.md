# Access Governance Decisions

## 1. Purpose

This document records key access-management decisions for the Microsoft 365 environment of Tonie-Osegbo Technologies Limited.

The purpose is to ensure that identity and access decisions are:

* Consistent
* Auditable
* Scalable
* Secure
* Aligned with business responsibilities

---

## 2. Decision: Role-Based Access Must Reflect the Current Role

### Decision

An employee's permanent role-based group membership must reflect their current organizational role.

When an employee changes role, the previous permanent role group should normally be removed and the new role group assigned.

### Example

**Before:**

`GRP-ROLE-NetworkEngineer`

**After promotion:**

`GRP-ROLE-NetworkManager`

### Rationale

This prevents privilege accumulation and ensures that access reflects the employee's current responsibilities.

---

## 3. Decision: Temporary Project Access Must Be Separate

### Decision

Temporary project responsibilities must be managed separately from permanent organizational roles.

### Example

An employee is promoted:

**Network Engineer → Network Manager**

The following changes should occur:

**Remove:**

`GRP-ROLE-NetworkEngineer`

**Add:**

`GRP-ROLE-NetworkManager`

The employee may retain temporary access to:

`GRP-PROJECT-NetworkMigration`

### Rationale

The employee's permanent role has changed, but their temporary project responsibility may continue.

Separating the two prevents the organization from confusing:

* Permanent organizational roles
* Temporary business responsibilities

---

## 4. Temporary Project Access Requirements

Temporary project groups should have:

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

When the project is completed, access should be removed.

---

## 5. Decision: Attribute Groups and Access Groups Should Be Separated

### Decision

Groups that describe an employee should be separated from groups that grant access to resources.

### Identity Group

Example:

`GRP-ROLE-NetworkManager`

This describes the employee's current role.

### Access Group

Example:

`GRP-ACCESS-NetworkManagement`

This controls access to a resource.

### Preferred Model

**User → Identity Group → Access Group → Resource**

This provides an additional layer of control and improves auditability.

---

## 6. Decision: Direct Permissions Should Be Minimized

### Decision

Permissions should be assigned to groups wherever possible rather than directly to individual users.

### Preferred Model

```text
User
  ↓
Group
  ↓
Resource
```

### Avoid Where Possible

```text
User
  ↓
Direct Permission
  ↓
Resource
```

### Rationale

Group-based access provides:

* Easier administration
* Better visibility
* Easier access reviews
* Reduced administrative errors
* Improved scalability

---

## 7. Decision: HR Is the Source of Employee Changes

### Decision

Human Resources is the authoritative source for employee lifecycle events and organizational changes.

HR is responsible for communicating changes such as:

* New employees
* Department transfers
* Promotions
* Demotions
* Location changes
* Employment termination

IT is responsible for implementing the resulting identity and access changes.

### Process

**HR Change**

↓

**IT Notification**

↓

**Identity Attribute Update**

↓

**Group Membership Update**

↓

**Access Review**

---

## 8. Decision: Access Should Follow Current Business Need

### Decision

Access should be based on the employee's current business responsibilities.

Historical access should not automatically remain indefinitely.

Where continued access is required, it should have:

* A documented business justification.
* Appropriate approval.
* A defined review period where appropriate.

---

## 9. Decision: Privileged Access Requires Additional Controls

Administrative and privileged access should receive additional security controls.

Examples include:

* Global Administrator
* Privileged Role Administrator
* Security Administrator
* Exchange Administrator
* SharePoint Administrator
* Intune Administrator

Privileged access should be:

* Limited.
* Assigned only when required.
* Reviewed regularly.
* Protected with strong authentication.
* Separated from normal user accounts where appropriate.

---

## 10. Decision: Access Reviews Are Required

Access should be periodically reviewed to ensure that:

* Users still require access.
* Group membership remains accurate.
* Former employees do not retain access.
* Role changes have been reflected.
* Temporary project access is removed when no longer required.
* Sensitive access remains justified.

Priority should be given to:

* Privileged groups
* Finance resources
* HR resources
* Executive resources
* Security systems
* Network management systems

---

## 11. Decision: Access Must Be Traceable

Access decisions should be traceable to:

* The employee.
* The business role.
* The group.
* The resource.
* The approving authority where required.

The organization should be able to answer:

> Why does this user have access to this resource?

A mature access model should make the answer clear.

---

## 12. Access Governance Model

The complete model is:

```text
HR
 │
 │ Employee / Organizational Change
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
        Access Groups
                │
                ▼
            Resources
```

---

## 13. Summary of Key Decisions

| Decision            | Principle                              |
| ------------------- | -------------------------------------- |
| Current role group  | Reflects current permanent role        |
| Previous role group | Normally removed after role change     |
| Project group       | Separate from permanent role           |
| Project access      | Time-bound and reviewed                |
| Attribute groups    | Describe the user                      |
| Access groups       | Control resource access                |
| Direct permissions  | Minimized                              |
| HR                  | Source of employee changes             |
| IT                  | Implements identity and access changes |
| Privileged access   | Requires additional controls           |
| Access reviews      | Required periodically                  |
| Access decisions    | Must be traceable                      |

---

## 14. Final Principle

The identity and access model is based on the following principle:

> **Identity attributes describe the user. Groups organize the user's identity and responsibilities. Access groups control resources. Governance ensures that access remains appropriate over time.**

This model provides a foundation for a secure and scalable Microsoft 365 environment.
