# Banco de Preguntas de Preparación para la Evaluación Final

## Propósito de este documento

Este documento reúne el conjunto de preguntas utilizadas como base para la construcción de la evaluación final de la asignatura.

El objetivo principal de este banco es apoyar el proceso de estudio y preparación de los estudiantes, permitiéndoles reforzar los conceptos, herramientas y metodologías trabajadas durante el semestre.

---

## ¿Cómo se construirá la evaluación?

La evaluación final será implementada mediante la plataforma Moodle.

A partir del banco completo de preguntas publicado en este documento, la plataforma seleccionará aleatoriamente un subconjunto de preguntas para cada estudiante, generando versiones diferentes de la evaluación.

Las preguntas podrán presentarse en un orden distinto para cada estudiante y las alternativas de respuesta también podrán aparecer aleatoriamente.

La selección de preguntas será aleatoria, por lo que se recomienda estudiar la totalidad del banco y no únicamente un subconjunto de preguntas.

---

## Características de la evaluación

* Tipo de evaluación: Selección única.
* Cantidad de preguntas en la evaluación: 25.
* Tiempo disponible: 60 minutos.
* Modalidad: Individual.
* Ponderación: Según lo establecido en el programa de la asignatura.
* Banco de referencia: Todas las preguntas contenidas en este documento.

---

## Recomendaciones de estudio

Se recomienda utilizar este banco como una guía de preparación y autoevaluación.

Más importante que memorizar respuestas es comprender los conceptos asociados a:

* Inteligencia de Negocios.
* Data Warehouse y modelamiento dimensional.
* Procesos ETL.
* SQL Server, SSMS y Visual Studio.
* Pentaho Data Integration.
* Power Automate.
* Cubos OLAP.
* Power BI.
* Integración de datos y automatización de procesos.

Asimismo, se recomienda complementar el estudio con los apuntes, videos, talleres y actividades desarrolladas durante el semestre.

---

## Importante

La comprensión de los conceptos, herramientas y decisiones de diseño trabajadas durante el curso será fundamental para responder correctamente las preguntas de la evaluación.

El propósito de esta actividad es verificar la capacidad de analizar situaciones y aplicar los conocimientos adquiridos, más que la simple memorización de respuestas.



# Banco de Preguntas

## Pregunta 1

Una universidad desea analizar la evolución de la matrícula de los últimos diez años considerando sede, carrera, género y vía de ingreso. ¿Qué componente es el más apropiado para almacenar la información histórica destinada al análisis?

a) Base de datos transaccional (OLTP)

b) Data Warehouse 

c) Archivo CSV

d) Servicio Web

<details>
<summary>Ver respuesta y retroalimentación</summary>
La respuesta correcta es b). Un Data Warehouse está diseñado para almacenar información histórica e integrada proveniente de múltiples fuentes, facilitando el análisis y la toma de decisiones.
</details>

---

## Pregunta 2

¿Cuál de las siguientes situaciones representa mejor un uso de Business Intelligence?

a) Registrar el pago de una matrícula.

b) Actualizar el correo electrónico de un estudiante.

c) Analizar tendencias de matrícula por región durante los últimos cinco años. 

d) Modificar una contraseña institucional.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Business Intelligence se orienta al análisis de información para apoyar la toma de decisiones, no a la ejecución de operaciones diarias.
</details>

---

## Pregunta 3

¿Cuál es la principal diferencia entre un sistema OLTP y un Data Warehouse?

a) El OLTP almacena únicamente datos históricos.

b) El Data Warehouse reemplaza a las bases de datos operacionales.

c) El OLTP se orienta a transacciones y el Data Warehouse al análisis. 

d) El Data Warehouse sólo almacena información externa.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Los sistemas OLTP están diseñados para registrar operaciones diarias, mientras que los Data Warehouse están orientados al análisis y explotación de información.
</details>

---

## Pregunta 4

Una organización desea integrar información proveniente de distintas bases de datos, archivos y servicios web para generar reportes ejecutivos. ¿Cuál es el principal propósito de un Data Warehouse en este escenario?

a) Eliminar completamente las bases de datos operacionales.

b) Reemplazar los sistemas transaccionales.

c) Centralizar e integrar información para el análisis. 

d) Automatizar la creación de dashboards.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Un Data Warehouse permite consolidar información proveniente de múltiples fuentes para facilitar el análisis organizacional.
</details>

## Pregunta 5

¿Cuál de las siguientes características es propia de un sistema orientado al análisis?

a) Gran cantidad de inserciones y actualizaciones diarias.

b) Optimización para consultas complejas e históricas. 

c) Registro de transacciones en tiempo real.

d) Gestión de usuarios y permisos.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Los sistemas analíticos están optimizados para consultas complejas, agregaciones y análisis histórico de datos.
</details>

---

## Pregunta 6

Una empresa utiliza un Data Warehouse para analizar ventas históricas. ¿Cuál de las siguientes preguntas corresponde a un uso típico de esta plataforma?

a) ¿Cuál fue la última venta registrada hace cinco minutos?

b) ¿Qué usuario inició sesión hoy?

c) ¿Qué región presentó el mayor crecimiento de ventas durante los últimos tres años? 

d) ¿Cuál es la contraseña de un vendedor?

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Los Data Warehouse están orientados al análisis de tendencias, patrones y comportamiento histórico.
</details>

---

## Pregunta 7

¿Por qué normalmente no se recomienda ejecutar análisis complejos directamente sobre una base de datos operacional?

a) Porque no permite almacenar información.

b) Porque puede afectar el rendimiento de las operaciones diarias. 

c) Porque no admite consultas SQL.

d) Porque no utiliza tablas.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Consultas analíticas complejas pueden consumir recursos y afectar el funcionamiento normal de los sistemas transaccionales.
</details>

---

## Pregunta 8

¿Cuál de los siguientes objetivos se asocia más directamente a una solución de Business Intelligence?

a) Incrementar la velocidad de digitación de datos.

b) Reemplazar a los usuarios finales.

c) Apoyar la toma de decisiones mediante el análisis de información. 

d) Administrar redes computacionales.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). El propósito central de Business Intelligence es transformar datos en información útil para apoyar decisiones organizacionales.
</details>

--- 

## Pregunta 9

Una organización desea analizar ventas considerando producto, cliente, sucursal y tiempo. ¿Qué tabla debería contener las medidas numéricas del modelo dimensional?

a) Tabla de dimensiones

b) Tabla de hechos 

c) Tabla staging

d) Tabla operacional

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). La tabla de hechos almacena las medidas numéricas que serán analizadas, tales como ventas, cantidades o montos.
</details>

---

## Pregunta 10

¿Cuál de las siguientes opciones representa una medida dentro de un modelo dimensional?

a) Región

b) Producto

c) Fecha

d) Total de ventas 

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es d). Las medidas corresponden a valores numéricos que pueden ser agregados mediante operaciones como suma, promedio o conteo.
</details>

---

## Pregunta 11

¿Cuál de los siguientes elementos corresponde a una dimensión en un modelo estrella orientado al análisis de matrícula escolar?

a) Matrícula total

b) Cantidad de estudiantes

c) Región 

d) Promedio de matrícula

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Región representa una perspectiva desde la cual se analiza la información, por lo que corresponde a una dimensión.
</details>

---

## Pregunta 12

¿Cuál es una característica propia del modelo estrella?

a) Las dimensiones suelen estar desnormalizadas. 

b) Todas las tablas se encuentran en tercera forma normal.

c) No utiliza tablas de hechos.

d) Sólo puede tener dos dimensiones.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). En el modelo estrella las dimensiones suelen estar desnormalizadas para simplificar consultas y mejorar el rendimiento analítico.
</details>

---

## Pregunta 13

¿Cuál es la principal diferencia entre un modelo estrella y un modelo copo de nieve?

a) El modelo estrella no utiliza dimensiones.

b) El modelo copo de nieve normaliza algunas dimensiones. 

c) El modelo copo de nieve no posee tabla de hechos.

d) El modelo estrella sólo se utiliza en Power BI.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). El modelo copo de nieve incorpora normalización en algunas dimensiones, generando estructuras más complejas pero reduciendo redundancia.
</details>

---

## Pregunta 14

Una dimensión denominada "Territorio" almacena los atributos Región, Provincia y Comuna. ¿Cuál es el principal objetivo de esta dimensión?

a) Almacenar medidas numéricas.

b) Permitir analizar los datos desde una perspectiva geográfica. 

c) Registrar transacciones.

d) Reemplazar la tabla de hechos.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Las dimensiones proporcionan contexto descriptivo para analizar las medidas almacenadas en la tabla de hechos.
</details>

---

## Pregunta 15

Al diseñar un modelo dimensional, ¿qué elemento representa el fenómeno principal que la organización desea analizar?

a) Dimensión tiempo.

b) Dimensión producto.

c) Tabla de hechos. 

d) Tabla staging.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). La tabla de hechos representa el evento o fenómeno central del análisis y contiene las medidas que serán estudiadas.
</details>

---

## Pregunta 16

Una universidad construye un modelo dimensional para analizar deserción estudiantil. ¿Cuál de las siguientes alternativas corresponde a una combinación válida de tabla de hechos y dimensión?

a) Hecho: Región | Dimensión: Deserción

b) Hecho: Matrícula | Dimensión: Tiempo 

c) Hecho: Comuna | Dimensión: Estudiante

d) Hecho: Carrera | Dimensión: Matrícula

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). La matrícula corresponde a una medida o hecho analizable, mientras que tiempo representa una dimensión desde la cual se puede estudiar su comportamiento.
</details>

---

## Pregunta 17

Durante un proceso de integración de datos, una organización detecta que un mismo estudiante aparece registrado varias veces con pequeñas diferencias en la escritura de su nombre. ¿Qué problema de calidad de datos se observa principalmente?

a) Inconsistencia de formatos.

b) Duplicidad de registros. 

c) Falta de integridad referencial.

d) Ausencia de datos históricos.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). La duplicidad de registros ocurre cuando una misma entidad aparece representada más de una vez en la base de datos, generando errores en los análisis posteriores.
</details>

---

## Pregunta 18

¿Cuál es el principal propósito de una base de datos de staging dentro de una arquitectura de Business Intelligence?

a) Reemplazar al Data Warehouse.

b) Almacenar dashboards corporativos.

c) Servir como área temporal para preparar los datos antes de cargarlos al modelo analítico. 

d) Ejecutar consultas OLAP.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). La zona de staging actúa como un espacio intermedio donde los datos son recibidos, validados y transformados antes de ser incorporados al Data Warehouse.
</details>

---

## Pregunta 19

Una organización recibe datos desde archivos Excel, APIs y bases de datos relacionales. Antes de cargarlos al Data Warehouse, decide consolidarlos en una zona temporal. ¿Cuál es la principal ventaja de esta estrategia?

a) Reducir la cantidad de usuarios.

b) Evitar procesos ETL.

c) Facilitar la limpieza y validación de los datos. 

d) Eliminar la necesidad de un modelo dimensional.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). La zona de staging permite centralizar y preparar los datos provenientes de distintas fuentes antes de integrarlos al entorno analítico.
</details>

---

## Pregunta 20

¿Cuál de los siguientes ejemplos representa un problema de calidad de datos?

a) Una tabla posee clave primaria.

b) Una consulta devuelve resultados rápidamente.

c) Un mismo campo almacena fechas utilizando distintos formatos. 

d) Una dimensión posee varios atributos.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). La utilización de múltiples formatos para representar una misma información dificulta la integración y análisis de los datos.
</details>

---

## Pregunta 21

¿Por qué es importante corregir problemas de calidad de datos antes de construir un Data Warehouse?

a) Porque Power BI no permite visualizar datos incorrectos.

b) Porque los errores pueden propagarse hacia los análisis y la toma de decisiones. 

c) Porque SQL Server exige datos perfectos.

d) Porque reduce el tamaño de los dashboards.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Los errores de calidad presentes en los datos originales pueden afectar directamente los indicadores, reportes y conclusiones obtenidas posteriormente.
</details>

---

## Pregunta 22

Una institución detecta que algunos registros poseen valores nulos en campos obligatorios. ¿Qué dimensión de calidad de datos se encuentra comprometida principalmente?

a) Completitud. 

b) Consistencia.

c) Unicidad.

d) Trazabilidad.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). La completitud hace referencia a la existencia de todos los datos necesarios para representar correctamente una entidad o proceso.
</details>

---

## Pregunta 23

Una organización recibe diariamente un archivo con nuevos registros de estudiantes. El objetivo es agregar únicamente los registros que no existen previamente en la base de datos. ¿Qué tipo de carga es la más adecuada?

a) Carga completa.

b) Carga derivada.

c) Carga incremental. 

d) Carga multidimensional.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). La carga incremental incorpora únicamente los registros nuevos o modificados, evitando reprocesar toda la información histórica.
</details>

---

## Pregunta 24

¿Cuál es el principal objetivo de un proceso ETL?

a) Diseñar dashboards interactivos.

b) Construir cubos OLAP.

c) Extraer, transformar y cargar datos para su análisis. 

d) Administrar usuarios en SQL Server.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Los procesos ETL permiten integrar datos provenientes de distintas fuentes y prepararlos para su utilización en entornos analíticos.
</details>

---

## Pregunta 25

Durante una transformación ETL se crea una nueva columna denominada "Rango Edad" a partir de la edad de cada estudiante. ¿Qué tipo de transformación se está realizando?

a) Carga incremental.

b) Columna derivada. 

c) Integración referencial.

d) Agregación OLAP.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Una columna derivada corresponde a un nuevo atributo generado a partir de uno o más campos existentes.
</details>

---

## Pregunta 26

¿Cuál de las siguientes tareas corresponde principalmente a la fase de transformación dentro de un proceso ETL?

a) Conectarse a una API.

b) Insertar datos en una tabla destino.

c) Estandarizar formatos de fecha provenientes de distintas fuentes. 

d) Crear visualizaciones en Power BI.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). La transformación busca limpiar, corregir, estandarizar o enriquecer los datos antes de cargarlos al entorno analítico.
</details>

---

## Pregunta 27

Una empresa ejecuta diariamente un proceso ETL que elimina todos los registros de una tabla y luego vuelve a cargar la información completa. ¿Qué estrategia está utilizando?

a) Carga incremental.

b) Columna derivada.

c) Carga completa o ETL básico. 

d) Drill-down.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). En una carga completa se reprocesa y recarga la totalidad de los datos disponibles.
</details>

---

## Pregunta 28

¿Cuál es una ventaja de la carga incremental respecto de una carga completa?

a) Permite crear cubos OLAP automáticamente.

b) Reduce el volumen de datos procesados en cada ejecución. 

c) Elimina la necesidad de transformaciones.

d) No requiere claves de identificación.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). La carga incremental procesa únicamente los cambios ocurridos desde la última ejecución, optimizando recursos y tiempo.
</details>

---

## Pregunta 29

Una organización desea identificar qué registros fueron incorporados después de una fecha determinada para procesarlos en un ETL incremental. ¿Qué atributo resulta más útil para esta tarea?

a) Nombre del usuario.

b) Descripción del registro.

c) Fecha de creación o modificación. 

d) Color de la interfaz.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Los procesos incrementales suelen apoyarse en marcas temporales para identificar cambios recientes.
</details>

---

## Pregunta 30

¿Cuál de las siguientes situaciones justifica la utilización de una columna derivada?

a) Crear una nueva clasificación de estudiantes según su promedio académico. 

b) Conectarse a una base de datos SQL Server.

c) Exportar datos a Excel.

d) Procesar un cubo OLAP.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Las columnas derivadas permiten enriquecer los datos mediante nuevas categorías o atributos calculados.
</details>

---

## Pregunta 31

¿Qué ocurriría normalmente si una carga incremental se configura incorrectamente?

a) El dashboard deja de funcionar automáticamente.

b) Se pueden omitir registros nuevos o duplicar información. 

c) Se eliminan las dimensiones del modelo estrella.

d) Se convierte automáticamente en un cubo OLAP.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Un diseño incorrecto de la lógica incremental puede provocar pérdida de información o duplicación de registros.
</details>

---

## Pregunta 32

Durante el desarrollo del proyecto del curso, ¿cuál fue el principal propósito de implementar distintos tipos de ETL?

a) Aprender diseño gráfico para dashboards.

b) Comprender diferentes estrategias de integración y carga de datos. 

c) Reemplazar SQL Server.

d) Automatizar la creación de cubos OLAP.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Los ETL básico, derivado e incremental permiten abordar distintos escenarios reales de integración y preparación de datos para análisis.
</details>

---

## Pregunta 33

Durante el desarrollo de un proyecto de Business Intelligence, ¿cuál es el rol principal de SQL Server?

a) Diseñar dashboards interactivos.

b) Almacenar y administrar los datos utilizados por la solución BI. 

c) Crear visualizaciones avanzadas.

d) Publicar reportes en Power BI Service.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). SQL Server actúa como motor de base de datos, permitiendo almacenar, consultar y administrar la información utilizada en la solución analítica.
</details>

---

## Pregunta 34

¿Cuál de las siguientes herramientas se utilizó principalmente para administrar bases de datos, ejecutar consultas SQL y verificar resultados?

a) Power BI.

b) Pentaho.

c) SQL Server Management Studio (SSMS). 

d) Power Automate.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). SSMS es la herramienta utilizada para administrar bases de datos SQL Server y ejecutar consultas sobre ellas.
</details>

---

## Pregunta 35

Una estudiante necesita verificar que los datos cargados mediante un proceso ETL fueron almacenados correctamente en una tabla. ¿Qué acción sería la más apropiada?

a) Crear un dashboard.

b) Ejecutar una consulta SQL en SSMS. 

c) Procesar un cubo OLAP.

d) Crear una API.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Una consulta SQL permite revisar directamente el contenido de las tablas y validar los resultados del proceso de carga.
</details>

---

## Pregunta 36

¿Cuál fue el principal propósito de utilizar Visual Studio durante el curso?

a) Administrar usuarios de SQL Server.

b) Desarrollar procesos ETL y proyectos de Business Intelligence. 

c) Diseñar páginas web.

d) Administrar servicios de correo electrónico.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Visual Studio se utilizó para desarrollar procesos ETL y posteriormente para construir proyectos relacionados con Analysis Services.
</details>

---

## Pregunta 37

Si una tabla contiene millones de registros, ¿cuál de las siguientes consultas permite obtener rápidamente la cantidad total de filas almacenadas?

a) INSERT

b) UPDATE

c) COUNT(*) 

d) DELETE

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). La función COUNT permite contabilizar registros y es ampliamente utilizada para validar cargas de datos.
</details>

---

## Pregunta 38

Durante el proyecto del curso, ¿cuál era el propósito principal de la base de datos operacional o transaccional?

a) Almacenar el cubo OLAP.

b) Servir como repositorio inicial de los datos obtenidos desde distintas fuentes. 

c) Publicar dashboards.

d) Almacenar únicamente dimensiones.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). La base operacional recibe inicialmente los datos extraídos desde las distintas fuentes antes de su transformación y carga hacia estructuras analíticas.
</details>

---

## Pregunta 39

Una organización desea verificar que una tabla contiene únicamente registros únicos según un identificador determinado. ¿Qué concepto resulta más relevante para esta validación?

a) Clave primaria. 

b) Dashboard.

c) Medida OLAP.

d) Jerarquía.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Las claves primarias permiten identificar de manera única cada registro dentro de una tabla.
</details>

---

## Pregunta 40

¿Cuál de las siguientes afirmaciones describe mejor la relación entre SQL Server y Visual Studio en una solución BI?

a) Ambas herramientas cumplen exactamente la misma función.

b) SQL Server almacena los datos y Visual Studio permite desarrollar componentes de integración y análisis. 

c) Visual Studio reemplaza completamente a SQL Server.

d) SQL Server sólo se utiliza para crear dashboards.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). SQL Server actúa como plataforma de almacenamiento, mientras que Visual Studio permite desarrollar soluciones ETL y OLAP sobre dicha infraestructura.
</details>

---

## Pregunta 41

Una organización necesita obtener información desde un servicio web SOAP para incorporarla a su Data Warehouse. ¿Qué recurso permite conocer la estructura y operaciones disponibles del servicio?

a) CSV

b) JDBC

c) WSDL 

d) Dashboard

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). El archivo WSDL describe los servicios, operaciones, parámetros y formatos de intercambio utilizados por un servicio SOAP.
</details>

---

## Pregunta 42

¿Cuál fue el principal propósito de utilizar Pentaho Data Integration (PDI) durante el curso?

a) Diseñar dashboards interactivos.

b) Construir cubos OLAP.

c) Extraer, transformar e integrar datos desde diversas fuentes. 

d) Administrar usuarios de SQL Server.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Pentaho es una herramienta especializada en integración de datos y procesos ETL.
</details>

---

## Pregunta 43

¿Qué técnica resulta más apropiada cuando una organización necesita extraer información publicada en una página web que no dispone de una API oficial?

a) Replicación de bases de datos.

b) Web Scraping. 

c) Modelado dimensional.

d) OLAP.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). El Web Scraping permite capturar información directamente desde páginas web cuando no existe otro mecanismo formal de acceso.
</details>

---

## Pregunta 44

¿Cuál es una ventaja de consumir datos desde un servicio web mediante WSDL en comparación con Web Scraping?

a) Los datos suelen estar estructurados y definidos formalmente. 

b) No requiere conexión a Internet.

c) Elimina la necesidad de ETL.

d) No necesita validación de datos.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Los servicios SOAP normalmente entregan información estructurada y documentada, facilitando su integración.
</details>

---

## Pregunta 45

Durante una extracción mediante Web Scraping, ¿qué situación puede generar problemas en futuros procesos de carga?

a) Que la página modifique su estructura HTML. 

b) Que los datos estén en formato XML.

c) Que exista una tabla de hechos.

d) Que SQL Server tenga índices.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Los procesos de Web Scraping dependen de la estructura de la página web; cambios en ella pueden afectar la extracción.
</details>

---

## Pregunta 46

¿Cuál de las siguientes afirmaciones describe mejor una transformación ETL desarrollada en Pentaho?

a) Es un conjunto de pasos que permite extraer, transformar y cargar datos. 

b) Es una visualización de Power BI.

c) Es una jerarquía OLAP.

d) Es un dashboard corporativo.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Las transformaciones de Pentaho permiten construir flujos de integración de datos mediante distintos pasos conectados.
</details>

---

## Pregunta 47

Una organización obtiene datos meteorológicos desde un servicio web y posteriormente los almacena en SQL Server. ¿Qué etapa corresponde a la carga (Load) dentro del proceso ETL?

a) Conectarse al servicio web.

b) Transformar unidades de medida.

c) Insertar los datos en la base de datos destino. 

d) Diseñar el dashboard.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). La fase de carga consiste en almacenar los datos procesados en el sistema de destino.
</details>

---

## Pregunta 48

¿Cuál fue uno de los principales objetivos de los ejercicios desarrollados con Pentaho durante el curso?

a) Aprender administración de servidores Linux.

b) Integrar fuentes de datos externas dentro de una solución BI. 

c) Diseñar aplicaciones móviles.

d) Implementar redes neuronales.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Los ejercicios con Pentaho permitieron incorporar información externa mediante servicios web y Web Scraping para enriquecer los modelos analíticos.
</details>

---

## Pregunta 49

Una organización desea obtener diariamente la temperatura de una ciudad desde una API pública y almacenarla automáticamente en una base de datos. ¿Qué herramienta estudiada en el curso resulta especialmente adecuada para automatizar este proceso?

a) SQL Server Management Studio.

b) Power Automate. 

c) Analysis Services.

d) Excel.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Power Automate permite crear flujos automatizados que consumen información desde servicios externos y ejecutan acciones sin intervención manual.
</details>

---

## Pregunta 50

¿Cuál fue el principal objetivo de utilizar Power Automate durante el curso?

a) Construir cubos OLAP.

b) Crear modelos estrella.

c) Automatizar procesos de integración y consumo de datos desde servicios externos. 

d) Administrar bases de datos SQL Server.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Power Automate permite automatizar tareas repetitivas e integrar información proveniente de APIs y otros servicios digitales.
</details>

---

## Pregunta 51

¿Qué caracteriza a una API dentro de una solución de Business Intelligence?

a) Permite acceder programáticamente a información o servicios externos. 

b) Reemplaza completamente al Data Warehouse.

c) Almacena medidas y dimensiones.

d) Procesa cubos OLAP.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Las APIs proporcionan mecanismos estandarizados para acceder a datos o funcionalidades de sistemas externos.
</details>

---

## Pregunta 52

Una empresa desea capturar diariamente información publicada por un servicio meteorológico y cargarla automáticamente a SQL Server. ¿Cuál sería la secuencia más adecuada?

a) SQL Server → API → Dashboard.

b) Dashboard → API → Cubo OLAP.

c) API → Power Automate → SQL Server. 

d) Cubo OLAP → API → ETL.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). La API entrega los datos, Power Automate ejecuta el flujo automatizado y SQL Server almacena la información resultante.
</details>

---

## Pregunta 53

¿Cuál de las siguientes ventajas ofrece Power Automate respecto de ejecutar manualmente una tarea todos los días?

a) Elimina la necesidad de una base de datos.

b) Automatiza la ejecución periódica de procesos. 

c) Reemplaza a Power BI.

d) Convierte automáticamente datos en cubos OLAP.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Una de las principales ventajas de Power Automate es programar y ejecutar tareas de manera automática según una frecuencia definida.
</details>

---

## Pregunta 54

Durante el taller del curso, Power Automate fue utilizado para obtener información desde una API y posteriormente almacenarla en una estructura de datos. ¿Cuál era el propósito principal de este ejercicio?

a) Comprender cómo integrar fuentes externas mediante automatización. 

b) Diseñar modelos estrella.

c) Implementar jerarquías OLAP.

d) Administrar servidores SQL Server.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). El ejercicio buscaba demostrar cómo incorporar información externa a una solución BI mediante flujos automatizados de integración de datos.
</details>

---

## Pregunta 55

¿Cuál es el principal objetivo de un cubo OLAP dentro de una solución de Business Intelligence?

a) Registrar transacciones operacionales.

b) Facilitar el análisis multidimensional de los datos. 

c) Reemplazar las bases de datos relacionales.

d) Automatizar procesos ETL.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Los cubos OLAP están diseñados para optimizar consultas analíticas y permitir el análisis de información desde múltiples perspectivas.
</details>

---

## Pregunta 56

Una organización desea analizar matrícula por año, región y dependencia educativa. ¿Qué componente del cubo permite observar la información desde estas distintas perspectivas?

a) Medidas.

b) Dimensiones. 

c) Claves primarias.

d) Transformaciones ETL.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Las dimensiones proporcionan los distintos puntos de vista desde los cuales se analizan las medidas contenidas en el cubo.
</details>

---

## Pregunta 57

Dentro de un cubo OLAP, ¿cuál de los siguientes elementos corresponde a una medida?

a) Región.

b) Año.

c) Dependencia.

d) Matrícula total. 

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es d). Las medidas son valores numéricos que pueden ser agregados y analizados dentro del cubo.
</details>

---

## Pregunta 58

Un analista comienza observando la matrícula total por región y posteriormente profundiza hasta visualizar la información por comuna. ¿Qué operación OLAP está realizando?

a) Roll-up.

b) Pivot.

c) Drill-down. 

d) Slice.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). El Drill-down permite pasar desde niveles generales hacia niveles más detallados dentro de una jerarquía.
</details>

---

## Pregunta 59

¿Cuál de las siguientes jerarquías es consistente con un análisis territorial desarrollado durante el curso?

a) Región → Provincia → Comuna. 

b) Comuna → Región → País.

c) Matrícula → Región → Año.

d) Dashboard → Cubo → ETL.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Las jerarquías organizan los atributos de una dimensión desde niveles más generales hacia niveles más específicos.
</details>

---

## Pregunta 60

En el proyecto final del curso, ¿cuál fue el principal propósito de conectar Power BI al cubo OLAP?

a) Crear nuevas tablas de hechos.

b) Diseñar procesos ETL.

c) Consumir y visualizar información para responder preguntas de negocio. 

d) Reemplazar SQL Server.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Power BI actúa como herramienta de análisis y visualización, permitiendo explotar la información contenida en el cubo OLAP para apoyar la toma de decisiones.
</details>

---

## Pregunta 61

Una organización desea incorporar información desde una API, almacenarla en SQL Server, construir un cubo OLAP y visualizar resultados en Power BI. ¿Cuál es la secuencia más adecuada?

a) API → Dashboard → SQL Server → Cubo OLAP

b) API → ETL → SQL Server → Cubo OLAP → Power BI 

c) SQL Server → API → Power BI → Cubo OLAP

d) Cubo OLAP → ETL → Dashboard → SQL Server

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Esta secuencia representa una arquitectura BI típica: integración, almacenamiento, análisis y visualización.
</details>

---

## Pregunta 62

¿Qué operación OLAP permite filtrar una única dimensión del cubo?

a) Drill-down

b) Slice 

c) Roll-up

d) Pivot

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Slice consiste en seleccionar un valor específico de una dimensión para analizar una porción del cubo.
</details>

---

## Pregunta 63

¿Qué operación OLAP permite aplicar filtros simultáneos sobre múltiples dimensiones?

a) Roll-up

b) Slice

c) Dice 

d) Pivot

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Dice permite analizar subconjuntos específicos utilizando múltiples condiciones.
</details>

---

## Pregunta 64

¿Cuál es el propósito principal de una jerarquía dentro de una dimensión?

a) Crear nuevas medidas.

b) Facilitar la navegación entre distintos niveles de detalle. 

c) Reemplazar la tabla de hechos.

d) Almacenar datos históricos.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Las jerarquías permiten realizar operaciones como Drill-down y Roll-up.
</details>

---

## Pregunta 65

¿Qué operación OLAP corresponde al proceso inverso del Drill-down?

a) Slice

b) Dice

c) Roll-up 

d) Pivot

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Roll-up resume información pasando desde niveles detallados hacia niveles más generales.
</details>

---

## Pregunta 66

En Power BI, ¿qué visualización se utiliza habitualmente para mostrar un único indicador numérico relevante?

a) Tabla

b) Segmentador

c) Tarjeta (Card) 

d) Matriz

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Las tarjetas permiten destacar indicadores clave de forma simple y directa.
</details>

---

## Pregunta 67

¿Cuál es la principal función de un segmentador (Slicer) en Power BI?

a) Crear nuevas columnas.

b) Filtrar interactivamente la información mostrada. 

c) Construir cubos OLAP.

d) Ejecutar procesos ETL.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Los segmentadores permiten al usuario filtrar dinámicamente los datos visualizados.
</details>

---

## Pregunta 68

¿Qué ventaja ofrece una jerarquía utilizada dentro de un gráfico de Power BI?

a) Permite realizar Drill-down sobre la visualización. 

b) Incrementa automáticamente la calidad de los datos.

c) Sustituye la tabla de hechos.

d) Elimina la necesidad de dimensiones.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Las jerarquías permiten navegar entre distintos niveles de detalle directamente desde los gráficos.
</details>

---

## Pregunta 69

¿Cuál es una diferencia importante entre una base operacional y un Data Warehouse?

a) El Data Warehouse integra información proveniente de múltiples fuentes. 

b) La base operacional almacena únicamente datos históricos.

c) El Data Warehouse no utiliza SQL.

d) La base operacional reemplaza a los cubos OLAP.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Los Data Warehouse están diseñados para consolidar información proveniente de diversos sistemas.
</details>

---

## Pregunta 70

¿Cuál es el principal riesgo de trabajar con datos de baja calidad en un proyecto BI?

a) Aumentar la velocidad de procesamiento.

b) Obtener conclusiones incorrectas. 

c) Mejorar el rendimiento del dashboard.

d) Simplificar los ETL.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Datos incorrectos generan análisis y decisiones incorrectas.
</details>

---

## Pregunta 71

¿Qué elemento conecta normalmente una tabla de hechos con una dimensión?

a) Una medida.

b) Una clave foránea. 

c) Un dashboard.

d) Una jerarquía.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Las claves foráneas permiten relacionar hechos con dimensiones.
</details>

---

## Pregunta 72

¿Por qué se recomienda utilizar una zona de staging antes del Data Warehouse?

a) Para publicar dashboards.

b) Para construir cubos OLAP.

c) Para validar y preparar los datos antes de integrarlos. 

d) Para reemplazar SQL Server.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). El staging permite realizar procesos de limpieza y transformación previos.
</details>

---

## Pregunta 73

¿Cuál de los siguientes escenarios justifica el uso de una carga incremental?

a) Recargar completamente una tabla cada noche.

b) Incorporar únicamente los registros nuevos desde la última ejecución. 

c) Crear dimensiones.

d) Diseñar dashboards.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). La carga incremental optimiza recursos procesando sólo los cambios.
</details>

---

## Pregunta 74

¿Qué característica distingue a una API respecto de Web Scraping?

a) Las APIs entregan información mediante interfaces estructuradas. 

b) Las APIs requieren HTML.

c) Las APIs sólo funcionan con Power BI.

d) Las APIs no permiten automatización.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Las APIs proporcionan acceso formal y estructurado a la información.
</details>

---

## Pregunta 75

¿Cuál fue uno de los principales beneficios de utilizar Power Automate durante el curso?

a) Automatizar la captura periódica de datos desde servicios externos. 

b) Construir modelos estrella.

c) Crear cubos OLAP.

d) Reemplazar SQL Server.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Power Automate facilita la automatización de procesos repetitivos de integración de datos.
</details>

---

## Pregunta 76

¿Qué herramienta fue utilizada para consumir servicios SOAP mediante WSDL?

a) Power BI.

b) Pentaho Data Integration. 

c) SSMS.

d) Excel.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Pentaho fue utilizado para conectarse y consumir información desde servicios SOAP.
</details>

---

## Pregunta 77

¿Cuál es el principal propósito de SQL Server Analysis Services (SSAS)?

a) Diseñar dashboards.

b) Gestionar correos electrónicos.

c) Construir modelos analíticos y cubos OLAP. 

d) Ejecutar Web Scraping.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). SSAS permite desarrollar soluciones analíticas multidimensionales.
</details>

---

## Pregunta 78

¿Qué elemento de una arquitectura BI es consumido directamente por Power BI en la Evaluación 3 del curso?

a) API pública.

b) Zona de staging.

c) Cubo OLAP. 

d) Servicio WSDL.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). En la tercera evaluación el dashboard se construye utilizando como fuente de datos el cubo OLAP.
</details>

---

## Pregunta 79

¿Por qué es importante que las preguntas de negocio definidas inicialmente guíen el diseño del cubo y del dashboard?

a) Porque permiten mantener la coherencia del proyecto. 

b) Porque simplifican SQL Server.

c) Porque reemplazan las dimensiones.

d) Porque eliminan los procesos ETL.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Las preguntas de negocio justifican el diseño de la solución analítica y orientan su construcción.
</details>

---

## Pregunta 80

¿Cuál es el objetivo final de una solución de Business Intelligence?

a) Diseñar modelos relacionales complejos.

b) Automatizar exclusivamente procesos ETL.

c) Transformar datos en información útil para apoyar decisiones. 

d) Reemplazar todas las bases de datos operacionales.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). El propósito central de BI es convertir datos en conocimiento útil para la toma de decisiones organizacionales.
</details>

---

## Pregunta 81

¿Cuál es la principal diferencia entre un Data Warehouse y un Data Mart?

a) El Data Warehouse almacena únicamente datos estructurados.

b) El Data Mart está orientado a necesidades específicas de un área de negocio. 

c) El Data Mart reemplaza al Data Warehouse.

d) El Data Warehouse sólo puede utilizarse en grandes empresas.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Un Data Mart se enfoca en necesidades particulares de un departamento o unidad de negocio, mientras que un Data Warehouse busca una visión organizacional integrada.
</details>

---

## Pregunta 82

¿Cuál es el principal objetivo de un Data Lake?

a) Almacenar únicamente datos históricos resumidos.

b) Almacenar datos en su formato original, independientemente de su estructura. 

c) Reemplazar todos los procesos ETL.

d) Ejecutar consultas OLAP.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Un Data Lake permite almacenar datos estructurados, semiestructurados y no estructurados en su formato nativo.
</details>

---

## Pregunta 83

¿Qué problema describe el concepto de Data Swamp?

a) Un Data Warehouse con exceso de índices.

b) Un repositorio de datos sin organización ni gobernanza adecuada. 

c) Una base de datos transaccional lenta.

d) Un cubo OLAP mal diseñado.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Un Data Swamp surge cuando un Data Lake pierde organización y control, dificultando el acceso y uso de la información.
</details>

---

## Pregunta 84

¿Cuál es el propósito principal de una arquitectura Lakehouse?

a) Eliminar completamente los Data Warehouse.

b) Combinar características de Data Lake y Data Warehouse. 

c) Sustituir los cubos OLAP.

d) Automatizar Power BI.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). El modelo Lakehouse busca combinar la flexibilidad de un Data Lake con las capacidades analíticas de un Data Warehouse.
</details>

---

## Pregunta 85

¿Cuál de los siguientes ejemplos corresponde a un dato no estructurado?

a) Tabla de ventas en SQL Server.

b) Archivo CSV.

c) Imagen médica almacenada en formato digital. 

d) Tabla de clientes.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Las imágenes, videos y documentos multimedia son ejemplos típicos de datos no estructurados.
</details>

---

## Pregunta 86

¿Cuál es una característica propia de los datos estructurados?

a) Carecen de esquema definido.

b) Se organizan mediante tablas y relaciones predefinidas. 

c) Sólo pueden almacenarse en Data Lakes.

d) No permiten consultas.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Los datos estructurados se organizan siguiendo esquemas formales que facilitan su consulta y gestión.
</details>

---

## Pregunta 87

¿Qué busca garantizar la integridad referencial?

a) Que todas las medidas sean numéricas.

b) Que las relaciones entre tablas sean consistentes. 

c) Que los dashboards sean interactivos.

d) Que los ETL sean incrementales.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). La integridad referencial evita referencias a registros inexistentes dentro de una base de datos.
</details>

---

## Pregunta 88

¿Cuál de las siguientes situaciones representa una violación de integridad referencial?

a) Una dimensión contiene atributos descriptivos.

b) Una tabla de hechos referencia una clave inexistente en una dimensión. 

c) Un dashboard contiene tres gráficos.

d) Una tabla posee clave primaria.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Las claves foráneas deben apuntar a registros válidos para mantener la consistencia del modelo.
</details>

---

## Pregunta 89

¿Qué describe una dependencia funcional?

a) Una relación donde un atributo determina el valor de otro. 

b) Una conexión entre Power BI y SQL Server.

c) Una relación entre ETL y OLAP.

d) Una operación de Web Scraping.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Una dependencia funcional indica que el valor de un atributo determina de forma única el valor de otro.
</details>

---

## Pregunta 90

¿Cuál es el propósito principal de la normalización en bases de datos relacionales?

a) Incrementar la redundancia.

b) Eliminar redundancias y reducir anomalías. 

c) Construir cubos OLAP.

d) Crear dashboards.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). La normalización organiza los datos para evitar duplicidades y mejorar la consistencia.
</details>

---

## Pregunta 91

¿Qué operación OLAP permite combinar múltiples filtros simultáneamente?

a) Roll-up.

b) Drill-down.

c) Dice. 

d) Pivot.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Dice permite filtrar el cubo utilizando varias dimensiones al mismo tiempo.
</details>

---

## Pregunta 92

¿Cuál es el objetivo de una operación Roll-up?

a) Incrementar el nivel de detalle.

b) Resumir información en niveles superiores de una jerarquía. 

c) Crear nuevas dimensiones.

d) Construir medidas.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Roll-up agrupa la información en niveles más generales.
</details>

---

## Pregunta 93

Una organización desea descubrir patrones ocultos en millones de registros históricos. ¿Qué disciplina se asocia más directamente con este objetivo?

a) Data Mining. 

b) Web Scraping.

c) ETL.

d) WSDL.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Data Mining busca descubrir patrones, tendencias y relaciones ocultas en grandes volúmenes de datos.
</details>

---

## Pregunta 94

¿Cuál de las siguientes afirmaciones describe mejor la relación entre BI y Data Mining?

a) Son exactamente lo mismo.

b) Data Mining puede complementar procesos de BI mediante descubrimiento de patrones. 

c) BI reemplaza completamente a Data Mining.

d) Data Mining sólo trabaja con datos no estructurados.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Data Mining amplía las capacidades analíticas de BI mediante técnicas de descubrimiento de conocimiento.
</details>

---

## Pregunta 95

¿Cuál es una ventaja de los sistemas OLAP respecto de OLTP?

a) Permiten registrar transacciones más rápidamente.

b) Están optimizados para análisis multidimensional. 

c) Eliminan la necesidad de ETL.

d) Sustituyen a las bases operacionales.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Los sistemas OLAP están diseñados para consultas analíticas complejas y exploración multidimensional.
</details>

---

## Pregunta 96

¿Qué componente proporciona el contexto descriptivo dentro de un cubo OLAP?

a) Medidas.

b) Dimensiones. 

c) ETL.

d) Claves primarias.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Las dimensiones permiten interpretar y analizar las medidas desde distintas perspectivas.
</details>

---

## Pregunta 97

¿Cuál es una diferencia importante entre BI y Machine Learning?

a) BI se enfoca principalmente en comprender información para apoyar decisiones, mientras ML busca construir modelos predictivos. 

b) BI utiliza algoritmos y ML no.

c) ML sólo trabaja con bases relacionales.

d) BI reemplaza a ML.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). BI tiene una orientación principalmente descriptiva y analítica, mientras Machine Learning enfatiza la predicción y automatización.
</details>

---

## Pregunta 98

¿Qué herramienta estudiada en el curso permitió automatizar procesos sin necesidad de programación compleja?

a) SSMS.

b) Power Automate. 

c) SSAS.

d) WSDL.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Power Automate permite crear flujos automatizados mediante conectores y acciones predefinidas.
</details>

---

## Pregunta 99

¿Qué ventaja ofrece un Web Service respecto de Web Scraping?

a) Entrega información estructurada y estable para consumo automatizado. 

b) Requiere interpretar HTML.

c) Depende del diseño visual del sitio web.

d) No utiliza formatos estructurados.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Los Web Services están diseñados específicamente para el intercambio automatizado de información.
</details>

---

## Pregunta 100

¿Cuál es el objetivo final de una arquitectura de Inteligencia de Negocios?

a) Centralizar únicamente datos históricos.

b) Diseñar bases de datos normalizadas.

c) Transformar datos en información útil para apoyar decisiones organizacionales. 

d) Reemplazar todas las aplicaciones operacionales.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). La finalidad de BI es convertir datos en conocimiento que apoye la toma de decisiones.
</details>

---

## Pregunta 101

¿Cuál es la principal diferencia entre la Inteligencia de Negocios (BI) y el Aprendizaje Automático (Machine Learning) en términos de su perspectiva temporal?

a) Ambas disciplinas tienen el mismo enfoque temporal y solo se diferencian en las herramientas tecnológicas utilizadas.

b) BI analiza datos históricos y actuales, mientras que Machine Learning predice resultados futuros basándose en modelos entrenados. 

c) BI trabaja exclusivamente con datos futuros, mientras que Machine Learning utiliza únicamente datos históricos.

d) BI y Machine Learning se enfocan exclusivamente en la automatización de procesos operacionales.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). La Inteligencia de Negocios tiene un enfoque principalmente descriptivo, orientado al análisis del pasado y del presente para apoyar la toma de decisiones. Por su parte, Machine Learning utiliza datos históricos para entrenar modelos capaces de realizar predicciones sobre eventos futuros.
</details>

---

## Pregunta 102

En el contexto de la gestión de datos, ¿qué caracteriza fundamentalmente a un Data Lake en comparación con un Data Warehouse?

a) Está diseñado exclusivamente para almacenar datos estructurados provenientes de sistemas ERP.

b) Adopta un enfoque de "esquema en lectura" (Schema-on-Read), donde los datos se estructuran únicamente al momento de ser analizados. 

c) Es un modelo jerárquico que elimina la necesidad de procesos de gobernanza de datos.

d) Requiere un esquema predefinido antes de poder almacenar cualquier tipo de información.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Una de las principales características de un Data Lake es que permite almacenar datos en su formato original (estructurados, semiestructurados o no estructurados), aplicando la estructura únicamente cuando los datos son utilizados para análisis. Este enfoque se conoce como Schema-on-Read. En contraste, los Data Warehouse utilizan generalmente un enfoque de Schema-on-Write, donde la estructura se define antes de almacenar los datos.
</details>

---

## Pregunta 103 

¿Cuál es una diferencia importante entre un modelo relacional normalizado y un modelo estrella utilizado en Business Intelligence?

a) El modelo estrella elimina completamente las relaciones entre tablas.

b) El modelo relacional busca reducir redundancias mediante normalización, mientras que el modelo estrella prioriza el rendimiento analítico. 

c) El modelo estrella sólo puede utilizarse en Power BI.

d) El modelo relacional no utiliza claves primarias.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Los modelos relacionales suelen normalizar los datos para reducir redundancias y mantener consistencia. En cambio, los modelos estrella utilizados en Business Intelligence privilegian consultas analíticas eficientes, aceptando cierto nivel de desnormalización en las dimensiones.
</details>

---

## Pregunta 104

Dentro del modelado multidimensional, ¿cuál es la función principal de las tablas de dimensiones?

a) Eliminar la necesidad de claves foráneas en el diseño del Data Warehouse.

b) Proporcionar el contexto descriptivo necesario para segmentar y filtrar las métricas analizadas. 

c) Almacenar métricas cuantitativas densas como ventas, ingresos o cantidades.

d) Actuar como repositorios temporales durante el proceso ETL.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Las tablas de dimensiones contienen atributos descriptivos como tiempo, producto, cliente o región, que permiten interpretar, segmentar y analizar las medidas almacenadas en la tabla de hechos. Gracias a ellas es posible realizar filtros, agrupaciones y análisis multidimensionales.
</details>

---

## Pregunta 105

Durante la implementación de una carga incremental en SSIS, se utiliza un componente Merge Join para comparar registros provenientes de dos conjuntos de datos. ¿Por qué es necesario ordenar previamente ambas entradas?

a) Para reducir el espacio ocupado por la base de datos destino.

b) Porque el componente Merge Join requiere que ambas entradas estén ordenadas para poder comparar correctamente los registros. 

c) Porque el ordenamiento elimina automáticamente todos los registros duplicados.

d) Porque permite convertir automáticamente los datos a formato relacional.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). El componente Merge Join de SSIS exige que las entradas se encuentren previamente ordenadas utilizando el mismo criterio. Esto permite comparar registros de forma eficiente y realizar procesos como cargas incrementales o detección de cambios.
</details>

---

## Pregunta 106

¿Qué operación OLAP permite al usuario pasar de una vista resumida a una más detallada, como navegar desde "Región" hasta "Comuna"?

a) Roll-up

b) Pivot

c) Slice

d) Drill-down 

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es d). La operación Drill-down permite desglosar la información y navegar desde niveles más generales hacia niveles más específicos dentro de una jerarquía. Por ejemplo, pasar desde Región a Provincia o desde Provincia a Comuna.
</details>

---

## Pregunta 107

Al extraer datos desde un Web Service utilizando Pentaho Data Integration (PDI), ¿cuál es el propósito de configurar una ruta XPath en el componente Get Data from XML?

a) Identificar la jerarquía de etiquetas necesaria para llegar al nivel donde residen los datos que se desean capturar. 

b) Definir la URL de conexión hacia el servidor de base de datos remoto.

c) Encriptar el contenido XML antes de procesarlo.

d) Distribuir automáticamente los datos entre múltiples destinos de salida.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es a). Los documentos XML poseen una estructura jerárquica compuesta por etiquetas anidadas. XPath permite especificar la ruta que debe seguir Pentaho para localizar los elementos que contienen la información requerida y convertirlos posteriormente en registros estructurados.
</details>

---

## Pregunta 108

¿Cuál es una de las mayores complejidades del Web Scraping en comparación con el uso de Web Services?

a) Los navegadores modernos prohíben la captura de código fuente mediante herramientas ETL.

b) La alta fragilidad del proceso, ya que depende de la estructura HTML del sitio, la cual puede cambiar y romper el flujo. 

c) El Web Scraping solo permite extraer datos numéricos, mientras que los Web Services extraen texto.

d) El Web Scraping requiere obligatoriamente una conexión VPN a una base de datos Oracle.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Una de las principales limitaciones del Web Scraping es que depende de la estructura HTML de la página web. Si el sitio modifica sus etiquetas, identificadores o estructura visual, el proceso de extracción puede dejar de funcionar. Por el contrario, los Web Services suelen ofrecer interfaces más estables y documentadas para el intercambio automatizado de información.
</details>

---

## Pregunta 109

En Power Automate, ¿qué elemento se encarga de definir el evento que inicia la ejecución de un flujo?

a) Conector

b) Acción

c) Condición

d) Trigger (Disparador) 

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es d). El Trigger o Disparador es el componente encargado de detectar el evento que inicia la ejecución del flujo. Este evento puede corresponder a una hora programada, la recepción de un correo electrónico, la publicación de un registro o cualquier otra condición configurada por el usuario.
</details>

---

## Pregunta 110

¿Qué problema estructural de los datos en las organizaciones resuelve principalmente la etapa de Transformación dentro de un proceso ETL?

a) La falta de espacio físico en los servidores de la organización.

b) La inconsistencia y escasa utilidad analítica de los datos provenientes de sistemas operacionales. 

c) La limitación para conectar múltiples usuarios simultáneamente a un archivo Excel.

d) La necesidad de realizar copias de seguridad periódicas de las bases de datos.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). La etapa de transformación busca limpiar, estandarizar y enriquecer los datos provenientes de distintas fuentes. Gracias a este proceso, la información adquiere consistencia y valor analítico, permitiendo su utilización en Data Warehouse, cubos OLAP y dashboards.
</details>

---

## Pregunta 111

Una organización posee información distribuida en Excel, SQL Server y servicios web. Cada área genera reportes distintos y frecuentemente obtiene resultados contradictorios. ¿Qué problema busca resolver principalmente una arquitectura de Business Intelligence?

a) Incrementar la velocidad de digitación de datos.

b) Centralizar e integrar la información para disponer de una única versión de la verdad. 

c) Eliminar la necesidad de bases de datos.

d) Reemplazar completamente los sistemas operacionales.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Uno de los objetivos centrales de BI es integrar información proveniente de distintas fuentes para generar análisis consistentes y confiables.
</details>

---

## Pregunta 112

Una organización desea incorporar información desde una API meteorológica. Los datos cambian diariamente y se utilizarán en dashboards ejecutivos. ¿Cuál es la estrategia más adecuada?

a) Realizar Web Scraping diariamente.

b) Consumir la API mediante un proceso automatizado y almacenar los resultados en SQL Server. 

c) Ingresar los datos manualmente en Excel.

d) Conectar Power BI directamente a la API sin almacenar historial.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). El almacenamiento histórico permite analizar tendencias y mantener consistencia en los análisis.
</details>

---

## Pregunta 113

Una empresa dispone de un modelo estrella correctamente implementado. Sin embargo, los usuarios no logran responder las preguntas de negocio definidas inicialmente. ¿Cuál es la causa más probable?

a) El modelo fue construido en SQL Server.

b) Las dimensiones y medidas no fueron diseñadas considerando los requerimientos analíticos. 

c) El Data Warehouse contiene demasiados registros.

d) El dashboard posee pocos colores.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Un modelo dimensional debe diseñarse a partir de las preguntas de negocio que pretende responder.
</details>

---

## Pregunta 114

¿Por qué normalmente se recomienda separar los sistemas OLTP de los sistemas OLAP?

a) Porque utilizan lenguajes de programación distintos.

b) Porque poseen objetivos y patrones de uso diferentes. 

c) Porque los sistemas OLTP no utilizan bases de datos.

d) Porque los sistemas OLAP no admiten consultas SQL.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Los sistemas transaccionales priorizan operaciones rápidas y concurrentes, mientras que los analíticos optimizan consultas complejas sobre grandes volúmenes de información.
</details>

---

## Pregunta 115

Un equipo construye un dashboard visualmente atractivo, pero los indicadores muestran valores inconsistentes respecto de las fuentes originales. ¿Qué etapa del proceso BI debería revisarse primero?

a) Diseño gráfico.

b) ETL y calidad de datos. 

c) Publicación en Power BI Service.

d) Configuración del navegador web.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Los problemas de calidad de datos suelen propagarse hacia todas las capas analíticas posteriores.
</details>

---

## Pregunta 116

¿Cuál es el principal riesgo de construir un cubo OLAP sobre datos que no han sido adecuadamente transformados?

a) El cubo ocupará menos espacio.

b) Las consultas serán más rápidas.

c) Los análisis y decisiones podrían basarse en información incorrecta. 

d) Power BI dejará de funcionar.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). Un cubo OLAP amplifica el valor de los datos, pero también amplifica los errores presentes en ellos.
</details>

---

## Pregunta 117

Una organización necesita responder preguntas estratégicas que cambian constantemente según las necesidades de los directivos. ¿Qué característica de OLAP resulta especialmente valiosa en este contexto?

a) La capacidad de registrar transacciones.

b) La exploración multidimensional flexible de los datos. 

c) El almacenamiento de archivos multimedia.

d) La automatización de correos electrónicos.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). OLAP permite analizar la información desde distintas perspectivas sin necesidad de rediseñar continuamente las bases de datos.
</details>

---

## Pregunta 118

¿Cuál es la principal ventaja de construir un Data Warehouse antes de crear dashboards corporativos?

a) Permite utilizar más colores en los reportes.

b) Facilita disponer de información integrada, consistente e histórica. 

c) Elimina la necesidad de ETL.

d) Sustituye a Power BI.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Los dashboards son tan confiables como los datos sobre los que se construyen.
</details>

---

## Pregunta 119

Una organización utiliza Web Scraping para capturar precios de productos desde sitios web externos. ¿Qué riesgo debería monitorear permanentemente?

a) Que aumente el tamaño del monitor.

b) Que cambie la estructura HTML del sitio origen. 

c) Que SQL Server cambie de versión.

d) Que Power BI actualice automáticamente los gráficos.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). La dependencia de la estructura HTML hace que los procesos de Web Scraping sean especialmente sensibles a cambios externos.
</details>

---

## Pregunta 120

¿Cuál de las siguientes afirmaciones resume mejor el propósito global de una solución de Inteligencia de Negocios?

a) Automatizar exclusivamente la captura de datos.

b) Reemplazar las bases de datos operacionales.

c) Transformar datos dispersos en conocimiento útil para apoyar decisiones organizacionales. 

d) Diseñar dashboards visualmente atractivos.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es c). La Inteligencia de Negocios integra tecnologías, procesos y análisis para convertir datos en información útil para la toma de decisiones.
</details>

---

## Pregunta 121

Una organización dispone de dashboards, cubos OLAP y procesos ETL correctamente implementados. Sin embargo, los directivos continúan tomando decisiones basadas únicamente en intuición. ¿Cuál es el principal problema?

a) La arquitectura BI está incompleta.

b) Existe una baja adopción de la cultura de toma de decisiones basada en datos. 

c) El Data Warehouse tiene demasiados registros.

d) Los ETL deberían ejecutarse con mayor frecuencia.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Una solución BI genera valor cuando la información es utilizada efectivamente en la toma de decisiones organizacionales.
</details>

---

## Pregunta 122

Un directivo cuestiona el valor mostrado en un dashboard. ¿Qué capacidad resulta más importante para verificar el origen del dato?

a) Visualización interactiva.

b) Trazabilidad de los datos. 

c) Drill-down.

d) Pivot.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). La trazabilidad permite identificar el origen, las transformaciones y el recorrido de los datos dentro de la solución BI.
</details>

---

## Pregunta 123

¿Cuál de las siguientes herramientas resulta más adecuada para automatizar la captura periódica de información desde una API REST sin necesidad de programación compleja?

a) SSMS.

b) Power Automate. 

c) SSAS.

d) Power BI.

<details>
<summary>Ver respuesta y retroalimentación</summary>

La respuesta correcta es b). Power Automate está diseñado para automatizar flujos de trabajo e integración entre servicios.
</details>


