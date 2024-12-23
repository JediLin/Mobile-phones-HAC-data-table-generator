@echo off
:start
cd "%~dp0"
echo Start at %date% %time% > silent_update.log
echo Working from %~dp0 >> silent_update.log

IF NOT EXIST "mobile-accessibility-phones.xsl" (
  echo %time% No mobile-accessibility-phones.xsl available >> silent_update.log
  exit
)
IF NOT EXIST "wget.exe" (
  echo %time% No wget.exe available >> silent_update.log
  exit
)
IF NOT EXIST "xml.exe" (
  echo %time% no xml.exe available >> silent_update.log
  exit
)

:checkconnection
wget.exe -q -O NUL "https://www.gari.info/download-gari-db.cfm" >> silent_update.log 2>&1
IF ERRORLEVEL 1 (
  echo %time% No connection available >> silent_update.log
  exit
)

IF EXIST "mobile-accessibility-phones.html" (
  echo %time% Backup mobile-accessibility-phones.html >> silent_update.log
  del /F /Q mobile-accessibility-phones.bak.html >> silent_update.log 2>&1
  copy /Y mobile-accessibility-phones.html mobile-accessibility-phones.bak.html >> silent_update.log 2>&1
)

:download
echo %time% Download XML >> silent_update.log
wget --output-document=mobile-accessibility-phones.xml http://gari.info/xml/mobile-accessibility-phones.xml >> silent_update.log 2>&1

IF EXIST "mobile-accessibility-phones.xml" (
  GOTO cont
) ELSE (
  GOTO download
)

:cont
echo %time% Process XML >> silent_update.log
xml.exe tr mobile-accessibility-phones.xsl mobile-accessibility-phones.xml > mobile-accessibility-phones.html

IF EXIST "mobile-accessibility-phones.html" (
  echo %time% Clean-up >> silent_update.log
  del /F /Q mobile-accessibility-phones.xml >> silent_update.log 2>&1
  GOTO end
) ELSE (
  GOTO cont
)

:end
del /F /Q *. >> silent_update.log 2>&1
echo %time% Finished. >> silent_update.log
exit
