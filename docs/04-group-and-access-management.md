# Group and Access Management Design

## 1. Overview

Group and Access Management defines how users are organized and how access to organizational resources is managed within the Microsoft 365 environment of Tonie-Osegbo Technologies Limited.

The objective is to establish an access model that is secure, scalable, understandable, and aligned with business responsibilities.

The design supports:

* Departments.
* Office locations.
* Job roles.
* Organizational levels.
* Business responsibilities.
* Access control.
* Collaboration.
* Employee lifecycle changes.

The model is designed for an organization of approximately 250 employees, with the ability to scale as the organization grows toward 1,000 or more employees.

The central principle is:

> **User attributes describe who the user is. Group membership helps organize users and drive access decisions. Access groups are used to grant permissions to resources.**

This separation is important because a user's department, location, or job title should not automatically result in unrestricted access to every resource associated with that attribute.

Access should ultimately reflect the employee's current business responsibilities and approved access requirements.

---

# 2. Access Management Principles

## 2.1 Least Privilege

Users should receive only the access required to perform their current responsibilities.

Access should not be granted simply because a user is a member of a department or holds a senior job title.

---

## 2.2 Role-Based Access

Access should be based on the employee's current business role and responsibilities.

For example, two employees may work in the Technology department but require completely different levels of access based on their actual responsibilities.

---

## 2.3 Separation of Duties

Sensitive responsibilities should be appropriately separated to reduce the risk of unauthorized or conflicting activity.

For example, the person requesting access, approving access, and administering the access should not always be the same person.

The exact separation required should depend on the sensitivity of the resource and the organization's governance requirements.

---

## 2.4 Current Role Membership

Group membership should reflect the employee's current organizational situation.

When an employee changes department, role, or responsibilities, their existing access should be reviewed.

New access should not simply be added on top of old access without considering whether the previous access is still required.

---

## 2.5 Minimize Direct Permissions

Where possible, access should be assigned through groups rather than directly to individual users.

The preferred model is:

```text
User
  │
  ▼
Group
  │
  ▼
Resource Permission
```

rather than:

```text
User
  │
  ▼
Direct Permission
  │
  ▼
Resource
```

Group-based access is easier to manage, audit, review, and scale.

---

## 2.6 Access Should Be Traceable

It should be possible to understand why a user has access to a resource.

An administrator or reviewer should be able to determine:

* Who the user is.
* What group provides the access.
* What the group is used for.
* Who owns the group.
* Whether the access is still required.

---

## 2.7 Scalability

The access model should remain manageable as the organization grows.

An approach that works for 20 users may become difficult to manage when the organization has 250 or 1,000 users.

For this reason, the design favors:

* Group-based access.
* Standardized attributes.
* Consistent naming.
* Clear ownership.
* Automation where appropriate.
* Periodic access reviews.

---

# 3. Group Taxonomy

The organization will use different types of groups for different purposes.

The main group categories are:

```text
Attribute Groups
    │
    ├── Department Groups
    ├── Location Groups
    ├── Role Groups
    └── Organizational Level Groups

Access Groups
    │
    └── Resource Permissions

Collaboration Groups
    │
    └── Teams, Projects, and Shared Collaboration

Administrative and Privileged Groups
    │
    └── Administrative Access
```

These categories should not be treated as interchangeable.

A group used to describe an employee is not necessarily the same as a group used to grant access to a sensitive resource.

---

# 4. Attribute Groups

Attribute groups represent characteristics of the user.

Examples include:

* Department.
* Location.
* Role.
* Organizational level.

Examples:

```text
GRP-DEPT-Technology
GRP-LOC-Abuja
GRP-ROLE-NetworkManager
GRP-LEVEL-Management
```

These groups can help describe the user and may be used by:

* Access assignment processes.
* Automation.
* Reporting.
* Governance.
* Lifecycle workflows.

However, membership in an attribute group should not automatically result in unrestricted access to every resource associated with that attribute.

For example:

> A user belonging to `GRP-DEPT-Technology` should not automatically receive administrative access to every technology system.

The department attribute may help identify the user's business context, but access should still be based on actual responsibility and approved requirements.

---

# 5. Department Groups

Department groups represent the department to which an employee belongs.

Examples include:

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
* Group membership logic.
* Access assignment workflows.

However, department membership alone should not automatically grant all access associated with the department.

For example, a Finance employee may belong to the Finance department group but may not require access to confidential payroll or financial reporting resources.

---

# 6. Location Groups

Location groups represent an employee's primary office location.

Examples include:

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
* Reporting.
* Location-specific administration.

Location should not automatically determine whether a user is trusted.

A user's location is only one factor that may be considered as part of an overall identity and security model.

For example, being physically located in Abuja should not automatically provide unrestricted access to sensitive resources.

---

# 7. Role Groups

Role groups represent an employee's current job role or business responsibility.

Examples include:

```text
GRP-ROLE-NetworkEngineer
GRP-ROLE-SeniorNetworkEngineer
GRP-ROLE-NetworkManager
GRP-ROLE-Accountant
GRP-ROLE-HRManager
GRP-ROLE-SystemsAdministrator
```

Role groups can help represent an employee's current responsibilities and may be used as an input to access assignment processes.

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

This approach separates the user's business role from the actual permissions assigned to resources.

However, role-based automation requires consistent and reliable data.

For example, the following values should not be treated as completely different roles if they all represent the same business responsibility:

```text
Network Manager
Network Operations Manager
Manager - Network Operations
Head of Network Operations
```

Where role-based group membership is automated, the organization should establish standardized values or use a controlled attribute that can be consistently maintained.

The important principle is:

> **Automation should be based on reliable identity data.**

---

# 8. Organizational Level Groups

Organizational level groups represent an employee's position within the organizational hierarchy.

Examples include:

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
* Governance.
* Access assignment logic.

However, organizational seniority alone should not automatically grant access to sensitive systems.

For example:

> A senior executive may require access to executive resources but should not automatically receive technical administrator permissions.

Access should be based on business need.

---

# 9. Access Groups

Access groups are used to assign permissions to specific organizational resources.

Examples include:

* SharePoint sites.
* Microsoft Teams resources.
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

This separates:

> **Who the user is**

from:

> **What the user can access**

Where possible, resources should be assigned permissions to groups rather than directly to individual users.

---

# 10. Microsoft 365 Groups, Security Groups, and Dynamic Groups

Different group types serve different purposes.

They should be selected based on the business requirement.

## 10.1 Security Groups

Security groups are primarily used to manage access to resources.

They may be used to control access to:

* Applications.
* SharePoint resources.
* Internal systems.
* Azure or Microsoft Entra resources.
* Other organizational resources.

The general model is:

```text
User
  │
  ▼
Security Group
  │
  ▼
Resource Permission
```

Security groups may have assigned or dynamic membership, depending on the requirement.

---

## 10.2 Microsoft 365 Groups

Microsoft 365 Groups are designed primarily to support collaboration.

They can provide a shared collaboration experience across services such as:

* Microsoft Teams.
* SharePoint.
* Exchange Online.
* Shared calendars.
* Other Microsoft 365 services.

A Microsoft 365 Group may therefore represent a:

* Department.
* Project team.
* Working group.
* Collaboration community.

Examples from the enterprise lab include groups representing finance, technology, project, and other business activities.

Microsoft 365 Groups should have:

* A clear business purpose.
* Identified owners.
* Appropriate membership.
* A lifecycle review process.

---

## 10.3 Dynamic Groups

Dynamic groups use defined rules to automatically manage membership based on user or device attributes.

For example:

```text
Department = Technology
```

may be used to automatically include users whose department attribute is Technology.

Another example may be:

```text
OfficeLocation = Abuja
```

to identify users whose primary office location is Abuja.

Dynamic groups can reduce manual administration and improve consistency.

However, dynamic membership should be used carefully where the group grants access to sensitive resources.

Before using an attribute to drive automated access, the organization should confirm that:

* The attribute is consistently populated.
* Values are standardized.
* The attribute is updated when the employee's circumstances change.
* The resulting group membership is appropriate.
* The rule has been tested before being used for sensitive access.

Incorrect or outdated attributes can result in incorrect access.

---

# 11. Collaboration Groups

Collaboration groups support communication and teamwork.

Examples include:

```text
GRP-COLLAB-Technology
GRP-COLLAB-NetworkOperations
GRP-COLLAB-ProjectPhoenix
```

These groups may be implemented using appropriate Microsoft 365 collaboration capabilities, depending on the business requirement.

Examples include:

* Microsoft Teams teams.
* Microsoft 365 Groups.
* Project collaboration spaces.
* Department collaboration groups.

Collaboration groups should have an identified owner and should be reviewed periodically.

A project group, for example, may no longer be required after the project has ended.

---

# 12. Administrative and Privileged Groups

Administrative groups should be treated as highly sensitive.

Examples may include groups associated with:

* Microsoft 365 administration.
* Microsoft Entra administration.
* Security administration.
* Intune administration.
* Exchange administration.
* Network administration.

Membership should be strictly controlled and should follow the principle of least privilege.

Administrative access should not be granted simply because a user:

* Belongs to the Technology department.
* Holds a senior job title.
* Is a manager.
* Has previously performed administrative duties.

Access should be based on the specific administrative responsibilities assigned to the user.

Where appropriate, administrative access should also be:

* Separately assigned.
* Reviewed periodically.
* Time-limited or eligible where supported.
* Protected with strong authentication controls.

---

# 13. User Group Membership Model

An employee may belong to multiple groups representing different aspects of their identity and responsibilities.

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

# 14. Group-Based Access Model

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

# 15. Role Change and Access Management

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

The process should follow:

```text
Current Role
     │
     ▼
Current Business Responsibilities
     │
     ▼
Access Review
     │
     ▼
Appropriate Access
```

rather than:

```text
Historical Roles
       │
       ▼
Accumulated Access
```

Continued access to previous resources may be retained where there is:

* A documented business requirement.
* Appropriate approval.
* A clear reason for continued access.
* A defined review or expiration period where appropriate.

---

# 16. Dynamic Group Strategy

Where appropriate, group membership may be automated using reliable user attributes.

### Example: Department-Based Group

```text
Department = Technology
```

Potential members:

* Technology employees.

### Example: Location-Based Group

```text
OfficeLocation = Abuja
```

Potential members:

* Employees based in Abuja.

### Example: Role-Based Group

A role-based dynamic group may be used where the role attribute is standardized and consistently maintained.

For example:

```text
StandardizedRole = NetworkManager
```

Potential members:

* Employees whose current standardized role is Network Manager.

The organization should avoid building sensitive access decisions around inconsistent free-text values.

For example, the following values may describe similar responsibilities but would not necessarily match the same simple rule:

```text
Network Manager
Network Operations Manager
Manager - Network Operations
Head of Network Operations
```

If role-based automation is required, the organization should establish a consistent role taxonomy or another controlled identity attribute.

Dynamic groups should also be tested carefully before being used to provide access to sensitive resources.

---

# 17. Naming Convention

A consistent naming convention improves administration, troubleshooting, and governance.

The recommended format is:

```text
GRP-[TYPE]-[NAME]
```

### Department

```text
GRP-DEPT-Technology
```

### Location

```text
GRP-LOC-Abuja
```

### Role

```text
GRP-ROLE-NetworkManager
```

### Organizational Level

```text
GRP-LEVEL-Management
```

### Access

```text
GRP-ACCESS-Finance-Confidential
```

### Collaboration

```text
GRP-COLLAB-Technology
```

The naming convention should be applied consistently across the environment.

Where an existing group naming standard is already in use, new groups should follow the organization's approved naming convention rather than introducing multiple competing standards.

---

# 18. Access Assignment Rules

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
11. Dynamic membership rules should use reliable and consistently maintained attributes.
12. Group type should be selected based on the intended business and technical purpose.

---

# 19. Group Ownership

Every important group should have an identified owner.

Group owners should be responsible for:

* Confirming the business purpose of the group.
* Reviewing membership where required.
* Approving access requests where appropriate.
* Ensuring that the group remains necessary.
* Requesting the removal or retirement of obsolete groups.

IT remains responsible for technical administration and enforcement of organizational policies.

Business ownership and technical administration should not automatically be the same responsibility.

For example:

```text
Business Owner
      │
      ▼
Confirms Business Need
      │
      ▼
IT / Identity Administrator
      │
      ▼
Technical Implementation
```

This provides a clearer separation between business approval and technical administration.

---

# 20. Access Review

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

# 21. Example Access Scenario

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

The answer should be traceable through the employee's current business role, the approved access assignment, and the group that provides access to the resource.

---

# 22. Summary

The group and access management model for Tonie-Osegbo Technologies Limited separates identity attributes from resource permissions.

The model uses:

* Attribute groups.
* Department groups.
* Location groups.
* Role groups.
* Organizational level groups.
* Access groups.
* Collaboration groups.
* Administrative and privileged groups.

The design is based on:

* Least privilege.
* Role-based access.
* Group-based permissions.
* Separation of duties.
* Current role membership.
* Scalability.
* Access review.
* Clear ownership.
* Reliable identity data.

The central principle is:

> **Access should follow the employee's current business responsibilities and should not accumulate automatically from historical roles.**

---

# 23. Future Enhancements

Future improvements may include:

* Automated group provisioning.
* Microsoft Entra dynamic groups.
* Access packages.
* Microsoft Entra Entitlement Management.
* Access Reviews.
* Privileged Identity Management.
* Automated HR integration.
* Lifecycle-based group membership.
* Temporary access workflows.
* Automated group expiration and review.
* Approval-based access requests.
* Standardized role and department taxonomies.

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
