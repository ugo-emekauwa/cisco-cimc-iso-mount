# How-To: Automating an ISO Mount and Reboot on Cisco CIMC

The execution of server OS installations, refreshes, firmware updates, etc. can be expedited by automating the mount of a needed ISO. The Microsoft Windows PowerShell script named **automate_cisco_cimc_iso_mount.ps1** listed in this repository demonstrates how to automate and log the mounting of an ISO from a remote NFS share on a Cisco UCS C-Series rack server using the Cisco Integrated Management Controller (CIMC) and then restarting that server to boot to the mounted ISO.

## Requirements:
  1. Microsoft Windows PowerShell 3.0 or above.
  2. Cisco UCS PowerTool Suite, Release 2.x or above, currently available at [https://software.cisco.com/download/home/286305108/type/284574017](https://software.cisco.com/download/home/286305108/type/284574017).

## Author:
Ugo Emekauwa

## Contact Information:
uemekauw@cisco.com or uemekauwa@gmail.com
