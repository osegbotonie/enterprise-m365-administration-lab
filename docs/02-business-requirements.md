# Business Requirements

## 1. Organization Overview

Tonie-Osegbo Technologies Limited is a telecommunications and technology organization with approximately 250 employees.

The organization operates from its headquarters in Abuja, Nigeria, with regional offices in:

* Lagos
* Enugu
* Port Harcourt

The organization has multiple departments, employee levels, job roles, and locations that require secure and structured access to corporate resources.

---

## 2. Business Problem

As the organization grows, manually managing users, departments, groups, access rights, devices, and security policies becomes increasingly difficult.

The organization needs a centralized Microsoft 365 environment that can support:

* User identity management
* Department and organizational structure
* Role-based access control
* Employee onboarding and offboarding
* Device management
* Security monitoring
* Collaboration
* Data protection
* Compliance and auditing

The environment must also be scalable as the organization grows.

---

## 3. Identity and User Management Requirements

The organization needs a centralized system for managing employee identities.

The system should allow administrators to:

* Create and manage user accounts.
* Assign users to departments.
* Assign job titles and organizational levels.
* Assign office locations.
* Assign managers.
* Manage group memberships.
* Manage Microsoft 365 licenses.
* Manage user access to organizational resources.
* Disable accounts when employees leave the organization.
* Preserve required data after employee departure.

Employee identity information should be maintained consistently and should support the Joiner, Mover, and Leaver lifecycle.

---

## 4. Organizational Structure Requirements

The organization requires a structure that can represent:

* Departments
* Job titles
* Organizational levels
* Office locations
* Managers
* Business units
* Employee groups

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

This structure should support efficient access management and future automation.

---

## 5. Access Management Requirements

Access to organizational resources should be based on the employee's business role.

The organization requires:

* Role-based access management.
* Department-based access management.
* Location-based access management.
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

---

## 6. Security Requirements

The organization must protect its users, devices, identities, and data from external and internal security threats.

The Microsoft 365 environment should support:

* Multi-factor authentication.
* Conditional Access.
* Identity protection.
* Secure authentication.
* Protection against phishing.
* Protection against malicious email.
* Protection against unauthorized access.
* Security monitoring.
* Audit logging.
* Security alerts.

The organization should be able to investigate suspicious activities and respond to security incidents.

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
* Remotely wipe corporate data where required.

Device management should support a secure working environment for employees working from different office locations.

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

Collaboration tools should be managed centrally and should follow organizational security policies.

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
* Support regulatory and legal requirements.

---

## 10. Monitoring and Audit Requirements

The organization requires visibility into activities within the Microsoft 365 environment.

Administrators should be able to investigate:

* User sign-ins.
* Administrative activities.
* Changes to user accounts.
* Changes to group memberships.
* Security alerts.
* Suspicious activities.
* Data access and sharing activities.

Audit logs should support security investigations, compliance requirements, and internal reviews.

---

## 11. Employee Lifecycle Requirements

The Microsoft 365 environment should support the complete employee lifecycle.

### Joiner

When a new employee joins the organization:

* A user identity should be created.
* Employee attributes should be configured.
* The employee should be assigned to the appropriate department.
* Appropriate groups should be assigned.
* Required licenses should be assigned.
* Security policies should be applied.
* Approved access should be provided.

### Mover

When an employee changes role or department:

* Employee information should be updated.
* Previous access should be reviewed.
* Unnecessary access should be removed.
* New access should be granted based on the new role.
* Group memberships should be updated.

### Leaver

When an employee leaves the organization:

* Sign-in should be blocked.
* Active sessions should be revoked.
* Access should be removed.
* Corporate devices should be secured.
* Required data should be preserved.
* Licenses should be reclaimed.
* Account deletion should be considered according to applicable policies.

---

## 12. Scalability Requirements

The solution should support organizational growth.

The design should remain manageable if the organization grows from:

**250 employees → 500 employees → 1,000+ employees**

The environment should minimize unnecessary manual administration through:

* Group-based access.
* Dynamic groups.
* Automated provisioning.
* Automated license assignment.
* Identity lifecycle workflows.
* Standardized naming conventions.
* Centralized policies.

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

---

## 14. Expected Business Outcomes

The Microsoft 365 environment should help the organization achieve the following outcomes:

### Improved Security

Reduced risk of unauthorized access, compromised accounts, and data exposure.

### Improved Efficiency

Reduced manual effort in managing users, groups, licenses, devices, and access.

### Better Governance

Clear ownership and accountability for identity and access management.

### Faster Employee Onboarding

New employees can receive the required access more efficiently.

### Better Offboarding

Employee access can be removed promptly when an employee leaves the organization.

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

The Microsoft 365 environment must provide a foundation for:

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

