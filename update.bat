@echo off
:start
chcp 65001
FOR /f "tokens=3-7 delims=[.] " %%i in ('ver') do @(if %%i==XP (set os_ver_org=%%k.%%l) else (if %%j geq 10 (set os_ver_org=%%j.%%k.%%l) else (set os_ver_org=%%j.%%k)))
set os_ver=%os_ver_org%
IF %os_ver_org:~0,1% gtr 3 set os_ver=0%os_ver_org%
set colorSupport=No
IF %os_ver% GEQ 10.0.10586 set colorSupport=Yes
IF %colorSupport%==Yes color
cls

IF NOT EXIST "mobile-accessibility-phones.xsl" (
  IF %colorSupport%==Yes (
    echo [31m⚠[0m  缺少 [32mmobile-accessibility-phones.xsl[0m 檔案，無法處理資料表。請把 mobile-accessibility-phones.xsl 跟 update.bat 放在同一個資料夾內，然後再試一次。請按任意鍵結束……
  ) ELSE (
    echo 錯誤：缺少 mobile-accessibility-phones.xsl 檔案，無法處理資料表。請把 mobile-accessibility-phones.xsl 跟 update.bat 放在同一個資料夾內，然後再試一次。請按任意鍵結束……
  )
  pause > nul
  exit
)
IF NOT EXIST "wget.exe" (
  IF %colorSupport%==Yes (
    echo [36m🔰[0m 請先取得 [32mGNU Wget[0m 執行檔。現在即將使用預設瀏覽器帶您前往 GNU Wget 下載網頁，請按任意鍵繼續……
  ) ELSE (
    echo 請先取得 GNU Wget 執行檔。現在即將使用預設瀏覽器帶您前往 GNU Wget 下載網頁，請按任意鍵繼續……
  )
  pause > nul
  start "" "https://eternallybored.org/misc/wget/"
  exit
)
IF NOT EXIST "xml.exe" (
  IF %colorSupport%==Yes (
    echo [36m🔰[0m 請先取得 [32mXMLStarlet[0m 工具執行檔。現在即將使用預設瀏覽器下載 XMLStarlet，請按任意鍵繼續……
  ) ELSE (
    echo 請先取得 XMLStarlet 工具執行檔。現在即將使用預設瀏覽器下載 XMLStarlet，請按任意鍵繼續……
  )
  pause > nul
  start "" "https://sourceforge.net/projects/xmlstar/files/latest/download"
  exit
)

:checkconnection
wget.exe -q -O NUL "https://www.gari.info/download-gari-db.cfm"
IF ERRORLEVEL 1 (
  IF %colorSupport%==Yes (
    echo [31m⚠[0m  無法連上 GARI 網站。請按任意鍵結束……
  ) ELSE (
    echo 無法連上 GARI 網站。請按任意鍵結束……
  )
  pause > nul
  exit
)

IF EXIST "mobile-accessibility-phones.html" (
  IF %colorSupport%==Yes (
    echo ○○○[0/3][35m💾[0m 發現先前製作的資料表，自動備份為 [32mmobile-accessibility-phones.bak.html[0m
  ) ELSE (
    echo ○○○[0/3] 發現先前製作的資料表，自動備份為 mobile-accessibility-phones.bak.html
  )
  echo:
  del /F /Q mobile-accessibility-phones.bak.html > nul 2>&1
  copy /Y mobile-accessibility-phones.html mobile-accessibility-phones.bak.html > nul
  timeout /t 2 > nul
)

cls
:download
IF %colorSupport%==Yes (
  echo [1;32m●[0m○○[1/3][34m📦[0m 正在從 GARI 網站下載行動電話資料集……
) ELSE (
  echo ●○○[1/3] 正在從 GARI 網站下載行動電話資料集……
)
echo:
wget --output-document=mobile-accessibility-phones.xml http://gari.info/xml/mobile-accessibility-phones.xml

IF EXIST "mobile-accessibility-phones.xml" (
  GOTO cont
) ELSE (
  echo:
  IF %colorSupport%==Yes (
    echo [33m⟲[0m  檔案下載出了問題，正在重試……
  ) ELSE (
    echo 檔案下載出了問題，正在重試……
  )
  echo:
  GOTO download
)

:cont
cls
IF %colorSupport%==Yes (
  echo [1;32m●●[0m○[2/3][35m📱[0m 正在轉換產製資料表，這個步驟可能耗時約一分鐘，請耐心等候……
) ELSE (
  echo ●●○[2/3] 正在轉換產製資料表，這個步驟可能耗時約一分鐘，請耐心等候……
)
echo:
xml.exe tr mobile-accessibility-phones.xsl mobile-accessibility-phones.xml > mobile-accessibility-phones.html

IF EXIST "mobile-accessibility-phones.html" (
  del /F /Q mobile-accessibility-phones.xml
  GOTO end
) ELSE (
  echo:
  IF %colorSupport%==Yes (
    echo [33m⟲[0m  轉換產製資料表出了問題，正在重試……
  ) ELSE (
    echo 轉換產製資料表出了問題，正在重試……
  )
  echo:
  GOTO cont
)

:end
del /F /Q *.
cls
IF %colorSupport%==Yes (
  echo [1;32m●●●[0m[3/3][32m✅[0m 資料表產生完成。即將使用預設瀏覽器開啟資料表 ^([32mmobile-accessibility-phones.html[0m^)，請按任意鍵繼續……
) ELSE (
  echo ●●●[3/3] 資料表產生完成。即將使用預設瀏覽器開啟資料表 ^(mobile-accessibility-phones.html^)，請按任意鍵繼續……
)
pause > nul
start "" "mobile-accessibility-phones.html"
exit
