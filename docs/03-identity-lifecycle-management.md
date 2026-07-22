# Identity Lifecycle Management

## 1. Overview

Identity Lifecycle Management defines how user identities, access rights, and associated resources are managed throughout an employee's relationship with Tonie-Osegbo Technologies Limited.

The lifecycle consists of three primary stages:

* **Joiner** — An employee joins the organization.
* **Mover** — An employee's role, department, location, or responsibilities change.
* **Leaver** — An employee leaves the organization.

The objective is to ensure that employees receive appropriate access when they join, that access is reviewed and updated when their roles change, and that access is securely removed when they leave.

---

## 2. Organization Profile

**Organization:** Tonie-Osegbo Technologies Limited

**Industry:** Telecommunications and Technology

**Number of Employees:** 250

**Headquarters:** Abuja, Nigeria

### Regional Offices

* Lagos
* Enugu
* Port Harcourt

---

## 3. Identity Lifecycle Ownership

Human Resources (HR) is the authoritative source for employee lifecycle events.

HR is responsible for notifying the IT and Identity Administration team of:

* New employees
* Department changes
* Job title changes
* Promotions
* Transfers
* Location changes
* Employee departures

The IT and Identity Administration team is responsible for implementing the required identity, access, device, and security changes.

Department managers may approve additional role-specific access where required.

### High-Level Process

**HR → IT / Identity Administration → Microsoft Entra ID**

The employee lifecycle event begins with HR. IT and Identity Administration then implement the required identity and access changes within Microsoft Entra ID and other relevant Microsoft 365 services.

---

## 4. Joiner Process

A **Joiner** is a new employee joining Tonie-Osegbo Technologies Limited.

The Joiner process ensures that the employee receives an appropriately configured identity and the access required to perform their job.

### 4.1 Joiner Process

The onboarding process follows these general steps:

1. HR confirms the employee's employment.
2. HR provides the required employee information to IT.
3. IT creates the user account.
4. User attributes are configured.
5. Appropriate groups and licenses are assigned.
6. Required security policies are applied.
7. The employee receives approved access.

### 4.2 Required Employee Information

The following information should be captured during the onboarding process:

* Full name
* Employee ID
* Department
* Job title
* Organizational level
* Office location
* Manager
* Employment start date

### 4.3 Initial Access Assignment

Access should be assigned based on the employee's:

* Department
* Job title
* Organizational level
* Office location
* Business responsibilities

**Example:**

**Department:** Technology

**Job Title:** Network Engineer

**Location:** Abuja

Potential group memberships may include:

* `Technology-Users`
* `Network-Operations`
* `Abuja-Office`
* `Network-Engineers`

The principle of **least privilege** should be applied. Employees should receive only the access required to perform their approved responsibilities.

---

## 5. Mover Process

A **Mover** is an employee whose organizational role or responsibilities change.

Examples include:

* Department transfer
* Promotion
* Change of job title
* Change of location
* Change of manager
* Change in job responsibilities

### 5.1 Department Transfer

For example, an employee may move from:

**Finance → Technology**

When an employee changes department, their identity attributes and access should be reviewed.

### Required Actions

* Update the department attribute.
* Update the job title where applicable.
* Update the manager.
* Update the office location where applicable.
* Review existing group memberships.
* Remove access no longer required.
* Add the appropriate new department groups.
* Grant approved role-specific access.

The employee should not retain unnecessary access from their previous role unless there is a documented business requirement and appropriate approval.

---

## 6. Promotion Process

A promotion may result in changes to an employee's:

* Job title
* Organizational level
* Department responsibilities
* Manager
* Group membership
* Access permissions

### Example Career Progression

**Network Engineer → Senior Network Engineer → Network Manager**

When an employee is promoted, the employee's identity attributes and access should be reviewed.

### Example Group Change

**Previous Group:** `Network-Engineers`

**New Group:** `Network-Managers`

Access should be reviewed to ensure that the employee receives the permissions appropriate for the new role.

Promotion should not automatically result in unrestricted access. Access should continue to follow the principles of:

* Least privilege
* Role-based access
* Separation of duties
* Business need

---

## 7. Leaver Process

A **Leaver** is an employee who is leaving the organization.

The primary objective of the Leaver process is to prevent unauthorized access while preserving information that may be required for legitimate business, legal, regulatory, audit, or investigative purposes.

### 7.1 Leaver Process

The offboarding process may include the following actions:

1. HR confirms the employee's departure.
2. IT receives the departure notification.
3. User sign-in is blocked.
4. Active sessions are revoked.
5. Access to organizational resources is reviewed and removed.
6. Corporate devices are secured.
7. Required data is preserved.
8. Licenses are reclaimed.
9. Retention requirements are reviewed.
10. Account deletion is considered in accordance with applicable policies.

### 7.2 Immediate Actions

Depending on the circumstances of the employee's departure, IT may need to:

* Block account sign-in.
* Revoke active sessions.
* Remove access to organizational resources.
* Review authentication methods.
* Secure corporate devices.
* Remove or transfer ownership of business resources.
* Preserve required business data.
* Reclaim licenses.

### 7.3 Account Retention

User accounts should not necessarily be deleted immediately after an employee leaves the organization.

The account or associated data may need to be retained for:

* Business continuity
* Legal requirements
* Regulatory requirements
* Internal investigations
* Audit purposes
* Data retention requirements

> **Disable first. Delete later, subject to applicable retention and organizational policies.**

During the retention period, access to the account should remain restricted. Authorized administrators may manage required data preservation and investigation activities in accordance with organizational policy.

---

## 8. Identity Lifecycle Summary

| Lifecycle Stage | Primary Trigger                     | Key Actions                                                                                   |
| --------------- | ----------------------------------- | --------------------------------------------------------------------------------------------- |
| **Joiner**      | Employee joins the organization     | Create identity, assign attributes, groups, licenses, and approved access                     |
| **Mover**       | Employee changes role or department | Update attributes, review access, remove unnecessary permissions, and assign new access       |
| **Leaver**      | Employee leaves the organization    | Block access, revoke sessions, secure resources, preserve required data, and review retention |

---

## 9. Identity Lifecycle Principles

### 9.1 Least Privilege

Users should receive only the access required to perform their approved responsibilities.

### 9.2 Separation of Duties

Identity administration, access approval, and business ownership should be appropriately separated to reduce the risk of unauthorized access.

### 9.3 Timely Access Changes

Access should be reviewed and updated promptly when an employee's role or responsibilities change.

### 9.4 Secure Offboarding

Departing employees should lose access promptly while required organizational information is preserved according to applicable policies.

### 9.5 Auditability

Identity and access changes should be recorded and traceable.

### 9.6 Automation

Where possible, repetitive identity lifecycle activities should be automated to reduce errors and improve efficiency.

---

## 10. Future Enhancements

Future versions of this identity lifecycle design may include:

* Automated HR-to-IT provisioning workflows
* Dynamic group membership
* Automated license assignment
* Access reviews
* Privileged Identity Management
* Identity Governance
* Microsoft Entra lifecycle workflows
* Integration with HR systems
* Automated Joiner, Mover, and Leaver workflows
* Periodic access certification

---

## 11. Conclusion

A well-designed identity lifecycle ensures that users receive appropriate access when they join the organization, that access is updated when their responsibilities change, and that access is securely removed when they leave.

The Joiner-Mover-Leaver model provides a structured foundation for managing identity and access across the employee lifecycle.

For Tonie-Osegbo Technologies Limited, this model supports the broader objectives of:

* Secure identity management
* Least-privilege access
* Improved governance
* Reduced security risk
* Better auditability
* Operational efficiency
