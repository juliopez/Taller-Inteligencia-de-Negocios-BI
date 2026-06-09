# De Excel a Power BI

## Evolucionando hacia el análisis visual e interactivo de datos

#### Cuaderno de Ejercicios

---
# 1. Introducción

En los últimos años, las organizaciones han incrementado significativamente la cantidad de datos disponibles para apoyar procesos de gestión, monitoreo y toma de decisiones. En el contexto universitario, esta información puede encontrarse en ámbitos como:

- productividad científica;
- proyectos de investigación;
- matrícula;
- indicadores académicos;
- gestión administrativa;
- y seguimiento institucional.

Tradicionalmente, gran parte de estos análisis se realizan utilizando *Microsoft Excel*, especialmente mediante:

- tablas dinámicas;
- gráficos;
- filtros;
- y funciones de búsqueda.

Sin embargo, a medida que los datos aumentan en volumen y complejidad, surgen nuevas necesidades relacionadas con:

- integración de múltiples fuentes;
- automatización de reportes;
- análisis interactivo;
- y construcción de dashboards ejecutivos.

En este contexto, **Power BI** se ha consolidado como una de las principales herramientas de *Business Intelligence* utilizadas para:

- analizar datos;
- construir visualizaciones;
- integrar múltiples tablas;
- y generar informes dinámicos e interactivos.


<img src="https://github.com/juliopez/Taller-Inteligencia-de-Negocios-BI/blob/main/Power_BI/Imagenes/IMG-1.png" width="800">

---
# 2. Objetivo de la sesión

Comprender los fundamentos básicos de **Power BI Desktop** mediante la construcción guiada de un *dashboard* institucional de productividad científica, utilizando múltiples tablas relacionadas (03) y visualizaciones interactivas.

---
# 3. ¿Qué es Power BI?

**Power BI** es una herramienta de análisis y visualización de datos desarrollada por *Microsoft* que permite:

- conectar múltiples fuentes de información;
- construir modelos de datos;
- crear visualizaciones dinámicas;
- y diseñar *dashboards* interactivos.

A diferencia de una planilla tradicional *(Excel)*, **Power BI** trabaja utilizando múltiples tablas relacionadas, permitiendo integrar información de manera más eficiente y escalable.

Entre sus principales capacidades se encuentran:

- análisis interactivo;
- actualización dinámica de información;
- integración de múltiples tablas;
- construcción de indicadores;
- y creación de *dashboards* ejecutivos.

**Power BI** ofrece dos alternativas de trabajo: en la nube y  en escritorio. En este taller se utilizará **Power BI Desktop**  la versión gratuita de la herramienta, instalada localmente en cada computador.

<img src="https://github.com/juliopez/Taller-Inteligencia-de-Negocios-BI/blob/main/Power_BI/Imagenes/IMG-2.png" width="800">

---
# 4. Diferencias entre *Excel y Power BI*

*Excel y Power BI* son herramientas complementarias y ambas cumplen un rol importante en el análisis de datos. Sin embargo, presentan diferencias importantes en la forma de trabajar la información.

*Excel* posee grandes fortalezas para:

- cálculos;
- trabajo tabular;
- análisis rápidos;
- funciones;
- y elaboración de reportes simples.

**Power BI**, en cambio, se orienta especialmente a:

- integrar múltiples tablas;
- automatizar análisis;
- construir *dashboards*;
- y explorar información de manera interactiva.

**Comparación general**

| Excel                                           | Power BI                                  |
| ----------------------------------------------- | ----------------------------------------- |
| Trabaja principalmente con hojas independientes | Trabaja con múltiples tablas relacionadas |
| Uso frecuente de BUSCARV/BUSCARX                | Uso de relaciones entre tablas            |
| Tablas dinámicas manuales                       | Visualizaciones dinámicas automáticas     |
| Gráficos generalmente estáticos                 | Dashboards interactivos                   |
| Orientado a análisis individuales               | Orientado a análisis integrados           |
| Menor escalabilidad                             | Mayor capacidad para integrar datos       |

<img src="https://github.com/juliopez/Taller-Inteligencia-de-Negocios-BI/blob/main/Power_BI/Imagenes/IMG-3.png" width="800">

---
## 4.1 Ejemplo conceptual

En *Excel*, si se desea conectar información entre hojas, normalmente se utilizan:

- BUSCARV;
- BUSCARX;
- referencias;
- o consolidación manual.

En **Power BI**, las tablas se relacionan mediante identificadores comunes, permitiendo que la información “converse” automáticamente.   Esto permite construir visualizaciones integradas sin necesidad de copiar información manualmente entre tablas.

<img src="https://github.com/juliopez/Taller-Inteligencia-de-Negocios-BI/blob/main/Power_BI/Imagenes/IMG-4.png" width="800">

---
# 5. Caso de estudio

Se trabajará con un caso de estudio relacionado con productividad científica universitaria.

El objetivo será construir un *dashboard* institucional utilizando información asociada a:

- investigadores;
- proyectos de investigación;
- y publicaciones científicas.

Para ello se utilizarán tres archivos  *CSV*  relacionados entre sí:

| Tabla          | Descripción                                        |
| -------------- | -------------------------------------------------- |
| Investigadores | Información general de académicos e investigadores |
| Proyectos      | Información sobre proyectos de investigación       |
| Publicaciones  | Registro de publicaciones científicas              |

El caso de estudio simula un escenario institucional real donde distintas fuentes de información deben integrarse para apoyar procesos de análisis y toma de decisiones.

---

# 6. Modelo de datos y relaciones

Uno de los conceptos más importantes de **Power BI** es la posibilidad de trabajar con múltiples tablas relacionadas.

En este taller, las tablas estarán conectadas mediante identificadores comunes, permitiendo construir un modelo integrado de información.

---

## 6.1 Tablas del modelo

**Tabla: Investigadores**

Contiene información relacionada con:

- nombre del investigador;
- departamento;
- categoría académica;
- jornada.

La columna: $ID-Investigador$ corresponde al identificador único de cada investigador.

**Tabla: Proyectos**

Contiene información relacionada con:

- proyectos de investigación;
- tipo de proyecto;
- estado;
- monto adjudicado;
- año de inicio.

La columna: $ID-Proyecto$  identifica de manera única cada proyecto.

**Tabla: Publicaciones**

Contiene información relacionada con:

- publicaciones científicas;
- año;
- tipo de publicación;
- revista;
- indexación;
- investigador asociado;
- proyecto asociado.

Esta tabla actúa como punto central del modelo.

**Relaciones entre tablas**

Esta es una representación de como se vera nuestro modelo de datos cargado en **Power BI.**

<img src="https://github.com/juliopez/Taller-Inteligencia-de-Negocios-BI/blob/main/Power_BI/Imagenes/IMG-5.png" width="800">

Basándonos en este modelo de datos, la lectura correcta seria la siguiente:

- Un **investigador** puede tener muchas **publicaciones**.
- Un **proyecto** puede estar asociado a muchas **publicaciones**.

---

## 6.2 Explicación simple de Primary Key y Foreign Key

La **Primary Key** corresponde a un identificador único dentro de una tabla.

Por ejemplo: $ID-Investigador$ permite identificar individualmente a cada investigador.

La **Foreign Key** corresponde a un campo utilizado para conectar una tabla con otra.

Por ejemplo: $ID-Investigador$  también aparece en la tabla `Publicaciones`, permitiendo asociar cada publicación con un investigador específico.

---

## 6.3 Importancia del modelo relacional

A diferencia de *Excel*, donde muchas veces toda la información se concentra en una única hoja, **Power BI** permite:

- mantener tablas separadas;
- reducir duplicidad de información;
- automatizar relaciones;
- y construir análisis más escalables.

Este enfoque constituye una de las principales bases del trabajo en *Business Intelligence.*

---

---
# 7. Ejercicios
## Ejercicio 1 — Importación y relación de datos

### Objetivo del ejercicio

Comprender cómo **Power BI** permite trabajar con múltiples tablas relacionadas para construir un modelo de datos integrado.

---
### Duración estimada

10–12 minutos.

---
### Archivos utilizados

- `Investigadores.csv`
- `Proyectos.csv`
- `Publicaciones.csv`

---
### Introducción

En este ejercicio se trabajará con un conjunto de datos relacionados con productividad científica universitaria. La información se encuentra distribuida en múltiples tablas, simulando una situación real de gestión institucional.

A diferencia de *Excel*, donde muchas veces toda la información se consolida manualmente en una sola hoja, **Power BI** permite trabajar con tablas separadas que se conectan mediante relaciones.

Este enfoque facilita:

- organizar mejor los datos;
- evitar duplicidad de información;
- automatizar análisis;
- y construir dashboards más escalables.

---
### Parte 1 — Importación de archivos CSV

#### Paso 1

Abrir Power BI Desktop.

---
#### Paso 2

Seleccionar: $Inicio → Obtener datos → Texto/CSV$

---
#### Paso 3

Importar los siguientes archivos:

- `Investigadores.csv`
- `Proyectos.csv`
- `Publicaciones.csv`

---
#### Paso 4

Seleccionar la opción: $Cargar$  para incorporar las tablas al modelo de datos.

---

### Parte 2 — Exploración de tablas

Una vez cargados los datos, revisar:

- nombres de tablas;
- nombres de columnas;
- tipos de datos;
- cantidad de registros.

Observar especialmente:

- identificadores;
- columnas de texto;
- columnas numéricas;
- años;
- relaciones potenciales entre tablas.

---

### Parte 3 — Creación de relaciones

**Power BI** permite conectar tablas mediante campos comunes.

En este caso se crearán las siguientes relaciones:

#### Relación 1

$$Publicaciones.ID_Investigador
→ Investigadores.ID_Investigador$$

---

#### Relación 2

$$Publicaciones.ID_Proyecto
→ Proyectos.ID_Proyecto$$

---

### Conceptos principales del ejercicio

Durante esta actividad se introducen los siguientes conceptos:

- tablas;
- columnas;
- tipos de datos;
- relaciones;
- Primary Key;
- Foreign Key.

---
### Diferencias respecto al trabajo tradicional en Excel

En *Excel*, este tipo de tareas normalmente requiere:

- múltiples hojas;
- funciones $BUSCARV$ o $BUSCARH$;
- copia manual de columnas;
- consolidación manual de datos.

En **Power BI**:

- las tablas permanecen separadas;
- las relaciones conectan automáticamente la información;
- no es necesario duplicar datos;
- y el modelo queda centralizado.

---
### Resultado esperado

Al finalizar el ejercicio, los participantes deberían visualizar:

- tres tablas independientes;
- relaciones conectadas entre ellas;
- y un modelo de datos funcional listo para construir visualizaciones.

---
### Reflexión final del ejercicio

Este ejercicio introduce uno de los conceptos más importantes de **Power BI**:

> Los datos no necesitan estar en una sola hoja para poder analizarse conjuntamente.

Las relaciones permiten que múltiples tablas “conversen” entre sí de manera automática, facilitando la construcción de *dashboards* e informes interactivos.

## Ejercicio 2 — Visualizaciones

### Objetivo del ejercicio

Construir visualizaciones interactivas utilizando información proveniente de múltiples tablas relacionadas.

---
### Duración estimada

12–15 minutos.

---
### Introducción

Una vez construido el modelo de datos, Power BI permite generar visualizaciones automáticamente utilizando la información conectada entre tablas.

A diferencia de *Excel*, donde normalmente se requiere:

- crear tablas dinámicas;
- seleccionar rangos manualmente;
- actualizar gráficos;
- o reorganizar información;

**Power BI** permite construir visualizaciones dinámicas simplemente arrastrando campos al área de trabajo.

En este ejercicio se crearán las primeras visualizaciones de un *dashboard*.

---
### Parte 1 — Crear gráfico de publicaciones por año

#### Paso 1

Seleccionar un gráfico de columnas.

---
#### Paso 2

Incorporar los siguientes campos:

**Eje X**  $Año \ Publicacion$

**Valores** $Conteo \ de \ ID-Publicacion$

#### Resultado esperado

Visualizar la cantidad de publicaciones por año.

---

### Parte 2 — Crear gráfico de publicaciones por departamento

#### Paso 1

Insertar un gráfico de barras.

---
#### Paso 2

Agregar:

**Eje** $Departamento$

**Valores** $Conteo \ de  \ ID-Publicacion$

**Concepto importante**

Este gráfico utiliza información proveniente de:

- la tabla `Investigadores`;
- y la tabla `Publicaciones`.

La relación creada en el ejercicio anterior permite combinar automáticamente los datos.

---

### Parte 3 — Crear gráfico por indexación

#### Paso 1

Insertar un gráfico circular o de barras.

---
#### Paso 2

Agregar:

**Categoría** $Indexacion$

**Valores** $Conteo \ de \ ID-Publicacion$

---

**Resultado esperado**

Visualizar la distribución de publicaciones según tipo de indexación:

- WoS;
- Scopus;
- SciELO;
- Otra.

---
### Parte 4 — Crear indicador KPI

#### Paso 1

Insertar una visualización tipo **Tarjeta**

---
#### Paso 2

Agregar: $Conteo \ de \ ID-Publicacion$

---

**Resultado esperado**

Visualizar el total general de publicaciones registradas en el sistema.

---
### Conceptos principales del ejercicio

Durante esta actividad se introducen los siguientes conceptos:

- visualizaciones;
- agregación automática;
- conteo de registros;
- gráficos interactivos;
- KPIs;
- análisis integrado.

Aunque no se explique formalmente, este ejercicio introduce:
1. **Agregación automática de datos**
	**Power BI** resume información automáticamente sin necesidad de crear tablas dinámicas manuales.
 2. **Uso simultáneo de múltiples tablas**
	Las visualizaciones combinan información proveniente de distintas tablas relacionadas.
 3. **Modelo centralizado**
	El análisis se realiza sobre el modelo completo y no sobre hojas aisladas.

---
#### Diferencias respecto al trabajo tradicional en Excel

En *Excel*, este tipo de análisis normalmente requiere:

- tablas dinámicas;
- consolidación manual;
- actualización de rangos;
- copia de gráficos;
- y reorganización frecuente de datos.

En **Power BI**:

- las visualizaciones se construyen automáticamente;
- los gráficos permanecen conectados al modelo;
- y cualquier actualización de datos se refleja dinámicamente.

---
### Resultado esperado

Al finalizar el ejercicio, los participantes deberían tener:

- múltiples visualizaciones;
- gráficos dinámicos;
- un KPI institucional;
- y un panel inicial de análisis académico.

Las visualizaciones deberían mostrar:

- publicaciones por año;
- publicaciones por departamento;
- publicaciones por indexación;
- total de publicaciones.

---
### Reflexión final del ejercicio

Este ejercicio introduce una de las principales fortalezas de **Power BI**:

> La capacidad de transformar múltiples tablas relacionadas en visualizaciones dinámicas e interactivas de manera rápida y automatizada.

A diferencia de *Excel*, donde gran parte del trabajo implica preparar manualmente los datos, **Power BI** permite enfocarse directamente en el análisis y la interpretación de la información.

## Ejercicio 3 — Filtros e interactividad del dashboard

#### Objetivo del ejercicio

Comprender cómo **Power BI** permite crear *dashboards* interactivos mediante filtros y segmentadores que modifican simultáneamente múltiples visualizaciones.

---
#### Duración estimada

10–12 minutos.

---
#### Introducción

Uno de los principales diferenciadores de **Power BI** respecto a *Excel* es la capacidad de generar interactividad automática entre gráficos, tablas e indicadores.

En *Excel*, normalmente:

- cada gráfico funciona de manera independiente;
- los filtros deben aplicarse manualmente;
- o se requieren configuraciones adicionales con tablas dinámicas y segmentadores.

En **Power BI**, las visualizaciones se encuentran conectadas al modelo de datos y reaccionan automáticamente a las selecciones realizadas por el usuario.

En este ejercicio se incorporarán filtros interactivos al *dashboard* institucional.

---

### Parte 1 — Crear segmentador por departamento

#### Paso 1

Seleccionar la visualización: $Segmentación \ de \ datos$

---
#### Paso 2

Agregar el campo: $Departamento$

---
#### Resultado esperado

El usuario podrá filtrar todas las visualizaciones del *dashboard* según departamento académico.

Por ejemplo:

- Ingeniería;
- Educación;
- Ciencias Sociales;
- Ciencias de la Salud.

---

### Parte 2 — Crear segmentador por indexación

#### Paso 1

Insertar un nuevo segmentador.

---
#### Paso 2

Agregar el campo: $Indexacion$

---
#### Resultado esperado

El *dashboard* podrá mostrar únicamente publicaciones:

- WoS;
- Scopus;
- SciELO;
- u otras categorías.

---
### Parte 3 — Crear segmentador por año

#### Paso 1

Agregar un nuevo segmentador.

---
#### Paso 2

Incorporar: $Año \ Publicacion$

---
#### Resultado esperado

Los participantes podrán explorar la evolución temporal de la productividad científica.

---
### Parte 4 — Explorar interactividad

Interactuar con:

- gráficos;
- barras;
- filtros;
- y segmentadores.

Observar cómo:

- todas las visualizaciones cambian simultáneamente;
- los KPIs se actualizan automáticamente;
- y el dashboard responde dinámicamente a las selecciones realizadas.

---
### Conceptos principales del ejercicio

Durante esta actividad se introducen los siguientes conceptos:

- filtros;
- segmentadores;
- interactividad;
- análisis dinámico;
- dashboards interactivos;
- exploración visual de datos.

Aunque no se expliquen formalmente, este ejercicio introduce:
 1. **Modelo interactivo de análisis**
	Las visualizaciones ya no son estáticas.
	El usuario puede explorar la información dinámicamente.
 2. **Conexión automática entre visualizaciones**
	Todos los gráficos se encuentran vinculados al modelo de datos central.
 3. **Navegación analítica**
	El *dashboard* deja de ser un reporte fijo y se transforma en una herramienta de exploración.

---
### Diferencias respecto al trabajo tradicional en *Excel*

En *Excel*, este tipo de interacción normalmente requiere:

- múltiples tablas dinámicas;
- segmentadores independientes;
- actualización manual;
- o configuraciones adicionales complejas.

En **Power BI**:

- todas las visualizaciones reaccionan automáticamente;
- los filtros afectan simultáneamente todo el *dashboard*;
- y el análisis se vuelve mucho más dinámico.

---
### Resultado esperado

Al finalizar el ejercicio, los participantes deberían tener:

- un *dashboard* interactivo;
- múltiples filtros dinámicos;
- visualizaciones conectadas;
- y capacidad de explorar información institucional en tiempo real.

---
### Reflexión final del ejercicio

Este ejercicio introduce una de las capacidades más potentes de **Power BI**:

> La posibilidad de construir *dashboards* dinámicos e interactivos donde toda la información se encuentra conectada automáticamente.

Más que generar gráficos estáticos, **Power BI** permite explorar datos institucionales de manera flexible, rápida y visual.

## Ejercicio 4 — Dashboard

### Objetivo del ejercicio

Integrar visualizaciones, indicadores y filtros en un *dashboard* que permita analizar información de productividad científica de manera clara, interactiva y visual.

---
### Duración estimada

10–15 minutos.

---
### Introducción

En los ejercicios anteriores se construyó:

- el modelo de datos;
- las relaciones entre tablas;
- las visualizaciones;
- y los filtros interactivos.

En esta actividad final, todos esos elementos serán organizados en un dashboard institucional similar a los utilizados en contextos reales de gestión universitaria.

El objetivo no es únicamente construir gráficos, sino transformar datos en información visual que facilite:

- análisis;
- monitoreo;
- toma de decisiones;
- y comunicación de resultados.

---
### Parte 1 — Organización del espacio de trabajo

#### Paso 1

Reorganizar las visualizaciones construidas previamente dentro de una misma página del informe.

---
#### Paso 2

Distribuir los elementos considerando:

- orden visual;
- alineación;
- legibilidad;
- tamaño;
- y claridad.

---
#### Recomendación visual

Se recomienda ubicar:

|Elemento|Ubicación sugerida|
|---|---|
|KPI principal|Parte superior|
|Segmentadores|Lado izquierdo o superior|
|Gráficos temporales|Zona central|
|Rankings y distribución|Parte inferior|

---
### Parte 2 — Incorporar título institucional

#### Paso 1

Insertar un cuadro de texto.

---
#### Paso 2

Agregar un título similar a: $Dashboard \ de \ Productividad \ Científica$

---
#### Paso 3

Opcionalmente incorporar:

- fecha;
- nombre de la facultad;
- o subtítulo descriptivo.

---

### Parte 3 — Ajustar visualizaciones

Revisar:

- tamaños;
- colores;
- títulos;
- etiquetas;
- y legibilidad de gráficos.

---
#### Recomendaciones

Evitar:

- exceso de colores;
- demasiados gráficos;
- saturación visual.

Priorizar:

- claridad;
- simplicidad;
- lectura rápida.

---
### Parte 4 — Validar interactividad

Probar:

- filtros;
- segmentadores;
- selección de gráficos;
- interacción entre visualizaciones.

Verificar que:

- los KPIs cambien;
- los gráficos respondan;
- y el dashboard permanezca coherente.

---
### Parte 5 — Interpretación del dashboard

Analizar visualmente preguntas como:

- ¿Qué departamento presenta mayor productividad?
- ¿Qué tipo de indexación predomina?
- ¿Cómo evoluciona la producción científica en el tiempo?
- ¿Qué investigadores destacan?
- ¿Qué proyectos presentan mayor actividad?

---
### Conceptos principales del ejercicio

Durante esta actividad se introducen los siguientes conceptos:

- *dashboards*;
- diseño visual;
- indicadores ejecutivos;
- análisis institucional;
- integración de visualizaciones;
- *storytelling* visual básico.

Aunque no se expliquen formalmente, este ejercicio introduce:

 1. **Comunicación visual de datos**
	Los *dashboards* permiten transformar datos complejos en información comprensible.
 2. **Análisis integrado**
	Múltiples indicadores pueden analizarse simultáneamente en un mismo entorno visual.
 3. **Toma de decisiones basada en datos**
	El *dashboard* facilita identificar:
	- tendencias;
	- comportamientos;
	- áreas destacadas;
	- y oportunidades de mejora.

---
### Diferencias respecto al trabajo tradicional en Excel

En *Excel*, construir un panel similar normalmente requiere:

- múltiples hojas;
- gráficos independientes;
- segmentadores separados;
- actualización manual;
- y reorganización frecuente de datos.

En **Power BI**:

- todas las visualizaciones permanecen conectadas;
- los filtros afectan automáticamente todo el informe;
- y el dashboard se actualiza dinámicamente.

---
### Resultado esperado

Al finalizar el ejercicio, los participantes deberían tener:

- un *dashboard* ejecutivo funcional;
- múltiples visualizaciones conectadas;
- filtros interactivos;
- KPIs institucionales;
- y un entorno visual listo para análisis académico.

---
### Reflexión final del ejercicio

Este ejercicio integra los principales conceptos trabajados durante el taller:

- modelos de datos;
- relaciones entre tablas;
- visualizaciones;
- filtros interactivos;
- y dashboards ejecutivos.

Más que reemplazar *Excel*, **Power BI** permite ampliar las capacidades tradicionales de análisis institucional mediante herramientas visuales, dinámicas e integradas.

---

# 8. Reflexiones finales

Durante el desarrollo de la sesión se trabajaron algunos de los conceptos fundamentales de **Power BI Desktop** utilizando un caso de estudio basado en productividad científica universitaria.

A lo largo de los ejercicios se abordaron aspectos relacionados con:

- importación de datos;
- relaciones entre tablas;
- visualizaciones;
- filtros interactivos;
- y construcción de *dashboards* ejecutivos.

Uno de los principales elementos trabajados fue la diferencia entre el enfoque tradicional de análisis en *Excel* y el trabajo mediante modelos de datos relacionados en **Power BI.**

Mientras *Excel* continúa siendo una herramienta extremadamente útil para:

- cálculos;
- análisis tabular;
- y construcción rápida de reportes;

**Power BI** permite ampliar estas capacidades mediante:

- integración de múltiples fuentes;
- *dashboards* interactivos;
- análisis dinámico;
- y automatización visual de información.

El objetivo del taller no fue reemplazar *Excel*, sino mostrar cómo ambas herramientas pueden complementarse dentro de procesos modernos de análisis y gestión institucional.

---

**Power BI** constituye actualmente una de las principales herramientas utilizadas en entornos de *Business Intelligence* y análisis institucional, permitiendo transformar datos en información visual útil para apoyar procesos de gestión y toma de decisiones.
