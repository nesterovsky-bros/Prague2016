<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:array="http://www.w3.org/2005/xpath-functions/array"
  xmlns:t="this"
  exclude-result-prefixes="xs map array t">
  
  <xsl:output name="xml" method="xml"/>
  <xsl:output name="json" method="json"/>

  <xsl:param name="art-names" as="xs:string" select="'art-names.txt'"/>
  <xsl:param name="tags" as="xs:string" select="'tags.txt'"/>
  <xsl:param name="target" as="xs:string" select="'input/prices'"/>
  <xsl:param name="counts" as="xs:string" 
    select="'10 25 50 100 250 500 1000 2500 5000 10000'"/>
  <xsl:param name="seed" as="xs:string?" select="()"/>
  
  <xsl:template name="xsl:initial-template" match="/">
    <xsl:variable name="art-names-list" as="xs:string+" 
      select="unparsed-text-lines($art-names)"/>
    <xsl:variable name="tags-list" as="xs:string+" 
      select="unparsed-text-lines($tags)"/>
      
    <xsl:iterate select="tokenize($counts)!xs:integer(.)">
      <xsl:param name="generator" as="map(xs:string, item())" 
        select="random-number-generator($seed)"/>
        
      <xsl:variable name="count" as="xs:integer" select="."/>
       
      <xsl:variable name="result" as="map(xs:string, item()*)" select="
        t:generate-data
        (
          $count,
          $art-names-list, 
          $tags-list,
          $generator
        )"/>
        
      <xsl:variable name="data" as="map(xs:string, item()*)*" 
        select="$result?data"/>
      <xsl:variable name="next-generator" as="map(xs:string, item())" 
        select="$result?generator"/>
      
      <xsl:variable name="json-uri" as="xs:anyURI" select="
        resolve-uri($target || '/prices-' || $count || '.json')"/>
  
      <xsl:result-document format="json" href="{$json-uri}">
        <xsl:sequence select="array { $data }"/> 
      </xsl:result-document>

      <xsl:variable name="xml-uri" as="xs:anyURI" select="
        resolve-uri($target || '/prices-' || $count || '.xml')"/>

      <xsl:result-document format="xml" href="{$xml-uri}">
        <prices>
          <xsl:for-each select="$data">
            <item id="{?id}" 
              name="{?name}" 
              price="{?price}" 
              tags="{?tags?*}">
              <dimensions 
                width="{?dimensions?width}"
                height="{?dimensions?height}"/>
              <warehouseLocation
                longitude="{?warehouseLocation?longitude}"
                latitude="{?warehouseLocation?latitude}"/>
            </item>
          </xsl:for-each>
        </prices>
      </xsl:result-document>
      
      <xsl:next-iteration>
        <xsl:with-param name="generator" select="$next-generator"/>
      </xsl:next-iteration>
    </xsl:iterate>
  </xsl:template>

  <xsl:function name="t:generate-data" as="map(xs:string, item()*)*">
    <xsl:param name="count" as="xs:integer"/>
    <xsl:param name="art-names" as="xs:string+"/>
    <xsl:param name="tags" as="xs:string+"/>
    <xsl:param name="generator" as="map(xs:string, item())"/>
    
    <xsl:variable name="art-names-count" as="xs:integer" 
      select="count($art-names)"/>
    <xsl:variable name="tags-count" as="xs:integer" 
      select="count($tags)"/>

    <xsl:iterate select="1 to $count">
      <xsl:param name="data" as="map(xs:string, item()*)*"/>
      <xsl:param name="generator" as="map(xs:string, item())" 
        select="$generator"/>

      <xsl:on-completion 
        select="map { 'data': $data, 'generator': $generator }"/>

      <xsl:variable name="generator2" as="map(xs:string, item())" 
        select="$generator?next()"/>
      <xsl:variable name="generator3" as="map(xs:string, item())" 
        select="$generator2?next()"/>
      <xsl:variable name="generator4" as="map(xs:string, item())" 
        select="$generator3?next()"/>
      <xsl:variable name="generator5" as="map(xs:string, item())" 
        select="$generator4?next()"/>
      <xsl:variable name="generator6" as="map(xs:string, item())" 
        select="$generator5?next()"/>
      <xsl:variable name="generator7" as="map(xs:string, item())" 
        select="$generator6?next()"/>
      <xsl:variable name="generator8" as="map(xs:string, item())" 
        select="$generator7?next()"/>

      <xsl:variable name="id" as="xs:integer" select="."/>
      <xsl:variable name="name" as="xs:string" select="
        $art-names[xs:integer($generator?number * $art-names-count + 1)]"/>
      <xsl:variable name="tag-count" as="xs:integer" select="
        xs:integer($generator2?number * $tags-count div 2.0)"/>
      <xsl:variable name="tags" as="xs:string*" select="
        $generator2?permute($tags)[position() lt $tag-count]"/>
          
      <xsl:next-iteration>
        <xsl:with-param name="data" select="
          $data,
          map
          {
            'id': $id, 
            'name': $name,
            'price': xs:integer($generator3?number * 2000) div 100,
            'tags': array { $tags },
            'dimensions': map
            {
              'width': xs:integer($generator4?number * 100) div 10,
              'height': xs:integer($generator5?number * 200) div 10
            },
            'warehouseLocation': map
            {
              'latitude': $generator6?number * 180 - 90,
              'longitude': $generator7?number * 180
            }
          }"/>
        <xsl:with-param name="generator" select="$generator8"/>
      </xsl:next-iteration>
    </xsl:iterate>    
  </xsl:function>

</xsl:stylesheet>