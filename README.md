# 行動電話助聽器相容性 (HAC) 資料表產生器
![GitHub all releases](https://img.shields.io/github/downloads/JediLin/Mobile-phones-HAC-data-table-generator/total?style=for-the-badge)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/JediLin/Mobile-phones-HAC-data-table-generator?label=LATEST%20RELEASE&style=for-the-badge)
<br/>
![GitHub commits since tagged version](https://img.shields.io/github/commits-since/JediLin/Mobile-phones-HAC-data-table-generator/latest?style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/JediLin/Mobile-phones-HAC-data-table-generator?style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues/JediLin/Mobile-phones-HAC-data-table-generator?style=for-the-badge)

[Global Accessibility Reporting Initiative (GARI)](https://www.gari.info/) 蒐集整理了許多行動電話（包括智慧型手機及非智慧型手機）的親和力功能資料，而且這些資料每日更新發佈成 XML 格式的資料庫，依[創用姓名標示—非商業性—禁止改作 3.0 版授權](http://creativecommons.org/licenses/by-nc-nd/3.0/)提供給公眾使用。

我寫了一小段批次檔，用來自動下載這個 XML 格式資料庫，並且利用 [XSL Transformations (XSLT)](https://www.w3.org/TR/xslt/) 技術，從中擷取關於 [ANSI C63.19](https://ieeexplore.ieee.org/document/8906258) 標準的助聽器相容性 (Hearing Aid Compatibility, HAC) 資訊，以便查詢檢索。

## 使用方法

- 首先要把 Perl 裝起來。
- 執行 `update.bat` 即可自動下載（或更新）資料庫，做必要的編輯修改，然後在相同路徑位置儲存成 `mobile-accessibility-phones.xml`。
- 把 `mobile-accessibility-phones.xml`, `mobile-accessibility-phones.xsl`, `mobile-accessibility-phones.css` 三個檔案放在可以透過 http 或 https 通訊協定取用的地方，然後用網頁瀏覽器開啟 `mobile-accessibility-phones.xml` 即可。
  - 單純放在自己的硬碟上然後用瀏覽器開啟會有問題，因為 file 協定的安全性等級不同。

## 技術細節說明

請參考我的部落格文章：《[查詢手機的助聽器相容性評級 (HAC Rating)](https://jedi.org/blog/archives/006259.html)》
