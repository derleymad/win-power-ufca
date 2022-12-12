@ECHO OFF
TITLE CONFIGURACOES INICIAIS DOS COMPUTADORES DOS LAB 

ECHO ------------------------ COPIA DO REGISTRO FEITA E SALVA EM C:/RegBackup/Backup.reg 
SETLOCAL
SET RegBackup=%SYSTEMDRIVE%\RegBackup
IF NOT EXIST "%RegBackup%" md "%RegBackup%"
IF EXIST "%RegBackup%\HKLM.reg" DEL "%RegBackup%\HKLM.reg"
REG export HKLM "%RegBackup%\HKLM.reg"
IF EXIST "%RegBackup%\HKCU.reg" DEL "%RegBackup%\HKCU.reg"
REG export HKCU "%RegBackup%\HKCU.reg"
IF EXIST "%RegBackup%\HKCR.reg" DEL "%RegBackup%\HKCR.reg"
REG export HKCR "%RegBackup%\HKCR.reg"
IF EXIST "%RegBackup%\HKU.reg" DEL "%RegBackup%\HKU.reg"
REG export HKU "%RegBackup%\HKU.reg"
IF EXIST "%RegBackup%\HKCC.reg" DEL "%RegBackup%\HKCC.reg"
REG export HKCC "%RegBackup%\HKCC.reg"
IF EXIST "%RegBackup%\Backup.reg" DEL "%RegBackup%\Backup.reg"
COPY "%RegBackup%\HKLM.reg"+"%RegBackup%\HKCU.reg"+"%RegBackup%\HKCR.reg"+"%RegBackup%\HKU.reg"+"%RegBackup%\HKCC.reg" "%RegBackup%\Backup.reg"
DEL "%RegBackup%\HKLM.reg"
DEL "%RegBackup%\HKCU.reg"
DEL "%RegBackup%\HKCR.reg"
DEL "%RegBackup%\HKU.reg"
DEL "%RegBackup%\HKCC.reg"

echo ------------------------ INSTALANDO PROGRAMAS ------------------------ 

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
FOR %%A IN (foxitreader googlechrome firefox jre8 vlc winrar 7zip gsudo geogebra powerbi texmaker) DO CHOCO INSTALL %%A -Y

mkdir "C:\lab-config"
cd "C:\lab-config"

echo ------------------------ CRIANDO PASTA NO C:\lab-config ------------------------ 

wget https://github.com/derleymad/win-power-ufca/raw/main/image.jpeg
wget https://raw.githubusercontent.com/derleymad/win-power-ufca/main/server-config.json
wget https://raw.githubusercontent.com/derleymad/win-power-ufca/main/lab_public_key.pem
choco install veyon --params '"/config:C:\lab-config\server-config.json"'


reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d C:\lab-config\image.bmp /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoChangingWallPaper /t REG_DWORD /d 1 

echo ------------------------ CRIANDO USUARIO UFCA ------------------------
net user UFCA /ADD

echo ------------------------ DEIXANDO USUARIO UFCA COMO MODO LEITURA -------------------------

sudo cacls C:\Users\UFCA\* /E /P UFCA:R
sudo cacls C:\Users\UFCA\Documents /E /P UFCA:F
sudo cacls C:\Users\UFCA\Downloads /E /P UFCA:F

ECHO ------------------------ REMOVENDO TASKS ------------------------ 

SCHTASKS /Change /TN "\Microsoft\Windows\WS\WSTask" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\WOF\WIM-Hash-Validation" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\WOF\WIM-Hash-Management" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\WindowsUpdate\sih" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\WDI\ResolutionHost" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Sysmain\ResPriStaticDbSync" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskNetwork" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskLogon" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTask" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\SettingSync\NetworkStateChangeTask" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\SettingSync\BackgroundUploadTask" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\PI\Sqm-Tasks" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Maps\MapsUpdateTask" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Maps\MapsToastTask" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Maintenance\WinSAT" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\FileHistory\File History (maintenance mode)" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\File Classification Infrastructure\Property Definition Sync" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\File Classification Infrastructure\Property Definition Sync" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Feedback\Siuf\DmClient" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\CertificateServicesClient\UserTask-Roam" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Autochk\Proxy" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\AppxDeploymentClient\Pre-staged app cleanup" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\AppID\SmartScreenSpecific" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack" /DISABLE

ECHO ------------------------ DESATIVANDO BUSCA PELO BING E WEB SEARCH ------------------------ 

REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchSafeSearch" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f

ECHO ------------------------ DESATIVANDO SERVICOES ESPECIFICOS PARA OS PCS DA UFCA ------------------------ 

SC config "CscService" start= disabled
SC config "MapsBroker" start= disabled
SC config "CertPropSvc" start= disabled
SC config "wscsvc" start= demand
SC config "SystemEventsBroker" start= demand
SC config "tiledatamodelsvc" start= demand
SC config "WerSvc" start= demand

ECHO ------------------------  DELETANDO SERVICOS ------------------------ 

PowerShell -Command "Get-Service DiagTrack | Set-Service -StartupType Disabled"
PowerShell -Command "Get-Service dmwappushservice | Set-Service -StartupType Disabled"
PowerShell -Command "Get-Service diagnosticshub.standardcollector.service | Set-Service -StartupType Disabled"
PowerShell -Command "Get-Service DPS | Set-Service -StartupType Disabled"
PowerShell -Command "Get-Service RemoteRegistry | Set-Service -StartupType Disabled"
PowerShell -Command "Get-Service TrkWks | Set-Service -StartupType Disabled"
PowerShell -Command "Get-Service WMPNetworkSvc | Set-Service -StartupType Disabled"
PowerShell -Command "Get-Service WSearch | Set-Service -StartupType Disabled"
PowerShell -Command "Get-Service SysMain | Set-Service -StartupType Disabled"

SC config "DiagTrack" start= disabled
SC config "dmwappushservice" start= disabled
SC config "diagnosticshub.standardcollector.service" start= disabled
SC config "DPS " start= disabled
SC config "RemoteRegistry" start= disabled
SC config "TrkWks" start= disabled
SC config "WMPNetworkSvc" start= disabled
SC config "WSearch" start= disabled
SC config "SysMain" start= disabled

NET STOP DiagTrack
NET STOP diagnosticshub.standardcollector.service
NET STOP dmwappushservice
NET STOP DPS
NET STOP RemoteRegistry
NET STOP TrkWks
NET STOP WMPNetworkSvc
NET STOP WSearch
NET STOP SysMain

SC delete DiagTrack
SC delete "diagnosticshub.standardcollector.service"
SC delete "dmwappushservice"
SC delete "DPS"
SC delete "RemoteRegistry"
SC delete "TrkWks"
SC delete "WMPNetworkSvc"
SC delete "WSearch"
SC delete "SysMain"

ECHO ------------------------ DESATIVANDO E DELETANDO PESQUISA E OS INDEXS ------------------------

DEL "C:\ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb" /s
DEL "C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl" /s
ATTRIB -r "C:\ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb"
ECHO "" > C:\ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb
ATTRIB +r "C:\ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb"
ATTRIB -r "C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl"
ECHO "" > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl
ATTRIB +r "C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl"

ECHO ------------------------  REMOVENDO IMAGEM DO LOGIN ------------------------ 

REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableLogonBackgroundImage" /t REG_DWORD /d 1 /f

ECHO ------------------------  MOSTRAR COMPUTADOR NA AREA DE TRABALHO ------------------------ 

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f

ECHO ------------------------ ESCONDER SEARCH BAR DA BARRA DE MENU ------------------------ 

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f

ECHO ------------------------ MOSTRAR EXTENCAO NOS ARQUIVOS ------------------------ 

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f

ECHO ------------------------  MOSTRAR EXTENSOES OCULTAS ------------------------ 

REG ADD "HKCR\lnkfile" /v "NeverShowExt" /f
REG ADD "HKCR\IE.AssocFile.URL" /v "NeverShowExt" /f
REG ADD "HKCR\IE.AssocFile.WEBSITE" /v "NeverShowExt" /f
REG ADD "HKCR\InternetShortcut" /v "NeverShowExt" /f
REG ADD "HKCR\Microsoft.Website" /v "NeverShowExt" /f
REG ADD "HKCR\piffile" /v "NeverShowExt" /f
REG ADD "HKCR\SHCmdFile" /v "NeverShowExt" /f
REG ADD "HKCR\LibraryFolder" /v "NeverShowExt" /f

ECHO ------------------------  DESATIVAR SHIFT 5 VEZES ------------------------ 

REG ADD "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f

ECHO ------------------------  DESATIVAR SHIFT 8 VEZES ------------------------ 

REG ADD "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "122" /f

ECHO ------------------------ MUDAR AS HORAS ------------------------ 

REG ADD "HKCU\Control Panel\International" /v "iMeasure" /t REG_SZ /d "0" /f
REG ADD "HKCU\Control Panel\International" /v "iNegCurr" /t REG_SZ /d "1" /f
REG ADD "HKCU\Control Panel\International" /v "iTime" /t REG_SZ /d "1" /f
REG ADD "HKCU\Control Panel\International" /v "sShortDate" /t REG_SZ /d "dd.MM.yyyy" /f
REG ADD "HKCU\Control Panel\International" /v "sShortTime" /t REG_SZ /d "HH:mm" /f
REG ADD "HKCU\Control Panel\International" /v "sTimeFormat" /t REG_SZ /d "H:mm:ss" /f

ECHO ------------------------ PESQUISA COM O GOOGLE ------------------------ 

REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\SearchScopes" /v "DefaultScope" /t REG_SZ /d "{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "DisplayName" /t REG_SZ /d "Google" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "FaviconURL" /t REG_SZ /d "http://www.google.com/favicon.ico" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "FaviconURLFallback" /t REG_SZ /d "http://www.google.com/favicon.ico" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "OSDFileURL" /t REG_SZ /d "http://www.iegallery.com/en-us/AddOns/DownloadAddOn?resourceId=813" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "ShowSearchSuggestions" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "SuggestionsURL" /t REG_SZ /d "http://clients5.google.com/complete/search?q={searchTerms}&client=ie8&mw={ie:maxWidth}&sh={ie:sectionHeight}&rh={ie:rowHeight}&inputencoding={inputEncoding}&outputencoding={outputEncoding}" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "SuggestionsURLFallback" /t REG_SZ /d "http://clients5.google.com/complete/search?hl={language}&q={searchTerms}&client=ie8&inputencoding={inputEncoding}&outputencoding={outputEncoding}" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "TopResultURLFallback" /t REG_SZ /d "" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "URL" /t REG_SZ /d "http://www.google.com/search?q={searchTerms}&sourceid=ie7&rls=com.microsoft:{language}:{referrer:source}&ie={inputEncoding?}&oe={outputEncoding?}" /f

ECHO ------------------------ WINDOWS UPDATE DIRETO DO MICROSFT ------------------------ 

REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d 0 /f

ECHO ------------------------ WINDOWS UPDATE ------------------------ 

NET STOP wuauserv
SCHTASKS /Change /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /DISABLE
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AutoInstallMinorUpdates" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d %AutoUpdateN% /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v "AUOptions" /t REG_DWORD /d %AutoUpdateN% /f
NET START wuauserv

ECHO ------------------------ DESATIVAR RENECIAR DEPOIS DO WINDOWS UPDATE FOR INSTALADO ------------------------ 

SCHTASKS /Change /TN "Microsoft\Windows\UpdateOrchestrator\Reboot" /Disable
ren "%WinDir%\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot" "Reboot.bak"
md "%WinDir%\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot"
SCHTASKS /Change /TN "Microsoft\Windows\UpdateOrchestrator\Reboot" /Disable

ECHO ------------------------ DESATIVANDO COMPARTILHAR WIFI NETWORK LOGIN ------------------------ 

REG ADD "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d 0 /f

ECHO ------------------------ PREVENIR CRIAR LINKS NAS PASTAS RECENTES ------------------------ 

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /t REG_DWORD /d 1 /f

ECHO ------------------------ REMOVENDO VERSAO ANTERIOR DO TAB ------------------------ 

REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v NoPreviousVersionsPage /t REG_DWORD /d 1 /f

ECHO ------------------------ DELAY DOS POPS BAR COM 10s ------------------------ 

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ExtendedUIHoverTime" /t REG_DWORD /d "10000" /f

ECHO ------------------------ DESATIVANDO COMPLETAMENTE O CENTRO DE NOTIVACAO NO WINDOWS 10.REG------------------------ 

REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f
