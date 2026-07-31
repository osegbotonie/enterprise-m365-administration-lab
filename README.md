# Enterprise Microsoft 365 Administration Lab

A practical Microsoft 365 and Entra ID administration lab built around a simulated telecom organization, Tonie-Osegbo Technologies Limited (about 250 employees across Abuja, Lagos, Enugu, and Port Harcourt).

The aim is to design and build identity, access, security, device management, and collaboration controls the way a real, growing organization would need them, and to back each decision with evidence from a live M365 E5 tenant rather than just writing about how it should theoretically work.

**Last updated:** July 2026 - identity lifecycle (Joiner/Mover/Leaver), Privileged Access, and all five Conditional Access policies are built and evidenced. Intune device management design is underway. Exchange/Teams/SharePoint governance and further automation are next.

---

## High-Level Architecture

Logical view of how users, office locations, identity, device management, security, and collaboration services fit together across the organization.

![High-Level Microsoft 365 Enterprise Architecture](diagrams/High-Level%20Microsoft%20365%20Enterprise%20Architecture.drawio.png)

---

## Documentation

### Foundations

| # | Document | Description |
|---|---|---|
| 01 | [Project Overview](docs/01-project-overview.md) | What this lab is, the organization it simulates, objectives and scope |
| 02 | [Business Requirements](docs/02-business-requirements.md) | The business problem behind the technical decisions |

### Identity & Access

| # | Document | Description |
|---|---|---|
| 03 | [Identity Lifecycle Management](docs/03-identity-lifecycle-management.md) | Joiner / Mover / Leaver design and lab validation |
| 04 | [Group and Access Management](docs/04-group-and-access-management.md) | Group structures and access design |
| 05 | [Attribute-to-Group Mapping](docs/05-attribute-to-group-mapping.md) | How user attributes drive group membership |
| 06 | [Access Governance Decisions](docs/06-access-governance-decisions.md) | Governance rules behind access assignment |
| 07 | [Privileged Access Management](docs/07-privileged-access-management.md) | Protecting and managing administrative access |
| 08 | [Administrative Role Matrix](docs/08-administrative-role-matrix.md) | Role assignments across the admin tier |

### Conditional Access

| # | Document | Description |
|---|---|---|
| 09 | [Conditional Access Architecture](docs/09-conditional-access-architecture.md) | Decision model and design principles |
| 10 | [CA-001: Require MFA](docs/10-ca-001-require-mfa.md) | |
| 11 | [CA-002: Protect Administrative Access](docs/11-ca-002-protect-administrative-access.md) | |
| 12 | [CA-003: Block Legacy Authentication](docs/12-ca-003-block-legacy-authentication.md) | |
| 13 | [CA-004: Require Compliant Devices](docs/13-ca-004-require-compliant-devices.md) | |
| 14 | [CA-005: Risk-Based Access](docs/14-ca-005-risk-based-access.md) | |
| 15 | [Conditional Access Policy Matrix](docs/15-conditional-access-policy-matrix.md) | Combined view of all CA policies |

### Device Management

| # | Document | Description |
|---|---|---|
| 16 | [Intune Device Management Architecture](docs/16-intune-device-management-architecture.md) | Enrollment strategy, compliance vs. configuration, design principles |
| 17 | [Device Compliance Policies](docs/17-device-compliance-policies.md) | Compliance requirements matrix and how it feeds into CA-004 |

---

## Repository Structure

```text
docs/           Design documentation, in build order
data/           Sample organizational data (employees, group inventory)
diagrams/       Architecture diagrams
evidence/       Screenshots and exports from the live tenant
powershell/     PowerShell / Graph SDK automation scripts
reports/        Generated reports (access reviews, audits, exports)
screenshots/    Supporting screenshots not tied to a specific evidence set
```

The docs describe how the environment is meant to work. The evidence folder is where you can see that it was actually built and tested.

---

## Sample Data

`data/sample-employees.csv` and `data/group-inventory.csv` are fictional employee and group records used to design and test the identity and access model. No real organizational, personal, or tenant data is included.

---

## About This Project

This lab is part of a career move into cloud infrastructure and identity/security engineering. It's meant to show more than just configuring services - understanding the business problem, designing for it, implementing it, testing it, and documenting it properly.

I share progress on [LinkedIn](https://www.linkedin.com/in/anthony-osegbo/) as the lab moves forward.

## Disclaimer

This is a simulated lab environment for educational and professional portfolio purposes. Tonie-Osegbo Technologies Limited is fictional. No confidential organizational data, credentials, or production information is included in this repository.

## License

MIT License - see [LICENSE](LICENSE).
