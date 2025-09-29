<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Academic Transcript</title>
            </head>
            <body>
                <h1>Academic Transcript</h1>

                <p><strong>Student:</strong> <xsl:value-of select="/transcript/@student"/></p>

                <table>
                    <thead>
                        <tr>
                            <th>Subject</th>
                            <th>Grade</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/transcript/subject">
                            <tr>
                                <td><xsl:value-of select="name"/></td>
                                <td><xsl:value-of select="grade"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
