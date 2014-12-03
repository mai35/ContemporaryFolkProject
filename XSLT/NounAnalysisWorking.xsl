<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xhtml" indent="yes"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Noun Subtheme Analysis</title>
            </head>
            <body>
                <h1>Noun Subtheme Analysis</h1>
                <xsl:comment>#include virtual="include/menu.html"</xsl:comment>
                <h2>List of all Nouns with Subthemes</h2>
                <table border="1">
                    <tr>
                        <th>Noun</th>
                        <th>Language</th>
                        <th>Song Title</th>
                        <th>Song Theme</th>
                        <th>Noun Subtheme</th>
                        <th>Count</th>
                    </tr>
                    <xsl:apply-templates select="//song"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="song">
        <xsl:for-each select="distinct-values(//noun/@subtheme)">
            <tr>
                <xsl:apply-templates select="distinct-values(ancestor::song//noun[@subtheme eq .])"></xsl:apply-templates>
            </tr>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="noun">
        <tr>
            <td>
                <xsl:apply-templates/>
            </td>
            <td>
                <xsl:apply-templates select="ancestor::songs/@language"/>
            </td>
            <td>
                <xsl:apply-templates select="ancestor::song//title"/>
            </td>
            <td>
                <xsl:apply-templates select="ancestor::song//theme"/>
            </td>
            <td>
                <xsl:value-of select="./@subtheme"/>
            </td>
            <td>
                <xsl:value-of select="count(ancestor::song[noun eq .]//noun[@subtheme eq .])"></xsl:value-of>
            </td>
        </tr>        
    </xsl:template>
</xsl:stylesheet>
