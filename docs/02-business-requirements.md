# Business Requirements

## 1. Organization Overview

Tonie-Osegbo Technologies Limited is a simulated telecommunications and technology organization with approximately 250 employees.

The organization operates from its headquarters in Abuja, Nigeria, with regional offices in:

* Lagos
* Enugu
* Port Harcourt

The organization has multiple departments, job roles, organizational levels, managers, and locations. As the organization grows, employees may join, change departments, receive promotions, change locations, or leave the organization.

The Microsoft 365 environment must therefore provide a structured way to manage employee identities and access throughout the employee lifecycle.

---

## 2. Business Problem

The main business problem is the need to manage the organization's people, identities, access, devices, and security controls in a consistent and scalable way.

As the organization grows, manually managing users and access becomes increasingly difficult.

The organization needs to be able to answer questions such as:

* Who is this employee?
* Which department does the employee belong to?
* What is the employee's current position and organizational level?
* Which groups should the employee belong to?
* What resources should the employee be able to access?
* What should happen when the employee changes department?
* What should happen when the employee is promoted?
* What should happen when the employee leaves the organization?

The Microsoft 365 environment should provide the structure needed to answer these questions and ensure that access reflects the employee's current business responsibilities.

---

## 3. Identity and User Management Requirements

The organization requires a centralized system for managing employee identities.

The system should allow authorized administrators to:

* Create and manage user accounts.
* Assign departments.
* Assign job titles and organizational levels.
* Assign office locations.
* Assign managers.
* Manage group memberships.
* Manage Microsoft 365 licenses.
* Manage access to organizational resources.
* Restrict accounts when employees leave.
* Preserve required data and account information after employee departure.

Employee identity information should be maintained consistently and should support the Joiner, Mover, and Leaver lifecycle.

The user's identity should remain consistent throughout their employment, while their access and group memberships may change as their business responsibilities change.

---

## 4. Organizational Structure Requirements

The organization requires a structure that can represent:

* Departments.
* Job titles.
* Organizational levels.
* Office locations.
* Managers.
* Business units.
* Employee groups.

### Example Departments

* Executive Management
* Technology
* Network Operations
* Finance
* Human Resources
* Sales and Marketing
* Customer Service
* Legal and Regulatory Affairs
* Administration

### Example Organizational Levels

* Executive
* Senior Management
* Management
* Senior Staff
* Staff
* Entry Level

### Example Locations

* Abuja
* Lagos
* Enugu
* Port Harcourt

This structure should support access management, reporting, governance, and future automation.

---

## 5. Access Management Requirements

Access to organizational resources should be based on an employee's current business responsibilities.

The organization requires:

* Role-based access management.
* Department-based access management.
* Location-based access management where appropriate.
* Least-privilege access.
* Separation of duties.
* Regular access reviews.

Employees should receive only the access required to perform their responsibilities.

Access should be reviewed when an employee:

* Joins the organization.
* Changes department.
* Changes job role.
* Is promoted.
* Changes location.
* Leaves the organization.

A change in an employee's role should trigger an access review rather than simply adding new access to the employee's existing permissions.

---

## 6. Security Requirements

The organization must protect its users, devices, identities, and data from external and internal security threats.

The Microsoft 365 environment should support:

* Multifactor Authentication.
* Conditional Access.
* Identity protection.
* Modern and secure authentication.
* Protection against phishing.
* Protection against malicious email.
* Protection against unauthorized access.
* Security monitoring.
* Audit logging.
* Security alerts.

The organization should be able to investigate suspicious activity and respond appropriately to security incidents.

Security controls should be designed to protect both:

* External access to organizational resources.
* Internal access and misuse of organizational resources.

---

## 7. Device Management Requirements

The organization requires centralized management of corporate devices.

IT should be able to:

* Register corporate devices.
* Manage device configurations.
* Apply security policies.
* Monitor device compliance.
* Deploy applications.
* Manage operating system updates.
* Restrict access from non-compliant devices.
* Protect or remotely wipe corporate data where required.

Device management should support employees working from the Abuja headquarters and the Lagos, Enugu, and Port Harcourt regional offices.

The organization should also be able to distinguish between managed and compliant devices and devices that do not meet the organization's security requirements.

---

## 8. Collaboration Requirements

Employees need secure tools for communication and collaboration.

The organization requires:

* Email communication.
* Internal messaging.
* Video conferencing.
* File sharing.
* Document collaboration.
* Team collaboration spaces.
* Secure external collaboration where approved.

Collaboration tools should be centrally managed and should follow organizational security, access, and data protection policies.

---

## 9. Data Protection Requirements

The organization handles business information that may require protection from unauthorized access, accidental disclosure, and inappropriate sharing.

The organization should be able to:

* Identify sensitive information.
* Control access to sensitive information.
* Monitor data sharing.
* Protect business documents.
* Apply appropriate retention policies.
* Investigate data-related incidents.
* Support applicable legal, regulatory, and business requirements.

Data protection should be considered throughout the lifecycle of information, including creation, sharing, storage, retention, and eventual deletion.

---

## 10. Monitoring and Audit Requirements

The organization requires visibility into important activities within the Microsoft 365 environment.

Administrators should be able to investigate:

* User sign-ins.
* Administrative activities.
* Changes to user accounts.
* Changes to group memberships.
* Security alerts.
* Suspicious activities.
* Data access and sharing activities.

Audit logs should support:

* Security investigations.
* Compliance requirements.
* Internal reviews.
* Troubleshooting.
* Accountability for administrative changes.

---

## 11. Employee Lifecycle Requirements

The Microsoft 365 environment should support the complete employee lifecycle.

The expected process is:

```text
HR Business Event
       │
       ▼
HR Notifies or Initiates Request
       │
       ▼
IT Reviews and Implements Change
       │
       ▼
Microsoft 365 Identity and Access Updated
```

HR is the primary source of information about employee lifecycle events.

IT is responsible for implementing the required technical changes in the Microsoft 365 environment.

---

### Joiner

When a new employee joins the organization:

1. HR confirms the employee's employment and provides the required information to IT.
2. IT creates or provisions the user's Microsoft 365 identity.
3. The employee's attributes are configured.
4. The employee is assigned to the appropriate department.
5. The employee is assigned to the relevant groups.
6. Required licenses are assigned.
7. Appropriate security policies are applied.
8. Approved access is provided.

The new employee should receive only the access required for the role.

---

### Mover

A Mover event occurs when an employee:

* Changes department.
* Changes job role.
* Is promoted.
* Changes location.
* Moves into a new area of responsibility.

For example:

```text
Engineer
   │
   ▼
Promotion
   │
   ▼
Network Manager
```

When this occurs:

1. HR confirms the change.
2. IT updates the employee's relevant attributes.
3. The employee's existing access is reviewed.
4. Access no longer required for the previous role is removed where appropriate.
5. New access required for the new role is granted.
6. Group memberships are updated.
7. The change is documented.

For example, an employee promoted from an Engineering role to a Management role may need access to management resources and may no longer require access to certain Engineer-specific groups.

The objective is to ensure that access reflects the employee's current responsibilities.

---

### Leaver

When an employee leaves the organization:

1. HR notifies IT.
2. Sign-in access is blocked.
3. Active sessions are revoked where appropriate.
4. Access to organizational resources is removed.
5. Corporate devices and organizational data are secured.
6. Required data is preserved.
7. Licenses are reviewed for reclamation.
8. The account is retained where required by business, legal, regulatory, or investigation requirements.
9. Permanent deletion is considered only after the applicable retention requirements have been reviewed.

The preferred lifecycle is:

```text
Active Employee
      │
      ▼
Employee Leaves
      │
      ▼
Access Restricted
      │
      ▼
Account and Required Data Retained
      │
      ▼
Retention Review
      │
      ▼
Permanent Deletion Where Appropriate
```

The account should not be deleted immediately without considering the organization's retention and business requirements.

---

## 12. Scalability Requirements

The solution should support organizational growth.

The design should remain manageable if the organization grows from:

**250 employees → 500 employees → 1,000+ employees**

The environment should minimize unnecessary manual administration through:

* Group-based access.
* Dynamic groups where appropriate.
* Automated provisioning where available.
* Automated license assignment where appropriate.
* Identity lifecycle workflows.
* Standardized naming conventions.
* Centralized policies.

Automation should be introduced where it improves consistency and efficiency without creating unnecessary operational risk.

---

## 13. Governance Requirements

The organization requires clear ownership and accountability for identity and access management.

The following principles should apply:

* HR is the authoritative source for employee lifecycle events.
* IT manages identity and access implementation.
* Department managers approve role-specific access where required.
* Administrative privileges should be limited.
* Access changes should be traceable.
* Security policies should be documented.
* Regular reviews should be conducted.

A typical process should therefore follow:

```text
HR
 │
 ├── New Employee
 ├── Department Transfer
 ├── Promotion
 └── Employee Departure
       │
       ▼
      IT
       │
       ├── Creates or Updates Identity
       ├── Updates Attributes
       ├── Updates Groups
       ├── Updates Access
       └── Restricts Account Where Required
```

---

## 14. Expected Business Outcomes

The Microsoft 365 environment should help the organization achieve the following outcomes.

### Improved Security

Reduced risk of unauthorized access, compromised accounts, and data exposure.

### Improved Efficiency

Reduced manual effort in managing users, groups, licenses, devices, and access.

### Better Governance

Clear ownership and accountability for identity and access management.

### Faster Employee Onboarding

New employees can receive the access required for their roles more efficiently.

### Better Access Management During Employee Changes

Promotions and department transfers can trigger an appropriate review of existing access.

### Better Offboarding

Employee access can be restricted promptly when an employee leaves the organization, while required information can be retained appropriately.

### Improved Visibility

Administrators can monitor activities and investigate suspicious events.

### Scalability

The environment can support organizational growth without requiring a proportional increase in manual administration.

---

## 15. Summary of Business Requirements

| Requirement Area         | Business Need                                                 |
| ------------------------ | ------------------------------------------------------------- |
| Identity Management      | Centralized management of employee identities                 |
| Organizational Structure | Departments, levels, roles, managers, and locations           |
| Access Management        | Role-based and least-privilege access                         |
| Security                 | Protection against internal and external threats              |
| Device Management        | Centralized management and security of corporate devices      |
| Collaboration            | Secure communication and document collaboration               |
| Data Protection          | Protection and monitoring of sensitive information            |
| Monitoring               | Visibility into user, administrative, and security activities |
| Lifecycle Management     | Joiner, Mover, and Leaver processes                           |
| Scalability              | Support for future organizational growth                      |
| Governance               | Clear ownership, accountability, and auditability             |

---

## 16. Conclusion

Tonie-Osegbo Technologies Limited requires a secure, scalable, and centrally managed Microsoft 365 environment.

The primary business challenge is to effectively manage users, groups, departments, organizational levels, locations, devices, access, and security across the organization.

The environment must provide a foundation for:

* Secure identity management.
* Controlled access.
* Employee lifecycle management.
* Device security.
* Collaboration.
* Data protection.
* Monitoring.
* Governance.
* Future automation.

These business requirements will guide the technical architecture and implementation decisions documented throughout this project.

The core design principle is:

> **The right person should receive the right access, based on their current business responsibilities, using an appropriate device and under appropriate security controls.**

Access should change when the employee's role changes, and access should be restricted when the employee's relationship with the organization ends.
