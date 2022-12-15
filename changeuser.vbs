echo Set x = CreateObject("wscript.shell") > %TEMP%\temp.vbs
echo wscript.sleep 2000 >> %TEMP%\temp.vbs
echo x.sendkeys "{TAB}">> %TEMP%\temp.vbs
echo wscript.sleep 1000>> %TEMP%\temp.vbs
echo x.sendkeys "{ENTER}">> %TEMP%\temp.vbs
echo wscript.sleep 5000>> %TEMP%\temp.vbs
echo x.sendkeys "{TAB}">> %TEMP%\temp.vbs
echo wscript.sleep 1000>> %TEMP%\temp.vbs
echo x.sendkeys "{DOWN}">> %TEMP%\temp.vbs
echo wscript.sleep 1000>> %TEMP%\temp.vbs
echo x.sendkeys "{ENTER}">> %TEMP%\temp.vbs
echo wscript.sleep 1000>> %TEMP%\temp.vbs
echo x.sendkeys "{DOWN}">> %TEMP%\temp.vbs
echo wscript.sleep 1000>> %TEMP%\temp.vbs
echo x.sendkeys "{DOWN}">> %TEMP%\temp.vbs
echo wscript.sleep 1000>> %TEMP%\temp.vbs
echo x.sendkeys "{DOWN}">> %TEMP%\temp.vbs
echo wscript.sleep 1000>> %TEMP%\temp.vbs 
echo x.sendkeys "{ENTER}">> %TEMP%\temp.vbs
start %TEMP%\temp.vbs
