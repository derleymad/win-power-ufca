powershell "Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0"
REM Start the sshd service
powershell "Start-Service sshd"
REM OPTIONAL but recommended:
powershell "Set-Service -Name sshd -StartupType 'Automatic'"
REM https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=powershell