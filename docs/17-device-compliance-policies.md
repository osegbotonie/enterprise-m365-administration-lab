# Device Compliance Policies

## Purpose

Defines what "compliant" actually means for a device in this environment, and how that status is meant to connect to Conditional Access.

## Compliance Requirements Matrix

| Requirement | Windows | Rationale |
| --- | --- | --- |
| Minimum OS version | Windows 10 20H2 or later | Ensures the device has current security patches available |
| Encryption required | BitLocker enabled | Protects data at rest if the device is lost or stolen |
| Password/PIN required | Yes, minimum 6 characters | Basic access control at the device level |
| Jailbreak/root detection | N/A for Windows (applies to iOS/Android) | Prevents policy bypass on mobile platforms |

Mobile platform requirements (iOS/Android) follow the same shape but aren't detailed here, since no mobile device was tested in this lab.

## Relationship to CA-004

CA-004 (Require Compliant Devices, see doc 13) is the Conditional Access policy that actually enforces this compliance state at sign-in - a device failing this compliance policy would be blocked by CA-004 regardless of the user's identity or credentials being valid. The compliance policy defines the bar; CA-004 is what happens when a device doesn't meet it.

## Non-Compliance Actions

In a full deployment, non-compliant devices would typically get a grace period (for example, 3 days) before access is actually blocked, giving the user time to remediate - update the OS, enable encryption - before being locked out. This is a config detail worth setting deliberately rather than defaulting to immediate block, since an immediate block on first non-compliance is a common source of avoidable support tickets.

## Practical Validation

Live enrollment and compliance evaluation were not performed in this lab - see the note on device enrollment scope in doc 16. This policy design is documented but not evidenced against a real device.
