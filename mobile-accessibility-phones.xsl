<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
    <head>
    <link rel="Stylesheet" href="mobile-accessibility-phones.css" type="text/css" />
    <title>HAC Rating</title>
    </head>
    <body>
      <table>
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
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>