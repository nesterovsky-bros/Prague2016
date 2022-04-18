<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:array="http://www.w3.org/2005/xpath-functions/array"
  exclude-result-prefixes="xs map array">

  <xsl:param name="input"/>

  <xsl:output method="json"/>

  <xsl:template name="xsl:initial-template">
    <xsl:variable name="input-as-array" select="json-doc($input)" as="array(*)"/>
    
    <xsl:sequence select="
      array:for-each
      (
        $input-as-array,
        function($item as map(xs:string, item()))
        {
          if ($item?tags?* = 'ice') then
            map:put($item, 'price', $item?price * 1.1)
          else
            $item
        }
      )"/>
  </xsl:template>

</xsl:stylesheet>
