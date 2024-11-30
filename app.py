from flask import Flask, request, render_template, send_file
from lxml import etree

DEFAULT_TYPE_FILTER = 'Plug-in Hybrid Electric Vehicle (PHEV)'
DEFAULT_MODEL_YEAR_FILTER = '2020'
DEFAULT_COUNTY_FILTER = ''
DEFAULT_CITY_FILTER = ''
DEFAULT_STATE_FILTER = ''
DEFAULT_MAKE_FILTER = ''
DEFAULT_MODEL_FILTER = ''
DEFAULT_CAFV_TYPE_FILTER = ''

app = Flask("hola")

# Ruta principal para mostrar el formulario
@app.route('/')
def index():
    return render_template('index.html')

# Ruta para procesar el formulario y aplicar el XSLT
@app.route('/filter', methods=['GET'])
def filter_data():
    # Obtiene los parámetros del formulario
    county_filter = request.args.get('county_filter', DEFAULT_COUNTY_FILTER)
    city_filter = request.args.get('city_filter', DEFAULT_CITY_FILTER)
    state_filter = request.args.get('state_filter', DEFAULT_STATE_FILTER)
    make_filter = request.args.get('make_filter', DEFAULT_MAKE_FILTER)
    model_filter = request.args.get('model_filter', DEFAULT_MODEL_FILTER)
    model_year_filter = request.args.get('model_year_filter', DEFAULT_MODEL_YEAR_FILTER)
    cafv_type_filter = request.args.get('cafv_type_filter', DEFAULT_CAFV_TYPE_FILTER)
    type_filter = request.args.get('type_filter', DEFAULT_TYPE_FILTER)

    # Carga el XML y el XSL
    xml_path = 'static/vehiculos.xml'
    xsl_path = 'static/vehiculos.xsl'

    xml = etree.parse(xml_path)
    xsl = etree.parse(xsl_path)

    # Configura la transformación
    transform = etree.XSLT(xsl)
    result = transform(xml,
                       county_filter=etree.XSLT.strparam(county_filter),
                       city_filter=etree.XSLT.strparam(city_filter),
                       state_filter=etree.XSLT.strparam(state_filter),
                       make_filter=etree.XSLT.strparam(make_filter),
                       model_filter=etree.XSLT.strparam(model_filter),
                       model_year_filter=etree.XSLT.strparam(model_year_filter),
                       cafv_type_filter=etree.XSLT.strparam(cafv_type_filter),
                       type_filter=etree.XSLT.strparam(type_filter))

    # Retorna el HTML transformado
    return str(result)

app.run(debug=True)