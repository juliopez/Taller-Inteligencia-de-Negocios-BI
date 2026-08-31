# Sesión 9

# OLAP, Business Intelligence e integración

**Asignatura:** Fundamentos de Ingeniería de Datos y SQL
**Duración:** 3 horas
**Modalidad:** Online sincrónica
**Entorno práctico:** SQL Server + Visual Studio / SQL Server Analysis Services (SSAS)
**RAA dominante:** RAA3
**Carácter:** Sesión integradora y cierre del módulo

## Objetivo de aprendizaje

Implementar y explorar una estructura analítica multidimensional a partir del Data Warehouse construido, identificando dimensiones, medidas y jerarquías, y relacionando los componentes desarrollados durante el curso dentro de una arquitectura integrada de ingeniería de datos y Business Intelligence.

## Descripción de la jornada

Durante S7 los estudiantes diseñaron un modelo dimensional orientado al análisis y en S8 implementaron un proceso ETL para poblar sus dimensiones y tabla de hechos.

En esta sesión final se utilizará ese Data Warehouse como fuente para construir una estructura OLAP que permita analizar las ventas desde diferentes perspectivas.

Los estudiantes identificarán medidas, dimensiones y jerarquías, procesarán la estructura analítica y explorarán los resultados mediante operaciones multidimensionales.

Finalmente, se reconstruirá la arquitectura completa desarrollada durante el curso, desde el problema organizacional y la base operacional hasta el Data Warehouse y su explotación analítica.

# Agenda

| Bloque                    |      Tiempo | Actividad                                                           |
| ------------------------- | ----------: | ------------------------------------------------------------------- |
| Exposición + demostración |  **45 min** | BI, OLAP, dimensiones, medidas, jerarquías y arquitectura integrada |
| Break                     |  **15 min** | Descanso                                                            |
| Taller práctico           | **120 min** | Construcción y exploración de modelo OLAP                           |
| Cierre                    |  **15 min** | Integración S1–S9 y cierre del módulo                               |

# Bloque 1 — Exposición y demostración

## 19:15–20:00

## 1. ¿Dónde estamos?

Comenzaría reconstruyendo exclusivamente lo realizado en S7 y S8:

```text
BASE OPERACIONAL
      │
      │
      ▼
     ETL
      │
      ▼
DATA WAREHOUSE
      │
      ├── DIM_CLIENTE
      ├── DIM_PRODUCTO
      ├── DIM_TIEMPO
      └── FACT_VENTAS
```

Nuestro Data Warehouse contiene información preparada para análisis.

Podemos ejecutar:

```sql
SELECT SUM(importe)
FROM FACT_VENTAS;
```

o:

```sql
SELECT p.categoria,
       SUM(f.importe)
FROM FACT_VENTAS f
INNER JOIN DIM_PRODUCTO p
    ON f.id_producto = p.id_producto
GROUP BY p.categoria;
```

SQL continúa funcionando perfectamente.

Entonces planteamos:

> ¿Cómo facilitamos que un usuario pueda analizar esta información repetidamente desde diferentes perspectivas?

---

# 2. Business Intelligence

Aquí recuperaría de forma muy acotada la definición de la antigua sesión final:

> Business Intelligence comprende metodologías, procesos y tecnologías destinadas a transformar datos en información útil para apoyar la toma de decisiones. 

Pero ahora podemos mostrar dónde se ubica:

```text
FUENTES
   │
   ▼
 ETL
   │
   ▼
DATA WAREHOUSE
   │
   ▼
OLAP / MODELO ANALÍTICO
   │
   ▼
REPORTES / DASHBOARDS
   │
   ▼
DECISIONES
```

BI ya no es una definición abstracta.

Es la arquitectura que llevamos tres sesiones construyendo.

---

# 3. ¿Qué es OLAP?

La antigua sesión explicaba OLAP como una estructura destinada a analizar grandes volúmenes de información desde múltiples perspectivas. 

Aplicado a nuestro caso:

Queremos analizar:

**¿Qué?**

```text
VENTAS
```

**¿Cuándo?**

```text
TIEMPO
```

**¿Qué producto?**

```text
PRODUCTO
```

**¿Quién compró?**

```text
CLIENTE
```

Visualmente:

```text
                  TIEMPO
                    │
                    │
                    ▼
CLIENTE ───────── VENTAS ───────── PRODUCTO
```

Estas perspectivas constituyen nuestras **dimensiones de análisis**.

---

# 4. Medidas

Nuestro modelo contiene:

```text
cantidad
precio_unitario
importe
```

Pero no todas tienen necesariamente el mismo comportamiento analítico.

Las medidas principales podrían ser:

```text
Unidades vendidas = SUM(cantidad)

Ingresos = SUM(importe)
```

Y podríamos agregar:

```text
Cantidad de transacciones
```

Introducir una idea sencilla:

> **Las medidas representan aquello que queremos cuantificar.**

Las dimensiones representan:

> **desde qué perspectiva queremos analizarlo.**

---

# 5. Dimensiones

Nuestro Data Warehouse ya las contiene.

### DIM_PRODUCTO

```text
Producto
Categoría
```

### DIM_CLIENTE

```text
Cliente
Ciudad
```

### DIM_TIEMPO

```text
Fecha
Mes
Trimestre
Año
```

La conexión S7 → S9 debe ser explícita:

> Diseñamos dimensiones en S7 precisamente porque queríamos proporcionar perspectivas de análisis.

Ahora vamos a utilizarlas.

---

# 6. Jerarquías

Este es un concepto nuevo que sí merece explicación.

En `DIM_TIEMPO` tenemos:

```text
Año
 ↓
Trimestre
 ↓
Mes
 ↓
Fecha
```

Esto constituye una jerarquía natural.

Permite comenzar observando:

```text
2026
```

y descender hacia:

```text
2026
 ├── Q1
 ├── Q2
 ├── Q3
 │    ├── Julio
 │    ├── Agosto
 │    └── Septiembre
 └── Q4
```

Conceptualmente:

> **Una jerarquía permite navegar entre distintos niveles de detalle dentro de una dimensión.**

---

# 7. Drill-down y roll-up

Utilizar inmediatamente la jerarquía temporal.

### Roll-up

Pasar:

```text
Mes → Trimestre → Año
```

Menor nivel de detalle.

### Drill-down

Pasar:

```text
Año → Trimestre → Mes
```

Mayor nivel de detalle.

No convertiría la sesión en una clase extensa de terminología OLAP. Basta con que puedan experimentar ambas operaciones.

---

# 8. Slice y dice

Introducirlos mediante preguntas, no definiciones.

### Slice

> Muéstreme solamente las ventas del año 2026.

Seleccionamos un valor de una dimensión.

### Dice

> Muéstreme ventas de Tecnología y Accesorios durante determinados meses de 2026.

Seleccionamos subconjuntos de diferentes dimensiones.

Esto ayuda a comprender por qué hablamos de **análisis multidimensional**.

---

# 9. Del modelo estrella al modelo OLAP

Mostrar:

### Data Warehouse

```text
                    DIM_TIEMPO
                         │
                         ▼
DIM_CLIENTE ─────── FACT_VENTAS ─────── DIM_PRODUCTO
```

### Modelo analítico

```text
                 CUBO VENTAS

        ┌────────────────────────┐
        │ MEDIDAS                │
        │                        │
        │ Ingresos               │
        │ Unidades vendidas      │
        │ Transacciones          │
        └────────────────────────┘

          ▲          ▲          ▲
          │          │          │
       TIEMPO     CLIENTE    PRODUCTO
```

Aquí debería quedar muy clara la relación entre **modelo dimensional y OLAP**.

---

# 10. ¿Qué haremos en Visual Studio?

Mostrar solamente el mapa de trabajo:

```text
Data Source
     ↓
Data Source View
     ↓
Dimensions
     ↓
Cube
     ↓
Measures
     ↓
Process
     ↓
Browse
```

Esto evita que Visual Studio se convierta en una secuencia de clics sin significado.

# Break

## 20:00–20:15

# Taller práctico

## 20:15–22:15

Como en S8, utilizaremos:

**demostración breve → reproducción → validación.**

# Etapa 1 — Crear proyecto Analysis Services

### 15 minutos

En Visual Studio:

1. crear proyecto de Analysis Services;
2. establecer conexión con `DW_COMERCIAL`;
3. crear Data Source;
4. verificar conexión.

El estudiante debe comprender:

```text
SSAS
 │
 ▼
DW_COMERCIAL
```

El Data Warehouse es la **fuente del modelo analítico**.

---

# Etapa 2 — Data Source View

### 15 minutos

Incorporar:

```text
DIM_CLIENTE
DIM_PRODUCTO
DIM_TIEMPO
FACT_VENTAS
```

Visualizar nuevamente:

```text
                    DIM_TIEMPO
                         │
                         ▼
DIM_CLIENTE ─────── FACT_VENTAS ─────── DIM_PRODUCTO
```

Pregunta:

> ¿Por qué SSAS reconoce estas relaciones?

Porque las estructuras fueron diseñadas previamente.

---

# Etapa 3 — Construcción de dimensiones

### 20 minutos

Crear:

```text
DIM CLIENTE
DIM PRODUCTO
DIM TIEMPO
```

Incorporar atributos.

### Cliente

```text
Nombre
Ciudad
```

### Producto

```text
Nombre Producto
Categoría
```

### Tiempo

```text
Fecha
Mes
Trimestre
Año
```

---

# Etapa 4 — Jerarquía temporal

### 15 minutos

Construir:

```text
Año
 ↓
Trimestre
 ↓
Mes
 ↓
Fecha
```

Explicar durante la práctica por qué ese orden tiene sentido.

Este componente debería quedar obligatorio en el producto final de S9.

---

# Etapa 5 — Construcción del cubo

### 20 minutos

Crear:

**`CUBO_VENTAS`**

Seleccionar la tabla:

```text
FACT_VENTAS
```

Definir medidas:

```text
Ingresos
Unidades Vendidas
```

y, si la configuración lo permite sin complicaciones innecesarias:

```text
Cantidad de registros / transacciones
```

Verificar relaciones con:

```text
DIM_CLIENTE
DIM_PRODUCTO
DIM_TIEMPO
```

---

# Etapa 6 — Procesar

### 10 minutos

Ejecutar procesamiento.

Aquí recuperaría el mismo principio de S8:

> **Que el proceso termine correctamente no significa todavía que el modelo sea correcto.**

Necesitamos validarlo.

---

# Etapa 7 — Primera exploración

### 15 minutos

Construir:

**Ingresos por categoría**

```text
Categoría             Ingresos
Tecnología             ...
Accesorios             ...
...
```

Luego:

**Ingresos por año**

```text
Año                    Ingresos
2025                    ...
2026                    ...
```

Comparar al menos una medida con SQL:

```sql
SELECT SUM(importe)
FROM FACT_VENTAS;
```

El total debería coincidir.

Así mantenemos durante S8 y S9 el principio:

**procesar → verificar.**

---

# Etapa 8 — Análisis multidimensional

### 10 minutos

Construir una matriz:

```text
                    2025       2026
Tecnología           ...        ...
Accesorios           ...        ...
Hogar                ...        ...
```

Estamos cruzando:

```text
DIM_PRODUCTO
      ×
DIM_TIEMPO
      ×
MEDIDA INGRESOS
```

Este es probablemente el momento en que el concepto de multidimensionalidad se vuelve realmente evidente.

# Desafío integrador

### 15 minutos

Entregar exclusivamente el requerimiento:

> **La gerencia necesita analizar la evolución de los ingresos y unidades vendidas por categoría de producto durante los distintos períodos disponibles. Además, necesita poder descender desde el año hasta el mes y filtrar los resultados según ciudad del cliente.**

No indicar:

* dimensiones;
* medidas;
* jerarquías;
* operaciones.

Los estudiantes deberán determinar cómo configurar y explorar el modelo.

# Producto de la sesión

El estudiante deberá finalizar con un modelo OLAP que incluya:

* fuente de datos;
* Data Source View;
* `DIM_CLIENTE`;
* `DIM_PRODUCTO`;
* `DIM_TIEMPO`;
* jerarquía temporal;
* `CUBO_VENTAS`;
* medida de ingresos;
* medida de unidades vendidas;
* evidencia de procesamiento;
* evidencia de análisis multidimensional.

Podemos denominar el producto:

**`07_modelo_olap_comercial`**

# Una demostración final de Dashboard

Aquí sería deliberadamente prudente.

La antigua sesión incluía dashboards como uno de los productos finales de BI y mencionaba herramientas como Power BI, Tableau, Oracle Analytics y Looker Studio. 

En la nueva versión **no dedicaría una parte importante de S9 a enseñar Power BI**.

Tenemos solamente 3 horas y el RAA3 se concentra en evaluar estructuras de almacenamiento y Data Warehousing.

Sí haría una demostración final de **5–10 minutos**, dentro del cierre, mostrando conceptualmente:

```text
CUBO / MODELO ANALÍTICO
          ↓
       Power BI
          ↓
     DASHBOARD
```

con:

* tarjeta de ingresos;
* ventas por categoría;
* evolución temporal;
* filtro por cliente o ciudad.

La intención no es:

> "Ahora aprenderemos Power BI."

Es demostrar:

> **Este es uno de los posibles consumidores de la arquitectura que acabamos de construir.**

# Cierre final del curso

## 22:15–22:30

## S1 — Problema → Modelo

Diseñamos:

```text
CLIENTES
PRODUCTOS
VENTAS
DETALLE_VENTAS
```

## S2 — Modelo → Base de datos

Implementamos:

```text
Tablas
PK
FK
Restricciones
Datos
```

## S3 — Datos → Operaciones

Aprendimos:

```text
SELECT
WHERE
ORDER BY
INSERT
UPDATE
DELETE
```

## S4 — Datos relacionados

Construimos:

```text
INNER JOIN
LEFT JOIN
JOIN múltiples
```

## S5 — Datos → Indicadores

Utilizamos:

```text
COUNT
SUM
AVG
GROUP BY
HAVING
```

## S6 — Problema → Consulta

Resolvimos requerimientos mediante:

```text
Filtros
JOIN
Agregaciones
Subconsultas
```

## S7 — Operación → Análisis

Transformamos:

```text
MODELO RELACIONAL
       ↓
MODELO DIMENSIONAL
```

## S8 — Fuente → Data Warehouse

Construimos:

```text
EXTRACT
   ↓
TRANSFORM
   ↓
LOAD
```

## S9 — Data Warehouse → Análisis

Construimos:

```text
DIMENSIONES
     +
MEDIDAS
     +
JERARQUÍAS
     ↓
    OLAP
```

# La arquitectura completa

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
       SQL
        │
        ▼
CONSULTAS E INDICADORES
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
       OLAP
        │
        ▼
 BUSINESS INTELLIGENCE
        │
        ▼
 TOMA DE DECISIONES
```

