java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-xml.xsl -o:output/prices/prices-10.xml input=input/prices/prices-10.xml
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-xml.xsl -o:output/prices/prices-25.xml input=input/prices/prices-25.xml
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-xml.xsl -o:output/prices/prices-50.xml input=input/prices/prices-50.xml

java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-xml.xsl -o:output/prices/prices-100.xml input=input/prices/prices-100.xml
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-xml.xsl -o:output/prices/prices-250.xml input=input/prices/prices-250.xml
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-xml.xsl -o:output/prices/prices-500.xml input=input/prices/prices-500.xml

java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-xml.xsl -o:output/prices/prices-1000.xml input=input/prices/prices-1000.xml
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-xml.xsl -o:output/prices/prices-2500.xml input=input/prices/prices-2500.xml
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-xml.xsl -o:output/prices/prices-5000.xml input=input/prices/prices-5000.xml

java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-xml.xsl -o:output/prices/prices-10000.xml input=input/prices/prices-10000.xml


