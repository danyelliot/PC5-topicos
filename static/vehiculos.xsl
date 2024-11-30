<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:param name="min_range"/>
    <xsl:param name="type_filter"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Vehículos Eléctricos Filtrados</title>
            </head>
            <body>
                <h1>Resultados de Filtro</h1>
                <table border="1">
                    <tr>
                        <th>VIN</th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Año</th>
                        <th>Tipo</th>
                        <th>Ciudad</th>
                        <th>Autonomía Eléctrica</th>
                    </tr>
                    <xsl:for-each select="/response/row/row[
                        number(electric_range) &gt;= number($min_range) and
                        ev_type = $type_filter
                    ]">
                        <tr>
                            <td><xsl:value-of select="vin_1_10"/></td>
                            <td><xsl:value-of select="make"/></td>
                            <td><xsl:value-of select="model"/></td>
                            <td><xsl:value-of select="model_year"/></td>
                            <td><xsl:value-of select="ev_type"/></td>
                            <td><xsl:value-of select="city"/></td>
                            <td><xsl:value-of select="electric_range"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>