<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns="some:ns">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <!-- Author Dimitre Novatchev -->
  <!-- https://stackoverflow.com/users/36305/dimitre-novatchev -->

  <ns:WhiteList>
    <name>ns0:Name</name>
    <name>ns0:Zip</name>
  </ns:WhiteList>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[not(descendant-or-self::*[name()=document('')/*/ns:WhiteList/*])]"/>
</xsl:stylesheet>