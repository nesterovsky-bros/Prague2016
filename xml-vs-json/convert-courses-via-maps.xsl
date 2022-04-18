<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:array="http://www.w3.org/2005/xpath-functions/array"
  exclude-result-prefixes="xs map array">

  <xsl:param name="input"/>
  
  <xsl:output method="json"/>
  
  <xsl:template name="xsl:initial-template">
    <xsl:variable name="input-as-array" select="json-doc($input)" as="array(*)"/>

    <xsl:variable name="items" as="map(xs:string, item())*" select="
      for
        $course in $input-as-array?*?courses?*,
        $student in $course?students?*
      return
        map { 'student': $student, 'course': $course?course }"/>
    
    <xsl:variable name="groups" as="map(xs:string, item())*">
      <xsl:for-each-group select="$items" group-by="?student?email">
        <xsl:sort select="?student?last"/>
        <xsl:sort select="?student?first"/>

        <xsl:sequence select="
          map
          {
            'email': current-grouping-key(),
            'courses': array { current-group()?course }
          }"/>
      </xsl:for-each-group>
    </xsl:variable>
    
    <xsl:sequence select="array { $groups }"/>
  </xsl:template>
 
</xsl:stylesheet>