# Intune Device Management Architecture

## Purpose and Scope

This document covers the design of device management for Tonie-Osegbo Technologies Limited using Microsoft Intune. It defines how devices are enrolled, what compliance means for a device in this environment, and how device state feeds into the Conditional Access policies already defined in the identity and access documents.

## Business Requirements

Staff are spread across Abuja, Lagos, Enugu, and Port Harcourt, and a mix of company-issued and personal devices is realistic for an organization this size. Device management needs to answer two separate questions:

- Is this device managed and configured to company standard? (MDM - full device enrollment)
- Is company data safe inside apps, even on a device that isn't fully enrolled? (MAM - app-level protection, covered in doc 18)

This document focuses on the first question.

## Enrollment Strategy

Windows devices are enrolled via Microsoft Entra join, connecting the device directly to the tenant rather than joining a traditional on-premises domain. iOS and Android devices would enroll through the Company Portal app - not tested in this lab, but the same compliance policy model applies across platforms.

## Compliance Policies vs. Configuration Profiles

These are two different things and it's worth being precise about the difference:

- **Compliance policies** define the *bar* a device has to meet - encrypted, up to date, not jailbroken. A device is evaluated as compliant or non-compliant against this bar.
- **Configuration profiles** actively *set* things on the device - Wi-Fi settings, certificate deployment, restriction policies. They push configuration rather than just checking a state.

This lab focuses on compliance policies, since that's what feeds directly into CA-004 (Require Compliant Devices).

## Design Principle

The same principle running through the identity and Conditional Access design applies here: access should be granted based on actual risk and current state, not blanket trust. A device that isn't up to date or isn't encrypted represents more risk, regardless of who's using it - compliance policy is how that risk gets reflected in access decisions.

## Note on Device Enrollment Scope

Full device enrollment and compliance policy evaluation were not carried out against a live device in this lab. The available test hardware is the same machine used for day-to-day production work, and enrolling it would apply real Intune compliance and configuration policies to that device - encryption requirements, PIN enforcement, and compliance state changes that are not easily reversible without risk to the working environment.

This reflects a judgment made in most real deployments too: policy testing against production endpoints carries risk, and the safer path is testing on an isolated device (a dedicated test machine or VM) before rolling policies out more broadly. That isolated testing step is out of scope for this lab given hardware constraints, but the compliance policy design itself - requirements, assignment scope, and rationale - is documented in doc 17.
