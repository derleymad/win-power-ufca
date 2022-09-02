choco install openssh -y -f
ssh -Vssh -V
cd "C:\Program Files\OpenSSH-Win64"
powershell.exe -ExecutionPolicy Bypass -File install-sshd.ps1
powershell New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
net start sshd
powershell Set-Service sshd -StartupType Automatic
powershell get-service | findstr ssh

