Este resumen detalla el proceso de **extracción de datos desde un Web Service** utilizando la herramienta **Pentaho Data Integration (PDI)**, según lo explicado en las nuevas fuentes. El ejercicio se enfoca en obtener información pública de la Cámara de Diputados de Brasil mediante el lenguaje WSDL.

### 1. Conceptos Fundamentales
*   **WSDL (Web Services Description Language):** Es un lenguaje basado en **XML** que permite describir los servicios que ofrece un sitio web y cómo conectarse a ellos,.
*   **Pentaho Data Integration (PDI):** Al igual que SSIS (mencionado en conversaciones previas como "data tools"), permite ejecutar tareas y proyectos de transformación de datos mediante un flujo lógico de "cajitas" o pasos.

### 2. Configuración de la Extracción
El proceso comienza conectándose al servicio web mediante el componente **Web Services Lookup**:
*   Se ingresa la **URL del WSDL** y se cargan las opciones disponibles,.
*   Se selecciona un servicio específico del menú (en el ejemplo, "obterDeputados") para rescatar la información de los diputados.
*   Al realizar un *preview* inicial, el sistema captura toda la información del sitio web en una sola fila en formato **XML**.

### 3. Transformación y Limpieza (Parseo de XML)
Para procesar el bloque de datos XML, se utiliza el componente **Get data from XML**:
*   **Mapeo de la ruta:** Es necesario indicarle al sistema la jerarquía de las etiquetas (tags) para llegar al dato deseado (ej. de la etiqueta plural `deputados` a la etiqueta singular `deputado`),.
*   **Selección de campos:** El instructor elige "robar" (extraer) específicamente el **teléfono** (`phone`) y el **correo electrónico** (`email`) de cada registro.
*   **Formatos:** Se recomienda capturar los datos inicialmente como **String** (texto) para evitar errores y facilitar su manipulación posterior en una base de datos.

### 4. Carga y Salida (Output)
Una vez transformados, los datos se pueden enviar a diferentes destinos:
*   **Excel o Archivo de Texto:** El flujo se puede dirigir a un archivo de Excel (llamado "aylin" en el ejemplo) o a un archivo de texto plano separado por punto y coma (llamado "agustin"),.
*   **Filtrado de campos finales:** En la configuración de salida, es fundamental **eliminar el campo original que contiene todo el XML** y conservar únicamente las columnas procesadas (teléfono y correo) para que el archivo final sea limpio,.

### 5. Ejecución y Verificación
El proceso finaliza ejecutando la transformación. El sistema muestra métricas de cuánto tardó y cuántos registros se procesaron (por ejemplo, 513 registros extraídos),. El resultado exitoso se verifica abriendo los archivos generados en el escritorio, donde los datos aparecen correctamente tabulados y listos para su uso.

Para definir la ruta XML y extraer los datos correctamente en Pentaho Data Integration (PDI), se debe seguir la **jerarquía de las etiquetas** (tags) del documento, funcionando de manera similar a cómo abren y cierran los paréntesis o llaves en programación,.

Los pasos específicos detallados en las fuentes son los siguientes:

*   **Identificar la jerarquía:** Los datos suelen estar organizados en una estructura de etiquetas donde una etiqueta general contiene a otras más específicas. Por ejemplo, en el caso de la Cámara de Diputados de Brasil, existe una etiqueta plural llamada `deputados` y, dentro de ella, etiquetas individuales en singular llamadas `deputado` para cada registro.
*   **Establecer la ruta completa:** En el componente **"Get data from XML"**, es necesario señalar el camino exacto desde el resultado del servicio hasta el nivel donde se encuentra la información de interés. En el ejemplo del video, la ruta se define como:
    1.  `ObterDeputadosResult` (la raíz del resultado del servicio).
    2.  `deputados` (la etiqueta plural).
    3.  `deputado` (la etiqueta singular).
*   **Seleccionar el nivel de captura:** Es fundamental llegar hasta la etiqueta en **singular** (`deputado`), ya que es dentro de esta etiqueta donde residen los datos específicos que se desean extraer, como el teléfono o el correo electrónico,.

Una vez definida esta ruta, el sistema podrá identificar cada registro individual y procesar los campos específicos contenidos en ese nivel de la jerarquía.

En el contexto de **Pentaho Data Integration (PDI)**, específicamente al configurar el componente **"Get data from XML"**, la distinción entre capturar un nodo o un atributo es técnica y depende de cómo esté estructurada la información en el archivo XML que se desea procesar, las diferencias principales son:

*   **Capturar un Nodo:** En el ejemplo del video, se especifica que elementos como el teléfono (`phone`) y el correo electrónico (`email`) son tratados como **nodos**, no como atributos. Al capturar un nodo, el objetivo es extraer el **valor del nodo**, es decir, el dato real o contenido que está almacenado dentro de esa etiqueta específica (por ejemplo, la dirección de correo electrónico en sí). El instructor enfatiza que no se busca el nombre de la variable, sino su contenido.
*   **Capturar un Atributo:** Aunque las fuentes no profundizan en la definición técnica de un atributo, aclaran que en este flujo de trabajo para la Cámara de Diputados de Brasil **no se están utilizando atributos**. En términos generales de XML (aunque no detallado exhaustivamente en la fuente), un atributo es una propiedad que reside *dentro* de la etiqueta de apertura (ej. `<deputado id="123">`), mientras que el nodo es la estructura completa o el contenido entre etiquetas,.

**Consideraciones adicionales al extraer datos:**
*   **Jerarquía:** Para llegar a estos nodos, es obligatorio definir primero la **ruta lógica** a través de las etiquetas (ej. `deputados` > `deputado`), similar a cómo se manejan paréntesis o llaves en programación.
*   **Formato de salida:** Al capturar estos nodos (como el correo o el celular), se recomienda extraerlos inicialmente como formato **String** (texto) para facilitar su manipulación posterior y evitar errores de formato en la base de datos o archivos finales como Excel,.

Al utilizar múltiples destinos en Pentaho Data Integration (PDI) para un mismo flujo de datos, el comportamiento predeterminado es la **distribución de los registros**, lo que significa que el total de los datos se reparte entre los distintos destinos en lugar de duplicarse en cada uno.

Los detalles específicos sobre cómo ocurre esta distribución según las fuentes son:

*   **División equitativa:** El sistema divide el total de registros capturados entre el número de salidas configuradas. Por ejemplo, en el ejercicio del video, se procesaron un total de **513 registros**. Al enviarlos simultáneamente a un archivo de Excel y a uno de texto plano, el sistema envió **257 registros a un destino y 256 al otro**.
*   **Suma del total:** La suma de los registros recibidos por todos los destinos debe ser igual al número total de registros que salieron del paso anterior (la transformación de datos).
*   **Configuración del flujo:** Esta distribución ocurre cuando se conectan varias flechas de salida desde una misma "cajita" o componente de transformación hacia diferentes componentes de salida (como Excel Output y Text File Output).

> En resumen, bajo esta configuración, cada registro se envía a **un solo destino**, repartiendo la carga de datos entre todos los archivos o bases de datos finales configurados.

En este contexto, el Web Service devuelve un error o el proceso falla en Pentaho Data Integration (PDI), el sistema tiene mecanismos específicos para identificarlo y gestionarlo:

*   **Visualización en la vista previa:** Durante la etapa de prueba (*preview*), si la conexión o la transformación fallan, no aparecerá la ventana con los resultados tabulados (similar a una hoja de Excel). En su lugar, el sistema mostrará una **ventana con los errores detallados** que impidieron la captura de los datos.
*   **Gestión mediante el flujo de errores:** Al diseñar la transformación, PDI permite configurar una salida específica para los fallos. Al igual que en otras herramientas de integración (como Data Tools), se puede utilizar una **"flechita roja"** para dirigir los registros o mensajes de error hacia una **bitácora o archivo aparte**, permitiendo registrar qué salió mal sin detener necesariamente todo el flujo principal que tuvo éxito.
*   **Monitoreo en métricas de ejecución:** En la parte inferior de la herramienta, el sistema ofrece una pestaña de **métricas** donde se indica cuánto tardó cada paso y si hubo errores. Si todo sale bien, los componentes se marcan en **verde**, pero si hay un fallo, se indica visualmente en dicha sección para que el desarrollador pueda corregirlo.

> En resumen, el sistema no solo detiene la visualización de datos correctos, sino que ofrece la posibilidad de capturar y documentar el error a través de un flujo de salida alternativo.

Para configurar el componente **Web Services Lookup** en Pentaho Data Integration (PDI), debes seguir una serie de pasos técnicos que permiten establecer la conexión con el servicio web y seleccionar la operación deseada.

A continuación se detalla el proceso de configuración basado en las fuentes:

1.  **Insertar el componente:** Debes buscar y arrastrar la "cajita" llamada **Web services lookup** al área de diseño de la transformación.
2.  **Definir la URL del WSDL:** Al hacer doble clic sobre el componente, se abre la ventana de configuración. Lo primero que debes ingresar es la **URL del Web Service** (la dirección que termina en `?WSDL`) a la que te quieres conectar.
3.  **Cargar los datos del servicio:** Una vez ingresada la URL, es necesario hacer clic en el botón **"Cargar" (Load)**. Esto permite que el sistema alimente y muestre todas las opciones y métodos que el servicio web ofrece.
4.  **Seleccionar la operación:** En el menú desplegable que se habilita tras la carga, debes elegir la **operación específica** con la que vas a trabajar (por ejemplo, el método "obterDeputados" mencionado en el video).
5.  **Configuración automática de la pestaña de servicio:** Al seleccionar la operación, el sistema crea automáticamente una **nueva pestaña**. En esta sección, el componente detecta de inmediato qué información está transmitiendo el sitio web (por ejemplo, el campo `deputadosResult`) sin necesidad de realizar cambios manuales adicionales en esa parte.
6.  **Verificación mediante Preview:** Se recomienda realizar una **vista previa (Preview)** utilizando el icono del ojo. Si la configuración es correcta, aparecerá una ventana tipo Excel mostrando una fila con toda la información capturada en formato **XML**. Si hay errores, el sistema mostrará los detalles del fallo en lugar de los datos.

Una vez configurado este componente, el flujo de salida enviará los datos en formato XML a la siguiente etapa del proceso para su tratamiento.

El componente **Web Services Lookup** en Pentaho Data Integration (PDI) cumple la función primordial de actuar como el puente de conexión para **extraer datos desde un servicio web**, permitiendo al sistema comunicarse con fuentes externas descritas bajo el lenguaje WSDL,.

Sus capacidades y tareas específicas dentro del flujo de datos incluyen:

*   **Establecimiento de la conexión:** Es el encargado de recibir la URL del servicio web para vincular la herramienta de ETL con la fuente de información.
*   **Descubrimiento de servicios (Carga de datos):** Al configurar la URL, el componente permite "alimentar" el proyecto con todas las opciones y métodos que el sitio web ofrece, cargando automáticamente un menú de operaciones disponibles.
*   **Selección de operaciones específicas:** Permite al usuario elegir qué tipo de información desea rescatar del servicio web (por ejemplo, el método para obtener datos de diputados), creando de forma automática las pestañas necesarias para gestionar lo que el sitio está transmitiendo,.
*   **Captura masiva en formato XML:** Técnicamente, su función es capturar toda la información disponible en el servicio web y consolidarla en **una sola fila o registro**. Este bloque de datos se entrega en formato **XML**, sirviendo como el insumo inicial que luego será procesado y desglosado por otros componentes del flujo,.

> En esencia, este componente simplifica la transacción de datos entre la máquina del usuario y el servidor web, permitiendo "descargar" la descripción y el contenido del servicio para su posterior transformación,.


