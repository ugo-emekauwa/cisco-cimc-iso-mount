# Automated ISO vMedia Mount Mapping for Cisco CIMC Script, written by Ugo Emekauwa (uemekauw@cisco.com or uemekauwa@gmail.com)

# Start script
Write-Output "$(Get-Date) - Starting Automated ISO vMedia Mount for CIMC Script." | Out-File -Append "c:\Logs\sample.log"

# Load Cisco IMC PowerShell modules
Write-Output "$(Get-Date) - Loading Cisco IMC PowerShell Modules." | Out-File -Append "c:\Logs\sample.log"
Get-Module -Name Cisco.IMC -ListAvailable | Import-Module

# Set CIMC credentials
$user = "admin"
$password = "password" | ConvertTo-SecureString -AsPlainText -Force
$cimccred = New-Object System.Management.Automation.PSCredential($user,$password)

# Start server 1 operations
Write-Output "$(Get-Date) - Beginning server 1 operations." | Out-File -Append "c:\Logs\sample.log"

# Log into the CIMC for server 1
Write-Output "$(Get-Date) - Logging into server1-cimc." | Out-File -Append "c:\Logs\sample.log"
Connect-Imc 192.168.1.10 -Credential $cimccred

# Update boot order on server 1 with CIMC-Mapped vDVD entry
Write-Output "$(Get-Date) - Updating boot order on server 1 with CIMC-Mapped vDVD entry." | Out-File -Append "c:\Logs\sample.log"
Get-ImcLsbootDevPrecision | Add-ImcLsbootVMedia -Name cimc-dvd -Order 1 -State enabled -Subtype cimc-mapped-dvd

# Remove any potential previously mounted ISOs on the server 1 CIMC
Write-Output "$(Get-Date) - Unmount any potential ISOs on server1-cimc." | Out-File -Append "c:\Logs\sample.log"
Get-ImcCommVMediaMap | Remove-ImcCommVMediaMap -Force

# Mount new ISO from a remote NFS share and reboot server 1
Write-Output "$(Get-Date) - Mounting new ISO and rebooting server 1." | Out-File -Append "c:\Logs\sample.log"
Get-ImcCommVMedia | Add-ImcCommVMediaMap -RemoteShare "192.168.1.5:/isos" -RemoteFile "sample.iso" -Map nfs -VolumeName "isos"
Get-ImcRackUnit | Reset-ImcServer -Force

# Disconnect from the CIMC for server 1
Write-Output "$(Get-Date) - Disconnecting from server1-cimc." | Out-File -Append "c:\Logs\sample.log"
Disconnect-Imc

# Exit script
Write-Output "$(Get-Date) - Automated ISO vMedia Mount Mapping for Cisco CIMC Script complete, exiting." | Out-File -Append "c:\Logs\sample.log"
Exit
