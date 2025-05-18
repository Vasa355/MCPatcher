@echo off
setlocal

echo  __  __  ____   ____   _  _____ ____ _   _ _____ ____  
echo |  \/  |/ ___| |  _ \ / \|_   _/ ___| | | | ____|  _ \ 
echo | |\/| | |     | |_  / _ \ | || |   | |_| |  _| | |_  |
echo | |  | | |___  |  __/ ___ \| || |___|  _  | |___|  _ < 
echo |_|  |_|\____| |_| /_/   \_\_| \____|_| |_|_____|_| \_\
echo By Vasa.

set "DLL_NAME=Windows.ApplicationModel.Store.dll"
set "NEW_DLL=%~dp0%Windows.ApplicationModel.Store.dll"
set "SYSTEM_DLL=%windir%\System32\%DLL_NAME%"

echo [*] Taking ownership and granting permissions...
takeown /f "%SYSTEM_DLL%" >nul
icacls "%SYSTEM_DLL%" /grant "%USERNAME%":F >nul

echo [*] Copying modified %DLL_NAME% to System32...
copy "%NEW_DLL%" "%SYSTEM_DLL%" /Y

echo [✓] %DLL_NAME% replaced successfully.
pause
