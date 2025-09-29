<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Expediente socio</title>
                <style>
                    table,th,td,tr {
                    border: 1px solid black;
                    border-collapse: collapse;
                    padding:5px;
                    text-align:center;
                    }
                    .rojo {
                    background-color: red;
                </style>
            </head>
            <body>
                <table>
                    <tr>
                        <th>DNI</th>
                        <th>Nombre</th>
                        <th>Titulacion</th>
                        <th>Curso_Academico</th>
                        <th>Domicilios</th>
                    </tr>
                    <xsl:for-each select="matricula/personal">
                        <xsl:sort select="nombre"/>
                        <tr>
                            <td>
                                <xsl:value-of select="dni/@numero"/>
                            </td>
                            <td>
                                <xsl:value-of select="nombre"/>
                            </td>
                            <td>
                                <xsl:value-of select="titulacion"/>
                            </td>
                        
                                <xsl:choose>
                                    <xsl:when test="curso_academico ='2016/2017'">
                                        <td class="rojo">
                                            <xsl:value-of select="curso_academico"></xsl:value-of>
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td>
                                            <xsl:value-of select="curso_academico"/>
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                           
                            <td>
                                <ul>
                                    <xsl:for-each select="domicilios/domicilio">
                                        <li>
                                            <xsl:value-of select="@tipo"/>
                                            <xsl:value-of select="nombre"/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
