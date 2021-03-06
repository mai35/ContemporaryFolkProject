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
                    <xsl:apply-templates select="//meta" mode="toc"><xsl:sort/></xsl:apply-templates>
                </ul>
                <hr/>
                <div><xsl:apply-templates select="//song"><xsl:sort/></xsl:apply-templates></div>
                <div class="creativeCommons">
                    <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">
                        <img alt="Creative Commons License" style="border-width:0"
                            src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><a
                                rel="license" href="http://creativecommons.org/licenses/by/4.0/"></a> </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="meta" mode="toc">
        <li><a href="#{translate(title,' ','_')}" name="{translate(title,' ', '_')}_toc"><xsl:apply-templates select="title"/> (by: <xsl:apply-templates select="artist"/>)</a></li>
    </xsl:template>
    <xsl:template match="song">
        <div>
        <xsl:apply-templates select="meta"><xsl:sort select="title"/></xsl:apply-templates>
        <p><xsl:apply-templates select="lyrics"/></p>
        <hr/>
        </div>
    </xsl:template>
    <xsl:template match="meta">
        <h3>
            <a href="#{translate(title,' ','_')}_toc" name="{translate(title,' ', '_')}"><xsl:apply-templates select="title"/></a>
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