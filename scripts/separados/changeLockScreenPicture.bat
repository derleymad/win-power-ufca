reg.exe ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization /v LockScreenImage /t REG_SZ /d C:\lab-config\image.jpeg /f
reg.exe ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System /v DisableLockScreenAppNotifications /t REG_DWORD /d 1 /f
