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
    
    <university>
      <xsl:for-each-group select="$input-as-xml//student" group-by="@email">
        <xsl:sort select="@last"/>
        <xsl:sort select="@first"/>
        
        <student email="{current-grouping-key()}" 
          courses="{current-group()!..!@name}"/>
      </xsl:for-each-group>
    </university>
  </xsl:template>
 
</xsl:stylesheet>