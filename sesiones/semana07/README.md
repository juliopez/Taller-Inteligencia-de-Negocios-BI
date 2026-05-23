# Semana 7 — Integración de datos desde Web Services (WSDL) con Pentaho

## Contexto

En los procesos tradicionales de Business Intelligence, los datos suelen provenir de bases de datos estructuradas. Sin embargo, en escenarios reales, gran parte de la información se encuentra disponible a través de servicios externos.

Estos servicios, muchas veces, no permiten acceso directo a SQL, sino que exponen sus datos mediante protocolos como SOAP y descripciones en WSDL.

En este contexto, surge una nueva necesidad:

> ¿Cómo integrar datos cuando la fuente no es una base de datos, sino un servicio web?

---

## Importancia

La capacidad de consumir servicios web dentro de un proceso ETL permite ampliar significativamente las fuentes de información disponibles en un sistema analítico.

Este tipo de integración es clave en escenarios como:

- Sistemas gubernamentales que exponen datos públicos
- Plataformas externas que entregan información vía API
- Integración entre sistemas heterogéneos

Desde la perspectiva de Business Intelligence, esto implica pasar desde un enfoque tradicional de ETL hacia un enfoque de integración de datos más amplio y flexible.

---

## Conceptos clave

### WSDL (Web Services Description Language)

Es un lenguaje basado en XML que describe:

- Qué servicios ofrece un sistema
- Cómo acceder a ellos
- Qué datos entrega

En otras palabras, funciona como un contrato que permite a un sistema externo entender cómo consumir un servicio web.

---

### XML (eXtensible Markup Language)

Es el formato en el cual se entregan los datos desde el servicio.

A diferencia de una tabla relacional, los datos en XML están organizados jerárquicamente mediante etiquetas (tags), lo que requiere un proceso de transformación para poder utilizarlos.

---

### Pentaho Data Integration (PDI)

Herramienta de integración de datos que permite construir procesos ETL mediante flujos visuales.

En este contexto, se utiliza como alternativa a SSIS para consumir servicios web y transformar datos semi-estructurados.

---

## Proceso general

El flujo de trabajo desarrollado en esta sesión considera las siguientes etapas:

### 1. Conexión al servicio web

Se utiliza el componente:

- **Web Services Lookup**

En este paso:
- Se ingresa la URL del WSDL
- Se cargan las operaciones disponibles
- Se selecciona el método a consumir

El resultado de esta etapa es un bloque de datos en formato XML.

---

### 2. Transformación del XML

Se utiliza el componente:

- **Get Data from XML**

En este paso:
- Se define la ruta jerárquica de los datos
- Se identifican las etiquetas relevantes
- Se seleccionan los campos a extraer

Ejemplo de jerarquía:

- nodo raíz
- lista de elementos (plural)
- elemento individual (singular)

---

### 3. Selección de campos

Se extraen campos específicos como:

- teléfono
- correo electrónico

Se recomienda trabajar inicialmente con formato **String** para evitar errores de conversión.

---

### 4. Carga de datos

Los datos procesados pueden ser enviados a distintos destinos:

- Archivo Excel
- Archivo de texto plano

Es importante eliminar el campo original XML para evitar redundancia.

---

## Consideración importante

Cuando se utilizan múltiples salidas en Pentaho, los registros no se duplican automáticamente.

En su lugar, el sistema distribuye los datos entre los distintos destinos.

Esto implica que cada salida recibe una parte del total de registros procesados.

---

## Actividad práctica

A partir del proceso desarrollado, se propone:

1. Consumir el servicio web proporcionado
2. Identificar la estructura del XML
3. Definir la ruta correcta para la extracción de datos
4. Seleccionar al menos dos campos relevantes
5. Exportar los resultados a un archivo estructurado

---

## Recursos

### Web Service utilizado
https://www.camara.leg.br/SitCamaraWS/Deputados.asmx?WSDL

### Pentaho Data Integration
https://github.com/ambientelivre/legacy-pentaho-ce

### Java (requisito)
https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html

---

## Idea clave de la sesión

> En Business Intelligence, los datos no siempre están en bases de datos.  
> Saber consumir servicios web y transformar XML es una competencia fundamental para integrar información en entornos reales.
