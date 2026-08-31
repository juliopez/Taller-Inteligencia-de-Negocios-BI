# Sesión 8

# ETL y construcción del Data Warehouse

**Asignatura:** Fundamentos de Ingeniería de Datos y SQL
**Duración:** 3 horas
**Modalidad:** Online sincrónica
**Entorno práctico:** SQL Server + Visual Studio / SQL Server Integration Services (SSIS)
**RAA dominante:** RAA3

## Objetivo de aprendizaje

Implementar un proceso ETL básico que permita extraer datos desde un modelo operacional, aplicar transformaciones orientadas a calidad e integración y cargar un modelo dimensional destinado al análisis.

## Descripción de la jornada

En S7 los estudiantes transformaron conceptualmente el modelo operacional utilizado durante el curso en un modelo dimensional compuesto por una tabla de hechos y dimensiones.

En esta sesión se implementará el proceso que permite trasladar los datos desde el sistema operacional hacia el Data Warehouse.

Los estudiantes construirán un flujo ETL utilizando SQL Server Integration Services, identificando explícitamente las etapas de extracción, transformación y carga. El proceso permitirá poblar las dimensiones `DIM_CLIENTE`, `DIM_PRODUCTO` y `DIM_TIEMPO`, para posteriormente cargar `FACT_VENTAS`.

El objetivo no será profundizar en administración de SSIS ni en automatización avanzada, sino comprender y experimentar **el papel que cumple ETL dentro de una arquitectura de ingeniería de datos**.

# Agenda

| Bloque                    |      Tiempo | Actividad                                                                      |
| ------------------------- | ----------: | ------------------------------------------------------------------------------ |
| Exposición + demostración |  **45 min** | ETL, arquitectura, extracción, transformación, carga, calidad y orden de carga |
| Break                     |  **15 min** | Descanso                                                                       |
| Taller práctico           | **120 min** | Implementación de un ETL básico con SSIS                                       |
| Cierre                    |  **15 min** | Validación del DW y conexión con OLAP                                          |

# Bloque 1 — Exposición y demostración

## 19:15–20:00

## 1. Tenemos dos modelos, pero falta algo

Comenzaría exactamente desde donde terminamos S7:

```text
BASE OPERACIONAL                       DATA WAREHOUSE

CLIENTES                               DIM_CLIENTE
PRODUCTOS                              DIM_PRODUCTO
VENTAS                ???              DIM_TIEMPO
DETALLE_VENTAS                         FACT_VENTAS
```

La pregunta:

> **¿Cómo llegan los datos desde el sistema operacional hasta el Data Warehouse?**

No basta con crear las tablas destino.

Necesitamos un proceso capaz de:

1. obtener los datos;
2. prepararlos;
3. cargarlos.

Ahí introducimos ETL.

---

# 2. ETL

La antigua versión utilizaba la definición clásica: **Extract, Transform, Load**. 

Ahora la conectamos directamente con nuestro caso:

```text
BASE OPERACIONAL
      │
      ▼
   EXTRACT
      │
      ▼
  TRANSFORM
      │
      ▼
    LOAD
      │
      ▼
DATA WAREHOUSE
```

### Extract

Obtener los datos necesarios desde las fuentes.

### Transform

Prepararlos para cumplir con las necesidades del modelo destino.

### Load

Insertarlos en las dimensiones y tabla de hechos del Data Warehouse.

---

# 3. Extract — ¿qué necesitamos obtener?

No necesariamente trasladamos toda la base operacional.

Por ejemplo, para construir:

```text
DIM_CLIENTE
```

necesitamos datos provenientes de:

```text
CLIENTES
```

Para:

```text
DIM_PRODUCTO
```

utilizaremos:

```text
PRODUCTOS
```

Pero `FACT_VENTAS` necesita integrar:

```text
VENTAS
      +
DETALLE_VENTAS
```

Por tanto, una primera idea fundamental:

> **ETL no significa copiar tablas.**

El modelo destino determina qué datos necesitamos extraer.

---

# 4. Transform — ¿por qué transformar?

Supongamos que encontramos:

```text
Nombre:     ana perez
Ciudad:     VALPARAISO
Categoría:  tecnologia
```

Podríamos querer almacenar:

```text
Ana Perez
Valparaiso
Tecnología
```

Otros problemas habituales:

* espacios innecesarios;
* valores nulos;
* formatos diferentes;
* tipos incompatibles;
* fechas inconsistentes;
* duplicados;
* categorías escritas de distintas maneras.

Introducir aquí una idea central:

> **Mover datos no garantiza calidad de datos.**

El ETL constituye también un punto de control.

---

# 5. Una transformación que ya conocemos

Tenemos:

```text
cantidad
precio_unitario
```

Pero en `FACT_VENTAS` diseñamos:

```text
importe
```

Por tanto:

```text
importe = cantidad × precio_unitario
```

Esto permite conectar nuevamente con S5.

Antes calculábamos:

```sql
SUM(cantidad * precio_unitario)
```

Ahora podemos generar `importe` durante el proceso de transformación y almacenarlo como medida en el modelo analítico.

---

# 6. DIM_TIEMPO: una transformación especial

En el modelo operacional tenemos:

```text
fecha_venta
```

Pero nuestra dimensión contiene:

```text
fecha
dia
mes
nombre_mes
trimestre
anio
```

El ETL deberá transformar:

```text
2026-09-21
```

en algo conceptualmente equivalente a:

```text
fecha        2026-09-21
dia          21
mes          9
nombre_mes   Septiembre
trimestre    3
anio         2026
```

Este es un excelente ejemplo de que:

> **El Data Warehouse no es una copia de la fuente.**

---

# 7. Load — ¿qué cargamos primero?

Presentar:

```text
DIM_CLIENTE
DIM_PRODUCTO
DIM_TIEMPO
       ↓
FACT_VENTAS
```

Pregunta:

> ¿Podemos cargar primero `FACT_VENTAS`?

Conceptualmente no deberíamos, porque los registros de hechos deben poder relacionarse con las dimensiones.

Por tanto:

**primero dimensiones → después hechos.**

Esto recupera exactamente la misma lógica de integridad referencial que descubrieron en S2.

---

# 8. El flujo completo

Ahora mostrar la arquitectura:

```text
┌─────────────────────┐
│ BASE OPERACIONAL    │
│                     │
│ CLIENTES            │
│ PRODUCTOS           │
│ VENTAS              │
│ DETALLE_VENTAS      │
└──────────┬──────────┘
           │
           │ EXTRACT
           ▼
┌─────────────────────┐
│ TRANSFORM           │
│                     │
│ limpieza            │
│ estandarización     │
│ cálculo importe     │
│ tratamiento fechas  │
└──────────┬──────────┘
           │
           │ LOAD
           ▼
┌─────────────────────┐
│ DATA WAREHOUSE      │
│                     │
│ DIM_CLIENTE         │
│ DIM_PRODUCTO        │
│ DIM_TIEMPO          │
│ FACT_VENTAS         │
└─────────────────────┘
```

La antigua versión mostraba ETL como uno de los componentes de la arquitectura BI.  Aquí ya estamos convirtiendo esa arquitectura en algo tangible.

---

# 9. ¿Qué es SSIS?

Introducir solamente lo necesario.

**SQL Server Integration Services (SSIS)** permite construir procesos de integración y transformación de datos.

Para nuestra práctica utilizaremos principalmente:

```text
SSIS Package
     │
     ├── Control Flow
     │
     └── Data Flow
```

### Control Flow

Define **qué tareas se ejecutan y en qué secuencia**.

### Data Flow

Define **cómo se mueven y transforman los datos**.

No dedicaría tiempo a enumerar componentes de SSIS. Los aprenderán al utilizarlos.

---

# 10. Nuestro ETL

Presentar desde el comienzo lo que construiremos:

```text
CARGA DIM_CLIENTE
        ↓
CARGA DIM_PRODUCTO
        ↓
CARGA DIM_TIEMPO
        ↓
CARGA FACT_VENTAS
```

Cada bloque será un `Data Flow Task`.

Así los estudiantes saben qué están construyendo antes de entrar a Visual Studio.

# Break

## 20:00–20:15

# Taller práctico

## 20:15–22:15

Aquí haría una diferencia respecto de S6: **S8 necesita bastante demostración guiada**, porque Visual Studio/SSIS es nuevo.

Pero la demostración debe ocurrir dentro de la práctica y ser operacional, no convertirse en otra exposición.

La secuencia:

**Profesor demuestra brevemente → estudiantes reproducen → verifican → siguiente componente.**

# Etapa 1 — Preparar el entorno

### 15 minutos

Mostrar:

* SQL Server;
* base operacional;
* base `DW_COMERCIAL`;
* Visual Studio;
* proyecto Integration Services;
* paquete SSIS.

Verificar que existen las estructuras destino:

```text
DIM_CLIENTE
DIM_PRODUCTO
DIM_TIEMPO
FACT_VENTAS
```

Aquí no perdería tiempo haciendo que todos construyan manualmente las tablas.

Podemos proporcionar un script:

**`06_creacion_dw.sql`**

El objetivo de S8 es ETL, no volver a practicar `CREATE TABLE`.

---

# Etapa 2 — Primer flujo: DIM_CLIENTE

### 20 minutos

Construir:

```text
CLIENTES
   │
   ▼
OLE DB Source
   │
   ▼
Transformación
   │
   ▼
OLE DB Destination
   │
   ▼
DIM_CLIENTE
```

Ejemplo de transformación:

```text
nombre → TRIM
ciudad → estandarización
```

Ejecutar.

Después verificar mediante SQL:

```sql
SELECT *
FROM DIM_CLIENTE;
```

Primera regla de S8:

> **Un ETL no termina cuando aparece el check verde. Termina cuando validamos el destino.**

---

# Etapa 3 — DIM_PRODUCTO

### 15 minutos

Ahora los estudiantes reproducen con menor acompañamiento:

```text
PRODUCTOS
    ↓
Transformación
    ↓
DIM_PRODUCTO
```

Campos:

```text
id_producto
nombre_producto
categoria
```

Aplicar alguna transformación sencilla de texto si los datos lo permiten.

Validar:

```sql
SELECT *
FROM DIM_PRODUCTO;
```

---

# Etapa 4 — DIM_TIEMPO

### 20 minutos

Este será probablemente el flujo conceptualmente más interesante.

Origen:

```text
VENTAS.fecha_venta
```

Destino:

```text
DIM_TIEMPO
```

Generar:

```text
fecha
dia
mes
nombre_mes
trimestre
anio
```

Aquí pueden observar de forma concreta cómo **una columna operacional se transforma en varios atributos analíticos**.

Validar posteriormente:

```sql
SELECT *
FROM DIM_TIEMPO
ORDER BY fecha;
```

---

# Etapa 5 — FACT_VENTAS

### 25 minutos

Ahora integramos:

```text
VENTAS
   +
DETALLE_VENTAS
```

Necesitamos obtener:

```text
id_venta
id_cliente
id_producto
fecha
cantidad
precio_unitario
importe
```

La transformación fundamental:

```text
importe = cantidad * precio_unitario
```

y posteriormente relacionar la fecha con `DIM_TIEMPO`.

Destino:

```text
FACT_VENTAS
```

Este es el momento en que todas las piezas empiezan a conectarse.

---

# Etapa 6 — Ejecutar el proceso completo

### 10 minutos

Control Flow:

```text
[Cargar DIM_CLIENTE]
          ↓
[Cargar DIM_PRODUCTO]
          ↓
[Cargar DIM_TIEMPO]
          ↓
[Cargar FACT_VENTAS]
```

Ejecutar.

Observar:

```text
✓ DIM_CLIENTE
      ↓
✓ DIM_PRODUCTO
      ↓
✓ DIM_TIEMPO
      ↓
✓ FACT_VENTAS
```

Pero nuevamente:

**check verde ≠ datos correctos.**

---

# Etapa 7 — Validación

### 15 minutos

Solicitar consultas como:

```sql
SELECT COUNT(*)
FROM DIM_CLIENTE;
```

```sql
SELECT COUNT(*)
FROM DIM_PRODUCTO;
```

```sql
SELECT COUNT(*)
FROM DIM_TIEMPO;
```

```sql
SELECT COUNT(*)
FROM FACT_VENTAS;
```

Luego:

```sql
SELECT SUM(importe)
FROM FACT_VENTAS;
```

Y comparar con el sistema operacional:

```sql
SELECT SUM(cantidad * precio_unitario)
FROM DETALLE_VENTAS;
```

Pregunta:

> **¿Los resultados deberían coincidir?**

Sí, para el conjunto de datos que cargamos.

Esta validación es pedagógicamente muy valiosa porque introduce un principio profesional:

> **No validamos únicamente filas. También validamos métricas.**

# Desafío final

### 15 minutos

Introducir deliberadamente un problema de calidad en la fuente.

Por ejemplo:

```text
Tecnología
tecnologia
TECNOLOGÍA
```

Solicitar:

> Modifique el flujo para que el Data Warehouse almacene una única representación consistente de la categoría.

Luego ejecutar nuevamente y verificar.

El estudiante debe demostrar que entiende la **T de ETL**, no solamente cómo conectar un origen con un destino.

# Producto de la sesión

El estudiante deberá finalizar con:

### 1. Script de creación

**`06_creacion_dw.sql`**

### 2. Proyecto SSIS

Con los flujos:

```text
DFT_DIM_CLIENTE
DFT_DIM_PRODUCTO
DFT_DIM_TIEMPO
DFT_FACT_VENTAS
```

### 3. Script de validación

**`07_validacion_etl.sql`**

con:

* conteos de registros;
* comprobación de dimensiones;
* comprobación de hechos;
* comparación de ingresos origen/destino.

Así el producto no es simplemente:

> "Hice un ETL."

Tenemos evidencia de que **funciona y preserva la información relevante**.

# Una consideración importante: carga incremental

El programa habla de fundamentos de Data Warehouse, por lo que introduciría el concepto de **carga incremental**, pero no desarrollaría un ETL incremental completo.

Después de ejecutar el flujo podemos preguntar:

> Mañana aparecen 10 ventas nuevas. ¿Debemos volver a cargar cinco años completos de información?

No sería eficiente.

Conceptualmente:

```text
CARGA COMPLETA
Todos los registros
```

frente a:

```text
CARGA INCREMENTAL
Solo registros nuevos
o modificados
```

Esto basta para que comprendan que los procesos ETL reales no necesariamente reconstruyen todo el DW cada vez.

No profundizaría aquí en:

* CDC;
* Slowly Changing Dimensions;
* orchestration;
* scheduling;
* logging avanzado;
* manejo complejo de errores.

Eso invadiría contenidos propios del módulo posterior de **Data Pipeline y Automatización**.

# Cierre

## 22:15–22:30

```text
SISTEMA OPERACIONAL
CLIENTES
PRODUCTOS
VENTAS
DETALLE
        │
        ▼
       ETL
        │
 ┌──────┼───────┐
 │      │       │
 ▼      ▼       ▼
Extract Transform Load
        │
        ▼
DATA WAREHOUSE
DIM_CLIENTE
DIM_PRODUCTO
DIM_TIEMPO
FACT_VENTAS
```

En S2 escribíamos datos directamente en una base.

En S8 estamos **moviendo, transformando y validando datos entre sistemas con propósitos diferentes**.

Eso ya es una aproximación mucho más directa al trabajo de **ingeniería de datos**.

## Puente hacia S9

```text
DIM_CLIENTE
      │
      │
DIM_TIEMPO ─── FACT_VENTAS ─── DIM_PRODUCTO
```

> Ya tenemos un Data Warehouse correctamente poblado. ¿Ahora vamos a volver a escribir manualmente una consulta SQL diferente cada vez que un gerente quiera analizar ventas por año, producto, categoría o cliente?

Podríamos.

Pero existe otra forma de proporcionar una estructura orientada específicamente al análisis multidimensional.

