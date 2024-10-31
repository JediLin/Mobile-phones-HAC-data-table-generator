@echo off
:start
chcp 65001
cls
IF NOT EXIST "mobile-accessibility-phones.xsl" (
  echo 缺少 mobile-accessibility-phones.xsl 檔案，無法處理資料表。請把 mobile-accessibility-phones.xsl 跟 update.bat 放在同一個資料夾內，然後再試一次。請按任意鍵結束……
  pause > nul
  exit
)
IF NOT EXIST "wget.exe" (
  echo 請先取得 GNU Wget 執行檔。現在即將使用預設瀏覽器帶您前往 GNU Wget 下載網頁，請按任意鍵繼續……
  pause > nul
  start "" "https://eternallybored.org/misc/wget/"
  exit
)
IF NOT EXIST "xml.exe" (
  echo 請先取得 XMLStarlet 工具執行檔。現在即將使用預設瀏覽器下載 XMLStarlet，請按任意鍵繼續……
  pause > nul
  start "" "https://sourceforge.net/projects/xmlstar/files/latest/download"
  exit
)
IF EXIST "mobile-accessibility-phones.html" (
  del /F /Q mobile-accessibility-phones.bak.html
  copy /Y mobile-accessibility-phones.xml mobile-accessibility-phones.bak.html
)

:download
wget --output-document=mobile-accessibility-phones.xml http://gari.info/xml/mobile-accessibility-phones.xml

IF EXIST "mobile-accessibility-phones.xml" (
  GOTO cont
) ELSE (
  GOTO download
)

:cont
xml.exe tr mobile-accessibility-phones.xsl mobile-accessibility-phones.xml > mobile-accessibility-phones.html

IF EXIST "mobile-accessibility-phones.html" (
  del /F /Q mobile-accessibility-phones.xml
  GOTO end
) ELSE (
  GOTO cont
)

:end
del /F /Q *.
cls
echo 資料表產生完成。現在即將使用預設瀏覽器開啟資料表 (mobile-accessibility-phones.html)，請按任意鍵繼續……
pause > nul
start "" "mobile-accessibility-phones.html"
exit
