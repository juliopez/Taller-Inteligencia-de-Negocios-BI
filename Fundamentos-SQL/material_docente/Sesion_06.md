# Sesión 6

# Consultas SQL aplicadas

**Asignatura:** Fundamentos de Ingeniería de Datos y SQL
**Duración:** 3 horas
**Modalidad:** Online sincrónica
**Entorno práctico:** Oracle APEX
**RAA dominante:** RAA2

## Objetivo de aprendizaje

Resolver requerimientos de información mediante consultas SQL que integren filtros, relaciones entre tablas, agregaciones y subconsultas, seleccionando autónomamente las operaciones necesarias y aplicando buenas prácticas básicas de construcción y validación de consultas.

## Descripción de la jornada

Durante las sesiones anteriores los estudiantes aprendieron progresivamente a consultar y manipular datos, relacionar tablas y construir indicadores mediante SQL.

Esta sesión constituye el cierre del bloque SQL.

El énfasis ya no estará en aprender instrucciones de manera aislada, sino en **analizar un requerimiento, identificar los datos necesarios y diseñar una consulta que permita responderlo**.

Se incorporarán filtros avanzados y subconsultas simples como herramientas adicionales, para luego desarrollar problemas de análisis comercial con un nivel progresivamente menor de andamiaje.

La pregunta central de la jornada será:

> **Ante un requerimiento de información, ¿cómo decidimos qué consulta SQL debemos construir?**

# Agenda

| Bloque                    |      Tiempo | Actividad                                                                    |
| ------------------------- | ----------: | ---------------------------------------------------------------------------- |
| Exposición y demostración |  **45 min** | Filtros avanzados, subconsultas, estrategia de resolución y buenas prácticas |
| Break                     |  **15 min** | Descanso                                                                     |
| Taller práctico           | **120 min** | Resolución autónoma de requerimientos comerciales                            |
| Cierre                    |  **15 min** | Síntesis del bloque SQL y transición hacia Data Warehouse                    |

# Bloque 1 — Exposición y demostración

## 19:15–20:00

## 1. De escribir SQL a resolver problemas

Hasta ahora hemos aprendido piezas:

```text
SELECT
WHERE
ORDER BY

INSERT
UPDATE
DELETE

INNER JOIN
LEFT JOIN

COUNT
SUM
AVG
MIN
MAX

GROUP BY
HAVING
```

Pero una organización nunca nos solicitará:

> "Construya un INNER JOIN con GROUP BY."

Nos dirá:

> "Necesito conocer qué clientes generan mayores ingresos."

o:

> "Necesito identificar productos que nunca se han vendido."

Por tanto, el problema profesional no consiste solamente en **conocer SQL**.

Consiste en:

**traducir una necesidad de información a una consulta SQL.**

---

# 2. Una estrategia para resolver requerimientos

### Paso 1 — ¿Qué necesito mostrar?

Identificar las columnas del resultado.

### Paso 2 — ¿Dónde están esos datos?

Identificar tablas.

### Paso 3 — ¿Cómo están relacionadas?

Identificar PK/FK.

### Paso 4 — ¿Necesito filtrar?

Determinar condiciones.

### Paso 5 — ¿Necesito resumir?

Determinar agregaciones y agrupamiento.

### Paso 6 — ¿Cómo debe presentarse?

Determinar ordenamiento.

Visualmente:

```text
REQUERIMIENTO
     ↓
¿Qué debo mostrar?
     ↓
¿Qué tablas necesito?
     ↓
¿Cómo se relacionan?
     ↓
¿Debo filtrar?
     ↓
¿Debo agregar/agrupar?
     ↓
¿Cómo ordeno?
     ↓
CONSULTA SQL
```

---

# 3. Filtros avanzados

### LIKE

```sql
SELECT *
FROM productos
WHERE nombre LIKE 'M%';
```

Productos cuyo nombre comienza con M.

```sql
SELECT *
FROM productos
WHERE nombre LIKE '%Pro%';
```

Productos cuyo nombre contiene "Pro".

### BETWEEN

```sql
SELECT *
FROM productos
WHERE precio BETWEEN 10000 AND 50000;
```

### IN

```sql
SELECT *
FROM productos
WHERE categoria IN ('Tecnología', 'Accesorios');
```

### IS NULL

```sql
SELECT c.nombre
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;
```

Aquí `IS NULL` permite detectar **ausencia de una relación**.

---

# 4. Combinar condiciones

Ejemplo:

```sql
SELECT nombre, categoria, precio, stock
FROM productos
WHERE categoria = 'Tecnología'
  AND precio > 50000;
```

Otro:

```sql
SELECT nombre, categoria, stock
FROM productos
WHERE categoria = 'Tecnología'
   OR stock < 5;
```

---

# 5. El problema del "promedio"

Ya sabemos:

```sql
SELECT AVG(precio)
FROM productos;
```

Supongamos que queremos responder:

> ¿Qué productos tienen un precio superior al precio promedio?

Conceptualmente necesitamos:

```text
precio del producto
       >
promedio de precios
```

Una consulta puede utilizar el resultado de otra consulta.

---

# 6. Subconsulta

```sql
SELECT nombre, precio
FROM productos
WHERE precio > (
    SELECT AVG(precio)
    FROM productos
);
```

La lógica:

Primero:

```sql
SELECT AVG(precio)
FROM productos;
```

Supongamos:

```text
85.000
```

Después SQL evalúa conceptualmente:

```sql
WHERE precio > 85000
```

La idea importante es:

> **Una subconsulta permite utilizar el resultado de una consulta dentro de otra.**

---

# 7. Otro ejemplo: comportamiento sobre el promedio

Podemos preguntar:

> ¿Qué líneas de venta poseen una cantidad superior a la cantidad promedio vendida?

```sql
SELECT id_venta,
       id_producto,
       cantidad
FROM detalle_ventas
WHERE cantidad > (
    SELECT AVG(cantidad)
    FROM detalle_ventas
);
```

---

# 8. Construcción progresiva

Supongamos el requerimiento:

> Identifique los productos de Tecnología que generan mayores ingresos.

No comenzar escribiendo todo.

### Paso 1

```sql
SELECT *
FROM productos;
```

### Paso 2

```sql
SELECT *
FROM productos
WHERE categoria = 'Tecnología';
```

### Paso 3

Agregar:

```text
PRODUCTOS
   +
DETALLE_VENTAS
```

### Paso 4

Calcular:

```text
cantidad × precio_unitario
```

### Paso 5

Agrupar.

### Paso 6

Ordenar.

Regla:

> **Construir → ejecutar → validar → ampliar.**

---

# 9. Optimización: una primera aproximación

Comparar:

```sql
SELECT *
FROM productos;
```

con:

```sql
SELECT nombre, precio
FROM productos
WHERE categoria = 'Tecnología';
```

Buenas prácticas iniciales:

* seleccionar solamente las columnas necesarias;
* filtrar cuando corresponda;
* evitar JOIN innecesarios;
* construir y validar progresivamente.

> Una consulta correcta no solamente debe ejecutarse; debe responder correctamente el requerimiento.

# Break

## 20:00–20:15

# Taller práctico

## 20:15–22:15

## Nivel 1 — Filtros aplicados

### 15 minutos

### Requerimiento 1

El área comercial necesita identificar productos pertenecientes a las categorías **Tecnología o Accesorios** cuyo precio se encuentre entre dos valores definidos.

Mostrar:

* producto;
* categoría;
* precio;
* stock.

### Requerimiento 2

Identificar clientes cuyo nombre comience con una determinada letra.

---

# Nivel 2 — Ausencia de información

### 15 minutos

### Requerimiento 3

> El área comercial desea identificar clientes registrados que nunca hayan realizado una compra.

### Requerimiento 4

Identificar productos que nunca han sido vendidos.

---

# Nivel 3 — Comparaciones con el promedio

### 20 minutos

### Requerimiento 5

Identificar productos cuyo precio sea superior al precio promedio del catálogo.

Mostrar:

* producto;
* categoría;
* precio.

### Requerimiento 6

Identificar productos cuyo precio sea inferior al promedio.

---

# Nivel 4 — Requerimientos analíticos

### 20 minutos

### Requerimiento 7

> La gerencia desea conocer qué clientes han generado mayores ingresos para la empresa.

Ordenar desde el cliente con mayor ingreso.

---

# Nivel 5 — Problema de negocio

### 20 minutos

### Requerimiento 8

> La empresa necesita analizar el desempeño de sus categorías de productos.

Construir un reporte que permita comparar:

* categoría;
* cantidad de productos vendidos;
* unidades vendidas;
* ingresos;
* precio promedio de venta.

Ordenar las categorías según ingresos.

---

# Nivel 6 — Consulta con criterio analítico

### 15 minutos

### Requerimiento 9

> La gerencia está interesada exclusivamente en las categorías que generan ingresos superiores al promedio de ingresos de las categorías.

---

# Desafío final

### 15 minutos

> **El gerente comercial solicita identificar los cinco productos que presentan mejor desempeño comercial. Diseñe una consulta SQL que permita responder el requerimiento y justifique qué criterio utilizó para definir "mejor desempeño".**

# Producto de la sesión

El estudiante deberá entregar:

**`05_consultas_aplicadas.sql`**

incluyendo las consultas desarrolladas y, para los requerimientos finales, comentarios breves explicando la interpretación.

Por ejemplo:

```sql
-- Criterio utilizado:
-- Se considera desempeño comercial según los ingresos
-- totales generados por cada producto.
```

# Cierre

## 22:15–22:30

### Sesión 1

**Representamos el negocio.**

```text
Problema → Modelo
```

### Sesión 2

**Construimos la base de datos.**

```text
Modelo → Tablas
```

### Sesión 3

**Consultamos y manipulamos datos.**

```text
Tablas → SQL
```

### Sesión 4

**Relacionamos información.**

```text
Tablas relacionadas → JOIN
```

### Sesión 5

**Construimos indicadores.**

```text
Datos → Agregaciones
```

### Sesión 6

**Respondemos requerimientos.**

```text
Problema → Consulta → Información
```

> **Si ya podemos construir todos estos indicadores directamente sobre nuestra base de datos, ¿para qué necesitamos un Data Warehouse?**

La **Sesión 7** comenzará precisamente investigando por qué una base operacional como la que hemos construido deja de ser suficiente cuando necesitamos:

* analizar años de historia;
* integrar múltiples fuentes;
* conservar información histórica;
* ejecutar grandes volúmenes de consultas analíticas;
* analizar el negocio desde distintas dimensiones.
