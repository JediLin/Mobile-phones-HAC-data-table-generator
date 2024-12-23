# 行動電話助聽器相容性 (HAC) 資料表產生器
![GitHub all releases](https://img.shields.io/github/downloads/JediLin/Mobile-phones-HAC-data-table-generator/total?style=for-the-badge)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/JediLin/Mobile-phones-HAC-data-table-generator?label=LATEST%20RELEASE&style=for-the-badge)
<br/>
![GitHub commits since tagged version](https://img.shields.io/github/commits-since/JediLin/Mobile-phones-HAC-data-table-generator/latest?style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/JediLin/Mobile-phones-HAC-data-table-generator?style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues/JediLin/Mobile-phones-HAC-data-table-generator?style=for-the-badge)

[Global Accessibility Reporting Initiative (GARI)](https://www.gari.info/) 蒐集整理了許多行動電話（包括智慧型手機及非智慧型手機）的親和力功能資料，而且這些資料每日更新發佈成 XML 格式的資料庫，依[創用姓名標示—非商業性—禁止改作 3.0 版授權](http://creativecommons.org/licenses/by-nc-nd/3.0/)提供給公眾使用。

我寫了一小段批次檔，用來自動下載這個 XML 格式資料庫，並且利用 [XSL Transformations (XSLT)](https://www.w3.org/TR/xslt/) 技術，從中擷取關於 [ANSI C63.19](https://ieeexplore.ieee.org/document/8906258) 標準的助聽器相容性 (Hearing Aid Compatibility, HAC) 資訊，以便查詢檢索。

## 下載

請下載[最新版套件](https://github.com/JediLin/Mobile-phones-HAC-data-table-generator/releases/latest)，找 `HAC_full_x64.zip` 那個連結，這是對應目前大多數使用者 x64 架構作業系統的整合版本，解壓縮後[可以直接使用](#使用方法)；如果想要自己手動下載第三方工具，例如要用於不同架構的作業系統，也可以用 `HAC.zip` 連結並[手動準備相關環境](#安裝手動環境設定)。

使用前記得要解壓縮。

### 安裝‧手動環境設定

這是一個可攜帶、免安裝的工具，只需要把幾個必要的檔案放在同一個資料夾內，就可以使用了。最必要的檔案是 `update.bat` 和 `mobile-accessibility-phones.xsl`，另外還用到幾個開源工具（已經內含於 `HAC_full_x64.zip` ，不必另外下載）：

- [Windows binaries of GNU Wget](https://eternallybored.org/misc/wget/)
  - 根據系統架構 (x86, x64, ARM64) 下載最新版的 EXE 檔案即可
  - 您應該會獲得一個 `wget.exe` 執行檔
  - 把 `wget.exe` 執行檔放到跟 `update.bat`, `mobile-accessibility-phones.xsl` 同一個資料夾
- [XMLStarlet command line XML toolkit](https://sourceforge.net/projects/xmlstar/)
  - 下載[最新版本](https://sourceforge.net/projects/xmlstar/files/latest/download)
  - 您應該會從 SourceForge 獲得 `xmlstarlet-1.6.1-win32.zip` 壓縮檔
  - 解壓縮 `xmlstarlet-1.6.1-win32.zip`
  - 從 `xmlstarlet-1.6.1` 資料夾裡面找到 `xml.exe` 執行檔
  - 把 `xml.exe` 執行檔放到跟 `update.bat`, `mobile-accessibility-phones.xsl` 同一個資料夾

如果缺少必要的檔案，執行 `update.bat` 的時候會加以提示，並且自動開啟預設瀏覽器到對應工具的下載網頁，依上述說明把相關第三方工具放置到資料夾內，未來就可以持續使用。上述開源工具中，除了 Wget 還有在更新之外，XMLStarlet 已經很久沒更新了。

## 使用方法

- 執行 `update.bat` 即可自動下載最新的 GARI 行動電話親和力功能資料庫，擷取資料及轉換檔案，在相同路徑位置儲存成 `mobile-accessibility-phones.html`，然後呼叫瀏覽器開啟。
- 如果不想更新資料，只想單純瀏覽檢視資料表，可以直接用任何網頁瀏覽器開啟 `mobile-accessibility-phones.html` 即可。
- 如果要把資料表傳給別人，只需要提供 `mobile-accessibility-phones.html` 檔案就夠了。
- 只有更新資料的時候需要網路連線，瀏覽、檢視、查詢資料表不需要網路，也可以把 `mobile-accessibility-phones.html` 檔案放在手機或平板電腦上使用（當然，螢幕太小可能不會很好用）。
- 執行 `scheduler.bat` 即可自動管理工作排程，例如設定自動更新資料表、測試工作排程、刪除已設定的排程項目等。

### 手動管理工作排程

- 如果需要排程自動更新資料表，可以使用 `silent_update.bat`
- 建議排程每個月或每季更新一次就可以了，太頻繁更新可能會被當成異常存取
- `silent_update.bat` 同樣會建立檔案備份及自動更新資料表，但過程中不提供任何訊息，操作完成後也不會自動用瀏覽器開啟資料表
- 最後一次執行 `silent_update.bat` 的相關訊息會儲存在 `silent_update.log` 日誌檔（這個檔案會自動建立及覆寫），如果遭遇異常可以用來釐清執行情況

## 版本沿革
### v2024.12.23
- 新增管理工作排程的批次腳本

### v2024.12.07
- 修正瑕疵
- 資料表新增型號欄位的「快查」功能，可與廠牌欄位的「快查」功能合併使用
- 資料表呈現表格列數較多時，即使捲動內容，各欄標題也會保持在網頁最頂端，以便查詢對照
- 範例檔案更新

### v2024.12.06.2
- 修正瑕疵
- 自動檢查是否能夠連線到 GARI 網站
- 執行更新期間提供進度說明訊息
- 在 Windows 10 或更新版本的作業系統上，進度訊息內容追加提供彩色顯示跟顏文字圖示
- 新增可用於排程自動執行的 silent_update.bat 批次腳本，執行過程無訊息，相關執行歷程狀態會自動產生日誌檔
- 資料表可根據使用者在作業系統設定的配色偏好，自動切換配色
- 資料表底端提供下載最新版產生器、意見回饋等相關連結
- 資料表排版調整
- 範例檔案更新

### v2024.11.12
- 修正瑕疵
- 明確提供整個套件的壓縮檔下載
- 提供包含第三方工具的完整套件壓縮檔下載
- 資料表新增廠牌欄位「快查」功能
- 資料表排版調整
- 範例檔案更新

### v2024.11.01-1
- 修正瑕疵
- 資料表標註製表日期及原始資料來源
- 範例檔案更新

### v2024.11.01
- 修正瑕疵
- 執行更新時，會自動備份前一次產生的檔案
- 範例檔案更新

### v2024.10.31-3
- 修正瑕疵
- 修正不必用到 UnZip 第三方工具
- 範例檔案更新

### v2024.10.31-2
- 修正瑕疵
- 自動檢查有沒有漏掉 `mobile-accessibility-phones.xsl` 檔案
- 提供範例檔案

### v2024.10.31-1
- 不再依賴 Perl 或 WinZip Command Line 工具
- 自動檢查是否已經有完整的第三方工具 (Wget, UnZip, XMLStarlet)；如果沒有找到，就會用預設瀏覽器連到對應工具的下載網頁
- 輸出產製 HTML 格式的資料表
- 整合 CSS 樣式規則
- 執行更新成功後，自動用預設瀏覽器開啟資料表

### v2024.10.31
- 第一個公開版本

## 參考資料

- 《[查詢手機的助聽器相容性評級 (HAC Rating)](https://jedi.org/blog/archives/006259.html)》部落格文章
- 《[助聽器公司不說的事：T 線圈](https://jedi.org/blog/archives/006308.html)》部落格文章
- FCC: [Hearing Aid Compatible Mobile Handsets](https://www.fcc.gov/hearing-aid-compatibility-wireless-telephones)
- GARI: [Find Accessible Devices and Apps](https://www.gari.info/findphones.cfm)
