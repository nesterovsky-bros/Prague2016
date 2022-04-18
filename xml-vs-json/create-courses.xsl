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

  <xsl:param name="male-names" as="xs:string" select="'male-names.txt'"/>
  <xsl:param name="female-names" as="xs:string" select="'female-names.txt'"/>
  <xsl:param name="surnames" as="xs:string" select="'surnames.txt'"/>
  <xsl:param name="university" as="xs:string" select="'university.json'"/>
  <xsl:param name="target" as="xs:string" select="'input/courses'"/>
  <xsl:param name="counts" as="xs:string" 
    select="'10 25 50 100 250 500 1000 2500 5000 10000'"/>
  <xsl:param name="seed" as="xs:string?" select="()"/>
  
  <xsl:template name="xsl:initial-template" match="/">
    <xsl:variable name="male-names-list" as="xs:string+" 
      select="unparsed-text-lines($male-names)"/>
    <xsl:variable name="female-names-list" as="xs:string+" 
      select="unparsed-text-lines($female-names)"/>
    <xsl:variable name="surnames-list" as="xs:string+" 
      select="unparsed-text-lines($surnames)"/>
      
    <xsl:variable name="university-courses" as="map(xs:string, xs:string)+" 
      select="
        for 
          $faculty in json-doc($university)?*,
          $course in $faculty?courses?* 
        return
          map
          {
            'faculty': $faculty?faculty,
            'course': $course 
          }"/>
          
    <xsl:iterate select="tokenize($counts)!xs:integer(.)">
      <xsl:param name="generator" as="map(xs:string, item())" 
        select="random-number-generator($seed)"/>
        
      <xsl:variable name="count" as="xs:integer" select="."/>
       
      <xsl:variable name="result" as="map(xs:string, item()*)" select="
        t:generate-data
        (
          $count,
          $male-names-list, 
          $female-names-list,
          $surnames-list,
          $university-courses,
          $generator
        )"/>
        
      <xsl:variable name="data" as="map(xs:string, item()*)*" 
        select="$result?data"/>
      <xsl:variable name="next-generator" as="map(xs:string, item())" 
        select="$result?generator"/>
      
      <xsl:variable name="json-uri" as="xs:anyURI" select="
        resolve-uri($target || '/courses-' || $count || '.json')"/>
  
      <xsl:result-document format="json" href="{$json-uri}">
        <xsl:variable name="faculties" as="map(xs:string, item()*)*">
          <xsl:for-each-group select="$data" group-by="?faculty">
            <xsl:variable name="faculty" as="xs:string" 
              select="current-grouping-key()"/>
            
            <xsl:variable name="courses" as="map(xs:string, item()*)*">
              <xsl:for-each-group select="current-group()" group-by="?course">
                <xsl:variable name="course" as="xs:string" 
                  select="current-grouping-key()"/>
              
                <xsl:variable name="students" as="map(xs:string, item()*)*"
                  select="
                    current-group()!
                      map
                      {
                        'first': ?first,
                        'last': ?last,
                        'email': ?email
                      }"/>
                
                <xsl:sequence select="
                  map
                  {
                    'course': $course,
                    'students': array { $students }
                  }"/> 
              </xsl:for-each-group>
            </xsl:variable>  
            
            <xsl:sequence select="
              map
              {
                'faculty': $faculty,
                'courses': array { $courses }
              }"/> 
          </xsl:for-each-group>
        </xsl:variable>
        
        <xsl:sequence select="array { $faculties }"/> 
      </xsl:result-document>

      <xsl:variable name="xml-uri" as="xs:anyURI" select="
        resolve-uri($target || '/courses-' || $count || '.xml')"/>

      <xsl:result-document format="xml" href="{$xml-uri}">
        <university>
          <xsl:for-each-group select="$data" group-by="?faculty">
            <xsl:variable name="faculty" as="xs:string" 
              select="current-grouping-key()"/>
              
            <faculty name="{$faculty}">
              <xsl:for-each-group select="current-group()" group-by="?course">
                <xsl:variable name="course" as="xs:string" 
                  select="current-grouping-key()"/>
                  
                <course name="{$course}">
                  <xsl:for-each select="current-group()">
                    <student first="{?first}" last="{?last}" email="{?email}"/>
                  </xsl:for-each>
                </course>
              </xsl:for-each-group>
            </faculty>
          </xsl:for-each-group>
        </university>
      </xsl:result-document>
      
      <xsl:next-iteration>
        <xsl:with-param name="generator" select="$next-generator"/>
      </xsl:next-iteration>
    </xsl:iterate>
  </xsl:template>

  <xsl:function name="t:generate-data" as="map(xs:string, item()*)*">
    <xsl:param name="count" as="xs:integer"/>
    <xsl:param name="male-names" as="xs:string+"/>
    <xsl:param name="female-names" as="xs:string+"/>
    <xsl:param name="surnames" as="xs:string+"/>
    <xsl:param name="university-courses" as="map(xs:string, xs:string)+"/>
    <xsl:param name="generator" as="map(xs:string, item())"/>
    
    <xsl:variable name="male-names-count" as="xs:integer" 
      select="count($male-names)"/>
    <xsl:variable name="female-names-count" as="xs:integer" 
      select="count($female-names)"/>
    <xsl:variable name="surnames-count" as="xs:integer" 
      select="count($surnames)"/>
    <xsl:variable name="university-courses-count" as="xs:integer" 
      select="count($university-courses)"/>

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

      <xsl:variable name="female" as="xs:boolean" 
        select="$generator?number ge .5"/>
      
      <xsl:variable name="name" as="xs:string" select="
        if ($female) then
          $female-names
            [xs:integer($generator2?number * $female-names-count + 1)]
        else
          $male-names
            [xs:integer($generator2?number * $male-names-count + 1)]"/>

      <xsl:variable name="surname" as="xs:string" select="
        $surnames[xs:integer($generator3?number * $surnames-count + 1)]"/>
      
      <xsl:variable name="course" as="map(xs:string, xs:string)" select="
        $university-courses
          [xs:integer($generator4?number * $university-courses-count + 1)]"/>
          
      <xsl:next-iteration>
        <xsl:with-param name="data" select="
          $data,
          map
          {
            'first': $name, 
            'last': $surname, 
            'email': $name || '.' || $surname || '@gmail.com',
            'faculty': $course?faculty, 
            'course': $course?course
          }"/>
        <xsl:with-param name="generator" select="$generator5"/>
      </xsl:next-iteration>
    </xsl:iterate>    
  </xsl:function>

</xsl:stylesheet>