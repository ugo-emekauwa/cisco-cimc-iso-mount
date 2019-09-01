# How-To: Automating an ISO Mount and Reboot on Cisco CIMC

The processes for server OS refreshes, firmware updates, etc. can be sped up by automating the mount of a needed ISO. The PowerShell script named **automate_cisco_iso_mount.ps1** listed in this repository demonstrates how to automate and log the mounting of an ISO on a Cisco UCS C-Series rack server using the CIMC (Cisco Integrated Management Controller) and then restarting that server to boot to the mounted ISO.

## Requirements:
  1. Microsoft Windows PowerShell 3.0 or above.
  2. Cisco UCS PowerTool Suite, Release 2.x or above, currently available at [https://software.cisco.com/download/home/286305108/type/284574017](https://software.cisco.com/download/home/286305108/type/284574017).

## Author:
Ugo Emekauwa

## Contact Information:
uemekauw@cisco.com or uemekauwa@gmail.com
