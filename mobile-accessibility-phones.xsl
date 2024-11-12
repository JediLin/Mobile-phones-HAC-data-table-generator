<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:date="http://exslt.org/dates-and-times"
  extension-element-prefixes="date">
  <xsl:template match="/">
    <html lang="zh-Hant-TW">
    <head>
    <title>助聽器相容性 (HAC) 評級資料表</title>
    <style>
table thead th, table tbody td {
  padding: 5px;
}
table tbody tr:nth-child(2n) td {
  background: #ffcccc;
}
table tbody tr:nth-child(2n+1) td {
  background: #ccffff;
}
    </style>
    </head>
    <body>
      <table id="myTable">
      	<caption>行動電話助聽器相容性 (HAC) 評級｜製表日期：<xsl:value-of select="date:year()"/> 年 <xsl:value-of select="date:month-in-year()"/> 月 <xsl:value-of select="date:day-in-month()"/> 日</caption>
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
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
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
