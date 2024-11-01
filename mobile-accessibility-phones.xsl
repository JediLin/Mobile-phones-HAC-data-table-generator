<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:date="http://exslt.org/dates-and-times"
  extension-element-prefixes="date">
  <xsl:template match="/">
    <html>
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
      <table>
      	<caption>行動電話助聽器相容性 (HAC) 評級｜製表日期：<xsl:value-of select="date:year()"/> 年 <xsl:value-of select="date:month-in-year()"/> 月 <xsl:value-of select="date:day-in-month()"/> 日</caption>
      	<thead>
      	  <tr><th>廠牌</th><th>型號</th><th>HAC 評級</th></tr>
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
  </xsl:template>
</xsl:stylesheet>