# Attribute-to-Group Mapping

## 1. Overview

Attribute-to-Group Mapping defines how employee identity attributes are used to determine group membership within the Microsoft 365 environment of Tonie-Osegbo Technologies Limited.

The objective is to create a consistent relationship between employee information, group membership, and access management.

The model is:

```text
HR Data
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

The primary identity attributes used in this model are:

* Department.
* Job Title.
* Organizational Level.
* Office Location.
* Employment Status.

The design is intended to reduce unnecessary manual administration while ensuring that access reflects the employee's current business responsibilities.

---

# 2. Identity Attribute Model

Each employee is represented by a set of identity attributes.

### Example

**Employee:** John Doe

| Attribute            | Value              |
| -------------------- | ------------------ |
| Employee ID          | TOT-0003           |
| Department           | Network Operations |
| Job Title            | Network Engineer   |
| Organizational Level | Senior Staff       |
| Office Location      | Abuja              |
| Employment Status    | Active             |

These attributes help describe the employee and may be used to determine appropriate group membership.

The quality of the resulting group membership depends on the accuracy of the underlying identity attributes.

---

# 3. Attribute-to-Group Relationship

The relationship between employee attributes and groups is:

```text
Employee Attribute
        │
        ▼
Attribute Group Membership
        │
        ▼
Access Assignment Logic
        │
        ▼
Access Group
        │
        ▼
Resource Access
```

### Example

**Department:**

```text
Network Operations
        ↓
GRP-DEPT-NetworkOperations
```

**Job Title:**

```text
Network Engineer
        ↓
GRP-ROLE-NetworkEngineer
```

**Organizational Level:**

```text
Senior Staff
        ↓
GRP-LEVEL-SeniorStaff
```

**Office Location:**

```text
Abuja
        ↓
GRP-LOC-Abuja
```

These groups describe the employee.

They should not automatically be treated as direct permission groups for every resource.

---

# 4. Department-Based Membership

Department membership should be based on the employee's department attribute.

### Example Rule

```text
Department = Network Operations
        ↓
GRP-DEPT-NetworkOperations
```

### Potential Members

* Network Manager.
* Network Engineer.
* Senior Network Engineer.
* Network Operations Analyst.

Department groups may support:

* Department collaboration spaces.
* Department SharePoint sites.
* Department communications.
* Reporting.
* Access assignment logic.

Department membership alone should not automatically provide unrestricted access to every resource belonging to the department.

---

# 5. Role-Based Membership

Role membership should be based on the employee's current job title or standardized role attribute.

### Example

```text
Job Title = Network Engineer
        ↓
GRP-ROLE-NetworkEngineer
```

Another example:

```text
Job Title = Network Manager
        ↓
GRP-ROLE-NetworkManager
```

Role-based membership should reflect the employee's current position.

Historical roles should not automatically continue to determine current membership.

Where job titles are inconsistent, a standardized role attribute may be preferable to relying on free-text job titles.

For example, the following titles may all represent the same standardized role:

```text
Network Engineer
Senior Network Engineer
Network Operations Engineer
```

Whether these should map to the same role group depends on the organization's access model and the actual responsibilities of each position.

---

# 6. Organizational Level Membership

Organizational level membership should reflect the employee's current position within the organizational hierarchy.

### Example

```text
Organizational Level = Management
        ↓
GRP-LEVEL-Management
```

Another example:

```text
Organizational Level = Senior Staff
        ↓
GRP-LEVEL-SeniorStaff
```

These groups may support:

* Organizational communications.
* Reporting.
* Access assignment logic.
* Governance.

Organizational seniority alone should not automatically grant access to sensitive systems.

For example:

> A user being classified as Management does not automatically mean the user should receive administrative access to IT systems.

Access should continue to be based on business need.

---

# 7. Location-Based Membership

Location membership should be based on the employee's primary office location.

### Example

```text
Office Location = Abuja
        ↓
GRP-LOC-Abuja
```

Another example:

```text
Office Location = Lagos
        ↓
GRP-LOC-Lagos
```

Location groups may support:

* Office communications.
* Location-specific resources.
* Regional collaboration.
* Reporting.
* Location-based administration.

Location should not automatically determine whether a user is trusted.

It should be treated as one attribute within the wider identity and security model.

---

# 8. Employment Status

Employment status is a critical identity attribute.

## Active Employee

```text
Employment Status = Active
```

The employee may receive access appropriate to their role and responsibilities.

## Departed Employee

```text
Employment Status = Inactive / Terminated
```

The employee should not retain active access to organizational resources.

The change in employment status should trigger the appropriate offboarding process, which may include:

* Blocking sign-in.
* Revoking active sessions.
* Removing access.
* Securing corporate devices.
* Preserving required data.
* Reclaiming licenses.
* Reviewing account retention.

Employment status should therefore be treated as a key control in the identity lifecycle.

---

# 9. Example Employee Mapping

### John Doe

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

The resulting access should then be determined by the organization's access assignment model.

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

This provides a clearer separation between describing the employee and granting resource access.

---

# 10. Promotion Scenario

Assume John Doe is promoted from:

```text
Network Engineer
        │
        ▼
Network Manager
```

## Before Promotion

**Job Title:**

```text
Network Engineer
```

**Role Group:**

```text
GRP-ROLE-NetworkEngineer
```

## After Promotion

**Job Title:**

```text
Network Manager
```

**Role Group:**

```text
GRP-ROLE-NetworkManager
```

## Required Change

The employee's identity attributes should be updated.

The previous role-based membership should normally be removed if it no longer represents the employee's current role.

### Remove

```text
GRP-ROLE-NetworkEngineer
```

### Add

```text
GRP-ROLE-NetworkManager
```

The employee's access should then be reviewed.

For example, the employee may become eligible for:

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

## Previous Membership

```text
GRP-DEPT-Finance
```

## New Membership

```text
GRP-DEPT-Technology
```

The employee's department attribute should be updated.

The previous department membership should be reviewed and removed where it no longer represents the employee's current department.

Access associated with the previous department should also be reviewed.

The employee should then receive access appropriate to the new department and role.

---

# 12. Location Transfer Scenario

Assume an employee moves from:

```text
Lagos
   │
   ▼
Abuja
```

## Previous Membership

```text
GRP-LOC-Lagos
```

## New Membership

```text
GRP-LOC-Abuja
```

The employee's location attribute should be updated.

The previous location membership should be reviewed and removed where appropriate.

Location-specific access should also be reviewed.

The employee's physical location should not automatically be used as the sole basis for making security decisions.

---

# 13. Group Membership Lifecycle

Group membership should follow the employee's current attributes.

## Joiner

When an employee joins:

* Identity attributes are created.
* Appropriate attribute groups are assigned.
* Access eligibility is evaluated.
* Approved access is provided.

## Mover

When an employee changes:

* Identity attributes are updated.
* Previous group membership is reviewed.
* Unnecessary membership is removed.
* New group membership is applied.
* Access is reviewed and updated.

## Leaver

When an employee leaves:

* Employment status is updated.
* Sign-in is blocked.
* Active sessions are revoked where appropriate.
* Access is removed.
* Group memberships are reviewed.
* Required data is preserved according to applicable policies.

---

# 14. Governance Considerations

Attribute-based group membership must be governed carefully.

The organization should ensure that:

* Employee attributes are accurate.
* HR remains the authoritative source for employee lifecycle changes.
* Attribute changes are traceable.
* Group membership is periodically reviewed.
* Access is not granted based on inaccurate information.
* Attribute values are standardized.
* Important groups have appropriate owners.

Incorrect identity attributes can result in incorrect group membership and, potentially, inappropriate access.

The principle is:

> **Bad identity data can produce bad access decisions.**

---

# 15. Attribute Standardization

Automated group membership depends on consistent attribute values.

For example, the following values should not be treated as separate departments if they represent the same organizational unit:

```text
Network Operations
Network Ops
Network Operations Department
```

The organization should define standard values for important attributes such as:

* Department.
* Office Location.
* Organizational Level.
* Employment Status.

This improves:

* Dynamic group accuracy.
* Reporting.
* Automation.
* Access consistency.

---

# 16. Summary

The attribute-to-group model creates a structured relationship between employee information and group membership.

The model is:

```text
HR Data
   ↓
Identity Attributes
   ↓
Attribute Groups
   ↓
Access Assignment
   ↓
Access Groups
   ↓
Resource Access
```

The primary attributes are:

* Department.
* Job Title.
* Organizational Level.
* Office Location.
* Employment Status.

This model supports:

* Scalable administration.
* Reduced manual work.
* Consistent group membership.
* Faster onboarding.
* Better role-change management.
* Improved offboarding.
* Least-privilege access.

The most important design principle is:

> **Identity attributes describe the employee. Group membership organizes the employee. Access groups grant resource permissions.**

---

# 17. Future Enhancements

Future improvements may include:

* Microsoft Entra Dynamic Groups.
* Automated HR integration.
* Automated Joiner, Mover, and Leaver workflows.
* Access Packages.
* Entitlement Management.
* Periodic Access Reviews.
* Automated attribute validation.
* Identity Governance workflows.
* Standardized HR-to-Entra attribute synchronization.
* Automated exception reporting.

---

## Conclusion

Attribute-to-group mapping provides the connection between employee information and the technical identity structure used by Microsoft 365.

A well-designed model ensures that:

* New employees can be grouped consistently.
* Department changes can trigger membership changes.
* Promotions can update role membership.
* Location changes can update location membership.
* Departures can trigger access restriction.
* Access can be managed at scale.

The final model is:

> **HR Data → Identity Attributes → Group Membership → Access Assignment → Resource Access**

This creates a structured foundation for automation while ensuring that access remains aligned with the employee's current business responsibilities.
