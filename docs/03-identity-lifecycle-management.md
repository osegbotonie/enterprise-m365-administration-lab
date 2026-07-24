# Identity Lifecycle Management

## 1. Overview

Identity Lifecycle Management defines how employee identities, access rights, and associated resources are managed throughout an employee's relationship with Tonie-Osegbo Technologies Limited.

The lifecycle consists of three primary stages:

* **Joiner** — An employee joins the organization.
* **Mover** — An employee's role, department, location, or responsibilities change.
* **Leaver** — An employee leaves the organization.

The objective is straightforward:

> **Employees should receive the access they need when they join, their access should be reviewed when their responsibilities change, and their access should be restricted when they leave.**

The user's identity may remain the same throughout their employment, but the access associated with that identity should change as the employee's business relationship with the organization changes.

---

## 2. Organization Profile

**Organization:** Tonie-Osegbo Technologies Limited

**Industry:** Telecommunications and Technology

**Number of Employees:** Approximately 250

**Headquarters:** Abuja, Nigeria

### Regional Offices

* Lagos
* Enugu
* Port Harcourt

The organization has multiple departments, job roles, organizational levels, and locations. This means that a user's identity must contain enough information to support access management and administration.

Examples of relevant user attributes include:

* Department.
* Job title.
* Organizational level.
* Office location.
* Manager.
* Employment status.

---

## 3. Lifecycle Ownership

The employee lifecycle begins with a business event, usually originating from HR.

### High-Level Process

```text
Employee Lifecycle Event
          │
          ▼
         HR
          │
          ▼
    HR Notifies IT
          │
          ▼
      IT Reviews
          │
          ▼
IT Implements Technical Change
          │
          ▼
Microsoft 365 / Entra ID
```

### HR Responsibilities

HR is the authoritative source for employee lifecycle events.

HR is responsible for confirming or communicating events such as:

* New employees.
* Department changes.
* Job title changes.
* Promotions.
* Transfers.
* Location changes.
* Employee departures.

### IT / Identity Administration Responsibilities

IT is responsible for implementing the technical changes required as a result of the business event.

This may include:

* Creating or updating user accounts.
* Updating user attributes.
* Managing group memberships.
* Assigning or removing licenses.
* Managing access.
* Applying security controls.
* Restricting accounts.
* Preserving required information.

### Department Manager Responsibilities

Department managers may be involved in:

* Confirming the employee's role.
* Approving role-specific access.
* Confirming access requirements after a transfer or promotion.

The exact approval process should be defined by organizational policy.

---

# 4. Joiner Process

A **Joiner** is a new employee joining Tonie-Osegbo Technologies Limited.

The objective of the Joiner process is to create a usable and secure digital identity for the employee and provide the access required for the employee to begin working.

## 4.1 Joiner Workflow

```text
HR Confirms Employment
          │
          ▼
HR Provides Employee Information
          │
          ▼
IT Creates User Identity
          │
          ▼
Attributes Are Configured
          │
          ▼
Groups and Licenses Assigned
          │
          ▼
Security Controls Applied
          │
          ▼
Approved Access Provided
```

## 4.2 Joiner Process

The onboarding process follows these general steps:

1. HR confirms the employee's employment.
2. HR provides the required employee information to IT.
3. IT creates or provisions the user's Microsoft 365 identity.
4. User attributes are configured.
5. The employee is assigned to the appropriate department and groups.
6. Required licenses are assigned.
7. Security policies are applied.
8. Approved access is provided.

The employee should receive only the access required to perform the approved role.

---

## 4.3 Required Employee Information

The following information should be captured during onboarding:

* Full name.
* Employee ID.
* Department.
* Job title.
* Organizational level.
* Office location.
* Manager.
* Employment start date.
* Employment status.

These attributes can later be used to support:

* Group membership.
* Access management.
* Reporting.
* Automation.
* Governance.

---

## 4.4 Example Joiner

**Department:** Network Operations

**Job Title:** Network Engineer

**Organizational Level:** Senior Staff

**Location:** Abuja

**Manager:** Network Operations Manager

Potential group memberships may include:

```text
Technology-Users
Network-Operations
Abuja-Office
Network-Engineers
```

The exact access assigned should depend on the employee's actual responsibilities rather than simply adding the employee to every group associated with the department.

This is an important distinction.

> **Department membership can help identify what a user may need, but business responsibility should determine what the user actually receives.**

---

# 5. Mover Process

A **Mover** is an employee whose organizational role or responsibilities change.

Examples include:

* Department transfer.
* Promotion.
* Change of job title.
* Change of location.
* Change of manager.
* Change in job responsibilities.

A Mover event should trigger an access review.

The employee's existing access should not simply remain unchanged while new access is added.

---

## 5.1 Department Transfer

For example:

```text
Finance
   │
   ▼
Department Transfer
   │
   ▼
Technology
```

When an employee changes department:

1. HR confirms the change.
2. IT updates the relevant employee attributes.
3. The employee's existing access is reviewed.
4. Access no longer required is removed where appropriate.
5. New department access is assigned.
6. Group memberships are updated.
7. Additional role-specific access is granted where approved.

### Example

An employee moving from Finance to Technology may no longer require membership of finance-specific groups.

At the same time, the employee may require access to technology resources.

The user's account remains the same, but the access associated with the account changes.

---

## 5.2 Promotion

A promotion may result in changes to an employee's:

* Job title.
* Organizational level.
* Responsibilities.
* Manager.
* Group membership.
* Access requirements.

### Example Career Progression

```text
Network Engineer
        │
        ▼
Senior Network Engineer
        │
        ▼
Network Manager
```

When an employee is promoted, the user's attributes and access should be reviewed.

For example:

```text
Previous Role:
Network Engineer

New Role:
Network Manager
```

The employee may need access to:

```text
Network-Managers
Management-Users
```

However, the employee may no longer require access to certain groups intended specifically for Network Engineers.

This does not mean every previous permission must automatically be removed. The correct approach is to review access against the employee's new responsibilities.

The principle is:

> **A promotion should trigger an access review, not an automatic accumulation of permissions.**

---

## 5.3 Location Change

An employee may also change office location.

For example:

```text
Abuja
   │
   ▼
Location Change
   │
   ▼
Lagos
```

The employee's location attribute should be updated.

Location-based group membership or access should be reviewed where such controls are used.

Location alone should not automatically determine whether a user is trusted. It should be treated as one factor in the overall identity and security model.

---

# 6. Leaver Process

A **Leaver** is an employee who is leaving the organization.

The primary objective of the Leaver process is to prevent unauthorized access while preserving information that may be required for legitimate business, legal, regulatory, audit, or investigative purposes.

---

## 6.1 Leaver Workflow

```text
HR Confirms Departure
          │
          ▼
IT Receives Notification
          │
          ▼
Sign-In Access Blocked
          │
          ▼
Active Sessions Revoked
          │
          ▼
Access and Resources Reviewed
          │
          ▼
Required Data Preserved
          │
          ▼
Retention Period Reviewed
          │
          ▼
Deletion Considered Where Appropriate
```

---

## 6.2 Immediate Actions

Depending on the circumstances of the employee's departure, IT may need to:

* Block account sign-in.
* Revoke active sessions.
* Review authentication methods.
* Remove access to organizational resources.
* Secure corporate devices.
* Remove or transfer ownership of business resources.
* Preserve required business data.
* Reclaim licenses.

The urgency of these actions may depend on the circumstances of the departure.

For example, an employee leaving under normal circumstances may follow a planned offboarding process, while an immediate security concern may require access to be restricted immediately.

---

## 6.3 Account Retention

A user account should not necessarily be deleted immediately after an employee leaves.

The account or associated data may need to be retained for:

* Business continuity.
* Legal requirements.
* Regulatory requirements.
* Internal investigations.
* Audit purposes.
* Data retention requirements.

The general approach is:

> **Disable first. Review retention requirements. Delete later where appropriate.**

During the retention period:

* The former employee should not be able to sign in.
* Access should remain restricted.
* Required data should be preserved according to policy.
* Authorized personnel may investigate relevant activity using appropriate auditing, compliance, and investigation tools.

Historical activity should be reviewed through appropriate audit and investigation mechanisms rather than by allowing access to the disabled account.

---

# 7. Identity Lifecycle Summary

| Lifecycle Stage | Primary Trigger                                | Key Actions                                                                                   |
| --------------- | ---------------------------------------------- | --------------------------------------------------------------------------------------------- |
| **Joiner**      | Employee joins the organization                | Create identity, configure attributes, assign groups, licenses, and approved access           |
| **Mover**       | Employee changes role, department, or location | Update attributes, review access, remove unnecessary access, and assign new access            |
| **Leaver**      | Employee leaves the organization               | Block access, revoke sessions, secure resources, preserve required data, and review retention |

---

# 8. Identity Lifecycle Principles

## 8.1 Least Privilege

Users should receive only the access required to perform their approved responsibilities.

## 8.2 Access Should Reflect Current Responsibilities

Access should be reviewed when an employee's role changes.

A user should not retain unnecessary access simply because they previously held a different position.

## 8.3 Separation of Duties

Identity administration, access approval, and business ownership should be appropriately separated to reduce the risk of unauthorized access.

## 8.4 Timely Access Changes

Access should be reviewed and updated promptly when an employee's role or responsibilities change.

## 8.5 Secure Offboarding

Departing employees should lose access promptly while required organizational information is preserved according to applicable policies.

## 8.6 Auditability

Identity and access changes should be recorded and traceable.

## 8.7 Automation

Where appropriate, repetitive identity lifecycle activities should be automated to reduce errors and improve efficiency.

Automation should not remove the need for appropriate approvals and governance.

---

# 9. Future Enhancements

Future versions of this identity lifecycle design may include:

* Automated HR-to-IT provisioning workflows.
* Dynamic group membership.
* Automated license assignment.
* Access reviews.
* Privileged Identity Management.
* Microsoft Entra Identity Governance.
* Microsoft Entra Lifecycle Workflows.
* Integration with HR systems.
* Automated Joiner, Mover, and Leaver workflows.
* Periodic access certification.

---

# 10. Conclusion

A well-designed identity lifecycle ensures that employees receive appropriate access when they join the organization, that access is reviewed when their responsibilities change, and that access is securely removed when they leave.

The Joiner-Mover-Leaver model provides a structured foundation for managing identity and access throughout the employee lifecycle.

For Tonie-Osegbo Technologies Limited, the most important principle is that an employee's access should reflect their current relationship with the organization.

This means:

* A new employee receives approved access for their role.
* An employee who changes role or department undergoes an access review.
* A promoted employee receives access appropriate to the new position without automatically accumulating unnecessary permissions.
* A departing employee loses access promptly while required information is retained according to applicable policies.

The lifecycle can therefore be summarized as:

> **Join with the right access. Change access when responsibilities change. Remove access when the relationship ends.**
>
> # 11. Practical Lab Validation

The identity lifecycle model was validated against an existing Microsoft Entra ID environment configured for the Tonie-Osegbo Technologies Limited enterprise lab.

The practical validation focused on:

* User identities.
* User attributes.
* Group memberships.
* Group ownership.
* License assignment.
* Administrative role assignment.

The environment was treated as a simulated enterprise environment supporting a 250-employee organization with the potential to scale to approximately 1,000 employees.

---

## 11.1 User Identity Validation

The environment contains multiple test identities used to simulate employees within the organization.

Examples include:

| Test Identity      | User Type | Group Memberships | Assigned Licenses |
| ------------------ | --------- | ----------------: | ----------------: |
| Tonie-Test Support | Member    |                 0 |                 0 |
| Tonie Two          | Member    |                 4 |                 0 |
| Tonie Three        | Member    |                 3 |                 1 |
| Tonie Four         | Member    |                 4 |                 1 |

These test identities provide a practical basis for validating identity lifecycle, group-based access, and license assignment scenarios.

The identities can be used to simulate:

* New employee onboarding.
* Department membership.
* Role changes.
* Access changes.
* License assignment.
* Access removal during offboarding.

---

## 11.2 Joiner Validation

The existing test users provide a practical example of the Joiner process.

A new user identity can be created and then progressively configured with:

```text
User Created
     │
     ▼
User Attributes Configured
     │
     ▼
Department or Role Identified
     │
     ▼
Group Membership Assigned
     │
     ▼
License Assigned Where Required
     │
     ▼
Security Controls Applied
```

For example, a new employee may initially be created with no group memberships or licenses.

Additional access can then be assigned according to the employee's approved role and business requirements.

This reflects the principle of providing access based on business need rather than granting broad access by default.

---

## 11.3 Group-Based Access Validation

Several groups were identified in the environment that can be used to represent organizational departments, teams, and projects.

Examples include:

* Tonie Finance Team.
* TonieTeknikal.
* TonieGruppo.
* Tonie_Test Project Team.

These groups provide practical examples of how users can be associated with business functions and work activities.

For example:

```text
User
 │
 ├── Finance Department
 │       │
 │       ▼
 │   Tonie Finance Team
 │
 ├── Technology Department
 │       │
 │       ▼
 │   TonieTeknikal
 │
 └── Revenue Assurance
         │
         ▼
     TonieGruppo
```

Group-based access provides a more scalable approach than assigning access individually to every user.

This becomes increasingly important as the organization grows from approximately 250 employees toward a potential 1,000-employee environment.

---

## 11.4 Group Ownership Validation

The practical environment also demonstrates the importance of group ownership.

For example, the following groups have documented ownership and membership structures:

* **TonieGruppo** — Finance Department: Revenue Assurance.
* **TonieTeknikal** — Technical Department: Technology and Innovation.
* **Tonie Finance Team** — Finance Department.
* **Tonie_Test Project Team** — Test project team.

Group owners are responsible for the business context and ongoing management of the group.

This supports the governance principle that access should have an identifiable business owner.

The ownership model can be represented as:

```text
Business Requirement
        │
        ▼
Business Owner
        │
        ▼
Group Membership
        │
        ▼
Access to Approved Resources
```

---

## 11.5 Mover Scenario Validation

The test environment can also be used to simulate an employee changing roles or departments.

For example:

```text
User
 │
 ▼
Current Department
 │
 ▼
Group Membership
 │
 ▼
Role or Department Change
 │
 ▼
Access Review
 │
 ├── Remove Access No Longer Required
 │
 └── Assign New Approved Access
```

A user can therefore be moved between groups to simulate:

* Department transfer.
* Promotion.
* Project reassignment.
* Change in business responsibilities.

The important control is that new access should not simply be added without reviewing the user's existing access.

---

## 11.6 Leaver Scenario Validation

The leaver process can be simulated using a test identity.

A typical process would be:

```text
Employee Departure
        │
        ▼
Account Sign-In Blocked
        │
        ▼
Active Sessions Revoked
        │
        ▼
Group Access Reviewed
        │
        ▼
Licenses Reviewed
        │
        ▼
Business Data Preserved Where Required
```

The user identity should not be immediately deleted where information or audit history may need to be preserved.

This provides a practical way to validate the difference between:

* Disabling access.
* Removing group membership.
* Reclaiming licenses.
* Preserving business information.
* Deleting an identity after retention requirements have been considered.

---

## 11.7 Practical Findings

The practical validation identified the following observations:

### Finding 1 — Test Identities Are Available

Multiple test identities are available for simulating employee lifecycle events.

### Finding 2 — Group-Based Access Is Already Demonstrated

Users are assigned to multiple groups representing departments, teams, and projects.

### Finding 3 — Group Ownership Is Present

The environment contains groups with identifiable owners, supporting accountability for group management.

### Finding 4 — License Assignment Can Be Tested

Some test users have Microsoft 365 licenses assigned while others do not.

This provides a basis for testing role-based license assignment and license removal during lifecycle events.

### Finding 5 — Lifecycle Scenarios Can Be Simulated

The existing environment can support practical testing of:

* Joiner processes.
* Mover processes.
* Leaver processes.
* Group membership changes.
* License assignment.
* Access review scenarios.

---

## 11.8 Evidence to Capture

The following evidence should be captured as part of the lab documentation:

* User profile showing user type and account information.
* Group membership for selected test users.
* Group ownership information.
* Group membership lists.
* License assignment for selected users.
* Account sign-in status.
* Administrative role assignment where relevant.

Screenshots should be captured with unnecessary personal or tenant information minimized where possible.

The evidence should demonstrate the configuration and outcome of the process rather than simply showing that a page exists.

---

## 11.9 Validation Summary

The practical validation demonstrates that the identity lifecycle design can be applied to a real Microsoft Entra ID environment.

The environment provides:

```text
Test Users
    │
    ▼
Group-Based Access
    │
    ▼
Department and Team Structures
    │
    ▼
License Assignment
    │
    ▼
Administrative Controls
    │
    ▼
Lifecycle Testing
```

The current environment therefore provides a practical foundation for continuing the identity and access management lab.

The next phase is to capture structured evidence and validate the Joiner, Mover, and Leaver processes through controlled configuration changes.

> **The design defines how identity lifecycle management should work. The practical lab validates how those principles can be implemented and tested in Microsoft Entra ID.**

