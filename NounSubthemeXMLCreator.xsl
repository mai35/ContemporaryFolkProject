<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <nouns>
            <xsl:apply-templates select="//noun"/>
        </nouns>
    </xsl:template>
    <xsl:template match="noun">
        <xsl:if test="exists(@subtheme)">
            <nounSubthemes>
                <noun><xsl:apply-templates/></noun>
                <subtheme><xsl:apply-templates select="@subtheme"/></subtheme>
            </nounSubthemes>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>