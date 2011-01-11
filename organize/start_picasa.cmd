@REM QUELLE: http://www.google.com/support/forum/p/picasa/thread?tid=473dd6ad2fcb34a4&hl=de
@REM BY: http://www.google.com/support/forum/p/picasa/user?userid=05334029495032017176&hl=de
@REM modified by: josy1024
@REM Feature Request : Make picasa work on a NAS drive so my whole family can use one database.
@REM references: http://www.google.com/support/forum/p/Picasa/thread?tid=24cf6c67b8a9da19&hl=en


@echo OFF
set PICASAPROFILEPATH=E:\STORE\Picasa2DB
set PICASAEXECPATH=C:\Programme\Google\Picasa3\
set TEMPPATH="%PICASAPROFILEPATH%\Appdata\Local"
IF NOT EXIST %TEMPPATH% mkdir %TEMPPATH%
IF NOT EXIST %TEMPPATH% GOTO NoValidPath
set TEMPPATH="%PICASAPROFILEPATH%\Lokale Einstellungen\Anwendungsdaten"
IF NOT EXIST %TEMPPATH% mkdir %TEMPPATH%
IF NOT EXIST %TEMPPATH% GOTO NoValidPath
:: Set dir where picasa should read/write its settings
set USERPROFILE=%PICASAPROFILEPATH%
:: Check if picasa is started already somewhere...
and if not, create lockfile
set LOCKFILE="%PICASAPROFILEPATH%\PicasaRunning.txt"
IF EXIST %LOCKFILE% GOTO PicasaRunningAlready
echo Picasa was started by %USERNAME% at %date% %time% on computer %COMPUTERNAME% > %LOCKFILE%


:: Start Picasa...
echo This window just needs to keep standing here as long as you are working with picasa... once you close picasa, it will close as well...
echo.
echo You are running picasa with the picasa database located in %PICASAPROFILEPATH%
set TEMPPATH="%PICASAEXECPATH%"
IF NOT EXIST %TEMPPATH% GOTO NoValidPath
cd %TEMPPATH%
C:\Programme\Google\Picasa3\picasa3.exe
del %LOCKFILE%
GOTO EOF
:: If the path doesn't exist/couldn't be created... error
:NoValidPath
echo ERROR: the following path isn't available and/or couldn't be created: %TEMPPATH%
echo.
pause 
GOTO EOF
:: If picasa is running somewhere already...
:PicasaRunningAlready
echo ERROR: Picasa won't start because someone is already running picasa:
type %LOCKFILE%
echo If you are really sure this isn't the case, delete this file: %LOCKFILE% and run this bat file again to start picasa...
echo.
pause 
GOTO EOF