# Sesión 8

# ETL y construcción del Data Warehouse

**Asignatura:** Fundamentos de Ingeniería de Datos y SQL<br>
**Duración:** 3 horas<br>
**Modalidad:** Online sincrónica<br>
**Entorno práctico:** SQL Server + Visual Studio / SQL Server Integration Services (SSIS)<br>

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

```text
BASE OPERACIONAL                       DATA WAREHOUSE

CLIENTES                               DIM_CLIENTE
PRODUCTOS                              DIM_PRODUCTO
VENTAS                ???              DIM_TIEMPO
DETALLE_VENTAS                         FACT_VENTAS
```

> **¿Cómo llegan los datos desde el sistema operacional hasta el Data Warehouse?**

No basta con crear las tablas destino.

Necesitamos un proceso capaz de:

1. obtener los datos;
2. prepararlos;
3. cargarlos.

---

# 2. ETL

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

> **Mover datos no garantiza calidad de datos.**

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

> **El Data Warehouse no es una copia de la fuente.**

---

# 7. Load — ¿qué cargamos primero?

```text
DIM_CLIENTE
DIM_PRODUCTO
DIM_TIEMPO
       ↓
FACT_VENTAS
```

> ¿Podemos cargar primero `FACT_VENTAS`?

Conceptualmente no deberíamos, porque los registros de hechos deben poder relacionarse con las dimensiones.

Por tanto:

**primero dimensiones → después hechos.**

---

# 8. El flujo completo

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

---

# 9. ¿Qué es SSIS?

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

---

# 10. Nuestro ETL

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

# Videos de apoyo — Implementación del proceso ETL con SSIS

Los siguientes videos complementan el trabajo práctico de esta sesión y pueden utilizarse como guía durante la implementación del proceso ETL.

| Video | Contenido | Enlace |
|:---:|---|:---:|
| 1️⃣ | **ETL Básico en SSIS \| Visual Studio Data Tools (Paso a Paso)** | [▶️ Ver video](https://youtu.be/IcPZkuTDWuE) |
| 2️⃣ | **ETL Intermedio en SSIS: Transformación de Datos con Columnas Derivadas** | [▶️ Ver video](https://youtu.be/aC-Aa-9fOXA) |
| 3️⃣ | **Carga Incremental en SSIS \| ETL con Visual Studio Data Tools** | [▶️ Ver video](https://youtu.be/gNtDZkjeoas) |

> [!TIP]
> Mantenga estos videos disponibles durante el taller. Puede utilizarlos como guía para repetir los procedimientos realizados durante la demostración.

> [!IMPORTANT]
> El objetivo no es únicamente reproducir los pasos mostrados en los videos.  
> Al finalizar el trabajo debe ser capaz de reconocer qué operaciones corresponden a **Extract**, **Transform** y **Load**, y comprender cómo estas permiten poblar el modelo dimensional.

# Break

## 20:00–20:15

# Taller práctico

## 20:15–22:15

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

> **Un ETL no termina cuando aparece el check verde. Termina cuando validamos el destino.**

---

# Etapa 3 — DIM_PRODUCTO

### 15 minutos

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

> **No validamos únicamente filas. También validamos métricas.**

# Desafío final

### 15 minutos

> Modifique el flujo para que el Data Warehouse almacene una única representación consistente de la categoría.

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
