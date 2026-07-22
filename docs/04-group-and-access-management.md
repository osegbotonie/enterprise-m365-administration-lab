# Group and Access Management Design

## 1. Overview

Group and Access Management defines how users are organized and how access to organizational resources is assigned within the Microsoft 365 environment of Tonie-Osegbo Technologies Limited.

The objective is to create a scalable, secure, and manageable access model that supports:

* Departments
* Office locations
* Job roles
* Organizational levels
* Business responsibilities
* Access control
* Employee lifecycle changes

The access model is designed to support the organization's growth from approximately 250 employees to 1,000 or more employees.

---

## 2. Access Management Principles

The group and access model is based on the following principles:

### Least Privilege

Users should receive only the access required to perform their current responsibilities.

### Role-Based Access

Access should be based on the employee's current role and responsibilities.

### Separation of Duties

Sensitive responsibilities should be appropriately separated to reduce the risk of unauthorized activity.

### Current Role Membership

Group membership should represent an employee's current role and organizational responsibilities.

### Minimize Direct Permissions

Where possible, access should be assigned through groups rather than directly to individual users.

### Scalability

The design should remain manageable as the organization grows.

---

## 3. Group Taxonomy

The organization will use different group categories to represent different identity attributes and access requirements.

The primary group categories are:

* Department Groups
* Location Groups
* Role Groups
* Organizational Level Groups
* Access Groups
* Collaboration Groups

---

## 4. Department Groups

Department groups represent the department to which an employee belongs.

### Examples

* `GRP-DEPT-ExecutiveManagement`
* `GRP-DEPT-Technology`
* `GRP-DEPT-NetworkOperations`
* `GRP-DEPT-Finance`
* `GRP-DEPT-HumanResources`
* `GRP-DEPT-SalesMarketing`
* `GRP-DEPT-CustomerService`
* `GRP-DEPT-LegalRegulatory`
* `GRP-DEPT-Administration`

Department membership should normally reflect the employee's current department.

---

## 5. Location Groups

Location groups represent an employee's primary office location.

### Examples

* `GRP-LOC-Abuja`
* `GRP-LOC-Lagos`
* `GRP-LOC-Enugu`
* `GRP-LOC-PortHarcourt`

Location groups may be used to support:

* Location-specific communications
* Office-based resources
* Location-based policies
* Regional collaboration
* Access to location-specific services

---

## 6. Role Groups

Role groups represent the employee's current job role.

### Examples

* `GRP-ROLE-NetworkEngineer`
* `GRP-ROLE-SeniorNetworkEngineer`
* `GRP-ROLE-NetworkManager`
* `GRP-ROLE-Accountant`
* `GRP-ROLE-HRManager`
* `GRP-ROLE-SystemsAdministrator`

Role groups are important for role-based access management.

---

## 7. Organizational Level Groups

Organizational level groups represent the employee's position within the organizational hierarchy.

### Examples

* `GRP-LEVEL-Executive`
* `GRP-LEVEL-SeniorManagement`
* `GRP-LEVEL-Management`
* `GRP-LEVEL-SeniorStaff`
* `GRP-LEVEL-Staff`
* `GRP-LEVEL-EntryLevel`

These groups may be used to support access to resources appropriate to organizational level.

---

## 8. Access Groups

Access groups are used to assign permissions to specific resources.

Examples include:

* SharePoint sites
* Teams
* Applications
* File repositories
* Internal resources

### Examples

* `GRP-ACCESS-NetworkManagement-SharePoint`
* `GRP-ACCESS-Finance-SharePoint`
* `GRP-ACCESS-HR-Confidential`
* `GRP-ACCESS-NetworkOperations-Tools`

Access should preferably be assigned to groups rather than individual users.

---

## 9. Collaboration Groups

Collaboration groups support communication and teamwork.

Examples include:

* Microsoft Teams teams
* Microsoft 365 Groups
* Project groups
* Department collaboration groups

### Examples

* `GRP-COLLAB-Technology`
* `GRP-COLLAB-NetworkOperations`
* `GRP-COLLAB-ProjectPhoenix`

Collaboration groups should be managed according to organizational ownership and lifecycle requirements.

---

## 10. User Group Membership Model

An employee may belong to multiple groups representing different attributes.

### Example

**Employee:** John Doe

**Department:**

`GRP-DEPT-NetworkOperations`

**Location:**

`GRP-LOC-Abuja`

**Role:**

`GRP-ROLE-NetworkEngineer`

**Organizational Level:**

`GRP-LEVEL-SeniorStaff`

This allows the organization to represent the employee's identity without creating a large number of unnecessary combined groups.

---

## 11. Role Change and Access Management

When an employee changes role, group membership should be updated to reflect the employee's current responsibilities.

### Example

An employee is promoted from:

**Network Engineer → Network Manager**

### Previous Role

`GRP-ROLE-NetworkEngineer`

### New Role

`GRP-ROLE-NetworkManager`

The previous role group should normally be removed and the new role group assigned.

This prevents unnecessary accumulation of privileges.

### Access Model

The access model should follow:

**Current Role → Appropriate Access**

Rather than:

**Historical Roles → Accumulated Access**

Continued access to previous resources may be granted only where there is:

* A documented business requirement
* Appropriate approval
* A defined access duration where applicable

---

## 12. Group-Based Access Model

The preferred access model is:

**User → Identity Attributes → Group Membership → Resource Access**

For example:

**User: John Doe**

* Department: Network Operations
* Location: Abuja
* Role: Network Manager
* Level: Management

These attributes may determine membership in appropriate groups.

The groups may then be assigned access to specific organizational resources.

This approach reduces the need to assign permissions directly to individual users.

---

## 13. Dynamic Group Strategy

Where appropriate, group membership may be automated using user attributes.

For example:

### Department-Based Dynamic Group

**Rule:**

`Department = Technology`

Potential members:

* Technology employees

### Location-Based Dynamic Group

**Rule:**

`OfficeLocation = Abuja`

Potential members:

* Employees based in Abuja

### Role-Based Dynamic Group

**Rule:**

`JobTitle = Network Manager`

Potential members:

* Network Managers

Dynamic groups can reduce manual administration and improve consistency.

However, automated membership rules must be carefully designed and regularly reviewed.

---

## 14. Naming Convention

A consistent naming convention improves administration and troubleshooting.

The following naming format is recommended:

**GRP-[TYPE]-[NAME]**

### Examples

**Department:**

`GRP-DEPT-Technology`

**Location:**

`GRP-LOC-Abuja`

**Role:**

`GRP-ROLE-NetworkManager`

**Organizational Level:**

`GRP-LEVEL-Management`

**Access:**

`GRP-ACCESS-Finance-SharePoint`

**Collaboration:**

`GRP-COLLAB-Technology`

The naming convention should be applied consistently across the environment.

---

## 15. Access Assignment Rules

The following rules should apply:

1. Access should be assigned through groups wherever possible.
2. Direct individual permissions should be minimized.
3. Users should receive access based on their current business responsibilities.
4. Access should be reviewed when an employee changes role.
5. Previous role-based access should normally be removed.
6. Sensitive access should require appropriate approval.
7. Administrative access should be strictly controlled.
8. Temporary access should have an appropriate review or expiration process where possible.

---

## 16. Group Ownership

Every important group should have an identified owner.

Group owners should be responsible for:

* Confirming the business purpose of the group.
* Reviewing membership where required.
* Approving access requests.
* Ensuring that the group remains necessary.
* Requesting the removal or retirement of obsolete groups.

IT remains responsible for technical administration and enforcement of organizational policies.

---

## 17. Access Review

Access should be reviewed periodically to ensure that:

* Users still require access.
* Group membership is accurate.
* Former employees do not retain access.
* Employees who changed roles have appropriate permissions.
* Sensitive groups have appropriate membership.
* Unused groups are identified.

Access reviews are particularly important for:

* Finance resources
* HR resources
* Executive resources
* Administrative roles
* Security systems
* Network management systems

---

## 18. Summary

The group and access management model for Tonie-Osegbo Technologies Limited separates identity attributes from resource permissions.

The model uses:

* Department groups
* Location groups
* Role groups
* Organizational level groups
* Access groups
* Collaboration groups

The design is based on:

* Least privilege
* Role-based access
* Group-based permissions
* Separation of duties
* Current role membership
* Scalability
* Regular access review

The central principle is:

> Access should follow the employee's current business responsibilities and should not accumulate automatically from historical roles.

---

## 19. Future Enhancements

Future improvements may include:

* Automated group provisioning.
* Microsoft Entra dynamic groups.
* Access packages.
* Entitlement management.
* Access reviews.
* Privileged Identity Management.
* Automated HR integration.
* Lifecycle-based group membership.
* Temporary access workflows.
* Automated group expiration and review.
