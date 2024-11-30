<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:param name="county_filter"/>
    <xsl:param name="city_filter"/>
    <xsl:param name="state_filter"/>
    <xsl:param name="make_filter"/>
    <xsl:param name="model_filter"/>
    <xsl:param name="model_year_filter"/>
    <xsl:param name="cafv_type_filter"/>
    <xsl:param name="type_filter"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Vehículos Eléctricos Filtrados</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f4f4f9;
                        color: #333;
                        margin: 0;
                        padding: 0;
                    }
                    h1 {
                        text-align: center;
                        color: #444;
                        margin-top: 20px;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin: 20px 0;
                    }
                    th, td {
                        padding: 10px;
                        border: 1px solid #ddd;
                        text-align: left;
                    }
                    tr:nth-child(even) {
                        background-color: #ffcccc; /* Color llamativo para filas pares */
                    }
                    tr:nth-child(odd) {
                        background-color: #ccffcc; /* Color llamativo para filas impares */
                    }
                    .parallax {
                        background-image: url('https://example.com/parallax-image.jpg');
                        height: 500px;
                        background-attachment: fixed;
                        background-position: center;
                        background-repeat: no-repeat;
                        background-size: cover;
                    }
                </style>
            </head>
            <body>
                <div class="parallax"></div>
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
                        (not($county_filter) or county = $county_filter) and
                        (not($city_filter) or city = $city_filter) and
                        (not($state_filter) or state = $state_filter) and
                        (not($make_filter) or make = $make_filter) and
                        (not($model_filter) or model = $model_filter) and
                        (not($model_year_filter) or model_year = $model_year_filter) and
                        (not($cafv_type_filter) or cafv_type = $cafv_type_filter) and
                        (not($type_filter) or ev_type = $type_filter)
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
                <div class="parallax"></div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>