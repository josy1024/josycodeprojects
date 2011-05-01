:: REM file2folder (film to folder
:: walk through all files an move them tho folder with its title.

:: MIT CLI (command line shell)
:: for %i in (*.mkv) do mkdir %~ni && move %i %~ni

:: DETAILS:
:: %~ni dateiname one erweiterung

:: FOR CMD file (batch script
for %i in (*.mkv) do mkdir %~ni && move %i %~ni