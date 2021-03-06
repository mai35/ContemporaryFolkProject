<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xhtml" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css/languagePages.css"/>
                <title><xsl:apply-templates select="songs/@language"/> Songs</title>
            </head>
            <body class="{songs/@language}">
                <h1><xsl:apply-templates select="songs/@language"/> Songs and Lyrics</h1>
                <xsl:comment>#include virtual="include/menu.html"</xsl:comment>
                <h2>Contents</h2>
                <ul>
                    <xsl:apply-templates select="//meta" mode="toc"/>
                </ul>
                <hr/>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="meta" mode="toc">
        <li><a href="#n{title}" name="n{title}_toc"><xsl:apply-templates select="title"/> (by: <xsl:apply-templates select="artist"/>)</a></li>
    </xsl:template>
    <xsl:template match="song">
        <xsl:apply-templates select="meta"/>
        <p><xsl:apply-templates select="lyrics"/></p>
        <hr/>
    </xsl:template>
    <xsl:template match="meta">
        <h3>
            <a href="#n{title}_toc" name="n{title}"><xsl:apply-templates select="title"/></a>
        </h3>
        <h4><xsl:apply-templates select="artist"/></h4>
    </xsl:template>
    <xsl:template match="stanza">
        <xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="line">
        <xsl:apply-templates/><br/>
    </xsl:template>
</xsl:stylesheet>