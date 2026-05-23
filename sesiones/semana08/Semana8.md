A diferencia de los procesos anteriores, donde la obtención de datos se realizaba mediante servicios diseñados específicamente para su consumo (como Web Services basados en WSDL), en esta sesión se aborda un escenario considerablemente más complejo desde el punto de vista de la integración de datos: la extracción de información desde un sitio web que no fue concebido como fuente de datos estructurados, sino únicamente como un medio de visualización para usuarios finales. 

Este cambio no es menor. Implica pasar desde un entorno donde los datos están organizados, documentados y disponibles mediante contratos formales (como XML o JSON), a un contexto donde la información se encuentra incrustada dentro de código HTML, mezclada con elementos visuales, estilos y estructuras propias de la interfaz web. En este sentido, el proceso de Web Scraping representa una forma de “forzar” la obtención de datos, transformando una fuente no estructurada en un insumo útil para procesos analíticos.

Desde una perspectiva de Business Intelligence, este tipo de técnicas cobra especial relevancia cuando las organizaciones necesitan complementar sus datos internos con información externa que no está disponible mediante APIs o servicios formales. Ejemplos de esto incluyen indicadores económicos publicados en sitios web, rankings, datos deportivos, información gubernamental o cualquier otro contenido que, aunque visible, no está diseñado para ser consumido automáticamente.

---

## De la visualización a la estructura: el desafío del scraping

El principal desafío del Web Scraping radica en que el dato no existe explícitamente como tal. Lo que existe es una representación visual de la información, construida mediante etiquetas HTML. Esto obliga al desarrollador a interpretar dicha estructura y traducirla a un formato tabular.

En el ejercicio desarrollado, este proceso comienza capturando el código completo de la página web mediante el componente **HTTP Client**, el cual almacena toda la información en una única variable de tipo texto. Este punto es crítico, ya que desde aquí se inicia un proceso de transformación que convierte un bloque masivo de texto en registros estructurados.

A diferencia de un proceso ETL tradicional, donde los datos ya están definidos en tablas, aquí el desarrollador debe **descubrir la estructura implícita del dato**, identificando patrones como etiquetas `<tr>` para filas o `<td>` para columnas. Este trabajo no es trivial, ya que depende directamente de cómo fue construido el sitio web, lo que introduce un alto grado de dependencia externa.

---

## El rol del ETL en contextos no estructurados

Uno de los elementos más relevantes de esta sesión es comprender que el ETL no solo se aplica a bases de datos tradicionales, sino que también puede extenderse a fuentes no estructuradas. En este caso, el proceso sigue manteniendo su lógica:

* **Extracción (E):** Captura del HTML completo
* **Transformación (T):** Parsing, filtrado, limpieza con Regex
* **Carga (L):** Generación de archivo estructurado

Sin embargo, la diferencia está en la complejidad de la transformación. Mientras en un ETL clásico se trabaja con campos claramente definidos, aquí es necesario:

* Separar registros a partir de etiquetas HTML
* Normalizar datos que originalmente no tienen estructura tabular
* Eliminar “ruido” (etiquetas, estilos, scripts)
* Reconstruir el dato desde fragmentos de texto

Este tipo de procesamiento exige un mayor dominio técnico, especialmente en el uso de **expresiones regulares (Regex)** y herramientas intermedias como JavaScript.

---

## Normalización y estructuración: paso clave para BI

Un componente particularmente relevante en este flujo es el **Row Normaliser**, cuya función es transformar datos dispuestos horizontalmente en una estructura vertical. Este paso es fundamental desde el punto de vista de BI, ya que permite convertir una representación fragmentada en un conjunto de registros coherentes.

En términos prácticos, esto equivale a transformar una “fila larga” en múltiples filas independientes, donde cada una representa una entidad (por ejemplo, un equipo de fútbol). Este proceso es conceptualmente equivalente a la normalización de datos en bases relacionales, pero aplicado a una fuente originalmente no estructurada.

---

## Limitaciones y riesgos del Web Scraping

A pesar de su utilidad, el Web Scraping presenta importantes limitaciones que deben ser consideradas en un contexto profesional:

1. **Alta fragilidad:**
   El proceso depende directamente de la estructura HTML del sitio. Un cambio mínimo en el diseño puede romper completamente el flujo de datos.

2. **Falta de estabilidad:**
   A diferencia de un Web Service, no existe garantía de disponibilidad ni consistencia en los datos.

3. **Mayor costo de mantenimiento:**
   Los procesos deben ser revisados y ajustados constantemente.

4. **Aspectos legales y éticos:**
   No todos los sitios permiten scraping, lo que introduce consideraciones de uso de datos.

---

## Web Scraping vs Web Service: una decisión estratégica

Desde el punto de vista de arquitectura de datos, la diferencia entre Web Scraping y Web Services no es solo técnica, sino estratégica.

Mientras los Web Services representan una solución robusta, estable y escalable para la integración de datos, el Web Scraping se posiciona como una alternativa cuando dichas soluciones no están disponibles. En este sentido, su uso debe ser evaluado cuidadosamente, considerando su impacto en la calidad, mantenibilidad y confiabilidad del sistema.

---

### 1. Inicio y Conexión al Sitio Web
*   **Generación de registros (Generate Rows):** Se utiliza como un "disparador" o llave de inicio para el flujo. Se configura para generar un solo registro, ya que se procesará una única página web.
*   **Captura de datos (HTTP Client):** Este componente se conecta a la URL del sitio web. Toda la información del código fuente de la página se almacena en una única variable de tipo texto (String) llamada "variable".

### 2. Estructuración de los Datos (Parsing)
*   **División en campos (Split Fields):** Dado que toda la página web está en una sola fila, se utiliza este objeto para dividirla. El instructor identifica que la información está en una tabla HTML y utiliza la etiqueta **`<tr>`** (table row) como delimitador para separar cada fila de la tabla.
*   **Normalizador de registros (Row Normaliser):** Este paso es crucial para la visualización; toma los datos que estaban expandidos horizontalmente y los organiza verticalmente (hacia abajo), convirtiendo cada segmento de la tabla en un registro individual.

### 3. Limpieza y Filtrado
*   **Filtro de filas (Filter Rows):** Se aplican filtros para eliminar registros innecesarios. Específicamente, se descartan la **fila 0** (cabecera de la página web) y la **fila 1** (encabezados de la tabla), dejando solo los datos de los equipos.
*   **Extracción con JavaScript y Expresiones Regulares (Regex):** Para obtener datos específicos (como el nombre del equipo y su posición) del código HTML, se utiliza un componente de JavaScript. El instructor emplea **expresiones regulares** para capturar el contenido que se encuentra entre etiquetas específicas (como `<span>` o `<a>`).

### 4. Transformación Final y Carga
*   **Reemplazo en String (Replace in string):** Se utiliza nuevamente Regex para "limpiar" los datos capturados, eliminando cualquier etiqueta HTML remanente y dejando únicamente el texto limpio (el número de posición y el nombre del club).
*   **Selección de valores (Select values):** Este componente permite elegir exclusivamente las columnas finales deseadas (posicion y club), descartando los campos técnicos y el código HTML original que ya no son necesarios.
*   **Salida (Text File Output):** Finalmente, los datos procesados se guardan en un archivo de texto plano (.txt). El resultado final muestra la lista de equipos y sus posiciones correctamente tabulados y sin errores de formato.

---

El **Web Scraping** se considera un proceso significativamente más complejo y "tedioso" que el uso de un **Web Service** debido a la naturaleza y el propósito del sitio de donde se extraen los datos.

*   **Diseño y propósito:** Los **Web Services** están **diseñados específicamente para compartir información**, lo que facilita enormemente su consumo. Por el contrario, los sitios web utilizados para el scraping están **diseñados solo para mostrar información** al usuario, no para que sea copiada o procesada automáticamente por máquinas.
*   **Captura de datos no estructurados:** Mientras que un Web Service entrega datos ya organizados, el Web Scraping comienza capturando **todo el código fuente de la página web** en una sola variable de texto masiva. Esto obliga al desarrollador a realizar un proceso manual de "parseo" para dividir ese bloque de información en filas y campos legibles.
*   **Dependencia del código HTML:** Para extraer los datos, es indispensable identificar manualmente las etiquetas HTML (como `<tr>` para las filas) que servirán como delimitadores para separar los registros.
*   **Limpieza de "ruido":** La información obtenida mediante scraping viene "sucia", mezclada con etiquetas de estilo, enlaces y otros elementos de formato (como `<span>` o `<a>`) que no forman parte del dato útil.
*   **Necesidad de herramientas avanzadas:** Debido a que el sitio no facilita la entrega de los datos, el desarrollador debe recurrir a **expresiones regulares (Regex)** y código en **JavaScript** para poder identificar, aislar y limpiar los valores específicos que desea capturar.

En resumen, la complejidad radica en que el desarrollador debe **descifrar la estructura visual** de una página para convertirla artificialmente en una base de datos, un esfuerzo que no es necesario cuando se utiliza un servicio diseñado para el intercambio de información.

---

Para limpiar el código HTML en un proceso de Web Scraping con Pentaho Data Integration (PDI), las expresiones regulares (Regex) se utilizan principalmente para **identificar patrones de etiquetas y reemplazarlas por espacios vacíos**, dejando únicamente el texto útil.

### 1. Extracción de contenido específico
Antes de la limpieza total, se utiliza código **JavaScript** para aislar bloques de información. Se definen expresiones que capturan lo que hay entre etiquetas específicas. Por ejemplo:
*   Para capturar la posición, se busca el patrón que comienza con una etiqueta de apertura y termina en una de cierre (usando el carácter `<` y `>`).
*   Para los nombres de los equipos, se busca el contenido entre etiquetas como `<span>` o `<a>`.

### 2. Limpieza mediante el componente "Replace in string"
Una vez que se tiene el bloque de código extraído, se utiliza el objeto **"Reemplazar en un string"** configurado para usar expresiones regulares. El procedimiento detallado es:

*   **Identificación de etiquetas:** Se escriben los nombres de las etiquetas HTML que se desean eliminar (como `span class=club`, `</a>` o `</span>`).
*   **Uso del operador "Pipe" (`|`):** Se utiliza este símbolo para indicar una función lógica de "O". Esto permite que el sistema busque y elimine múltiples tipos de etiquetas al mismo tiempo en una sola instrucción.
*   **Sustitución por vacío:** El sistema busca cualquier coincidencia con las Regex definidas y las reemplaza por un espacio en blanco, lo que efectivamente "borra" el código HTML y deja solo el dato limpio (por ejemplo, el nombre del club o el número de la posición).

Este método es fundamental en el Web Scraping porque permite transformar un código fuente "sucio" y masivo en registros tabulados y legibles similares a una base de datos.

---

En el flujo de Web Scraping con Pentaho Data Integration (PDI), el componente **Row Normaliser** (o normalizador de registro) cumple la función de **organizar los datos verticalmente**, transformando la información que está dispuesta en columnas (hacia el lado) y colocándola en filas (hacia abajo).

*   **Cambio de orientación:** El instructor lo describe visualmente como una herramienta que toma lo que "está hacia el lado" y lo pone "hacia abajo",. 
*   **Creación de registros individuales:** Después de que el componente anterior (*Split Fields*) divide el bloque masivo de código HTML en múltiples campos horizontales basándose en las etiquetas `<tr>`, el Row Normaliser toma esos campos y los convierte en registros independientes uno debajo del otro.
*   **Normalización para bases de datos:** Esta acción es fundamental para que la información, que originalmente era una sola fila gigante de código web, comience a tener una estructura de **tabla o entidad de base de datos** legible,.
*   **Asignación de atributos:** Durante su configuración, se le da un nombre al campo (como "filas") que servirá de cabecera para agrupar todos estos nuevos registros verticales bajo una misma característica o atributo.

En resumen, este componente es el que permite que los datos dejen de ser una "fila larga" dividida en partes y pasen a ser una **lista de registros sucesivos**, permitiendo que cada equipo de la tabla de posiciones ocupe su propia fila en el flujo de datos.

---

En el contexto del proceso de **Web Scraping** realizado con Pentaho Data Integration (PDI), estos dos componentes cumplen funciones fundamentales para iniciar la extracción de datos desde un sitio web:

*   **Generate Rows (Generar registros):** Funciona como el **disparador o "llave de inicio"** de la transformación. Su papel principal no es aportar datos complejos, sino dar el puntapié inicial al flujo de trabajo. En este caso específico, se configura para generar **un solo registro**, ya que el objetivo es capturar una única página web completa para luego procesarla.
*   **HTTP Client:** Su función es **conectarse a la URL del sitio web** para obtener su información. Este componente realiza la petición al sitio y extrae todo el código fuente de la página. El instructor explica que este objeto captura todo el código HTML del sitio y lo **almacena en una única variable** (llamada "variable" en el ejemplo) de tipo texto (String), dejando así toda la página web lista en una sola fila para las etapas posteriores de limpieza y transformación,.

En resumen, mientras **Generate Rows** enciende el motor del proceso, el **HTTP Client** es el encargado de ir al sitio web y "traer" todo su contenido hacia la herramienta de integración.

Para configurar el **delimitador** en el componente **Split Fields** (Dividir en campos) dentro de un proceso de Web Scraping, se deben seguir estos pasos técnicos detallados en las fuentes:

*   **Identificar el delimitador correcto:** Al extraer datos de una tabla HTML, el delimitador no es un carácter común (como una coma), sino la etiqueta de lenguaje que marca el inicio de una fila. El instructor identifica que en HTML la etiqueta para las filas es **`<tr>`** (Table Row).
*   **Modificar el valor por defecto:** Por defecto, el componente muestra una coma (`,`) como delimitador. Se debe borrar este valor e ingresar manualmente la etiqueta identificada: el símbolo menor que (`<`), seguido de las letras `tr` y el símbolo mayor que (`>`).
*   **Definir la estructura de salida:** Una vez establecido el delimitador `<tr>`, se debe configurar cuántas filas se desean capturar y cómo se tratarán:
    *   Se deben listar los registros (ej. fila 0, fila 1, fila 2, etc.) que se extraerán de ese bloque de datos.
    *   Se recomienda configurar el tipo de dato como **String** (texto) para cada una de estas filas.
    *   Es importante marcar la opción para **no remover los IDs**, asegurando que el sistema mantenga identificado dónde empieza y termina cada fila procesada.

Al realizar esta configuración, el sistema dejará de ver la página web como una sola línea de código y comenzará a "partirla" cada vez que encuentre la etiqueta `<tr>`, permitiendo que cada segmento pase a las siguientes etapas de transformación de forma individual.
