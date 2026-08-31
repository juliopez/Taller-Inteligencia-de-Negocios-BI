# Sesión 4

# JOIN y consultas multitabla

**Asignatura:** Fundamentos de Ingeniería de Datos y SQL
**Duración:** 3 horas
**Modalidad:** Online sincrónica
**Entorno práctico:** Oracle APEX
**RAA dominante:** RAA2

## Objetivo de aprendizaje

Construir consultas SQL que integren información almacenada en múltiples tablas relacionadas, utilizando `INNER JOIN`, `LEFT JOIN` y alias para responder requerimientos de información sobre el modelo comercial.

## Descripción de la jornada

En las sesiones anteriores se diseñó e implementó una base de datos relacional y posteriormente se utilizaron instrucciones SQL para consultar y manipular registros.

Hasta ahora, sin embargo, las consultas se han concentrado principalmente en **una tabla a la vez**.

En esta sesión los estudiantes comenzarán a explotar una de las principales características del modelo relacional: la posibilidad de **reconstruir información distribuida entre diferentes tablas** mediante sus claves primarias y foráneas.

A partir del modelo comercial, se utilizarán `INNER JOIN`, `LEFT JOIN`, alias y consultas con múltiples JOIN para responder preguntas relacionadas con clientes, ventas, productos y detalle de ventas.

# Agenda

| Bloque                    |      Tiempo | Actividad                                                  |
| ------------------------- | ----------: | ---------------------------------------------------------- |
| Exposición y demostración |  **45 min** | JOIN, PK/FK, INNER JOIN, LEFT JOIN, alias y JOIN múltiples |
| Break                     |  **15 min** | Descanso                                                   |
| Taller práctico           | **120 min** | Consultas relacionales progresivas                         |
| Cierre                    |  **15 min** | Revisión, errores frecuentes y conexión con S5             |

# Bloque 1 — Exposición y demostración

## 19:15–20:00

### 1. El problema: los datos están separados

Retomar el cierre de S3.

```sql
SELECT *
FROM ventas;
```

Podríamos obtener:

| id_venta | id_cliente | fecha_venta |
| -------: | ---------: | ----------- |
|      101 |          3 | 15/09/2026  |
|      102 |          1 | 16/09/2026  |

Pero el usuario no quiere saber que:

> `id_cliente = 3`

Quiere saber:

> **¿Quién realizó la venta?**

La respuesta se encuentra en otra tabla.

```text
CLIENTES                      VENTAS

id_cliente PK                 id_venta PK
nombre                        id_cliente FK
correo                        fecha_venta
ciudad
```

Tenemos que **relacionar ambas tablas**.

---

# 2. ¿Qué hace JOIN?

`JOIN` permite combinar registros de dos o más tablas utilizando una relación existente entre ellas.

En nuestro modelo:

```text
CLIENTES  1 ───── N  VENTAS
```

La conexión está definida por:

```text
CLIENTES.id_cliente  PK
          ↕
VENTAS.id_cliente    FK
```

Por tanto, el modelamiento realizado en S1 comienza ahora a tener una consecuencia práctica directa.

---

# 3. INNER JOIN

Introducir la estructura:

```sql
SELECT columnas
FROM tabla1
INNER JOIN tabla2
    ON tabla1.campo = tabla2.campo;
```

Aplicada al caso:

```sql
SELECT clientes.nombre,
       ventas.id_venta,
       ventas.fecha_venta
FROM clientes
INNER JOIN ventas
    ON clientes.id_cliente = ventas.id_cliente;
```

Resultado:

| nombre      | id_venta | fecha_venta |
| ----------- | -------: | ----------- |
| Ana Pérez   |      101 | 15/09/2026  |
| Carlos Soto |      102 | 16/09/2026  |

La idea conceptual:

> **INNER JOIN muestra registros que poseen coincidencia entre las tablas relacionadas.**

---

# 4. Alias

La consulta anterior funciona, pero podemos escribir:

```sql
SELECT c.nombre,
       v.id_venta,
       v.fecha_venta
FROM clientes c
INNER JOIN ventas v
    ON c.id_cliente = v.id_cliente;
```

Explicar:

```text
c → CLIENTES
v → VENTAS
```

Los alias no cambian los datos ni las tablas.

Son nombres temporales utilizados para simplificar y hacer más legible la consulta.

Desde este momento los utilizaremos como **buena práctica estándar**.

---

# 5. JOIN entre VENTAS y DETALLE_VENTAS

Ahora:

```text
VENTAS 1 ───── N DETALLE_VENTAS
```

Consulta:

```sql
SELECT v.id_venta,
       v.fecha_venta,
       dv.id_producto,
       dv.cantidad
FROM ventas v
INNER JOIN detalle_ventas dv
    ON v.id_venta = dv.id_venta;
```

Pregunta:

> ¿Por qué una misma venta puede aparecer varias veces?

Esta pregunta es pedagógicamente importante.

Porque una venta puede contener **varios productos**.

Por tanto, JOIN no "duplica incorrectamente" la venta. Está mostrando la granularidad de `DETALLE_VENTAS`.

---

# 6. JOIN entre múltiples tablas

Ahora queremos responder:

> ¿Qué productos compró cada cliente?

Necesitamos recorrer:

```text
CLIENTES
   ↓
VENTAS
   ↓
DETALLE_VENTAS
   ↓
PRODUCTOS
```

Consulta:

```sql
SELECT c.nombre AS cliente,
       v.id_venta,
       p.nombre AS producto,
       dv.cantidad,
       dv.precio_unitario
FROM clientes c
INNER JOIN ventas v
    ON c.id_cliente = v.id_cliente
INNER JOIN detalle_ventas dv
    ON v.id_venta = dv.id_venta
INNER JOIN productos p
    ON dv.id_producto = p.id_producto;
```

Aquí aparece por primera vez claramente el verdadero potencial del modelo relacional.

A partir de cuatro tablas independientes reconstruimos una visión comprensible:

| Cliente   | Venta | Producto | Cantidad | Precio |
| --------- | ----: | -------- | -------: | -----: |
| Ana Pérez |   101 | Notebook |        1 | 699990 |
| Ana Pérez |   101 | Mouse    |        2 |  14990 |

---

# 7. Construir JOIN progresivamente

Introducir una regla práctica:

**No construir inmediatamente una consulta de cuatro tablas.**

Primero:

```text
CLIENTES + VENTAS
```

Comprobar.

Luego:

```text
CLIENTES + VENTAS + DETALLE
```

Comprobar.

Finalmente:

```text
CLIENTES + VENTAS + DETALLE + PRODUCTOS
```

Comprobar.

Esto permite detectar mucho más fácilmente:

* relaciones incorrectas;
* columnas equivocadas;
* resultados inesperados;
* errores en `ON`.

---

# 8. INNER JOIN vs LEFT JOIN

Ahora plantear:

> Queremos saber qué clientes han realizado compras.

`INNER JOIN` funciona perfectamente.

Pero:

> ¿Qué ocurre si queremos saber **todos los clientes**, incluso quienes nunca han comprado?

Introducir:

```sql
SELECT c.nombre,
       v.id_venta
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente;
```

La diferencia:

| Tipo         | Resultado                                 |
| ------------ | ----------------------------------------- |
| `INNER JOIN` | Solo registros relacionados               |
| `LEFT JOIN`  | Todos los registros de la tabla izquierda |

Si un cliente no tiene ventas:

```text
CLIENTE       ID_VENTA
------------- --------
Pedro Díaz    NULL
```

Esto nos permitirá posteriormente detectar información faltante.

---

# Break

## 20:00–20:15

# Taller práctico

## 20:15–22:15

Mantendría nuestra progresión:

**Guiado → Semiguiado → Autónomo → Requerimiento de negocio.**

## Nivel 1 — Comprender la relación

### 20 minutos

### Ejercicio 1

Mostrar:

* nombre del cliente;
* identificador de venta;
* fecha de venta.

Tablas:

```text
CLIENTES
VENTAS
```

Utilizar `INNER JOIN`.

### Ejercicio 2

Modificar la consulta anterior utilizando alias:

```text
c → CLIENTES
v → VENTAS
```

El objetivo aquí no es dificultad sino consolidar la sintaxis.

---

# Nivel 2 — Relacionar productos y ventas

### 20 minutos

### Ejercicio 3

Mostrar:

* identificador de venta;
* identificador del producto;
* cantidad;
* precio unitario.

Tablas:

```text
VENTAS
DETALLE_VENTAS
```

### Ejercicio 4

Modificar la consulta para mostrar el **nombre del producto** en lugar de solamente `id_producto`.

Ahora necesitarán:

```text
VENTAS
     ↓
DETALLE_VENTAS
     ↓
PRODUCTOS
```

Aquí comienza el JOIN múltiple.

---

# Nivel 3 — Reconstruir una transacción

### 25 minutos

### Ejercicio 5

Construir una consulta que muestre:

* cliente;
* fecha de venta;
* producto;
* cantidad;
* precio unitario.

No indicar las tablas.

El estudiante debe descubrir que necesita:

```text
CLIENTES
VENTAS
DETALLE_VENTAS
PRODUCTOS
```

Este debería ser uno de los ejercicios centrales de S4.

---

# Nivel 4 — LEFT JOIN

### 20 minutos

Para que el ejercicio funcione, necesitamos asegurarnos de que exista al menos un cliente sin ventas.

### Ejercicio 6

Mostrar **todos los clientes**, tengan o no ventas.

Visualizar:

* nombre;
* id_venta;
* fecha.

Utilizar:

```sql
LEFT JOIN
```

### Ejercicio 7

Mostrar todos los productos, incluso aquellos que nunca hayan sido vendidos.

Visualizar:

* producto;
* id_detalle;
* cantidad.

Aquí el estudiante debe decidir qué tabla colocar a la izquierda.

---

# Nivel 5 — Detectar ausencia de relaciones

### 15 minutos

Ahora reutilizamos `IS NULL`, que aparecía en la antigua S4. 

### Ejercicio 8

Identificar exclusivamente los clientes que **nunca han realizado una compra**.

Pista:

```text
LEFT JOIN
+
IS NULL
```

No entregar la consulta.

Este es un uso mucho más significativo de `IS NULL` que simplemente buscar una columna vacía.

---

# Nivel 6 — Desafío autónomo

### 20 minutos

Presentar un requerimiento real:

> **El área comercial necesita un reporte que permita revisar todas las líneas de venta registradas. Para cada registro debe visualizarse el cliente, número de venta, fecha, producto, categoría, cantidad y precio unitario.**

No entregar:

* tablas;
* JOIN necesarios;
* claves;
* orden de construcción.

El estudiante deberá analizar el modelo y construir la consulta.

El resultado debería conceptualmente aproximarse a:

| Cliente | Venta | Fecha | Producto | Categoría | Cantidad | Precio |
| ------- | ----: | ----- | -------- | --------- | -------: | -----: |

Aquí ya estamos dejando de preguntar:

> "Escriba un INNER JOIN".

y comenzamos a preguntar:

> "La organización necesita esta información. **Obténgala.**"

Ese cambio es importante para preparar S6 y el proyecto final.

# Producto de la sesión

Cada estudiante deberá finalizar con:

**`03_consultas_join.sql`**

incluyendo:

* `INNER JOIN`;
* alias;
* JOIN de dos tablas;
* JOIN de tres tablas;
* JOIN de cuatro tablas;
* `LEFT JOIN`;
* detección de registros sin relación.

---

# Cierre

## 22:15–22:30

### 1. JOIN depende del modelo

No estamos relacionando tablas arbitrariamente:

```text
PK ↔ FK
```

### 2. INNER JOIN y LEFT JOIN responden preguntas diferentes

```text
INNER → coincidencias

LEFT → todos los de la izquierda
       + coincidencias cuando existan
```

### 3. Una mayor cantidad de filas no significa necesariamente duplicidad

La **granularidad** de las tablas determina el resultado.

Este concepto será extremadamente útil cuando lleguemos a Data Warehouse.

### 4. Construir consultas progresivamente

```text
2 tablas
   ↓
validar
   ↓
3 tablas
   ↓
validar
   ↓
4 tablas
```

## Puente hacia S5

 Ya sabemos **qué compró cada cliente**. Pero la gerencia probablemente no quiere revisar cientos o miles de líneas de venta.

Quiere respuestas como:

* ¿cuánto hemos vendido?;
* ¿cuál es el producto más vendido?;
* ¿cuánto compra cada cliente?;
* ¿cuántas ventas tenemos?;
* ¿cuál es el valor promedio de una venta?;
* ¿qué categoría genera mayores ingresos?

Eso nos lleva directamente a:

# Sesión 5 — Agregaciones e indicadores con SQL

`COUNT`, `SUM`, `AVG`, `MIN`, `MAX` y `GROUP BY`

