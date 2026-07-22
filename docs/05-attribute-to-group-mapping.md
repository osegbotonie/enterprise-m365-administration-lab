# Attribute-to-Group Mapping

## 1. Overview

Attribute-to-Group Mapping defines how employee identity attributes are used to determine group membership within the Microsoft 365 environment.

The objective is to reduce manual access administration and create a consistent relationship between:

**Employee Attributes → Group Membership → Resource Access**

The primary attributes used in this model are:

* Department
* Job Title
* Organizational Level
* Office Location
* Employment Status

---

## 2. Identity Attribute Model

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

These attributes are used to determine appropriate group membership.

---

## 3. Attribute-to-Group Relationship

The relationship between employee attributes and groups is:

**Employee Attribute → Group Membership → Resource Access**

### Example

**Department:**

`Network Operations`

↓

`GRP-DEPT-NetworkOperations`

**Job Title:**

`Network Engineer`

↓

`GRP-ROLE-NetworkEngineer`

**Organizational Level:**

`Senior Staff`

↓

`GRP-LEVEL-SeniorStaff`

**Office Location:**

`Abuja`

↓

`GRP-LOC-Abuja`

---

## 4. Department-Based Membership

Department membership should be based on the employee's department attribute.

### Example Rule

**Department = Network Operations**

↓

`GRP-DEPT-NetworkOperations`

### Example Members

* Network Manager
* Network Engineer
* Senior Network Engineer
* Network Operations Analysts

Department groups may provide access to:

* Department collaboration spaces
* Department SharePoint sites
* Department communications
* Department-specific resources

---

## 5. Role-Based Membership

Role membership should be based on the employee's current job title or role.

### Example Rule

**Job Title = Network Engineer**

↓

`GRP-ROLE-NetworkEngineer`

### Example Rule

**Job Title = Network Manager**

↓

`GRP-ROLE-NetworkManager`

Role-based membership should reflect the employee's current position.

Historical roles should not automatically continue to grant access.

---

## 6. Organizational Level Membership

Organizational level membership should reflect the employee's current organizational position.

### Example Rule

**Organizational Level = Management**

↓

`GRP-LEVEL-Management`

### Example Rule

**Organizational Level = Senior Staff**

↓

`GRP-LEVEL-SeniorStaff`

These groups may support access to resources appropriate to the employee's organizational level.

---

## 7. Location-Based Membership

Location membership should be based on the employee's primary office location.

### Example Rule

**Office Location = Abuja**

↓

`GRP-LOC-Abuja`

### Example Rule

**Office Location = Lagos**

↓

`GRP-LOC-Lagos`

Location groups may support:

* Office communications
* Location-specific resources
* Regional collaboration
* Location-based policies

---

## 8. Employment Status

Employment status is a critical identity attribute.

### Active Employee

**Employment Status = Active**

The employee may receive appropriate access based on their role and responsibilities.

### Departed Employee

**Employment Status = Inactive or Terminated**

The employee should not retain active access to organizational resources.

The account should be reviewed and appropriate offboarding actions should be initiated.

---

## 9. Example Employee Mapping

### John Doe

| Attribute            | Value              |
| -------------------- | ------------------ |
| Department           | Network Operations |
| Job Title            | Network Engineer   |
| Organizational Level | Senior Staff       |
| Office Location      | Abuja              |
| Employment Status    | Active             |

### Resulting Groups

* `GRP-DEPT-NetworkOperations`
* `GRP-ROLE-NetworkEngineer`
* `GRP-LEVEL-SeniorStaff`
* `GRP-LOC-Abuja`

---

## 10. Promotion Scenario

Assume John Doe is promoted from:

**Network Engineer → Network Manager**

### Before Promotion

**Job Title:**

Network Engineer

**Role Group:**

`GRP-ROLE-NetworkEngineer`

### After Promotion

**Job Title:**

Network Manager

**Role Group:**

`GRP-ROLE-NetworkManager`

### Required Change

The previous role-based membership should normally be removed.

**Remove:**

`GRP-ROLE-NetworkEngineer`

**Add:**

`GRP-ROLE-NetworkManager`

This ensures that the employee's access reflects their current role.

---

## 11. Department Transfer Scenario

Assume an employee moves from:

**Finance → Technology**

### Previous Membership

`GRP-DEPT-Finance`

### New Membership

`GRP-DEPT-Technology`

The employee's department attribute should be updated, and group membership should be reviewed accordingly.

Access that is no longer required should be removed.

---

## 12. Location Transfer Scenario

Assume an employee moves from:

**Lagos → Abuja**

### Previous Membership

`GRP-LOC-Lagos`

### New Membership

`GRP-LOC-Abuja`

The employee's location attribute should be updated and the appropriate location group membership applied.

---

## 13. Group Membership Lifecycle

Group membership should follow the employee's current attributes.

### Joiner

When an employee joins:

* Identity attributes are created.
* Appropriate groups are assigned.
* Approved access is provided.

### Mover

When an employee changes:

* Identity attributes are updated.
* Previous group membership is reviewed.
* Unnecessary access is removed.
* New group membership is applied.

### Leaver

When an employee leaves:

* Sign-in is blocked.
* Active sessions are revoked.
* Access is removed.
* Group memberships are reviewed.
* Required data is preserved.

---

## 14. Governance Considerations

Attribute-based group membership must be governed carefully.

The organization should ensure that:

* Employee attributes are accurate.
* HR remains the authoritative source for employee changes.
* Attribute changes are traceable.
* Group membership is periodically reviewed.
* Access is not granted based on inaccurate information.

Incorrect identity attributes can result in incorrect access.

---

## 15. Summary

The attribute-to-group model creates a structured relationship between employee information and access.

The model is:

**HR Data → Identity Attributes → Group Membership → Resource Access**

The primary attributes are:

* Department
* Job Title
* Organizational Level
* Office Location
* Employment Status

This model supports:

* Scalable administration
* Reduced manual work
* Consistent access assignment
* Faster onboarding
* Better role changes
* Improved offboarding
* Least-privilege access

---

## 16. Future Enhancements

Future improvements may include:

* Microsoft Entra dynamic groups.
* Automated HR integration.
* Automated Joiner, Mover, and Leaver workflows.
* Access packages.
* Entitlement management.
* Periodic access reviews.
* Automated attribute validation.
* Identity governance workflows.
