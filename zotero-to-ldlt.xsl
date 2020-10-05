<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
    xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:teix="http://www.tei-c.org/ns/Examples" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="a rng tei teix" version="2.0">
   
    <xsl:template match="tei:listBibl">
        <xsl:apply-templates>
            <xsl:sort select="@xml:id"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="tei:biblStruct">
        <xsl:choose>
            <xsl:when test="@type = 'journalArticle'">
                <bibl>
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:element name="abbr">
                        <xsl:attribute name="type">siglum</xsl:attribute>
                        <xsl:value-of select="tei:analytic/tei:author/tei:surname"/><xsl:text> </xsl:text><xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
                    </xsl:element>
                    <xsl:for-each select="tei:analytic/tei:author">
                        <author>
                            <xsl:value-of select="tei:surname"/>, <xsl:value-of
                                select="tei:forename"/>
                        </author>
                    </xsl:for-each>. "<title>
                        <xsl:attribute name="level">
                            <xsl:value-of select="tei:analytic/tei:title/@level"/>
                        </xsl:attribute>
                        <xsl:value-of select="tei:analytic/tei:title"/>
                    </title>." <title>
                        <xsl:attribute name="level">
                            <xsl:value-of select="tei:monogr/tei:title/@level"/>
                        </xsl:attribute>
                        <xsl:value-of select="tei:monogr/tei:title"/>
                    </title>. <xsl:element name="biblScope">
                        <xsl:attribute name="unit">volume</xsl:attribute>
                        <xsl:value-of
                            select="tei:monogr/tei:imprint/tei:biblScope[@unit = 'volume']"
                        /></xsl:element> (<xsl:element name="date"><xsl:value-of
                            select="tei:monogr/tei:imprint/tei:date"/></xsl:element>):
                        <xsl:element name="biblScope"><xsl:attribute name="unit"
                            >page</xsl:attribute><xsl:value-of
                            select="tei:monogr/tei:imprint/tei:biblScope[@unit = 'page']"
                        /></xsl:element>. </bibl>
            </xsl:when>
            <xsl:when test="@type = 'book'">
                <bibl>
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:element name="abbr">
                        <xsl:attribute name="type">siglum</xsl:attribute>
                        <xsl:value-of select="tei:monogr/tei:author/tei:surname"/><xsl:text> </xsl:text><xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
                    </xsl:element>
                    <xsl:for-each select="tei:monogr/tei:author">
                        <author>
                            <xsl:value-of select="tei:surname"/>, <xsl:value-of
                                select="tei:forename"/>
                        </author>
                    </xsl:for-each>. 
                    <title>
                        <xsl:attribute name="level">
                            <xsl:value-of select="tei:monogr/tei:title/@level"/>
                        </xsl:attribute>
                        <xsl:value-of select="tei:monogr/tei:title"/>
                    </title>.  
                    <pubPlace>
                        <xsl:value-of select="tei:monogr/tei:imprint/tei:pubPlace"/>
                    </pubPlace>. <date>
                        <xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
                    </date>.
                </bibl>
            </xsl:when>
            <xsl:when test="@type = 'bookSection'">
                <bibl>
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:element name="abbr">
                        <xsl:attribute name="type">siglum</xsl:attribute>
                        <xsl:value-of select="tei:analytic/tei:author/tei:surname"/><xsl:text> </xsl:text><xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
                    </xsl:element>
                    <xsl:for-each select="tei:monogr/tei:author">
                        <author>
                            <xsl:value-of select="tei:surname"/>, <xsl:value-of
                                select="tei:forename"/>
                        </author>
                    </xsl:for-each>. <title><xsl:attribute name="level">
                        <xsl:value-of select="tei:analytic/tei:title/@level"/>
                    </xsl:attribute>
                        <xsl:value-of select="tei:analytic/tei:title"/>
                    </title>. In  <xsl:for-each select="tei:monogr/tei:editor">
                        <editor>
                            <xsl:value-of select="tei:surname"/>, 
                            <xsl:value-of select="tei:forename"/>
                        </editor>, 
                    </xsl:for-each>
                    <title><xsl:attribute name="level">
                        <xsl:value-of select="tei:monogr/tei:title/@level"/>
                    </xsl:attribute><xsl:value-of select="tei:monogr/tei:title"/></title>.  <pubPlace>
                        <xsl:value-of select="tei:monogr/tei:imprint/tei:pubPlace"/>
                    </pubPlace>. <date>
                        <xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
                    </date>. <xsl:element name="biblScope"><xsl:attribute name="unit">page</xsl:attribute>
                        <xsl:value-of select="tei:monogr/tei:imprint/tei:biblScope[@unit = 'page']"/></xsl:element>.
                    
                </bibl>
            </xsl:when>
            
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
