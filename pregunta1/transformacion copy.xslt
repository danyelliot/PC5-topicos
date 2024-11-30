<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- Plantilla principal -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Vehículos Eléctricos - Datos Completos</title>
                <style>
                    table { width: 100%; border-collapse: collapse; }
                    th, td { border: 1px solid black; padding: 8px; text-align: left; }
                    th { background-color: #003366; color: white; }
                    tr:nth-child(even) { background-color: #ffcc99; }
                    tr:nth-child(odd) { background-color: #99ccff; }
                </style>
            </head>
            <body>
                <h1 style="color: #003366;">Vehículos Eléctricos en USA</h1>
                <table>
                    <thead>
                        <tr>
                            <th>VIN</th>
                            <th>Condado</th>
                            <th>Ciudad</th>
                            <th>Estado</th>
                            <th>Código Postal</th>
                            <th>Año del Modelo</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Tipo de Vehículo</th>
                            <th>Tipo CAFV</th>
                            <th>Autonomía Eléctrica</th>
                            <th>Precio Base</th>
                            <th>Distrito Legislativo</th>
                            <th>ID del Vehículo DOL</th>
                            <th>Coordenadas Geocodificadas</th>
                            <th>Proveedor de Electricidad</th>
                            <th>Tracto del Censo 2020</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Procesar y mostrar todos los datos -->
                        <xsl:for-each select="/response/row/row">
                            <tr>
                                <td><xsl:value-of select="vin_1_10"/></td>
                                <td><xsl:value-of select="county"/></td>
                                <td><xsl:value-of select="city"/></td>
                                <td><xsl:value-of select="state"/></td>
                                <td><xsl:value-of select="zip_code"/></td>
                                <td><xsl:value-of select="model_year"/></td>
                                <td><xsl:value-of select="make"/></td>
                                <td><xsl:value-of select="model"/></td>
                                <td><xsl:value-of select="ev_type"/></td>
                                <td><xsl:value-of select="cafv_type"/></td>
                                <td><xsl:value-of select="electric_range"/></td>
                                <td><xsl:value-of select="base_msrp"/></td>
                                <td><xsl:value-of select="legislative_district"/></td>
                                <td><xsl:value-of select="dol_vehicle_id"/></td>
                                <td><xsl:value-of select="geocoded_column"/></td>
                                <td><xsl:value-of select="electric_utility"/></td>
                                <td><xsl:value-of select="_2020_census_tract"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>