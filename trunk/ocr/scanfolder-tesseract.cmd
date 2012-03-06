:: AUTHOR: josef lahmer
:: http://code.google.com/p/tesseract-ocr/
:: tesseract-ocr-3.01-win32-portable.zip + langguage files deu + deu-frak
:: source: http://de.wikisource.org/wiki/Hilfe:Tesseract-Texterkennung


set tess=C:\daten_lokal\_OPERATIV\Tesseract-ocr\tesseract.exe

rem call:ocr E:\folder tif
rem - drop folger to script (1. parameter = ordner)

call:ocr %~1 tif
call:ocr %~1 jpg

goto:eof

:ocr   
echo.
echo. it could do %~1 of things %~2.
for %%i in (%~1\*.%~2) do %tess% %%i %%i.deu -l deu
for %%i in (%~1\*.%~2) do %tess% %%i %%i.deu-frak -l deu-frak
goto:eof