java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-maps.xsl -o:output/prices/prices-10.json input=input/prices/prices-10.json
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-maps.xsl -o:output/prices/prices-25.json input=input/prices/prices-25.json
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-maps.xsl -o:output/prices/prices-50.json input=input/prices/prices-50.json

java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-maps.xsl -o:output/prices/prices-100.json input=input/prices/prices-100.json
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-maps.xsl -o:output/prices/prices-250.json input=input/prices/prices-250.json
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-maps.xsl -o:output/prices/prices-500.json input=input/prices/prices-500.json

java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-maps.xsl -o:output/prices/prices-1000.json input=input/prices/prices-1000.json
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-maps.xsl -o:output/prices/prices-2500.json input=input/prices/prices-2500.json
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-maps.xsl -o:output/prices/prices-5000.json input=input/prices/prices-5000.json

java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-prices-via-maps.xsl -o:output/prices/prices-10000.json input=input/prices/prices-10000.json


