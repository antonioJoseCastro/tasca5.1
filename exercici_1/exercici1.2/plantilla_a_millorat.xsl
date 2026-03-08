<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Parámetro para el nombre del nodo de salida -->
  <xsl:param name="nodeName" select="'row'"/>

  <!-- Salida XML bien indentada -->
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <!-- Transformar cada <row> en el nodo definido por $nodeName -->
  <xsl:template match="row">
    <xsl:element name="{$nodeName}">
      <!-- Cada field se convierte en elemento hijo con el nombre del atributo name -->
      <xsl:for-each select="field">
        <xsl:element name="{@name}">
          <xsl:value-of select="."/>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <!-- Copiar todo lo demás (como <resultset>) -->
  <xsl:template match="@*|node()[not(self::row)]">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>