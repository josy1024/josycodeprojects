REM ' version: 2010_09_25
REM '  USAGE: doubleclick or open in cmd shell (oranize_move_dvd_mp4_avi_2_folder)
REM ' Author: Ing. Josef Lahmer alias josy1024
REM ' develcode: http://code.google.com/p/josycodeprojects/
REM ' organisiert video - ordner auf basis des inhalts
REM ' BEISPILE: QUELLE UND ZIEL
REM ' move F:\VIDEO\kategorie\FILMX\VIDEO_TS => F:\VIDEO_SORTED\dvd\FILMX\VIDEO_TS
REM ' move F:\VIDEO\kategorie\FILMB\filmb.vob => F:\VIDEO_SORTED\dvd\FILMB\filmb.vob
REM ' move F:\VIDEO\kategorie\FILMY\filmy.mp4 => F:\VIDEO_SORTED\mp4\FILMY
REM ' subfunctions: mdwithcheck (make directory with check if exists)

@REM Set /P weekday=<%tmp%\weekday.txt
@REM FOR /F %%i IN ('SET /A %date:~3,2% -2') DO SET lastarchiv=%opixbase%\Archiv\%date:~6,4%_%%i
@REM for /D %%f in (F:\VIDEO\*) do echo Betrifft Datei %%f
@REM pause

@ECHO OFF
@set source=F:\VIDEO
@set source=F:\VIDEO_TEMP
@set target=X:\VIDEO_SORTED
@set wetrun=0
@set wetrun=1

@echo organize from %source% to %target% (move commands)
 
@call :mdwithcheck %target%
@call :mdwithcheck %target%\avi
@call :mdwithcheck %target%\mp4
@call :mdwithcheck %target%\dvd
@call :mdwithcheck %target%\mpg

REM ordner mit struktur X:\VIDEOS_UNSORTED\filmordner\filmdatei.avi
call :dirvideocheck "X:\VIDEOS_UNSORTED"

REM ordner mit struktur source\kategorie\filmordner
for /D %%i in (%source%\*) do call :dirvideocheck %%i
GOTO:EOF
:dirvideocheck
FOR /D %%j IN (%*\*) DO (
@echo %%j
call :videocheck %%j
@rem cscript xcacls.vbs %%j >> ordnerzugriff.txt
)
GOTO:EOF

:videocheck
SET video=""
FOR %%k IN ("%*"\*.mp4) DO (
@REM echo %%k
SET video="mp4"
)
FOR %%k IN ("%*"\*.m4v) DO (
@REM echo %%k
SET video="m4v"
)
FOR %%k IN ("%*"\*.avi) DO (
@REM echo %%k
SET video="avi"
)
FOR %%k IN ("%*"\*.mp*) DO (
@REM echo %%k
SET video="mpg"
)
FOR %%k IN ("%*"\*.mpeg) DO (
@REM echo %%k
SET video="mpg"
)
FOR %%k IN ("%*"\*.vob) DO (
@REM echo %%k
SET video="dvd"
)
FOR /D %%k IN ("%*"\VIDEO_TS*.*) DO (
@REM echo %%k
SET video="dvd"
)
if %video%=="" echo %* %target%\%video% 
if %video%=="" GOTO:EOF 
REM echo %video%: %* %wetrun%
echo move "%*" "%target%"\%video%
if "%wetrun%"=="1" move "%*" "%target%"\%video%
GOTO:EOF

:mdwithcheck
@if not exist "%*" mkdir "%*"
GOTO:EOF
