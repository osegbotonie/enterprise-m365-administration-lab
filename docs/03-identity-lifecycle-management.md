# Identity Lifecycle Management

## Overview

Identity Lifecycle Management defines how user identities and access rights are managed throughout an employee's relationship with Tonie-Osegbo Technologies Limited.

The lifecycle is divided into three major stages:

- Joiner
- Mover
- Leaver

The objective is to ensure that employees receive the appropriate access when they join the organization, that access is updated when their role changes, and that access is securely removed when they leave.

---

## Identity Lifecycle Ownership

Human Resources (HR) is the authoritative source for employee lifecycle events.

HR is responsible for notifying IT of:

- New employees
- Department changes
- Job title changes
- Promotions
- Transfers
- Employee departures

The IT and Identity Administration team is responsible for implementing the required identity and access changes.

Department managers may approve additional role-specific access where required.

### High-Level Process

```text
HR
 │
 │ Employee Lifecycle Event
 ▼
IT / Identity Administration
 │
 ▼
Microsoft Entra ID
 │
 ├── User Account
 ├── Department
 ├── Job Title
 ├── Location
 ├── Manager
 └── Group Membership

#### 1. Joiner Process

A Joiner is a new employee joining Tonie-Osegbo Technologies Limited.

Process
HR Confirms Employment
          │
          ▼
Employee Information Sent to IT
          │
          ▼
User Account Created
          │
          ▼
User Attributes Configured
          │
          ▼
Groups and Licenses Assigned
          │
          ▼
Security Policies Applied
          │
          ▼
Employee Receives Access
Required User Information

The following information should be captured:

Full name
Employee ID
Department
Job title
Organizational level
Office location
Manager
Employment start date
Initial Access

Access should be assigned according to the employee's role, department, and location.

Example:

Department: Technology
Job Title: Network Engineer
Location: Abuja

Potential group memberships:

Technology-Users
Network-Operations
Abuja-Office
Network-Engineers

The principle of least privilege should be applied. Employees should receive only the access required to perform their job responsibilities.

2. Mover Process

A Mover is an employee whose organizational role or responsibilities change.

Examples include:

Department transfer
Promotion
Change of job title
Change of location
Change of manager
Department Transfer

Example:

Finance → Technology

The user's identity attributes should be updated and access should be reviewed.

Required Actions
Update department attribute.
Update job title where applicable.
Update manager.
Remove outdated group memberships.
Remove access no longer required.
Add new department groups.
Grant approved role-specific access.
HR
 │
 ▼
Change Confirmed
 │
 ▼
User Attributes Updated
 │
 ▼
Old Access Reviewed
 │
 ▼
Old Access Removed
 │
 ▼
New Access Granted
3. Promotion Process

When an employee is promoted, the user's organizational attributes and access should be reviewed.

Example:

Network Engineer
        │
        ▼
Senior Network Engineer
        │
        ▼
Network Manager

The following may need to be updated:

Job title
Organizational level
Manager
Group membership
Access permissions

Example:

Previous Group:
Network-Engineers

New Group:
Network-Managers

Access should be reviewed to ensure that the employee receives the permissions appropriate for the new role.

4. Leaver Process

A Leaver is an employee who is leaving the organization.

The account should normally be disabled before eventual deletion.

Offboarding Process
HR Confirms Departure
          │
          ▼
IT Receives Notification
          │
          ▼
Sign-In Blocked
          │
          ▼
Active Sessions Revoked
          │
          ▼
Access Reviewed and Removed
          │
          ▼
Corporate Devices Secured
          │
          ▼
Required Data Preserved
          │
          ▼
License Reclaimed
          │
          ▼
Retention Period
          │
          ▼
Account Deletion
Account Retention

User accounts should not necessarily be deleted immediately after an employee leaves.

The account may need to be retained for:

Business continuity
Legal requirements
Regulatory requirements
Internal investigations
Audit purposes
Data retention requirements

The preferred approach is:

Disable first. Delete later.

During the retention period, access to the account should remain restricted while authorized administrators manage any required data preservation or investigation activities.
Identity Lifecycle Principles

The following principles guide the identity lifecycle design:

1. Least Privilege

Users should receive only the access required to perform their responsibilities.

2. Separation of Duties

No single administrator should have unrestricted control over every identity and access decision.

3. Timely Access Changes

Access should be updated promptly when an employee's role changes.

4. Secure Offboarding

Departing employees should lose access promptly while required organizational data is preserved.

5. Auditability

Identity and access changes should be recorded and traceable.

6. Automation

Where possible, repetitive lifecycle activities should be automated to reduce errors and improve efficiency.

Future Enhancements

Future versions of this identity lifecycle design may include:

Automated HR-to-IT provisioning workflows.
Dynamic group membership.
Automated license assignment.
Access reviews.
Privileged Identity Management.
Identity Governance.
Microsoft Entra lifecycle workflows.
Integration with HR systems.
