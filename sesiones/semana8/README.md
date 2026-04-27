# Semana 8 — Web Scraping con Pentaho (PDI)

## Objetivo de la sesión

Comprender e implementar un proceso de extracción de datos desde fuentes no estructuradas mediante técnicas de Web Scraping, utilizando Pentaho Data Integration (PDI), y analizar su rol dentro de un proceso de integración de datos en Business Intelligence.

---

## Video de la sesión

Web Scraping con Pentaho (PDI) paso a paso | Extraer datos de una página web  
https://youtu.be/9IBuWiFGl5Q

---

## Contexto de la sesión

Hasta este punto del curso, los procesos de integración de datos han estado centrados en fuentes estructuradas, como bases de datos relacionales y servicios web (WSDL). En esta sesión se introduce un escenario distinto: la extracción de datos desde páginas web que no han sido diseñadas como fuentes de datos.

El Web Scraping permite obtener información desde contenido HTML, transformando una fuente no estructurada en un insumo útil para procesos analíticos. Este enfoque es especialmente relevante cuando no existen APIs o servicios formales disponibles.

---

## Contenidos abordados

- Extracción de contenido HTML mediante HTTP Client  
- Identificación de estructuras de datos en páginas web  
- Parsing de información utilizando etiquetas HTML (por ejemplo, `<tr>`, `<td>`)  
- Uso de expresiones regulares (Regex) para limpieza de datos  
- Transformación de datos no estructurados en formato tabular  
- Uso de JavaScript en Pentaho para procesamiento intermedio  
- Normalización de datos mediante Row Normaliser  

---

## Relación con Business Intelligence

El Web Scraping amplía las capacidades tradicionales de los procesos ETL, permitiendo integrar datos externos que no están disponibles en formatos estructurados. En el contexto de BI, esto permite:

- Incorporar nuevas dimensiones al modelo analítico  
- Complementar datos internos con información externa  
- Aumentar el valor analítico del sistema  

Sin embargo, este tipo de procesos presenta desafíos importantes, como la dependencia de la estructura del sitio web, la fragilidad ante cambios y mayores costos de mantenimiento.

---

## Consideraciones técnicas

- El HTML no es un formato estructurado para análisis, por lo que requiere procesamiento adicional  
- Cambios en la estructura del sitio pueden afectar el funcionamiento del ETL  
- El uso de Regex debe ser preciso para evitar errores en la extracción  
- Este tipo de soluciones debe evaluarse frente a alternativas más robustas (APIs, Web Services)  

---

## Actividad práctica

Los estudiantes deberán:

1. Ejecutar el flujo de Web Scraping mostrado en el video  
2. Identificar las etapas del proceso ETL (Extracción, Transformación, Carga)  
3. Analizar cómo se transforma el HTML en datos estructurados  
4. Evaluar las limitaciones del proceso  

---

## Preguntas para análisis

- ¿Qué diferencias existen entre un Web Service (WSDL) y el Web Scraping?  
- ¿En qué casos sería recomendable utilizar scraping en lugar de una API?  
- ¿Qué riesgos introduce este enfoque en un sistema de BI?  
- ¿Cómo se podría mejorar la estabilidad del proceso?  

---

## Recursos utilizados

- Pentaho Data Integration (PDI):  
  https://github.com/ambientelivre/legacy-pentaho-ce  

- Sitio web del ejemplo:  
  https://www.campeonatochileno.cl/ligas/liga-de-primera-itau/  

- Herramientas para expresiones regulares:  
  https://regex101.com/  
  https://www.debuggex.com/  

---

## Conexión con el proyecto del curso

Este contenido permite incorporar fuentes externas no estructuradas en el proyecto integrador, enriqueciendo el modelo dimensional desarrollado en las evaluaciones anteriores. La capacidad de integrar este tipo de datos será clave en la construcción de soluciones de Business Intelligence más completas.

---
