<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
    <head>
    <title>HAC Rating</title>
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
      	<caption>Mobile Phones HAC Rating</caption>
      	<thead>
      	  <tr><th>Brand</th><th>Model</th><th>HAC Rating</th></tr>
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
      <p>Data source: <a href="https://www.gari.info/download-gari-db.cfm">GARI Database</a></p>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>