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
