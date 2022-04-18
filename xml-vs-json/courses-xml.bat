java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-xml.xsl -o:output/courses/courses-10.xml input=input/courses/courses-10.xml
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-xml.xsl -o:output/courses/courses-25.xml input=input/courses/courses-25.xml
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-xml.xsl -o:output/courses/courses-50.xml input=input/courses/courses-50.xml

java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-xml.xsl -o:output/courses/courses-100.xml input=input/courses/courses-100.xml
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-xml.xsl -o:output/courses/courses-250.xml input=input/courses/courses-250.xml
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-xml.xsl -o:output/courses/courses-500.xml input=input/courses/courses-500.xml

java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-xml.xsl -o:output/courses/courses-1000.xml input=input/courses/courses-1000.xml
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-xml.xsl -o:output/courses/courses-2500.xml input=input/courses/courses-2500.xml
java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-xml.xsl -o:output/courses/courses-5000.xml input=input/courses/courses-5000.xml

java -cp %SAXON_HOME%/* net.sf.saxon.Transform -it -repeat:10 -xsl:convert-courses-via-xml.xsl -o:output/courses/courses-10000.xml input=input/courses/courses-10000.xml


