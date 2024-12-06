<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:date="http://exslt.org/dates-and-times"
  extension-element-prefixes="date">
  <xsl:output method="html" encoding="utf-8" indent="yes" />
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;&#33;</xsl:text>DOCTYPE html<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
    <html lang="zh-Hant-TW">
    <head>
      <title>助聽器相容性 (HAC) 評級資料表</title>
      <style>
:root {
  --background: hsl(210,6%,12%);
  --currentline: hsl(236,10%,33%);
  --selection: hsl(216,8%,24%);
  --selectionmark: hsla(140,2%,77%,80%);
  --foreground: hsl(140,2%,77%);
  --comment: hsl(120,0%,59%);
  --red: hsl(0,50%,60%);
  --orange: hsl(24,65%,62%);
  --yellow: hsl(39,80%,69%);
  --green: hsl(65,39%,57%);
  --aqua: hsl(171,28%,64%);
  --blue: hsl(207,31%,62%);
  --purple: hsl(286,22%,65%);
  --nightbackground: hsl(210,6%,12%);
}
@media (prefers-color-scheme: light) {
  :root {
    --background: hsl(0,0%,98%);
    --currentline: hsl(0,0%,92%);
    --selection: hsl(0,0%,82%);
    --selectionmark: hsla(228,8%,24%,80%);
    --foreground: hsl(228,8%,24%);
    --comment: hsl(231,4%,64%);
    --red: hsl(345,69%,49%);
    --orange: hsl(22,78%,49%);
    --yellow: hsl(46,60%,48%);
    --green: hsl(140,62%,36%);
    --aqua: hsl(199,100%,43%);
    --blue: hsl(222,78%,52%);
    --purple: hsl(263,86%,60%);
    --nightbackground: hsl(210,6%,12%);
  }
}
@media (prefers-contrast: less) {
  :root {
    --background: hsl(44,87%,94%);
    --currentline: hsl(45,64%,91%);
    --selection: hsl(46,42%,88%);
    --selectionmark: hsla(196,13%,45%,80%);
    --foreground: hsl(196,13%,45%);
    --comment: hsl(180,7%,60%);
    --red: hsl(1,71%,52%);
    --orange: hsl(18,80%,44%);
    --yellow: hsl(45,100%,35%);
    --green: hsl(68,100%,30%);
    --aqua: hsl(175,59%,40%);
    --blue: hsl(205,69%,49%);
    --purple: hsl(237,43%,60%);
    --nightbackground: hsl(210,6%,12%);
  }
}
@media (prefers-color-scheme: dark) {
  :root {
    --background: hsl(210,6%,12%);
    --currentline: hsl(236,10%,33%);
    --selection: hsl(216,8%,24%);
    --selectionmark: hsla(140,2%,77%,80%);
    --foreground: hsl(140,2%,77%);
    --comment: hsl(120,0%,59%);
    --red: hsl(0,50%,60%);
    --orange: hsl(24,65%,62%);
    --yellow: hsl(39,80%,69%);
    --green: hsl(65,39%,57%);
    --aqua: hsl(171,28%,64%);
    --blue: hsl(207,31%,62%);
    --purple: hsl(286,22%,65%);
    --nightbackground: hsl(210,6%,12%);
  }
}
@media (prefers-contrast: more) {
  :root {
    --background: hsl(0,0%,0%);
    --currentline: hsl(0,0%,16%);
    --selection: hsl(0,0%,26%);
    --selectionmark: hsla(0,0%,92%,80%);
    --foreground: hsl(0,0%,92%);
    --comment: hsl(120,1%,59%);
    --red: hsl(358,62%,57%);
    --orange: hsl(26,77%,59%);
    --yellow: hsl(47,77%,59%);
    --green: hsl(68,55%,54%);
    --aqua: hsl(169,39%,60%);
    --blue: hsl(213,56%,67%);
    --purple: hsl(281,45%,72%);
    --nightbackground: hsl(210,6%,12%);
  }
}
body {
  color: var(--foreground);
  background: var(--background);
}
h1, .center {
  text-align: center;
}
a {
  color: var(--green);
  text-decoration: underline;
}
a:link {
  color: var(--green);
  text-decoration: underline;
}
a:visited {
  color: var(--orange);
  text-decoration: underline;
}
a:active {
  color: var(--red);
}
a:hover {
  color: var(--red);
}
input:focus, textarea:focus {
  color: var(--foreground);
  background: var(--currentline);
}
table {
  border-collapse: collapse;
  border: 1px solid var(--foreground);
  margin: 0 auto;
}
table thead th, table tbody td {
  border: 1px solid;
  padding: 5px;
  max-width: 20em;
  word-wrap: break-word;
}
table + * {
  padding-top: 1em;
}
table tbody tr:nth-child(2n) td {
  background: var(--selection);
}
table tbody tr:nth-child(2n+1) td {
  background: var(--currentline);
}
footer {
  display: grid;
  grid-template-columns: 1fr auto 0.3fr auto 1fr;
  gap: 2em;
}
section#about {
  grid-column: 2;
}
section#link {
  grid-column: 4;
}
      </style>
    </head>
    <body>
      <h1>行動電話助聽器相容性 (HAC) 評級</h1>
      <table id="myTable">
      	<caption>製表日期：<xsl:value-of select="date:year()"/> 年 <xsl:value-of select="date:month-in-year()"/> 月 <xsl:value-of select="date:day-in-month()"/> 日</caption>
      	<thead>
      	  <tr><th>廠牌<br/>快查：<input type="text" id="myInput" onkeyup="myFunction()" placeholder="輸入廠牌"/></th><th>型號</th><th>HAC 評級</th></tr>
      	</thead>
      	<tbody>
          <xsl:for-each select="rss">
            <xsl:for-each select="channel">
              <xsl:for-each select="product">
                <tr>
      	          <td><xsl:value-of select = "ProductBrand" /></td>
      	          <td><xsl:value-of select = "Model" /></td>
                  <td>
                    <xsl:for-each select="item">
                      <xsl:if test="Feature='HAC Rating'">
                        <xsl:value-of select = "Detail" />
                      </xsl:if>
      	            </xsl:for-each>
      	          </td>
                </tr>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:for-each>
        </tbody>
      </table>
      <p>原始資料來源：<a href="https://www.gari.info/download-gari-db.cfm">GARI Database</a></p>
      <hr/>
      <footer>
        <section id="about">
          <h2>行動電話助聽器相容性 (HAC) 資料表產生器</h2>
          <dl>
            <dt>目前使用的資料表產生器版本</dt>
            <dd>v2024.12.06.2</dd>
          </dl>
          <ul>
            <li><a href="https://github.com/JediLin/Mobile-phones-HAC-data-table-generator/releases/latest">下載最新版套件</a></li>
            <li><a href="https://github.com/JediLin/Mobile-phones-HAC-data-table-generator/issues">意見回饋／瑕疵回報</a></li>
            <li><a href="https://github.com/JediLin/Mobile-phones-HAC-data-table-generator">專案網頁</a></li>
            <li><a href="https://jedi.org/blog/archives/006259.html">部落格文章</a></li>
          </ul>
        </section>
        <section id="link">
          <h2>相關連結</h2>
          <ul>
            <li><abbr title="Federal Communications Commission">FCC</abbr>: <a href="https://www.fcc.gov/hearing-aid-compatibility-wireless-telephones">Hearing Aid Compatible Mobile Handsets</a></li>
            <li><abbr title="Global Accessibility Reporting Initiative">GARI</abbr>: <a href="https://www.gari.info/findphones.cfm">Find Accessible Devices and Apps</a></li>
            <li>《<a href="https://jedi.org/blog/archives/006308.html">助聽器公司不說的事：T 線圈</a>》部落格文章</li>
          </ul>
        </section>
      </footer>
    </body>
    </html>
    <script>
function myFunction() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i <xsl:text disable-output-escaping="yes">&lt;</xsl:text> tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) <xsl:text disable-output-escaping="yes">&gt;</xsl:text> -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>
  </xsl:template>
</xsl:stylesheet>
