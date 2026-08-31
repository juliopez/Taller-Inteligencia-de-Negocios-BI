# Fundamentos de Ingeniería de Datos y SQL

Repositorio de materiales docentes para la asignatura **Fundamentos de Ingeniería de Datos y SQL**, perteneciente al **Diplomado en Ingeniería de Datos con Python**.

**Docente:** Dr. Julio Lopez-Nunez

## Descripción

La asignatura aborda los fundamentos de la ingeniería de datos mediante un enfoque predominantemente práctico, integrando modelamiento relacional, implementación de bases de datos, consultas SQL, modelamiento dimensional, procesos ETL y fundamentos de análisis multidimensional.

El curso se estructura mediante un **proyecto transversal y progresivo** que permite recorrer distintas etapas del ciclo de vida de los datos:

**Problema de negocio → Modelo relacional → Base de datos → SQL → Análisis → Data Warehouse → ETL → OLAP → Business Intelligence**

A lo largo de las sesiones, los estudiantes construyen progresivamente una solución de ingeniería de datos, comenzando con el diseño de una base operacional y finalizando con la implementación y exploración de una arquitectura analítica.

## Resultados de Aprendizaje

| Resultado | Descripción                                                                                                                                                                                                                    |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **RAA1**  | Diseñar modelos de datos relacionales utilizando principios de la ingeniería de datos y lenguaje SQL, con el fin de estructurar información de manera eficiente en contextos organizacionales y proyectos intensivos en datos. |
| **RAA2**  | Implementar consultas SQL para la extracción, transformación y análisis de datos desde sistemas de almacenamiento estructurado, considerando criterios de eficiencia y coherencia con los requerimientos del proyecto.         |
| **RAA3**  | Evaluar estructuras de almacenamiento de datos aplicando conceptos de data warehousing en escenarios reales de ingeniería de datos, valorando su impacto en la calidad, disponibilidad y uso estratégico de la información.    |

## Organización de la asignatura

La asignatura se desarrolla en **nueve sesiones**, organizadas en tres bloques progresivos.

| Sesión                                            | RAA dominante | Contenidos principales                                                         | Actividad práctica central                                         |
| ------------------------------------------------- | ------------- | ------------------------------------------------------------------------------ | ------------------------------------------------------------------ |
| **S1. De los datos al modelo relacional**         | RAA1          | Ingeniería de datos, entidades, atributos, relaciones, claves y cardinalidad   | Diseño del modelo relacional a partir de un problema de negocio    |
| **S2. Del modelo relacional a la base de datos**  | RAA1          | Modelo físico, tipos de datos, PK, FK, restricciones y buenas prácticas        | Implementación de la base de datos y carga inicial de datos        |
| **S3. SQL básico y operaciones CRUD**             | RAA2          | SELECT, WHERE, ORDER BY, INSERT, UPDATE y DELETE                               | Consulta y manipulación controlada de datos                        |
| **S4. JOIN y consultas multitabla**               | RAA2          | INNER JOIN, LEFT JOIN, alias y consultas sobre múltiples tablas                | Integración de información distribuida en el modelo relacional     |
| **S5. Agregaciones e indicadores con SQL**        | RAA2          | COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING y ORDER BY                         | Construcción de indicadores comerciales                            |
| **S6. Consultas SQL aplicadas**                   | RAA2          | Filtros avanzados, subconsultas, integración de operaciones y buenas prácticas | Resolución autónoma de requerimientos de información               |
| **S7. Del modelo relacional al Data Warehouse**   | RAA3          | OLTP vs. DW, hechos, dimensiones, medidas, granularidad, estrella y snowflake  | Transformación del modelo operacional en modelo dimensional        |
| **S8. ETL y construcción del Data Warehouse**     | RAA3          | Extract, Transform, Load, calidad de datos y validación                        | Implementación de un proceso ETL para poblar el Data Warehouse     |
| **S9. OLAP, Business Intelligence e integración** | RAA3          | Dimensiones, medidas, jerarquías, OLAP y arquitectura BI                       | Construcción y exploración de un modelo analítico multidimensional |

## Metodología

La asignatura utiliza una metodología de aprendizaje **progresiva y orientada a la práctica**.

Cada sesión combina una breve introducción conceptual y demostración del docente con un bloque principal de trabajo práctico, en el que los estudiantes aplican los conceptos sobre un caso transversal.

La progresión de las actividades sigue principalmente la secuencia:

**Demostración → Ejercicio guiado → Ejercicio autónomo → Desafío aplicado**

A medida que avanza la asignatura disminuye progresivamente el nivel de andamiaje. En las primeras sesiones se proporcionan instrucciones más detalladas, mientras que posteriormente los estudiantes deben seleccionar de manera autónoma las herramientas y estrategias necesarias para resolver requerimientos de información.

## Caso transversal

Durante la asignatura se utiliza un caso comercial como hilo conductor.

El modelo operacional inicial considera las siguientes entidades:

```text
CLIENTES
    │
    └──────< VENTAS
                │
                └──────< DETALLE_VENTAS >────── PRODUCTOS
```

Las principales tablas son:

```text
CLIENTES
PRODUCTOS
VENTAS
DETALLE_VENTAS
```

Este mismo modelo evoluciona durante la asignatura.

### Etapa operacional

```text
Problema de negocio
        ↓
Modelo relacional
        ↓
Base de datos
        ↓
Consultas SQL
        ↓
Indicadores
```

### Etapa analítica

```text
Base operacional
        ↓
Modelo dimensional
        ↓
ETL
        ↓
Data Warehouse
        ↓
OLAP
        ↓
Business Intelligence
```

Esta continuidad permite comprender que las distintas tecnologías estudiadas no constituyen componentes aislados, sino partes de una misma arquitectura de datos.

## Proyecto integrador

El aprendizaje se articula mediante un **proyecto integrador incremental** desarrollado durante toda la asignatura.

### Hito 1 — Modelo relacional

Diseño e implementación de una base de datos operacional a partir de un problema de negocio.

Incluye:

* identificación de entidades y atributos;
* definición de claves primarias y foráneas;
* relaciones y cardinalidades;
* implementación física de las tablas;
* carga inicial de datos.

### Hito 2 — SQL y análisis

Construcción de consultas orientadas a extracción, manipulación y análisis de información.

Incluye:

* operaciones CRUD;
* filtros;
* JOIN;
* agregaciones;
* agrupamiento;
* subconsultas;
* construcción de indicadores;
* resolución de requerimientos organizacionales.

### Hito 3 — Arquitectura analítica

Transformación del sistema operacional hacia una arquitectura orientada al análisis.

Incluye:

* diseño dimensional;
* tabla de hechos y dimensiones;
* definición de granularidad y medidas;
* construcción del Data Warehouse;
* implementación de ETL;
* validación de datos;
* construcción y exploración de un modelo OLAP.

## Herramientas tecnológicas

Durante las actividades prácticas se utilizan principalmente:

* **Oracle APEX / SQL Workshop**
* **Oracle SQL**
* **SQL Server**
* **Visual Studio**
* **SQL Server Integration Services (SSIS)**
* **SQL Server Analysis Services (SSAS)**

Las herramientas constituyen medios para aplicar los conceptos de la asignatura. El foco principal se encuentra en comprender los principios de **modelamiento, integración, transformación, almacenamiento y análisis de datos**.

## Estructura del repositorio

```text
Fundamentos-Ingenieria-Datos-SQL/
│
├── README.md
│
├── material_docente/
│   ├── sesion-01/
│   ├── sesion-02/
│   ├── sesion-03/
│   ├── sesion-04/
│   ├── sesion-05/
│   ├── sesion-06/
│   ├── sesion-07/
│   ├── sesion-08/
│   └── sesion-09/
│
├── scripts/
│   ├── modelo_operacional/
│   ├── consultas_sql/
│   └── data_warehouse/
│
├── etl/
│
├── olap/
│
└── proyecto/
```

