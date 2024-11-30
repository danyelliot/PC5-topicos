from flask import Flask, request, render_template, send_file
from lxml import etree

app = Flask("hola")

# Ruta principal para mostrar el formulario
@app.route('/')
def index():
    return render_template('index.html')

# Ruta para procesar el formulario y aplicar el XSLT
@app.route('/filter', methods=['GET'])
def filter_data():
    # Obtiene los parámetros del formulario
    min_range = int(request.args.get('min_range', 0))
    type_filter = request.args.get('type_filter', 'Plug-in Hybrid Electric Vehicle (PHEV)')

    # Carga el XML y el XSL
    xml_path = 'static/vehiculos.xml'
    xsl_path = 'static/vehiculos.xsl'

    xml = etree.parse(xml_path)
    xsl = etree.parse(xsl_path)

    # Configura la transformación
    transform = etree.XSLT(xsl)
    result = transform(xml, min_range=etree.XSLT.strparam(str(min_range)), type_filter=etree.XSLT.strparam(type_filter))

    # Retorna el HTML transformado
    return str(result)


app.run(debug=True)