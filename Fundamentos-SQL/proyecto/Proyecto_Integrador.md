# Proyecto Integrador

## Fundamentos de Ingeniería de Datos y SQL

## 1. Contexto del caso

Una empresa dedicada a la comercialización de productos necesita mejorar la gestión y análisis de la información generada por sus operaciones de venta.

Actualmente dispone de información relacionada con clientes, productos y transacciones comerciales. Sin embargo, requiere evolucionar desde un registro básico de operaciones hacia una **arquitectura de datos que permita almacenar, integrar y analizar información para apoyar la toma de decisiones**.

La organización necesita responder preguntas como:

* ¿qué productos generan mayores ingresos?;
* ¿qué categorías presentan mejor desempeño?;
* ¿qué clientes concentran mayores niveles de compra?;
* ¿cómo evolucionan las ventas en el tiempo?;
* ¿qué períodos presentan mayores o menores niveles de actividad?;
* ¿cómo puede organizarse la información para facilitar el análisis histórico?

Para responder estos requerimientos, usted deberá desarrollar progresivamente una solución de ingeniería de datos que considere:

**modelo relacional → base de datos operacional → consultas SQL → modelo dimensional → proceso ETL → Data Warehouse → análisis OLAP.**

---

# 2. Propósito del proyecto

El proyecto tiene como propósito integrar los aprendizajes desarrollados durante la asignatura mediante la construcción progresiva de una solución de datos aplicada a un contexto organizacional.

El estudiante deberá demostrar su capacidad para:

1. diseñar e implementar un modelo de datos relacional;
2. consultar, manipular y analizar información mediante SQL;
3. transformar requerimientos organizacionales en consultas;
4. diseñar una estructura dimensional orientada al análisis;
5. implementar un proceso básico de extracción, transformación y carga;
6. validar la consistencia de la información trasladada al Data Warehouse;
7. construir y explorar una estructura analítica multidimensional.

---

# 3. Arquitectura general del proyecto

El proyecto deberá desarrollar el siguiente flujo:

```text
PROBLEMA DE NEGOCIO
        │
        ▼
MODELO RELACIONAL
        │
        ▼
BASE DE DATOS OPERACIONAL
        │
        ▼
CONSULTAS SQL
        │
        ▼
INDICADORES
        │
        ▼
MODELO DIMENSIONAL
        │
        ▼
ETL
        │
        ▼
DATA WAREHOUSE
        │
        ▼
MODELO OLAP
        │
        ▼
ANÁLISIS DE INFORMACIÓN
```

El proyecto será desarrollado de manera incremental durante las distintas sesiones de la asignatura.

---

# 4. Hito 1 — Modelo relacional y base operacional

## RAA1

A partir del contexto comercial presentado, diseñe e implemente una base de datos relacional que permita registrar clientes, productos y ventas.

Como estructura mínima, el modelo deberá considerar información equivalente a:

* clientes;
* productos;
* ventas;
* detalle de los productos asociados a cada venta.

El estudiante deberá determinar:

* entidades;
* atributos;
* claves primarias;
* claves foráneas;
* relaciones;
* cardinalidades;
* tipos de datos;
* restricciones básicas.

### Requerimientos mínimos

El modelo deberá permitir representar correctamente que:

* un cliente puede realizar múltiples ventas;
* cada venta pertenece a un cliente;
* una venta puede contener múltiples productos;
* un producto puede participar en múltiples ventas.

El diseño deberá resolver correctamente la relación existente entre ventas y productos.

### Implementación

El modelo deberá ser implementado inicialmente en **Oracle APEX / SQL Workshop**.

El script deberá incluir:

* `CREATE TABLE`;
* `PRIMARY KEY`;
* `FOREIGN KEY`;
* `NOT NULL` cuando corresponda;
* tipos de datos adecuados;
* carga inicial de datos.

La cantidad de registros debe ser suficiente para permitir posteriormente análisis significativos.

---

# 5. Hito 2 — SQL, consultas e indicadores

## RAA2

Sobre la base operacional construida, desarrollar consultas SQL destinadas a responder requerimientos de información de la organización.

## 5.1 Operaciones básicas

El proyecto deberá incluir evidencia de:

* `SELECT`;
* `WHERE`;
* `ORDER BY`;
* `INSERT`;
* `UPDATE`;
* `DELETE`.

Para operaciones que modifiquen o eliminen información deberá demostrarse la secuencia:

```text
Verificar → Modificar → Verificar
```

---

## 5.2 Integración de información

Construir consultas que combinen información proveniente de múltiples tablas.

Deberá demostrarse el uso pertinente de:

* `INNER JOIN`;
* `LEFT JOIN`;
* alias;
* consultas sobre tres o más tablas.

Por ejemplo, el modelo deberá permitir reconstruir una transacción mostrando:

* cliente;
* venta;
* fecha;
* producto;
* categoría;
* cantidad;
* precio.

---

## 5.3 Indicadores

Construir consultas orientadas al análisis mediante:

* `COUNT`;
* `SUM`;
* `AVG`;
* `MIN`;
* `MAX`;
* `GROUP BY`;
* `HAVING`;
* `ORDER BY`.

El estudiante deberá generar indicadores que permitan analizar, al menos:

* ventas;
* clientes;
* productos;
* categorías.

---

# 6. Requerimientos de información

A partir de su modelo, deberá resolver mediante SQL los siguientes requerimientos.

### Requerimiento 1

Identificar los productos que generan mayores ingresos.

### Requerimiento 2

Construir un ranking de clientes según el monto total de sus compras.

### Requerimiento 3

Comparar el desempeño comercial de las distintas categorías de productos.

### Requerimiento 4

Identificar clientes que no registran compras.

### Requerimiento 5

Identificar productos que no han registrado ventas.

### Requerimiento 6

Identificar productos cuyo precio se encuentra por encima del precio promedio del catálogo.

### Requerimiento 7

Construir un reporte comercial que combine información de clientes, ventas y productos e incluya al menos un indicador agregado.

### Requerimiento 8 — Análisis autónomo

Formule **una pregunta de negocio adicional** que pueda responderse utilizando los datos disponibles.

El estudiante deberá:

1. formular la pregunta;
2. justificar su relevancia;
3. construir la consulta SQL;
4. interpretar el resultado obtenido.

Este último requerimiento es importante porque ya no estamos evaluando únicamente la capacidad de reproducir una consulta.

---

# 7. Hito 3 — Diseño del Data Warehouse

## RAA3

A partir de la base operacional desarrollada, diseñar una estructura dimensional orientada al análisis histórico de las ventas.

El estudiante deberá identificar:

* proceso de negocio;
* granularidad;
* tabla de hechos;
* dimensiones;
* medidas;
* relaciones.

## Declaración de granularidad

Antes de construir el modelo deberá completar explícitamente:

> **Una fila de la tabla de hechos representa ________________________________.**

Esta definición deberá ser coherente con las medidas y dimensiones utilizadas posteriormente.

---

# 8. Modelo dimensional

Como mínimo, el diseño deberá permitir analizar las ventas desde las perspectivas:

```text
TIEMPO
CLIENTE
PRODUCTO
```

El modelo deberá considerar una estructura equivalente a:

```text
                    DIM_TIEMPO
                         │
                         ▼
DIM_CLIENTE ─────── FACT_VENTAS ─────── DIM_PRODUCTO
```

El estudiante deberá definir los atributos de cada dimensión y las medidas incorporadas en la tabla de hechos.

Entre las medidas podrán considerarse:

* cantidad vendida;
* precio unitario;
* importe de venta.

El diseño deberá justificarse considerando las necesidades analíticas de la organización.

---

# 9. Esquema estrella y snowflake

El estudiante deberá:

1. implementar o representar el modelo dimensional utilizando un **esquema estrella**;
2. identificar al menos una modificación que permitiría convertir parcialmente el modelo a una estructura **snowflake**;
3. explicar brevemente cuál de las dos alternativas considera más apropiada para el caso desarrollado.

No se requiere implementar físicamente ambas alternativas.

---

# 10. Hito 4 — ETL y construcción del Data Warehouse

## RAA3

Implementar un proceso ETL que permita trasladar la información desde el modelo operacional hacia el Data Warehouse.

El proceso deberá contemplar:

```text
EXTRACT
   ↓
TRANSFORM
   ↓
LOAD
```

## Extracción

Identificar y extraer desde el sistema operacional los datos necesarios para poblar:

* dimensión cliente;
* dimensión producto;
* dimensión tiempo;
* tabla de hechos.

## Transformación

El proceso deberá incluir transformaciones pertinentes, por ejemplo:

* limpieza de texto;
* estandarización de valores;
* tratamiento de fechas;
* generación de atributos temporales;
* cálculo de medidas;
* tratamiento básico de inconsistencias.

Debe existir al menos **una transformación de calidad de datos claramente identificable**.

## Carga

La información deberá cargarse respetando la dependencia lógica:

```text
DIMENSIONES
     ↓
TABLA DE HECHOS
```

El proceso podrá implementarse mediante **SQL Server Integration Services (SSIS)**.

---

# 11. Validación del ETL

No será suficiente demostrar que el proceso ETL terminó correctamente.

El estudiante deberá validar los resultados.

Como mínimo deberá comprobar:

### Conteo de registros

Comparar cantidades entre origen y destino cuando corresponda.

### Integridad

Comprobar que la tabla de hechos se encuentre correctamente relacionada con sus dimensiones.

### Métricas

Comparar al menos un indicador entre el sistema operacional y el Data Warehouse.

Por ejemplo:

```text
Ingresos calculados en sistema operacional
                    =
Ingresos almacenados en Data Warehouse
```

El estudiante deberá explicar cualquier diferencia detectada.

---

# 12. Hito 5 — Modelo OLAP y análisis multidimensional

## RAA3

Utilizando el Data Warehouse como fuente, construir una estructura analítica multidimensional.

El modelo deberá incluir:

* fuente de datos;
* vista de fuente de datos;
* dimensiones;
* medidas;
* al menos una jerarquía;
* estructura OLAP procesada correctamente.

Como mínimo deberán existir las perspectivas:

* tiempo;
* cliente;
* producto.

Y las medidas:

* ingresos;
* unidades vendidas.

---

# 13. Jerarquía temporal

La dimensión tiempo deberá permitir navegar entre distintos niveles temporales.

Por ejemplo:

```text
Año
 ↓
Trimestre
 ↓
Mes
 ↓
Fecha
```

El estudiante deberá demostrar al menos una exploración mediante diferentes niveles de esta jerarquía.

---

# 14. Análisis final

Utilizando el modelo analítico construido, responder al menos las siguientes preguntas:

### Análisis 1

¿Cómo evolucionan los ingresos a través del tiempo?

### Análisis 2

¿Qué categorías generan mayores ingresos?

### Análisis 3

¿Cómo varían las unidades vendidas según categoría y período?

### Análisis 4

¿Qué clientes o grupos de clientes presentan mayor contribución a los ingresos?

### Análisis 5 — Autónomo

Formular y responder una pregunta analítica adicional utilizando las dimensiones y medidas disponibles.

---

# 15. Entregables


```text
APELLIDO_NOMBRE_PROYECTO/
│
├── 01_modelo_relacional/
│   ├── modelo_relacional.pdf
│   └── creacion_base.sql
│
├── 02_sql/
│   ├── crud.sql
│   ├── consultas_join.sql
│   ├── indicadores.sql
│   └── consultas_aplicadas.sql
│
├── 03_data_warehouse/
│   ├── modelo_dimensional.pdf
│   └── creacion_dw.sql
│
├── 04_etl/
│   ├── proyecto_ssis/
│   └── validacion_etl.sql
│
├── 05_olap/
│   ├── proyecto_ssas/
│   └── evidencias/
│
└── informe_final.pdf
```

## Informe final

Extensión máxima sugerida: **6 páginas**, sin considerar portada.

Debe contener:

1. descripción del problema;
2. modelo relacional;
3. principales consultas e indicadores;
4. modelo dimensional y granularidad;
5. descripción del proceso ETL;
6. evidencia de validación;
7. evidencia del análisis OLAP;
8. principales resultados y conclusiones.


---

# 16. Criterios de evaluación

| Criterio                                                   | RAA       | Ponderación |
| ---------------------------------------------------------- | --------- | ----------: |
| **1. Diseño e implementación del modelo relacional**       | RAA1      |     **15%** |
| **2. Consultas SQL y manipulación de datos**               | RAA2      |     **20%** |
| **3. Análisis e indicadores mediante SQL**                 | RAA2      |     **15%** |
| **4. Diseño del modelo dimensional y Data Warehouse**      | RAA3      |     **15%** |
| **5. Implementación y validación del proceso ETL**         | RAA3      |     **15%** |
| **6. Modelo OLAP y análisis multidimensional**             | RAA3      |     **15%** |
| **7. Documentación, interpretación y coherencia integral** | RAA1–RAA3 |      **5%** |
| **Total**                                                  |           |    **100%** |

---

# 17. Rúbrica de evaluación

**Excelente = 5 | Adecuado = 4 | Básico = 2 | Insuficiente = 0**

| Criterio                             | Excelente (5)                                                                                                                                                    | Adecuado (4)                                                                                                        | Básico (2)                                                                                                     | Insuficiente (0)                                                                    |   Pond. |
| ------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ------: |
| **Modelo relacional**                | Diseña e implementa un modelo coherente con el problema, con entidades, atributos, PK, FK, cardinalidades, tipos y restricciones correctamente definidos.        | El modelo es funcional y mayoritariamente correcto, con errores menores de diseño o implementación.                 | Presenta errores relevantes de estructura, relaciones o integridad que afectan parcialmente su funcionamiento. | El modelo no responde al problema o presenta errores graves que impiden utilizarlo. | **15%** |
| **Consultas SQL y manipulación**     | Utiliza correctamente SELECT, filtros, JOIN, INSERT, UPDATE y DELETE, construyendo consultas coherentes y seguras.                                               | Resuelve correctamente la mayoría de los requerimientos, con errores menores.                                       | Evidencia dominio parcial; varias operaciones presentan problemas de construcción o lógica.                    | Las consultas no funcionan o no evidencian dominio de los contenidos fundamentales. | **20%** |
| **Análisis e indicadores SQL**       | Integra tablas, agregaciones, GROUP BY, HAVING, subconsultas y ordenamiento para responder correctamente requerimientos analíticos e interpreta los resultados.  | Resuelve la mayoría de los análisis con pequeñas inconsistencias.                                                   | Los indicadores son incompletos o presentan errores relevantes de cálculo o interpretación.                    | No logra generar indicadores válidos a partir de los datos.                         | **15%** |
| **Modelo dimensional y DW**          | Define correctamente proceso, granularidad, hechos, dimensiones y medidas, construyendo un modelo dimensional coherente con los requerimientos analíticos.       | El modelo es apropiado, aunque presenta errores menores o decisiones parcialmente justificadas.                     | Confunde o define parcialmente hechos, dimensiones, medidas o granularidad.                                    | El modelo dimensional es inexistente o conceptualmente incorrecto.                  | **15%** |
| **ETL y validación**                 | Implementa correctamente extracción, transformaciones pertinentes y carga de dimensiones/hechos, incorporando controles de calidad y validación origen-destino.  | El ETL funciona correctamente en sus componentes principales, con problemas menores de transformación o validación. | El proceso funciona parcialmente o evidencia escasa transformación/validación.                                 | El ETL no funciona o se limita a una transferencia sin coherencia con el DW.        | **15%** |
| **OLAP y análisis multidimensional** | Implementa correctamente dimensiones, medidas y jerarquías, procesa el modelo y realiza análisis multidimensional coherente con los requerimientos.              | El modelo funciona y permite realizar la mayoría de los análisis solicitados, con errores menores.                  | El modelo es parcialmente funcional o presenta problemas relevantes en dimensiones, medidas o análisis.        | No implementa una estructura analítica funcional.                                   | **15%** |
| **Documentación e integración**      | Documenta claramente el proceso completo, aporta evidencias pertinentes, interpreta resultados y demuestra coherencia entre las distintas etapas de la solución. | Documenta adecuadamente la mayoría de las etapas y resultados.                                                      | La documentación es incompleta y presenta escasa integración o interpretación.                                 | No documenta suficientemente el proyecto ni permite verificar su desarrollo.        |  **5%** |

---

# 18. Cálculo del porcentaje de logro

Mantendría exactamente la lógica anterior:

```text
(Puntaje obtenido / 5) × ponderación del criterio
```

El porcentaje final corresponde a la suma de los siete criterios.

La calificación se obtiene utilizando la escala institucional correspondiente.

---

# 19. Recomendaciones

* Construir el proyecto progresivamente; no dejar su integración para el final.
* Validar cada componente antes de continuar con la siguiente etapa.
* Mantener consistencia en nombres de tablas, atributos y claves.
* Ejecutar y verificar las consultas SQL antes de incorporarlas a la entrega.
* Definir la granularidad antes de construir la tabla de hechos.
* Cargar las dimensiones antes de la tabla de hechos.
* Verificar los datos después de ejecutar el ETL.
* Comparar métricas entre origen y Data Warehouse.
* Interpretar los resultados y no limitarse a presentar capturas de pantalla.

# 20. Resultado esperado

Al finalizar el proyecto, el estudiante habrá desarrollado una solución integrada que permita recorrer las principales etapas trabajadas en la asignatura:

**Problema → Modelo relacional → Base operacional → SQL → Indicadores → Modelo dimensional → ETL → Data Warehouse → OLAP → Análisis.**
