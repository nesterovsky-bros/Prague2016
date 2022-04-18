java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-maps.xsl -o:output/courses/courses-10.json input=input/courses/courses-10.json
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-maps.xsl -o:output/courses/courses-25.json input=input/courses/courses-25.json
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-maps.xsl -o:output/courses/courses-50.json input=input/courses/courses-50.json

java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-maps.xsl -o:output/courses/courses-100.json input=input/courses/courses-100.json
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-maps.xsl -o:output/courses/courses-250.json input=input/courses/courses-250.json
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-maps.xsl -o:output/courses/courses-500.json input=input/courses/courses-500.json

java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-maps.xsl -o:output/courses/courses-1000.json input=input/courses/courses-1000.json
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-maps.xsl -o:output/courses/courses-2500.json input=input/courses/courses-2500.json
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-maps.xsl -o:output/courses/courses-5000.json input=input/courses/courses-5000.json

java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-maps.xsl -o:output/courses/courses-10000.json input=input/courses/courses-10000.json


