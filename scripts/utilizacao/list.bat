@echo off
setlocal enabledelayedexpansion
set /p program_list= "list.txt"

for /f "usebackq tokens=*" %%P in ("%%g.txt") do (
	echo %%P
	winget list "%%P"
	echo.
	echo.
)

"C:\Users\SUPORTE\AppData\Local\Programs\WinSCP\WinSCP.com" /command "open sftp://dati:dati@2022@200.129.12.21/" "put C:\lab-config\installedPrograms.json " "exit" /nointeractiveinput
pause