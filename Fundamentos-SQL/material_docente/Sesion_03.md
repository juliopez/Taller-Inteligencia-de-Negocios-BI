# Sesión 3

# SQL básico y operaciones CRUD

**Asignatura:** Fundamentos de Ingeniería de Datos y SQL
**Duración:** 3 horas
**Modalidad:** Online sincrónica
**Entorno práctico:** Oracle APEX
**RAA dominante:** RAA2

## Objetivo de aprendizaje

Consultar y manipular información almacenada en una base de datos relacional mediante instrucciones SQL básicas, aplicando `SELECT`, filtros, ordenamiento y operaciones de inserción, actualización y eliminación de registros.

## Descripción de la jornada

En las sesiones anteriores los estudiantes diseñaron un modelo relacional y posteriormente lo implementaron en Oracle APEX.

En esta sesión comenzarán a **trabajar directamente con los datos almacenados**, utilizando SQL para responder preguntas, incorporar nuevos registros y modificar información existente.

El énfasis estará en comprender SQL como un lenguaje para interactuar con datos y en aplicar buenas prácticas que permitan realizar modificaciones de manera controlada y segura.

## Agenda

| Bloque                    |      Tiempo | Actividad                                                   |
| ------------------------- | ----------: | ----------------------------------------------------------- |
| Exposición y demostración |  **45 min** | SQL, CRUD, SELECT, WHERE, ORDER BY, INSERT, UPDATE y DELETE |
| Break                     |  **15 min** | Descanso                                                    |
| Taller práctico           | **120 min** | Consultas y operaciones CRUD en Oracle APEX                 |
| Cierre                    |  **15 min** | Revisión, errores frecuentes y conexión con S4              |

# Bloque 1 — Exposición y demostración

## 19:15–20:00

### 1. Ya tenemos datos. ¿Qué hacemos con ellos?

Partir directamente desde lo construido en S2:

```text
CLIENTES
PRODUCTOS
VENTAS
DETALLE_VENTAS
```

Ahora podemos comenzar a hacer preguntas:

> ¿Qué productos tenemos?
> ¿Cuáles tienen poco stock?
> ¿Qué ventas fueron realizadas recientemente?
> ¿Cómo modificamos el precio de un producto?

Esto introduce SQL desde una necesidad, no desde su definición.

### 2. SQL y CRUD

Presentar las cuatro operaciones fundamentales:

| Operación  | SQL      |
| ---------- | -------- |
| **Create** | `INSERT` |
| **Read**   | `SELECT` |
| **Update** | `UPDATE` |
| **Delete** | `DELETE` |

Una precisión pedagógica importante:

> CRUD no significa `CREATE TABLE`.

En CRUD, **Create** significa crear un nuevo **registro** mediante `INSERT`. `CREATE TABLE` pertenece a DDL y fue utilizado en S2.

### 3. SELECT

Comenzar con:

```sql
SELECT *
FROM productos;
```

Luego:

```sql
SELECT nombre, precio, stock
FROM productos;
```

Introducir inmediatamente una buena práctica:

**consultar solamente las columnas que necesitamos.**

Pregunta:

> ¿Cuál de las dos consultas entrega información más pertinente si solo queremos revisar precios?

### 4. WHERE

Ahora necesitamos filtrar.

```sql
SELECT nombre, precio, stock
FROM productos
WHERE stock < 10;
```

Operadores iniciales:

| Operador | Significado   |
| -------- | ------------- |
| `=`      | Igual         |
| `<>`     | Distinto      |
| `>`      | Mayor         |
| `<`      | Menor         |
| `>=`     | Mayor o igual |
| `<=`     | Menor o igual |

Agregar dos operadores muy útiles:

```sql
WHERE precio BETWEEN 5000 AND 20000
```

```sql
WHERE categoria = 'Tecnología'
```

No ampliaría todavía a una batería enorme de operadores. La prioridad es que comprendan la lógica del filtro.

### 5. ORDER BY

```sql
SELECT nombre, precio
FROM productos
ORDER BY precio DESC;
```

Pregunta:

> ¿Qué producto aparecerá primero?

Luego:

```sql
ORDER BY precio ASC;
```

Con esto ya podemos construir consultas:

**SELECT → FROM → WHERE → ORDER BY**

```sql
SELECT nombre, precio, stock
FROM productos
WHERE stock < 20
ORDER BY precio DESC;
```

Esta será nuestra primera consulta "completa".

### 6. INSERT

Ahora pasamos de consultar a modificar.

```sql
INSERT INTO productos
(id_producto, nombre, categoria, precio, stock)
VALUES
(6, 'Monitor 24 pulgadas', 'Tecnología', 129990, 15);
```

Verificación:

```sql
SELECT *
FROM productos
WHERE id_producto = 6;
```

Aquí reforzaría una práctica que utilizaremos durante todo el curso:

**Ejecutar → verificar.**

### 7. UPDATE

```sql
UPDATE productos
SET precio = 119990
WHERE id_producto = 6;
```

Pero antes:

```sql
SELECT *
FROM productos
WHERE id_producto = 6;
```

Y después nuevamente:

```sql
SELECT *
FROM productos
WHERE id_producto = 6;
```

La secuencia será:

**SELECT → UPDATE → SELECT**

### 8. DELETE y el peligro de WHERE

```sql
DELETE FROM productos
WHERE id_producto = 6;
```

Nuevamente:

**SELECT → DELETE → SELECT**

Mostrar entonces deliberadamente:

```sql
DELETE FROM productos;
```

y preguntar:

> ¿Qué registro eliminaría?

**Todos.**

Lo mismo con:

```sql
UPDATE productos
SET precio = 1000;
```

Este punto merece algunos minutos porque constituye una práctica profesional esencial.

# Break

## 20:00–20:15

# Taller práctico — Gestión comercial

## 20:15–22:15

Aquí mantendría la filosofía de dificultad progresiva:

**Muestra → Guiado → Autónomo → Desafío.**

No necesitamos 14 ejercicios como en la antigua S3.  Prefiero menos ejercicios, pero con progresión clara.

## Nivel 1 — Exploración

### 20 minutos

### Ejercicio 1

Mostrar todos los productos.

### Ejercicio 2

Mostrar solamente:

* nombre;
* categoría;
* precio.

### Ejercicio 3

Mostrar productos cuyo precio sea superior a un determinado valor.

### Ejercicio 4

Mostrar productos ordenados desde el mayor al menor precio.

El objetivo es dominar:

```text
SELECT
FROM
WHERE
ORDER BY
```

## Nivel 2 — Consultas combinadas

### 20 minutos

### Ejercicio 5

Mostrar:

* nombre;
* precio;
* stock;

de los productos cuyo stock sea inferior a 20, ordenados desde el menor stock al mayor.

### Ejercicio 6

Mostrar los productos pertenecientes a una categoría determinada, ordenados por precio descendente.

Aquí ya no entregamos la estructura SQL.

Entregamos el **requerimiento**.

## Nivel 3 — INSERT

### 20 minutos

Registrar:

* un nuevo cliente;
* dos nuevos productos;
* una nueva venta.

Después de cada operación deberán comprobar mediante `SELECT` que el registro existe.

Aquí aparecerá nuevamente la integridad referencial de S2:

> ¿Podemos crear una venta para un cliente inexistente?

## Nivel 4 — UPDATE

### 20 minutos

### Ejercicio 7

Modificar el precio de uno de los productos incorporados.

### Ejercicio 8

Aumentar su stock.

Obligatoriamente deberán ejecutar:

```text
SELECT antes
      ↓
UPDATE
      ↓
SELECT después
```

No basta con que el comando "no dé error".

## Nivel 5 — DELETE

### 15 minutos

Eliminar uno de los productos de prueba.

Pero antes deberán:

1. identificar el registro;
2. ejecutar `SELECT`;
3. ejecutar `DELETE`;
4. volver a ejecutar `SELECT`.

Esto convierte la verificación en hábito.

## Nivel 6 — ¿Por qué no puedo eliminarlo?

### 15 minutos

Esta parte me parece especialmente valiosa.

Pedir que intenten eliminar un cliente que ya tenga una venta asociada.

Oracle debería impedirlo debido a la FK.

Pregunta:

> ¿Por qué podemos eliminar algunos registros y otros no?

Así conectamos:

**S1: relación → S2: FOREIGN KEY → S3: consecuencia operacional.**

## Desafío autónomo

### 10 minutos

Presentar solamente el requerimiento:

> La empresa detectó que un producto presenta poco stock. Identifíquelo mediante SQL, actualice su stock incorporando 10 unidades adicionales y compruebe que la operación fue realizada correctamente.

No indicar:

* qué consulta ejecutar;
* qué instrucción utilizar;
* en qué orden.

El estudiante debe construir la solución.

# Producto de la sesión

Cada estudiante deberá finalizar con un segundo script:

**`02_crud_comercial.sql`**

que contenga evidencias de:

```text
SELECT
WHERE
ORDER BY
INSERT
UPDATE
DELETE
```

El script de S2 construye la base.

El script de S3 trabaja sobre ella.

Esto comienza a generar además un pequeño **portafolio SQL incremental**.

# Cierre

## 22:15–22:30


**1. SQL permite consultar y modificar datos.**

**2. `WHERE` determina qué registros serán afectados.**

**3. Toda modificación debe verificarse.**

**4. Las relaciones del modelo condicionan qué operaciones son válidas.**


Tenemos:

```text
VENTAS
id_venta
id_cliente
fecha_venta
```

Podemos ejecutar:

```sql
SELECT *
FROM ventas;
```

y obtener algo parecido a:

| id_venta | id_cliente | fecha      |
| -------: | ---------: | ---------- |
|      101 |          3 | 15/09/2026 |

Pero surge una pregunta:

> **¿Quién es el cliente 3?**

Podemos mirar `CLIENTES`, pero ¿podemos hacer que SQL nos entregue directamente algo como esto?

| Venta | Cliente   | Fecha      |
| ----: | --------- | ---------- |
|   101 | Ana Pérez | 15/09/2026 |

---

## Conexión con S4

La **Sesión 4 será JOIN y consultas multitabla**.

