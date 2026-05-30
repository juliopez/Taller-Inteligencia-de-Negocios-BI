---
title: Sesión 4 - Introducción a Business Intelligence
course: Taller Práctico de Fundamentos de Ingeniería de Datos y SQL
program: Diplomado en Ingeniería de Datos con Python
author: Dr. Julio Lopez-Nunez
version: "1.0"
---
# Sesión 5
## Objetivo de aprendizaje

Comprender cómo las consultas SQL se integran dentro de un ecosistema de Business Intelligence, identificando el rol de los procesos ETL, Data Warehouse, Data Lake, Cubos OLAP y Dashboards en la transformación de datos en información útil para la toma de decisiones.

---

## Descripción de la jornada

En esta sesión final ampliaremos la visión desarrollada durante el taller, conectando las consultas SQL con las arquitecturas modernas de análisis de datos utilizadas en organizaciones públicas y privadas.

A partir de los conceptos de Business Intelligence, Data Warehouse, Data Lake, ETL, Cubos OLAP y Dashboards, analizaremos cómo los datos son capturados, integrados, transformados y posteriormente utilizados para generar información que apoye la toma de decisiones.

La sesión busca entregar una visión global del ciclo de vida de los datos y comprender cómo SQL forma parte de un ecosistema mucho más amplio de gestión y análisis de información.

---

# Agenda de la Jornada

| Bloque             | Tiempo | Actividad                                         |
| ------------------ | ------ | ------------------------------------------------- |
| Exposición guiada  | 60 min | Business Intelligence, Data Warehouse y Data Lake |
| Descanso           | 15 min | Break                                             |
| Exposición guiada  | 30 min | ETL, Cubos OLAP y Dashboards                      |
| Actividad práctica | 45 min | Análisis de procesos ETL mediante videos guiados  |
| Discusión y cierre | 30 min | Reflexión integradora sobre el ecosistema BI      |

---

# 1. Del dato al conocimiento

Durante las sesiones anteriores aprendimos a modelar datos, crear tablas, relacionar información y construir consultas SQL utilizando filtros, JOIN, agrupaciones y funciones de agregación.

Sin embargo, el objetivo final de estas técnicas no es simplemente ejecutar consultas, sino transformar datos en información útil para apoyar la toma de decisiones.

En una organización, los datos suelen encontrarse dispersos en distintos sistemas y tablas. A través de SQL es posible integrarlos, analizarlos y convertirlos en indicadores que permitan comprender mejor una situación o detectar oportunidades de mejora.

Este proceso puede entenderse como una cadena de valor donde cada etapa agrega significado a la información:

<img src=IMG-1.png width=800>

Por ejemplo, una tabla con miles de evaluaciones contiene datos. Calcular el promedio de notas por carrera genera información. Comparar esos resultados entre facultades produce indicadores. Finalmente, presentar esos resultados en un dashboard permite apoyar decisiones académicas y de gestión.

En esta última sesión veremos cómo SQL se integra dentro de un ecosistema más amplio de análisis de datos, Business Intelligence y apoyo a la toma de decisiones.

---

# 2. ¿Qué es Business Intelligence?

Business Intelligence (BI) es el conjunto de metodologías, procesos y tecnologías que permiten transformar datos en información útil para apoyar la toma de decisiones.

En términos simples, BI busca responder preguntas relevantes para una organización a partir de los datos disponibles. Por ejemplo:

- ¿Cuántos estudiantes se matricularon este semestre?
- ¿Qué carreras presentan mayor deserción?
- ¿Cuál es el promedio de notas por asignatura?
- ¿Qué facultades muestran mejores indicadores de retención?

Para responder estas preguntas, primero es necesario recopilar y organizar los datos. Posteriormente, estos se transforman en indicadores, reportes y dashboards que facilitan su interpretación.

Una característica fundamental de BI es que permite pasar desde la observación de datos aislados hacia una visión integrada del funcionamiento de una organización.

<img src=IMG-2.png width=800>

Actualmente, Business Intelligence se utiliza en empresas, organismos públicos, hospitales, bancos y universidades para apoyar procesos de planificación, monitoreo y mejora continua.

Las consultas SQL que hemos aprendido durante este taller constituyen una de las herramientas fundamentales para construir soluciones de Business Intelligence.

---

# 3. ¿Qué es un Data Warehouse?

Un Data Warehouse (DW) es una base de datos diseñada específicamente para el análisis de información y el apoyo a la toma de decisiones.

A diferencia de las bases de datos operacionales, cuyo objetivo principal es registrar transacciones diarias, un Data Warehouse integra información proveniente de múltiples fuentes para facilitar el análisis histórico y la generación de indicadores.

Por ejemplo, una universidad puede almacenar diariamente información sobre:

- estudiantes;
- matrículas;
- asignaturas;
- evaluaciones;
- docentes.

Un Data Warehouse permite consolidar todos estos datos en un único repositorio orientado al análisis.

<img src=adventureworks2008_schema.gif width=800>

Mientras una base operacional responde preguntas como:

> "¿Cuál es la nota de este estudiante?"

un Data Warehouse permite responder preguntas como:

> "¿Cómo ha evolucionado el rendimiento académico durante los últimos cinco años?"

Por esta razón, los Data Warehouse constituyen uno de los componentes fundamentales de las soluciones de Business Intelligence, ya que proporcionan una visión integrada, histórica y consistente de la información organizacional.

---

# 4. ¿Qué es un Data Lake?

Un Data Lake es un repositorio diseñado para almacenar grandes volúmenes de datos en su formato original, sin necesidad de transformarlos previamente.

A diferencia de un Data Warehouse, donde los datos suelen estar organizados y estructurados para análisis, un Data Lake permite almacenar información de diversos tipos:

- tablas de bases de datos;
- archivos Excel;
- documentos PDF;
- imágenes;
- videos;
- archivos de texto;
- registros de sensores;
- datos provenientes de Internet.

<img src=IMG-4.png width=800>

Una de las principales ventajas de los Data Lake es su flexibilidad. Los datos pueden almacenarse primero y analizarse posteriormente según las necesidades de la organización.

Por ejemplo, una universidad podría almacenar en un Data Lake:

* información académica;
* registros de plataformas virtuales;
* encuestas estudiantiles;
* documentos institucionales;
* datos provenientes de sistemas externos.

Actualmente, los Data Lake son ampliamente utilizados en proyectos de Big Data, Ciencia de Datos e Inteligencia Artificial, donde resulta necesario almacenar grandes cantidades de información antes de definir cómo será utilizada.

Por esta razón, los Data Lake suelen complementar a los Data Warehouse dentro de los ecosistemas modernos de análisis de datos.

---

# 5. Arquitectura simplificada de Business Intelligence

Las soluciones de Business Intelligence suelen estar compuestas por diversos componentes que trabajan de manera integrada para transformar datos en información útil para la toma de decisiones.

Aunque las arquitecturas reales pueden ser complejas, es posible representarlas mediante un modelo simplificado que muestra el flujo general de la información.

<img src=IMG-5.png width=800>

Cada componente cumple una función específica:

* **Fuentes de datos:** sistemas académicos, ERP, CRM, archivos Excel, APIs y otras aplicaciones.
* **ETL:** procesos encargados de extraer, transformar y cargar los datos.
* **Base operacional:** sistemas utilizados para registrar las actividades diarias de la organización.
* **Data Warehouse:** repositorio centralizado orientado al análisis.
* **Dashboards y reportes:** herramientas que presentan indicadores y visualizaciones para apoyar la toma de decisiones.

Por ejemplo, en una universidad los datos de estudiantes, matrículas, asignaturas y evaluaciones pueden integrarse en un Data Warehouse para construir dashboards institucionales que permitan monitorear indicadores académicos.

Esta arquitectura constituye la base de gran parte de las soluciones modernas de análisis de datos, Business Intelligence y analítica organizacional.

---

# 6. ¿Qué es ETL?

ETL corresponde a las siglas de:

- **Extract** (Extraer)
- **Transform** (Transformar)
- **Load** (Cargar)

Se trata de un proceso utilizado para mover datos desde diferentes fuentes hacia un repositorio centralizado de análisis, como un Data Warehouse.

<img src=IMG-6.png width=800>

Durante la etapa de extracción, los datos se obtienen desde distintas fuentes, por ejemplo:

* bases de datos;
* archivos Excel;
* sistemas académicos;
* APIs;
* aplicaciones empresariales.

Posteriormente, los datos son transformados para corregir errores, eliminar inconsistencias, estandarizar formatos o generar nuevos campos de análisis.

Finalmente, los datos son cargados en el repositorio donde serán utilizados para construir indicadores, reportes y dashboards.

Por ejemplo, una universidad podría extraer información desde sistemas de matrícula, evaluación y asistencia, transformarla para unificar formatos y cargarla posteriormente en un Data Warehouse institucional.

Los procesos ETL constituyen uno de los componentes más importantes dentro de la ingeniería de datos y Business Intelligence, ya que permiten asegurar que la información utilizada para el análisis sea consistente, confiable y útil para la toma de decisiones.

---

# 7. ¿Qué es un Cubo OLAP?

Un cubo OLAP (Online Analytical Processing) es una estructura diseñada para analizar grandes volúmenes de información desde múltiples perspectivas.

A diferencia de una tabla tradicional, un cubo OLAP permite explorar los datos considerando distintas dimensiones de análisis al mismo tiempo.

Por ejemplo, una universidad podría analizar las matrículas considerando:

- carrera;
- año;
- semestre;
- sede.

<img src=IMG-7.png width=800>

Cada dimensión representa una forma diferente de observar la información.

Gracias a esta estructura es posible responder preguntas como:

* ¿Cuántos estudiantes se matricularon por carrera y año?
* ¿Qué sede presenta mayor cantidad de matrículas?
* ¿Cómo ha evolucionado el rendimiento académico por semestre?

Los cubos OLAP permiten realizar consultas analíticas de manera muy rápida, incluso cuando existen millones de registros almacenados.

Actualmente, muchas herramientas de Business Intelligence utilizan tecnologías similares para construir dashboards interactivos, tablas dinámicas y análisis multidimensionales.

Por esta razón, los cubos OLAP han sido históricamente uno de los componentes más importantes dentro de los ecosistemas de Data Warehouse y Business Intelligence.

---

# 8. ¿Qué es un Dashboard?

Un dashboard es una herramienta visual que permite presentar información mediante gráficos, tablas, indicadores y métricas de forma clara y resumida.

Su objetivo principal es facilitar la interpretación de datos para apoyar la toma de decisiones.

En lugar de revisar cientos o miles de registros individuales, un dashboard permite visualizar rápidamente el estado de una organización mediante indicadores clave.

Por ejemplo, una universidad podría monitorear:

- cantidad de estudiantes matriculados;
- tasa de aprobación;
- promedio de notas;
- deserción estudiantil;
- titulaciones por carrera.

<img src=IMG-8.png width=800>

Los dashboards suelen alimentarse desde consultas SQL, Data Warehouse o cubos OLAP, transformando grandes volúmenes de información en visualizaciones fáciles de interpretar.

Actualmente, herramientas como:

* Power BI;
* Tableau;
* Oracle Analytics;
* Looker Studio;

permiten construir dashboards interactivos donde los usuarios pueden explorar la información desde distintas perspectivas.

Por esta razón, los dashboards constituyen uno de los productos finales más visibles dentro de los proyectos de Business Intelligence, ya que convierten los datos en conocimiento útil para la gestión y la toma de decisiones.

---


