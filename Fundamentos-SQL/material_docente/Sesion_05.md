# Sesión 5

# Agregaciones e indicadores con SQL

**Asignatura:** Fundamentos de Ingeniería de Datos y SQL<br>
**Duración:** 3 horas<br>
**Modalidad:** Online sincrónica<br>
**Entorno práctico:** Oracle APEX<br>

## Objetivo de aprendizaje

Construir consultas SQL orientadas al análisis de datos mediante funciones de agregación, agrupamiento y filtrado de resultados agregados, generando indicadores a partir de información transaccional.

## Descripción de la jornada

Durante la sesión anterior los estudiantes aprendieron a relacionar información distribuida entre distintas tablas mediante `JOIN`.

En esta sesión se avanzará desde la consulta de registros individuales hacia la **generación de información resumida**, utilizando funciones de agregación como `COUNT`, `SUM`, `AVG`, `MIN` y `MAX`, junto con `GROUP BY` y `HAVING`.

A partir del modelo comercial, los estudiantes construirán indicadores relacionados con ventas, clientes, productos y categorías, comprendiendo cómo SQL puede transformar datos transaccionales en información útil para análisis y toma de decisiones.

# Agenda

| Bloque                    |      Tiempo | Actividad                                          |
| ------------------------- | ----------: | -------------------------------------------------- |
| Exposición y demostración |  **45 min** | Agregaciones, GROUP BY, HAVING e indicadores       |
| Break                     |  **15 min** | Descanso                                           |
| Taller práctico           | **120 min** | Construcción progresiva de indicadores comerciales |
| Cierre                    |  **15 min** | Interpretación de resultados y conexión con S6     |

# Bloque 1 — Exposición y demostración

## 19:15–20:00

### 1. De registros a información

Partir de una consulta de S4:

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

Supongamos que devuelve cientos o miles de registros.

La consulta es correcta.

Pero ahora la gerencia pregunta:

> ¿Cuántas ventas tenemos?

> ¿Cuántas unidades hemos vendido?

> ¿Cuánto dinero hemos generado?

> ¿Qué producto genera mayores ingresos?

Ya no necesitamos observar cada registro individual.

Necesitamos **resumir los datos**.

---

# 2. Funciones de agregación


| Función   | Pregunta que permite responder |
| --------- | ------------------------------ |
| `COUNT()` | ¿Cuántos?                      |
| `SUM()`   | ¿Cuánto en total?              |
| `AVG()`   | ¿Cuál es el promedio?          |
| `MIN()`   | ¿Cuál es el menor?             |
| `MAX()`   | ¿Cuál es el mayor?             |

---

# 3. COUNT

Primera pregunta:

> ¿Cuántos clientes tenemos?

```sql
SELECT COUNT(*) AS total_clientes
FROM clientes;
```

Luego:

> ¿Cuántas ventas existen?

```sql
SELECT COUNT(*) AS total_ventas
FROM ventas;
```

El concepto de **alias de columna** como parte habitual de los indicadores.

---

# 4. SUM

Ahora:

> ¿Cuántas unidades hemos vendido?

```sql
SELECT SUM(cantidad) AS unidades_vendidas
FROM detalle_ventas;
```

Pero una pregunta más interesante es:

> ¿Cuánto dinero representan esas ventas?

Cada línea contiene:

```text
cantidad × precio_unitario
```

Por tanto:

```sql
SELECT SUM(cantidad * precio_unitario) AS ingresos_totales
FROM detalle_ventas;
```

---

# 5. AVG, MIN y MAX

```sql
SELECT AVG(precio) AS precio_promedio,
       MIN(precio) AS precio_minimo,
       MAX(precio) AS precio_maximo
FROM productos;
```

Esta única consulta permite introducir simultáneamente tres medidas descriptivas.

> Una agregación debe responder una pregunta que tenga sentido.

SQL puede calcular muchas cosas; eso no significa que todas tengan valor analítico.

---

# 6. GROUP BY

Sabemos calcular:

```sql
SELECT SUM(cantidad * precio_unitario)
FROM detalle_ventas;
```

Esto responde:

> ¿Cuánto vendimos en total?

Pero queremos:

> ¿Cuánto vendimos **por producto**?

Necesitamos agrupar.

```sql
SELECT id_producto,
       SUM(cantidad * precio_unitario) AS ingresos
FROM detalle_ventas
GROUP BY id_producto;
```

Resultado conceptual:

| id_producto |  ingresos |
| ----------: | --------: |
|           1 | 1.450.000 |
|           2 |   820.000 |
|           3 |   375.000 |

Pero el usuario no quiere `id_producto`.

Quiere el nombre.

Entonces recuperamos JOIN:

```sql
SELECT p.nombre AS producto,
       SUM(dv.cantidad * dv.precio_unitario) AS ingresos
FROM detalle_ventas dv
INNER JOIN productos p
    ON dv.id_producto = p.id_producto
GROUP BY p.nombre;
```

---

# 7. GROUP BY + ORDER BY

La gerencia pregunta:

> ¿Cuál producto genera mayores ingresos?

```sql
SELECT p.nombre AS producto,
       SUM(dv.cantidad * dv.precio_unitario) AS ingresos
FROM detalle_ventas dv
INNER JOIN productos p
    ON dv.id_producto = p.id_producto
GROUP BY p.nombre
ORDER BY ingresos DESC;
```

---

# 8. WHERE vs HAVING

Tenemos:

```sql
SELECT p.categoria,
       SUM(dv.cantidad * dv.precio_unitario) AS ingresos
FROM detalle_ventas dv
INNER JOIN productos p
    ON dv.id_producto = p.id_producto
GROUP BY p.categoria;
```

Ahora queremos:

> Mostrar solamente categorías cuyos ingresos superen $500.000.

```sql
SELECT p.categoria,
       SUM(dv.cantidad * dv.precio_unitario) AS ingresos
FROM detalle_ventas dv
INNER JOIN productos p
    ON dv.id_producto = p.id_producto
GROUP BY p.categoria
HAVING SUM(dv.cantidad * dv.precio_unitario) > 500000;
```

Diferencia esencial:

| Cláusula | Filtra                     |
| -------- | -------------------------- |
| `WHERE`  | registros antes de agrupar |
| `HAVING` | grupos después de agregar  |

# Break

## 20:00–20:15

# Taller práctico

## 20:15–22:15

## Nivel 1 — Agregaciones básicas

### 15 minutos

Construir consultas para determinar:

1. cantidad total de clientes;
2. cantidad total de productos;
3. cantidad total de ventas;
4. precio promedio de los productos;
5. precio mínimo y máximo registrado.

---

# Nivel 2 — Indicadores sobre transacciones

### 20 minutos

### Ejercicio 1

Determinar la cantidad total de unidades vendidas.

### Ejercicio 2

Determinar los ingresos totales generados.

### Ejercicio 3

Determinar el precio unitario promedio de los productos vendidos.

---

# Nivel 3 — GROUP BY

### 20 minutos

### Ejercicio 4

Cantidad de ventas realizadas por cliente.

### Ejercicio 5

Cantidad de unidades vendidas por producto.

### Ejercicio 6

Ingresos generados por producto.

---

# Nivel 4 — Rankings

### 20 minutos

### Ejercicio 7

Construir un ranking de productos desde el que genera mayores ingresos hasta el que genera menos.

Resultado:

| Producto | Ingresos |
| -------- | -------: |
| Notebook |      ... |
| Monitor  |      ... |
| Mouse    |      ... |

### Ejercicio 8

Construir un ranking de clientes según el monto total comprado.

---

# Nivel 5 — Indicadores por categoría

### 20 minutos

Generar un reporte que muestre:

* categoría;
* unidades vendidas;
* ingresos generados;
* precio promedio de venta.

Resultado conceptual:

| Categoría  | Unidades | Ingresos | Precio promedio |
| ---------- | -------: | -------: | --------------: |
| Tecnología |      ... |      ... |             ... |
| Accesorios |      ... |      ... |             ... |

---

# Nivel 6 — HAVING

### 10 minutos

A partir del reporte anterior:

> Mostrar solamente las categorías cuyos ingresos superen un determinado monto.

---

# Desafío

### 15 minutos

> **La gerencia comercial solicita identificar los cinco productos que generan mayores ingresos. El reporte debe mostrar el nombre del producto, su categoría, la cantidad total de unidades vendidas y los ingresos generados, ordenados desde el producto con mayor ingreso.**

El estudiante debe determinar:

* tablas;
* relaciones;
* agregaciones;
* agrupamientos;
* ordenamiento.

# Producto de la sesión

Cada estudiante deberá finalizar con:

**`04_indicadores_comerciales.sql`**

que incluya evidencia de:

```text
COUNT
SUM
AVG
MIN
MAX
GROUP BY
HAVING
ORDER BY
JOIN + agregaciones
```

# Cierre

## 22:15–22:30

### Registro individual

```text
Ana → Venta 101 → Notebook → 1 → $699.990
```

### Agregación

```text
SUM(cantidad × precio)
```

### Agrupamiento

```text
GROUP BY producto
```

### Indicador

```text
Ingresos por producto
```

### Decisión

```text
¿Qué productos generan mayores ingresos?
```

## Puente hacia la Sesión 6

Hasta ahora los requerimientos todavía están bastante dirigidos:

> "Calcule ingresos por producto."

> "Cuente ventas por cliente."

En la siguiente sesión cambiaremos deliberadamente la dinámica.

> **La gerencia desea identificar clientes con un comportamiento de compra superior al promedio de la organización.**

o:

> **Identifique productos que no han registrado ventas y productos cuyo desempeño comercial se encuentre por debajo del promedio de su categoría.**

Allí incorporaremos:

* filtros avanzados (`LIKE`, `IN`, `BETWEEN`, `IS NULL`) que estaban en la antigua S4; 
* subconsultas simples;
* combinación de JOIN + filtros + agregaciones;
* construcción progresiva;
* requerimientos de negocio;
* buenas prácticas;


