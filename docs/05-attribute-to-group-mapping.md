# Attribute-to-Group Mapping

## 1. Overview

Attribute-to-Group Mapping defines how employee identity information can be used to organize users into appropriate Microsoft Entra ID groups within the Tonie-Osegbo Technologies Limited enterprise environment.

The purpose of this design is to create a consistent relationship between employee information, group membership, and access management.

The model is:

```text
HR / Employee Data
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
Resource Access
```

The primary attributes considered in this design are:

* Department
* Job title or standardized role
* Organizational level
* Office location
* Employment status

The objective is to reduce unnecessary manual administration while ensuring that group membership and access remain aligned with the employee's current business responsibilities.

A key design principle is:

> **Identity attributes describe the employee. Groups organize the employee. Access groups grant access to resources.**

These functions should be kept separate wherever practical.

---

## 2. Identity Attribute Model

Each employee is represented by a collection of identity attributes.

For example:

| Attribute            | Example Value      |
| -------------------- | ------------------ |
| Employee ID          | TOT-0003           |
| Department           | Network Operations |
| Job Title            | Network Engineer   |
| Organizational Level | Senior Staff       |
| Office Location      | Abuja              |
| Employment Status    | Active             |

These attributes can be used to support:

* Group membership.
* Access assignment.
* Reporting.
* Automation.
* Governance.
* Identity lifecycle management.

The quality of any automated group membership or access decision depends on the accuracy and consistency of the underlying identity data.

For this reason, attributes used for access-related decisions should be maintained through an agreed process and should have a clear source of authority.

---

# 3. Attribute-to-Group Relationship

The relationship between employee attributes and access can be represented as:

```text
Employee Attribute
        │
        ▼
Attribute-Based Group Membership
        │
        ▼
Access Assignment Logic
        │
        ▼
Access Group
        │
        ▼
Resource
```

For example:

```text
Department = Network Operations
        │
        ▼
GRP-DEPT-NetworkOperations
```

```text
Job Title = Network Engineer
        │
        ▼
GRP-ROLE-NetworkEngineer
```

```text
Organizational Level = Senior Staff
        │
        ▼
GRP-LEVEL-SeniorStaff
```

```text
Office Location = Abuja
        │
        ▼
GRP-LOC-Abuja
```

These groups describe different aspects of the employee's organizational identity.

They should not automatically be treated as direct permission groups for every resource.

Where access is required, the identity information should be used as an input into the access assignment process.

For example:

```text
Identity Attributes
        │
        ▼
Attribute Groups
        │
        ▼
Access Decision
        │
        ▼
Access Group
        │
        ▼
Resource
```

This separation makes it easier to understand both:

> **Who the user is**

and:

> **Why the user has access to a particular resource.**

---

# 4. Department-Based Group Membership

Department-based membership should reflect the employee's current organizational department.

### Example

```text
Department = Network Operations
        │
        ▼
GRP-DEPT-NetworkOperations
```

Potential members may include:

* Network Engineers.
* Senior Network Engineers.
* Network Managers.
* Network Operations Analysts.

Department groups may support:

* Department collaboration.
* Department communication.
* SharePoint site membership.
* Reporting.
* Automation.
* Access assignment logic.

However, department membership alone should not automatically provide unrestricted access to all resources belonging to that department.

For example, an employee in the Technology department may still not require access to:

* Privileged administrative tools.
* Confidential management information.
* Security systems.
* Sensitive production infrastructure.

The employee's actual responsibilities and approved access requirements should determine access to those resources.

---

# 5. Role-Based Group Membership

Role-based group membership should represent the employee's current job role or a standardized role classification.

### Example

```text
Job Title = Network Engineer
        │
        ▼
GRP-ROLE-NetworkEngineer
```

Another example:

```text
Job Title = Network Manager
        │
        ▼
GRP-ROLE-NetworkManager
```

Role-based groups should reflect the employee's current responsibilities.

Where job titles are inconsistent, a standardized role attribute may be more reliable than using free-text job titles directly.

For example, the following titles may represent similar responsibilities:

```text
Network Engineer
Network Operations Engineer
Senior Network Engineer
```

Whether these roles should be mapped to the same group should depend on the organization's access model and the actual responsibilities of the positions.

The mapping should not be based on the title alone.

A role group should therefore be treated as an input to access decisions rather than an automatic grant of every permission associated with the role.

---

# 6. Organizational Level Group Membership

Organizational level groups represent an employee's position within the organization's hierarchy.

Examples include:

```text
GRP-LEVEL-Executive
GRP-LEVEL-SeniorManagement
GRP-LEVEL-Management
GRP-LEVEL-SeniorStaff
GRP-LEVEL-Staff
```

These groups may support:

* Organizational communications.
* Reporting.
* Governance.
* Access assignment logic.

Organizational seniority alone should not automatically grant access to sensitive systems.

For example:

> A user being a member of management does not automatically mean that the user should receive administrative access to IT systems.

Access should continue to be based on business need and appropriate authorization.

---

# 7. Location-Based Group Membership

Location groups represent the employee's primary office location.

Examples include:

```text
GRP-LOC-Abuja
GRP-LOC-Lagos
GRP-LOC-Enugu
GRP-LOC-PortHarcourt
```

Location groups may support:

* Office communications.
* Regional collaboration.
* Location-specific resources.
* Reporting.
* Office administration.

However, location should not automatically determine whether a user is trusted.

A user's location is only one factor that may be considered within the broader identity and security model.

Location-based group membership should therefore not be used as a substitute for security controls such as:

* Multifactor authentication.
* Conditional Access.
* Device compliance.
* Risk-based access controls.

---

# 8. Employment Status

Employment status is an important identity lifecycle attribute.

Example values may include:

```text
Active
Leave of Absence
Suspended
Terminated
```

An active employee may receive access appropriate to their approved role and responsibilities.

When an employee leaves the organization, the change in employment status should initiate the appropriate offboarding process.

Depending on the organization's implementation, this may involve:

* Blocking sign-in.
* Revoking active sessions.
* Removing group-based access.
* Securing corporate devices.
* Preserving required business information.
* Reclaiming licenses.
* Reviewing account retention.

The important distinction is that changing an attribute such as `Employment Status = Terminated` does not, by itself, automatically disable a user unless an automated workflow or administrative process is connected to that attribute.

Therefore:

```text
Employment Status Change
        │
        ▼
Offboarding Process
        │
        ▼
Access Restriction
```

The attribute should be treated as an important trigger or input into the lifecycle process.

---

# 9. Example Employee Mapping

### Employee

**Name:** John Doe

| Attribute            | Value              |
| -------------------- | ------------------ |
| Department           | Network Operations |
| Job Title            | Network Engineer   |
| Organizational Level | Senior Staff       |
| Office Location      | Abuja              |
| Employment Status    | Active             |

### Resulting Attribute Groups

```text
GRP-DEPT-NetworkOperations
GRP-ROLE-NetworkEngineer
GRP-LEVEL-SeniorStaff
GRP-LOC-Abuja
```

The resulting access should then be determined by the organization's access model.

For example:

```text
Identity Attributes
        │
        ▼
Attribute Groups
        │
        ▼
Access Assignment
        │
        ▼
GRP-ACCESS-NetworkOperations-Tools
        │
        ▼
Network Operations Tools
```

This structure provides a clear separation between the employee's identity information and the permissions assigned to resources.

---

# 10. Promotion Scenario

Assume an employee is promoted from:

```text
Network Engineer
        │
        ▼
Network Manager
```

## Before Promotion

```text
Job Title:
Network Engineer
```

```text
Role Group:
GRP-ROLE-NetworkEngineer
```

## After Promotion

```text
Job Title:
Network Manager
```

```text
Role Group:
GRP-ROLE-NetworkManager
```

The employee's identity attributes should be updated as part of the promotion process.

The previous role-based membership should normally be reviewed and removed if it no longer represents the employee's current role.

### Previous Membership

```text
GRP-ROLE-NetworkEngineer
```

### New Membership

```text
GRP-ROLE-NetworkManager
```

The employee's access should then be reviewed against the new responsibilities.

The employee may become eligible for access such as:

```text
GRP-ACCESS-NetworkManagement
```

However, eligibility for access and actual access assignment should remain subject to the organization's access model and any required approvals.

The principle is:

> **A promotion should trigger an access review, not automatic accumulation of permissions.**

---

# 11. Department Transfer Scenario

Assume an employee moves from:

```text
Finance
   │
   ▼
Technology
```

### Previous Department Group

```text
GRP-DEPT-Finance
```

### New Department Group

```text
GRP-DEPT-Technology
```

The employee's department attribute should be updated.

The previous department membership should be reviewed and removed where it no longer represents the employee's current department.

Access associated with the previous department should also be reviewed.

The employee should then receive access appropriate to the new department and current role.

The process should therefore be:

```text
Department Change
        │
        ▼
Update Identity Attribute
        │
        ▼
Review Existing Membership
        │
        ▼
Remove Unnecessary Membership
        │
        ▼
Assign New Membership
        │
        ▼
Review Access
```

---

# 12. Location Transfer Scenario

Assume an employee moves from:

```text
Lagos
   │
   ▼
Abuja
```

### Previous Location Group

```text
GRP-LOC-Lagos
```

### New Location Group

```text
GRP-LOC-Abuja
```

The employee's location attribute should be updated.

The previous location membership should be reviewed and removed where appropriate.

Any location-specific access should also be reviewed.

The employee's physical location should not be used as the sole basis for making security decisions.

---

# 13. Group Membership Lifecycle

Group membership should reflect the employee's current attributes and organizational relationship.

## Joiner

When an employee joins:

1. The employee's identity is created.
2. Required identity attributes are populated.
3. Appropriate attribute-based groups are assigned.
4. Access requirements are evaluated.
5. Approved access is provided.

## Mover

When an employee changes role, department, or location:

1. Identity attributes are updated.
2. Existing group membership is reviewed.
3. Membership that is no longer required is removed.
4. New group membership is assigned.
5. Access is reviewed and updated.

## Leaver

When an employee leaves:

1. Employment status is updated.
2. The offboarding process is initiated.
3. Sign-in is blocked.
4. Active sessions are revoked where appropriate.
5. Access and group membership are reviewed.
6. Required information is preserved according to applicable policies.
7. Licenses and resources are reviewed.

The exact sequence may vary depending on the circumstances of the departure.

---

# 14. Governance Considerations

Attribute-based group membership must be governed carefully.

The organization should ensure that:

* Employee attributes are accurate.
* HR remains the authoritative source for employee lifecycle events.
* Attribute changes are traceable.
* Attribute values are standardized.
* Group membership is periodically reviewed.
* Important groups have appropriate owners.
* Access is not granted solely because an inaccurate attribute exists.

Incorrect identity data can result in incorrect group membership and potentially inappropriate access.

The principle is:

> **Bad identity data can produce bad access decisions.**

---

# 15. Attribute Standardization

Automated group membership depends on consistent attribute values.

For example, the following values could create problems if they are intended to represent the same department:

```text
Network Operations
Network Ops
Network Operations Department
```

The organization should define standardized values for important attributes, including:

* Department.
* Office Location.
* Organizational Level.
* Employment Status.
* Standardized Role.

For example:

```text
Department:
Network Operations
```

should be preferred over allowing multiple uncontrolled variations of the same value.

Standardization improves:

* Dynamic group accuracy.
* Reporting.
* Automation.
* Access consistency.
* Troubleshooting.

---

# 16. Exception Handling

Not every employee will fit perfectly into a standard attribute-to-group mapping.

Examples may include:

* Temporary project assignments.
* Employees with responsibilities across multiple departments.
* Contractors.
* Employees performing temporary duties.
* Special access requirements.

These cases should be handled through a controlled exception process.

An exception should have:

* A documented business reason.
* An identified approver.
* A clear scope of access.
* A defined review date where appropriate.

Exceptions should not be used as a replacement for proper role and group design.

---

# 17. Mapping Example

The following example shows how employee attributes can support access assignment.

```text
Department:
Network Operations

Job Title:
Network Engineer

Organizational Level:
Senior Staff

Office Location:
Abuja

Employment Status:
Active
        │
        ▼
Attribute Groups
        │
        ├── GRP-DEPT-NetworkOperations
        ├── GRP-ROLE-NetworkEngineer
        ├── GRP-LEVEL-SeniorStaff
        └── GRP-LOC-Abuja
        │
        ▼
Access Assignment
        │
        ▼
GRP-ACCESS-NetworkOperations-Tools
        │
        ▼
Network Operations Tools
```

This model makes the access decision easier to understand and audit.

The organization can answer:

> **Which identity attributes contributed to this user's group membership?**

and:

> **Why was this access group assigned?**

---

# 18. Summary

The attribute-to-group model creates a structured relationship between employee information and group membership.

The model is:

```text
HR / Employee Data
        ↓
Identity Attributes
        ↓
Attribute-Based Groups
        ↓
Access Assignment
        ↓
Access Groups
        ↓
Resource Access
```

The primary attributes are:

* Department.
* Job Title or Standardized Role.
* Organizational Level.
* Office Location.
* Employment Status.

The model supports:

* Scalable administration.
* Reduced manual work.
* Consistent group membership.
* Faster onboarding.
* Better role-change management.
* More structured offboarding.
* Improved access governance.

The key design principle is:

> **Identity attributes describe the employee. Groups organize the employee. Access groups grant resource permissions.**

---

# 19. Future Enhancements

Future improvements may include:

* Microsoft Entra Dynamic Groups.
* Automated HR integration.
* Automated Joiner, Mover, and Leaver workflows.
* Access Packages.
* Microsoft Entra Entitlement Management.
* Periodic Access Reviews.
* Automated attribute validation.
* Identity Governance workflows.
* Standardized HR-to-Entra attribute synchronization.
* Automated exception reporting.

---

## Conclusion

Attribute-to-group mapping provides the connection between employee information and the technical identity structure used by Microsoft 365 and Microsoft Entra ID.

A well-designed model ensures that:

* New employees can be grouped consistently.
* Department changes can trigger appropriate membership changes.
* Promotions can update role membership.
* Location changes can update location membership.
* Departures can initiate access restriction and offboarding.
* Access can be managed at scale.

The final model is:

> **HR / Employee Data → Identity Attributes → Group Membership → Access Assignment → Resource Access**

This creates a structured foundation for automation while ensuring that access remains aligned with the employee's current business responsibilities.
