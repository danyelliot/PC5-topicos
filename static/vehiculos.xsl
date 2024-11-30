<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
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
                        <th>Condado</th>
                        <th>Ciudad</th>
                        <th>Estado</th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Año del Modelo</th>
                        <th>Tipo CAFV</th>
                        <th>Tipo de Vehículo</th>
                    </tr>
                    <xsl:for-each select="/response/row/row[
                        model_year = $type_filter
                    ]"> 
                        <tr>
                            <td><xsl:value-of select="county"/></td>
                            <td><xsl:value-of select="city"/></td>
                            <td><xsl:value-of select="state"/></td>
                            <td><xsl:value-of select="make"/></td>
                            <td><xsl:value-of select="model"/></td>
                            <td><xsl:value-of select="model_year"/></td>
                            <td><xsl:value-of select="cafv_type"/></td>
                            <td><xsl:value-of select="ev_type"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>