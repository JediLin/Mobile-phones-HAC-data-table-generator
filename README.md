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

請下載[最新版套件](https://github.com/JediLin/Mobile-phones-HAC-data-table-generator/releases/latest)，找 `Source code (zip)` 那個連結。

使用前記得要解壓縮。

## 安裝‧環境設定

這是一個可攜帶、免安裝的工具，只需要把幾個必要的檔案放在同一個資料夾內，就可以使用了。最必要的檔案是 `update.bat` 和 `mobile-accessibility-phones.xsl`，另外還有幾個開源工具要分別下載：

- [Windows binaries of GNU Wget](https://eternallybored.org/misc/wget/)
  - 根據系統架構 (x86, x64, ARM64) 下載最新版的 EXE 檔案即可
  - 您應該會獲得一個 `wget.exe` 執行檔
  - 把 `wget.exe` 執行檔放到跟 `update.bat`, `mobile-accessibility-phones.xsl` 同一個目錄內
- [UnZip for Windows](https://gnuwin32.sourceforge.net/packages/unzip.htm)
  - 下載[最新版本的 Binaries](https://gnuwin32.sourceforge.net/downlinks/unzip-bin-zip.php)
  - 您應該會從 SourceForge 獲得 `unzip-5.51-1-bin.zip` 壓縮檔
  - 解壓縮 `unzip-5.51-1-bin.zip`
  - 從 `bin` 資料夾裡面找到 `unzip.exe` 執行檔
  - 把 `unzip.exe` 執行檔放到跟 `update.bat`, `mobile-accessibility-phones.xsl` 同一個目錄內
- [XMLStarlet command line XML toolkit](https://sourceforge.net/projects/xmlstar/)
  - 下載[最新版本](https://sourceforge.net/projects/xmlstar/files/latest/download)
  - 您應該會從 SourceForge 獲得 `xmlstarlet-1.6.1-win32.zip` 壓縮檔
  - 解壓縮 `xmlstarlet-1.6.1-win32.zip`
  - 從 `xmlstarlet-1.6.1` 資料夾裡面找到 `xml.exe` 執行檔
  - 把 `xml.exe` 執行檔放到跟 `update.bat`, `mobile-accessibility-phones.xsl` 同一個目錄內

這個步驟只需要做一次。上述開源工具中，除了 Wget 還有在更新之外，另外兩個都已經很久沒更新了。

如果缺少必要的檔案，在執行 `update.bat` 的時候也會提示，並且自動開啟預設瀏覽器到對應工具的下載網頁。

## 使用方法

- 執行 `update.bat` 即可自動下載最新的醫療器材許可證資料集，擷取資料及轉換檔案，在相同路徑位置儲存成 `mobile-accessibility-phones.html`，然後呼叫瀏覽器開啟。
- 如果不想更新資料，只想單純瀏覽檢視資料表，可以直接用任何網頁瀏覽器開啟 `mobile-accessibility-phones.html` 即可。
- 如果要把資料表傳給別人，只需要提供 `mobile-accessibility-phones.html` 檔案就夠了。

## 技術細節說明

請參考我的部落格文章：《[查詢手機的助聽器相容性評級 (HAC Rating)](https://jedi.org/blog/archives/006259.html)》
