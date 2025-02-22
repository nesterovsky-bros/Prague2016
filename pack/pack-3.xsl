<?xml version="1.0" encoding="UTF-8"?>
<xsl:package xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs f"
    xmlns:f="http://localhost/fn"
    name="http://london2016/package-3"
    package-version="0.0.1"
    expand-text="yes"
    version="3.0">
    
    <xsl:use-package name="http://london2016/package-1"
        package-version="0.0.1">
        <xsl:override>
            <xsl:function name="f:compute-score" as="xs:integer" visibility="private">
                <xsl:param name="x" as="xs:integer"/>
                <xsl:param name="y" as="xs:integer"/>
                <xsl:sequence select="$x * $y"/>
            </xsl:function>
        </xsl:override>
    </xsl:use-package>

    <xsl:template name="xsl:initial-template">
        <out>{
            f:compute-score(17, 3) 
        }</out>
    </xsl:template>
    
</xsl:package>