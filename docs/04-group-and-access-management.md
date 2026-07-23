# Group and Access Management Design

## 1. Overview

Group and Access Management defines how users are organized and how access to organizational resources is managed within the Microsoft 365 environment of Tonie-Osegbo Technologies Limited.

The objective is to create an access model that is:

* Secure.
* Scalable.
* Understandable.
* Manageable.
* Aligned with business responsibilities.

The model supports:

* Departments.
* Office locations.
* Job roles.
* Organizational levels.
* Business responsibilities.
* Access control.
* Employee lifecycle changes.

The design is intended to remain manageable as the organization grows from approximately 250 employees to 1,000 or more employees.

The central design principle is:

> **User attributes describe who the user is. Access groups determine what the user can access.**

---

# 2. Access Management Principles

## Least Privilege

Users should receive only the access required to perform their current responsibilities.

## Role-Based Access

Access should be based on the employee's current business role and responsibilities.

## Separation of Duties

Sensitive responsibilities should be appropriately separated to reduce the risk of unauthorized or conflicting activity.

## Current Role Membership

Group membership should reflect the employee's current organizational situation.

When an employee changes role, previous role-based membership should be reviewed rather than allowing access to accumulate indefinitely.

## Minimize Direct Permissions

Where possible, access should be assigned through groups rather than directly to individual users.

## Access Should Be Traceable

It should be possible to understand why a user has access to a resource.

## Scalability

The design should remain manageable as the organization grows.

---

# 3. Group Taxonomy

The organization will use different types of groups for different purposes.

The primary categories are:

1. **Attribute Groups**
2. **Access Groups**
3. **Collaboration Groups**
4. **Administrative or Privileged Groups**

These categories should not be treated as interchangeable.

---

## 3.1 Attribute Groups

Attribute groups represent characteristics of the user.

Examples include:

* Department.
* Location.
* Role.
* Organizational level.

Examples:

```text
GRP-DEPT-NetworkOperations
GRP-LOC-Abuja
GRP-ROLE-NetworkManager
GRP-LEVEL-Management
```

These groups help describe the user and may be used by automation or access assignment processes.

Membership in an attribute group should not automatically mean that the user receives unrestricted access to every resource associated with that attribute.

---

## 3.2 Access Groups

Access groups are used to assign permissions to specific resources.

Examples include:

* SharePoint sites.
* Teams.
* Applications.
* File repositories.
* Internal systems.
* Network management tools.

Examples:

```text
GRP-ACCESS-NetworkManagement
GRP-ACCESS-Finance-Confidential
GRP-ACCESS-HR-Confidential
GRP-ACCESS-NetworkOperations-Tools
```

Where possible, resources should be assigned permissions to access groups rather than directly to individual users.

---

## 3.3 Collaboration Groups

Collaboration groups support communication and teamwork.

Examples include:

* Microsoft Teams teams.
* Microsoft 365 Groups.
* Project groups.
* Department collaboration groups.

Examples:

```text
GRP-COLLAB-Technology
GRP-COLLAB-NetworkOperations
GRP-COLLAB-ProjectPhoenix
```

Collaboration groups should have an identified owner and should be managed according to organizational lifecycle requirements.

---

## 3.4 Administrative and Privileged Groups

Administrative groups should be treated as highly sensitive.

Examples may include groups associated with:

* Microsoft 365 administration.
* Security administration.
* Intune administration.
* Exchange administration.
* Network administration.

Membership should be strictly controlled and should follow the principle of least privilege.

Administrative access should not be granted simply because a user belongs to a particular department or has a senior job title.

---

# 4. Department Groups

Department groups represent the department to which an employee belongs.

### Examples

```text
GRP-DEPT-ExecutiveManagement
GRP-DEPT-Technology
GRP-DEPT-NetworkOperations
GRP-DEPT-Finance
GRP-DEPT-HumanResources
GRP-DEPT-SalesMarketing
GRP-DEPT-CustomerService
GRP-DEPT-LegalRegulatory
GRP-DEPT-Administration
```

Department membership should normally reflect the employee's current department.

A department group may be used for:

* Department communication.
* Reporting.
* Automation.
* Access assignment logic.

However, department membership alone should not automatically grant all access associated with the department.

---

# 5. Location Groups

Location groups represent an employee's primary office location.

### Examples

```text
GRP-LOC-Abuja
GRP-LOC-Lagos
GRP-LOC-Enugu
GRP-LOC-PortHarcourt
```

Location groups may support:

* Location-specific communications.
* Office-based resources.
* Regional collaboration.
* Location-specific administration.
* Reporting.

Location should not automatically determine whether a user is trusted.

A user's location is only one factor that may be considered in an overall access and security decision.

---

# 6. Role Groups

Role groups represent an employee's current job role.

### Examples

```text
GRP-ROLE-NetworkEngineer
GRP-ROLE-SeniorNetworkEngineer
GRP-ROLE-NetworkManager
GRP-ROLE-Accountant
GRP-ROLE-HRManager
GRP-ROLE-SystemsAdministrator
```

Role groups help represent an employee's current responsibilities.

They may be used as an input to access assignment processes.

For example:

```text
GRP-ROLE-NetworkManager
        │
        ▼
Access Assignment Logic
        │
        ▼
GRP-ACCESS-NetworkManagement
```

This separation makes the access model easier to review and change.

---

# 7. Organizational Level Groups

Organizational level groups represent an employee's position within the organizational hierarchy.

### Examples

```text
GRP-LEVEL-Executive
GRP-LEVEL-SeniorManagement
GRP-LEVEL-Management
GRP-LEVEL-SeniorStaff
GRP-LEVEL-Staff
GRP-LEVEL-EntryLevel
```

These groups may support:

* Organizational reporting.
* Communications.
* Access assignment logic.
* Governance.

However, organizational seniority alone should not automatically grant access to sensitive systems.

For example:

> A senior executive may require access to executive resources but should not automatically receive technical administrator permissions.

Access should be based on business need.

---

# 8. Access Groups

Access groups represent permissions to specific organizational resources.

### Examples

```text
GRP-ACCESS-NetworkManagement
GRP-ACCESS-Finance-Confidential
GRP-ACCESS-HR-Confidential
GRP-ACCESS-NetworkOperations-Tools
GRP-ACCESS-Executive-Resources
```

The preferred model is:

```text
User
 │
 ▼
Identity Attributes
 │
 ├── Department
 ├── Location
 ├── Role
 └── Organizational Level
       │
       ▼
Access Assignment
       │
       ▼
Access Group
       │
       ▼
Resource
```

This model separates:

> **Who the user is**

from:

> **What the user can access**

---

# 9. User Group Membership Model

An employee may belong to multiple groups representing different aspects of their identity.

### Example

**Employee:** John Doe

```text
Department:
GRP-DEPT-NetworkOperations

Location:
GRP-LOC-Abuja

Role:
GRP-ROLE-NetworkManager

Organizational Level:
GRP-LEVEL-Management
```

These memberships describe the employee.

They do not necessarily mean that each group directly grants permissions.

The employee may then be assigned to an appropriate access group:

```text
Identity Attributes
        │
        ▼
Network Manager
        │
        ▼
GRP-ACCESS-NetworkManagement
        │
        ▼
Network Management Resources
```

This design makes it easier to review and explain why access was granted.

---

# 10. Group-Based Access Model

The preferred access model is:

```text
User
  │
  ▼
Identity Attributes
  │
  ▼
Group Membership
  │
  ▼
Access Assignment
  │
  ▼
Access Group
  │
  ▼
Resource
```

For example:

```text
User: John Doe

Department: Network Operations
Location: Abuja
Role: Network Manager
Level: Management
        │
        ▼
GRP-ACCESS-NetworkManagement
        │
        ▼
Network Management Resources
```

Where possible:

> **User → Group → Resource**

should be preferred over:

> **User → Direct Permission → Resource**

This improves:

* Administration.
* Consistency.
* Auditing.
* Access reviews.
* Scalability.

---

# 11. Role Change and Access Management

When an employee changes role, group membership should be reviewed to reflect the employee's current responsibilities.

### Example

An employee is promoted from:

```text
Network Engineer
        │
        ▼
Network Manager
```

### Previous Role

```text
GRP-ROLE-NetworkEngineer
```

### New Role

```text
GRP-ROLE-NetworkManager
```

The previous role group should normally be removed if it no longer represents the employee's current role.

The employee's access should then be reviewed and updated.

The access model should follow:

```text
Current Role
     │
     ▼
Current Business Responsibilities
     │
     ▼
Appropriate Access
```

Rather than:

```text
Historical Roles
       │
       ▼
Accumulated Access
```

Continued access to previous resources may be retained only where there is:

* A documented business requirement.
* Appropriate approval.
* A clear reason for continued access.
* A defined review or expiration period where appropriate.

---

# 12. Dynamic Group Strategy

Where appropriate, group membership may be automated using user attributes.

### Example: Department-Based Group

**Rule:**

```text
Department = Technology
```

Potential members:

* Technology employees.

### Example: Location-Based Group

**Rule:**

```text
OfficeLocation = Abuja
```

Potential members:

* Employees based in Abuja.

### Example: Role-Based Group

**Rule:**

```text
JobTitle = Network Manager
```

Potential members:

* Network Managers.

Dynamic groups can reduce manual administration and improve consistency.

However, dynamic membership rules must be carefully designed.

Before using an attribute for automated access, the organization should ensure that:

* The attribute is consistently populated.
* The value is standardized.
* The attribute is maintained when the employee changes role.
* The resulting membership is appropriate.

Incorrect or inconsistent attributes can result in incorrect access.

---

# 13. Naming Convention

A consistent naming convention improves administration, troubleshooting, and governance.

The recommended format is:

```text
GRP-[TYPE]-[NAME]
```

### Examples

**Department:**

```text
GRP-DEPT-Technology
```

**Location:**

```text
GRP-LOC-Abuja
```

**Role:**

```text
GRP-ROLE-NetworkManager
```

**Organizational Level:**

```text
GRP-LEVEL-Management
```

**Access:**

```text
GRP-ACCESS-Finance-Confidential
```

**Collaboration:**

```text
GRP-COLLAB-Technology
```

The naming convention should be applied consistently across the environment.

---

# 14. Access Assignment Rules

The following rules should apply:

1. Access should be assigned through groups wherever possible.
2. Direct individual permissions should be minimized.
3. Users should receive access based on their current business responsibilities.
4. Access should be reviewed when an employee changes role.
5. Previous role-based access should normally be reviewed and removed where no longer required.
6. Sensitive access should require appropriate approval.
7. Administrative access should be strictly controlled.
8. Temporary access should have an appropriate review or expiration process where possible.
9. Group ownership should be clearly assigned.
10. Access should be periodically reviewed.

---

# 15. Group Ownership

Every important group should have an identified owner.

Group owners should be responsible for:

* Confirming the business purpose of the group.
* Reviewing membership where required.
* Approving access requests where appropriate.
* Ensuring that the group remains necessary.
* Requesting the removal or retirement of obsolete groups.

IT remains responsible for technical administration and enforcement of organizational policies.

Business ownership and technical administration should not automatically be the same responsibility.

---

# 16. Access Review

Access should be reviewed periodically to ensure that:

* Users still require access.
* Group membership is accurate.
* Former employees do not retain access.
* Employees who changed roles have appropriate permissions.
* Sensitive groups have appropriate membership.
* Unused groups are identified.
* Group owners are still valid.

Access reviews are particularly important for:

* Finance resources.
* HR resources.
* Executive resources.
* Administrative roles.
* Security systems.
* Network management systems.

The frequency of access reviews should be determined by the sensitivity of the resource and organizational policy.

---

# 17. Example Access Scenario

### Employee

**Role:** Network Manager

**Department:** Network Operations

**Location:** Abuja

**Level:** Management

### Identity Groups

```text
GRP-DEPT-NetworkOperations
GRP-LOC-Abuja
GRP-ROLE-NetworkManager
GRP-LEVEL-Management
```

### Access Group

```text
GRP-ACCESS-NetworkManagement
```

### Resource

```text
Network Management Resources
```

The employee's access can therefore be represented as:

```text
Identity Attributes
        │
        ▼
Network Manager
        │
        ▼
Access Assignment
        │
        ▼
GRP-ACCESS-NetworkManagement
        │
        ▼
Network Management Resources
```

This structure makes it easier to answer:

> **Why does this user have access?**

---

# 18. Summary

The group and access management model for Tonie-Osegbo Technologies Limited separates identity attributes from resource permissions.

The model uses:

* Department groups.
* Location groups.
* Role groups.
* Organizational level groups.
* Access groups.
* Collaboration groups.
* Privileged groups where required.

The design is based on:

* Least privilege.
* Role-based access.
* Group-based permissions.
* Separation of duties.
* Current role membership.
* Scalability.
* Access review.
* Clear ownership.

The central principle is:

> **Access should follow the employee's current business responsibilities and should not accumulate automatically from historical roles.**

---

# 19. Future Enhancements

Future improvements may include:

* Automated group provisioning.
* Microsoft Entra dynamic groups.
* Access packages.
* Entitlement Management.
* Access Reviews.
* Privileged Identity Management.
* Automated HR integration.
* Lifecycle-based group membership.
* Temporary access workflows.
* Automated group expiration and review.
* Approval-based access requests.

---

## Conclusion

A well-designed group and access model provides the structure needed to manage access as the organization grows.

The model should make it possible to:

* Understand who a user is.
* Understand what the user should have access to.
* Grant access consistently.
* Remove access when responsibilities change.
* Review sensitive access.
* Reduce direct permissions.
* Support automation.
* Maintain clear accountability.

The fundamental model is:

> **Identity attributes describe the user. Groups organize the user. Access groups grant resource permissions. Governance ensures that access remains appropriate.**
