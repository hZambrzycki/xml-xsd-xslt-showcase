<?xml version="1.0" encoding="UTF-8"?>
<!-- Exercise 2 – XSLT (English version) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Exercise 2 – XSLT</title>
        <style>
          .highlight { background-color: red; }
          table, th, td, tr {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 5px;
            text-align: center;
          }
        </style>
      </head>
      <body>
        <table>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Degree</th>
            <th>Academic Year</th>
            <th>Address</th>
          </tr>

          <!-- iterate people -->
          <xsl:for-each select="enrollment/person">
            <xsl:sort select="name"/>

            <tr>
              <td><xsl:value-of select="id/@number"/></td>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="degree"/></td>

              <!-- highlight a specific academic year -->
              <xsl:choose>
                <xsl:when test="academic_year = '2016/2017'">
                  <td class="highlight"><xsl:value-of select="academic_year"/></td>
                </xsl:when>
                <xsl:otherwise>
                  <td><xsl:value-of select="academic_year"/></td>
                </xsl:otherwise>
              </xsl:choose>

              <td>
                <ul>
                  <xsl:for-each select="addresses/address">
                    <li>
                      <xsl:value-of select="@type"/> 
                      <xsl:text> </xsl:text>
                      <xsl:value-of select="name"/>
                    </li>
                  </xsl:for-each>
                </ul>
              </td>
            </tr>
          </xsl:for-each>
        </table>

        <!-- payment info (first payment shown if multiple) -->
        <p><xsl:value-of select="/enrollment/payment[1]/enrollment_type"/></p>
        <p>
          <xsl:value-of select="/enrollment/payment[1]/price"/>
          <xsl:text> - </xsl:text>
          <xsl:value-of select="/enrollment/payment[1]/price/@currency"/>
        </p>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
