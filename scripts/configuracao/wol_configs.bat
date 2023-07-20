sudo powershell Set-NetAdapterAdvancedProperty -Name "Ethernet" -DisplayName "Ethernet com uso eficiente de energia" -DisplayValue "Desligado"
sudo powercfg /x -monitor-timeout-ac 0
sudo powercfg /x -standby-timeout-ac 0
sudo reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /f /v HiberbootEnabled /t REG_DWORD /d 0
pause