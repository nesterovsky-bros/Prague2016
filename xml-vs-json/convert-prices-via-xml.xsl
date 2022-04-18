<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs">
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:param name="input"/>
  
  <xsl:output method="xml"/>
  
  <xsl:template name="xsl:initial-template">
    <xsl:variable name="input-as-xml" select="document($input)"/>

    <xsl:apply-templates select="$input-as-xml"/>
  </xsl:template>
  
  <xsl:template match="item[tokenize(@tags) = 'ice']/@price">
  	<xsl:attribute name="price" select="xs:decimal(.) * 1.1"/>
  </xsl:template>

</xsl:stylesheet>
