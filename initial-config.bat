@echo off
Title UFCA-Programas Iniciais
cls

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
FOR %%A IN (adobereader googlechrome firefox jre8 vlc winrar 7zip teamviewer9 google-drive-file-stream qbittorrent) DO CHOCO INSTALL %%A -Y

echo DESATIVANDO SERVICOS

sc stop SysMain & sc config SysMain start=disabled
sc stop WSearch & sc config WSearch start= disabled

echo CRIANDO USUARIO UFCA/UFCA
net user UFCA /ADD

echo DESATIVANDO NOTIFICACOES
REG ADD HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer2 /v DisableNotificationCenter /t REG_DWORD /d 1 /f

ECHO FEITO POR @WANDERLEY M. B. FILHO
ECHO FEITO POR @WANDERLEY M. B. FILHO
ECHO FEITO POR @WANDERLEY M. B. FILHO
ECHO FEITO POR @WANDERLEY M. B. FILHO
PAUSE

