# Enterprise Microsoft 365 Administration Lab

## Project Overview

This project is a practical Microsoft 365 administration and security lab designed around a simulated telecommunications and technology organization: **Tonie-Osegbo Technologies Limited**.

The organization has approximately **250 employees** distributed across its headquarters in **Abuja** and regional offices in **Lagos, Enugu, and Port Harcourt**.

The project is designed to simulate the type of identity, access, security, device management, collaboration, governance, and administrative challenges that a growing organization would face as its workforce and technology environment expand.

Rather than documenting Microsoft 365 services in isolation, this project focuses on how those services can be designed and connected to solve actual organizational problems.

---

## The Organization

| Attribute             | Details                           |
| --------------------- | --------------------------------- |
| Organization          | Tonie-Osegbo Technologies Limited |
| Industry              | Telecommunications and Technology |
| Approximate Employees | 250                               |
| Headquarters          | Abuja, Nigeria                    |
| Regional Offices      | Lagos, Enugu, Port Harcourt       |
| Cloud Platform        | Microsoft 365                     |
| Identity Platform     | Microsoft Entra ID                |

The organization has employees working across multiple departments and locations.

The environment includes different levels of responsibility, from ordinary employees to managers and senior administrators. As employees join, change departments, receive promotions, or leave the organization, their access to company resources must change accordingly.

This creates the need for a structured approach to identity and access management.

---

## The Business Problem

As the organization grows, managing users and access manually becomes increasingly difficult.

The organization needs to be able to:

* Create and manage employee identities.
* Assign employees to departments and appropriate groups.
* Manage access according to job responsibilities.
* Support employee transfers between departments.
* Update access when employees are promoted.
* Protect user accounts from external attacks.
* Reduce the impact of compromised credentials.
* Manage access from potentially insecure devices.
* Monitor administrative activity.
* Secure company data and collaboration services.
* Restrict access when employees leave the organization.
* Retain information where necessary for business or investigation purposes.
* Remove accounts and data in accordance with documented retention and governance requirements.

The project therefore treats Microsoft 365 as an integrated enterprise environment rather than a collection of separate applications.

---

## Project Objectives

The objectives of this project are to design and document a practical Microsoft 365 environment that demonstrates how an organization can:

### 1. Manage Identity

Design an identity lifecycle that covers:

```text
Joiner
   │
   ▼
Mover
   │
   ▼
Leaver
```

The process should ensure that access changes as an employee's relationship with the organization changes.

---

### 2. Apply Role-Based Access

Access should be based on business requirements and job responsibilities.

For example, an employee who moves from an engineering role into management may no longer require the same access to engineering resources.

The project therefore explores:

* Department-based access.
* Job-level access.
* Role-based groups.
* Location-based grouping.
* Dynamic group membership.
* Access reviews.

---

### 3. Protect the Organization

The security design applies identity and Zero Trust principles.

The project explores controls including:

* Multifactor Authentication.
* Conditional Access.
* Administrative account protection.
* Legacy authentication blocking.
* Device compliance.
* Risk-based access.
* Privileged access management.

---

### 4. Manage Devices

The project explores how Microsoft Intune can be used to:

* Enroll devices.
* Apply configuration policies.
* Define compliance requirements.
* Manage applications.
* Protect organizational data.
* Support Conditional Access decisions.

---

### 5. Support Collaboration

The environment includes the design and administration of Microsoft 365 collaboration services, including:

* Exchange Online.
* Microsoft Teams.
* SharePoint Online.
* OneDrive.

The goal is to consider not only how these services are enabled, but also how they should be governed and secured.

---

### 6. Establish Governance and Monitoring

A Microsoft 365 environment requires ongoing administration.

The project therefore considers:

* Administrative roles.
* Access governance.
* Policy ownership.
* Monitoring.
* Auditing.
* Security alerts.
* Change management.
* Exception management.

---

### 7. Develop Automation Skills

Where appropriate, repetitive administrative tasks will be explored through PowerShell automation.

The objective is not to automate everything unnecessarily, but to identify tasks where automation can improve:

* Consistency.
* Efficiency.
* Reporting.
* User administration.
* Group management.
* Administrative visibility.

---

## High-Level Architecture

The diagram below provides a high-level logical view of the organization's Microsoft 365 environment.

It shows the relationship between:

* Employees.
* Office locations.
* Identity.
* Groups.
* Device management.
* Security controls.
* Microsoft 365 collaboration services.

![High-Level Microsoft 365 Enterprise Architecture](diagrams/High-Level%20Microsoft%20365%20Enterprise%20Architecture.drawio.png)

The architecture is designed around the idea that identity is central to the environment.

A user's access should be influenced by factors such as:

```text
User Identity
     │
     ├── Department
     │
     ├── Job Level
     │
     ├── Role
     │
     ├── Location
     │
     ├── Device
     │
     └── Risk
           │
           ▼
     Access Decision
```

---

## Project Scope

The project covers the following areas:

### Identity and Access

* Microsoft Entra ID.
* User lifecycle management.
* Groups and access management.
* Role-based access.
* Dynamic group concepts.
* Privileged access.

### Security

* Conditional Access.
* Multifactor Authentication.
* Zero Trust principles.
* Administrative account protection.
* Risk-based access.
* Identity security.

### Endpoint Management

* Microsoft Intune.
* Device enrollment.
* Device configuration.
* Device compliance.
* Application management.

### Microsoft 365 Services

* Exchange Online.
* Microsoft Teams.
* SharePoint Online.
* OneDrive.

### Governance and Monitoring

* Access governance.
* Administrative roles.
* Auditing.
* Monitoring.
* Security review processes.
* Change management.

### Automation

* PowerShell administration.
* Reporting.
* Repetitive administrative tasks.

---

## Project Approach

The project follows a design-to-implementation approach:

```text
Business Requirements
        │
        ▼
Architecture Design
        │
        ▼
Identity and Access Design
        │
        ▼
Security Policy Design
        │
        ▼
Hands-On Implementation
        │
        ▼
Testing and Validation
        │
        ▼
Documentation
        │
        ▼
Review and Improvement
```

The intention is to connect each technical decision to a business or security requirement.

For example:

> If an employee changes department, the identity lifecycle process should trigger a review of the employee's access.

Similarly:

> If a user accesses company resources from an insecure device, the access decision should consider the device's security posture rather than relying only on the user's password.

---

## Expected Repository Outcomes

At the end of the project, the repository is expected to contain:

* Enterprise architecture documentation.
* Business requirements.
* Identity lifecycle design.
* Group and access management design.
* Security policy designs.
* Conditional Access architecture.
* Microsoft Intune design and implementation documentation.
* Microsoft 365 service configurations.
* PowerShell automation scripts.
* Architecture diagrams.
* Testing and validation records.
* Troubleshooting notes.
* Lessons learned.
* Recommendations for future improvements.

---

## Learning and Professional Development Objective

This project is also a personal professional development initiative.

The goal is to build practical experience across Microsoft 365 administration, identity, cloud security, endpoint management, automation, and governance.

The project is intended to demonstrate not only that I can configure Microsoft 365 services, but that I can also:

* Understand the business problem.
* Design a solution.
* Make and explain technical decisions.
* Consider security and operational risks.
* Test the solution.
* Troubleshoot issues.
* Document the implementation.
* Identify areas for future improvement.

---

## Disclaimer

This is a simulated laboratory environment created for educational and professional portfolio purposes.

The organization and its environment are used for design and learning purposes. No confidential organizational data, credentials, or production information is included in this repository.
