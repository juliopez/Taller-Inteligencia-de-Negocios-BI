# Sesión 2

# Del modelo relacional a la base de datos

**Asignatura:** Fundamentos de Ingeniería de Datos y SQL
**Programa:** Diplomado en Ingeniería de Datos con Python
**Duración:** 3 horas
**Modalidad:** Online sincrónica
**Entorno práctico:** Oracle APEX
**RAA dominante:** RAA1 / transición hacia RAA2

## Objetivo de aprendizaje

Implementar un modelo relacional en Oracle APEX mediante SQL, creando tablas, definiendo tipos de datos, claves primarias y foráneas, y cargando un conjunto inicial de registros respetando las restricciones de integridad del modelo.

---

# Descripción de la jornada

Durante la sesión anterior se diseñó conceptualmente un modelo relacional para representar las operaciones comerciales de una organización.

En esta segunda sesión se realizará el paso desde el **modelo lógico hacia su implementación física**, utilizando Oracle APEX como entorno de base de datos.

Los estudiantes crearán mediante SQL las cuatro tablas definidas en la sesión anterior, establecerán sus claves y relaciones y cargarán progresivamente datos de prueba.

La actividad permitirá comprobar que un modelo relacional no consiste solamente en un diagrama: sus relaciones deben traducirse correctamente en estructuras que permitan almacenar información de manera consistente.

---

# Agenda de la jornada

| Bloque                    |      Tiempo | Actividad                                                                |
| ------------------------- | ----------: | ------------------------------------------------------------------------ |
| Exposición y demostración |  **45 min** | Oracle APEX, DDL, `CREATE TABLE`, tipos de datos, PK, FK y restricciones |
| Break                     |  **15 min** | Descanso                                                                 |
| Taller práctico           | **120 min** | Implementación y carga del modelo comercial                              |
| Cierre                    |  **15 min** | Validación del modelo y preparación para S3                              |

---

# Bloque 1 — Exposición y demostración

## 19:15–20:00

## 1. Del modelo a la implementación

Retomar el resultado de la Sesión 1:

```text
CLIENTES  1 ───── N  VENTAS

VENTAS    1 ───── N  DETALLE_VENTAS

PRODUCTOS 1 ───── N  DETALLE_VENTAS
```

Hasta ahora tenemos una **representación del problema**.

Pero todavía no existe ninguna base de datos.

El siguiente paso consiste en traducir:

**Entidad → Tabla**

**Atributo → Columna**

**PK → PRIMARY KEY**

**FK → FOREIGN KEY**

**Cardinalidad → Restricción entre tablas**

---

# 2. ¿Qué es DDL?

Introducir una distinción que será importante durante las siguientes sesiones.

SQL no es solamente un lenguaje para consultar datos.

Existen diferentes familias de instrucciones.

| Categoría | Función             | Ejemplos                     |
| --------- | ------------------- | ---------------------------- |
| DDL       | Definir estructuras | `CREATE`, `ALTER`, `DROP`    |
| DML       | Manipular datos     | `INSERT`, `UPDATE`, `DELETE` |
| DQL       | Consultar datos     | `SELECT`                     |

En esta sesión trabajaremos fundamentalmente con:

```sql
CREATE TABLE
```

y comenzaremos a utilizar:

```sql
INSERT
```

La manipulación y consulta de datos se profundizará en la Sesión 3.

---

# 3. Conociendo Oracle APEX

Realizar una demostración breve del entorno.

Recorrido:

```text
Oracle APEX
    ↓
SQL Workshop
    ├── Object Browser
    ├── SQL Commands
    └── SQL Scripts
```

Explicar para qué utilizaremos cada componente.

### SQL Scripts

Para ejecutar conjuntos de instrucciones.

### SQL Commands

Para probar instrucciones individuales.

### Object Browser

Para inspeccionar tablas, columnas, claves y datos.

No dedicar demasiado tiempo a la interfaz. El objetivo es que Oracle APEX sea **el laboratorio**, no el contenido de la clase.

---

# 4. CREATE TABLE

Partir con una tabla sencilla.

```sql
CREATE TABLE clientes (
    id_cliente NUMBER,
    nombre VARCHAR2(100),
    correo VARCHAR2(150),
    ciudad VARCHAR2(100)
);
```

Explicar qué está ocurriendo:

```text
clientes        → tabla
id_cliente      → columna
NUMBER          → tipo de dato
VARCHAR2(100)   → tipo y longitud
```

---

# 5. Tipos de datos

Trabajar solamente con los tipos necesarios para el curso.

| Tipo          | Uso     |
| ------------- | ------- |
| `NUMBER`      | números |
| `VARCHAR2(n)` | texto   |
| `DATE`        | fechas  |

Ejemplos del modelo:

```sql
precio NUMBER(10,2)
```

```sql
nombre VARCHAR2(100)
```

```sql
fecha_venta DATE
```

La idea no es convertir esta parte en una clase exhaustiva sobre tipos Oracle.

---

# 6. PRIMARY KEY

Modificar conceptualmente la tabla anterior:

```sql
CREATE TABLE clientes (
    id_cliente NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    correo VARCHAR2(150),
    ciudad VARCHAR2(100)
);
```

Preguntar:

> ¿Qué ocurriría si intentamos ingresar dos clientes con el mismo `id_cliente`?

Aquí conectamos directamente con lo aprendido en S1.

---

# 7. FOREIGN KEY

Ahora introducir `VENTAS`.

```sql
CREATE TABLE ventas (
    id_venta NUMBER PRIMARY KEY,
    id_cliente NUMBER NOT NULL,
    fecha_venta DATE NOT NULL,

    CONSTRAINT fk_ventas_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);
```

Visualmente:

```text
CLIENTES
id_cliente PK
     │
     │ 1:N
     ▼
VENTAS
id_venta   PK
id_cliente FK
```

Este es probablemente **el concepto central de los 45 minutos**.

El estudiante debe comprender que la relación que dibujó en S1 ahora existe realmente dentro del motor de base de datos.

---

# 8. Integridad referencial

Realizar una pequeña demostración.

Supongamos que no existe el cliente 99:

```sql
INSERT INTO ventas
(id_venta, id_cliente, fecha_venta)
VALUES
(1, 99, SYSDATE);
```

La operación debería ser rechazada.

Preguntar:

> ¿Es esto un problema de Oracle o es precisamente lo que queremos que ocurra?

La respuesta:

**La base de datos está protegiendo la consistencia del modelo.**

Aquí podemos introducir formalmente el concepto de **integridad referencial**.

---

# Break

## 20:00–20:15

---

# Taller práctico

## 20:15–22:15

Esta vez la práctica tendrá un producto muy concreto:

> **Transformar el modelo diseñado en S1 en una base de datos funcional.**

---

# Etapa 1 — Preparación de Oracle APEX

### 10 minutos

Cada estudiante deberá:

1. ingresar a Oracle APEX;
2. acceder a su Workspace;
3. ingresar a `SQL Workshop`;
4. localizar `SQL Scripts`;
5. localizar `Object Browser`.

Crear un script denominado:

```text
01_modelo_comercial
```

---

# Etapa 2 — Crear CLIENTES

### 15 minutos

Implementar:

```text
CLIENTES
---------------------
id_cliente
nombre
correo
ciudad
```

Los estudiantes deberán determinar:

* tipos de datos;
* PK;
* campos obligatorios.

Después ejecutar:

```sql
SELECT *
FROM clientes;
```

Aunque no existan datos todavía, la consulta permitirá comprobar que la tabla existe.

---

# Etapa 3 — Crear PRODUCTOS

### 15 minutos

Implementar:

```text
PRODUCTOS
---------------------
id_producto
nombre
categoria
precio
stock
```

Nuevamente deberán determinar:

* tipos;
* PK;
* restricciones apropiadas.

---

# Etapa 4 — Crear VENTAS

### 20 minutos

Ahora aparece la primera relación.

```text
CLIENTES 1 ───── N VENTAS
```

La tabla deberá considerar:

```text
VENTAS
---------------------
id_venta
id_cliente
fecha_venta
```

Los estudiantes deberán implementar:

```text
id_cliente → FK
```

referenciando:

```text
CLIENTES.id_cliente
```

---

# Etapa 5 — Crear DETALLE_VENTAS

### 20 minutos

Esta será la tabla más importante de la práctica.

```text
DETALLE_VENTAS
---------------------
id_detalle
id_venta
id_producto
cantidad
precio_unitario
```

Debe contener dos claves foráneas:

```text
id_venta
     ↓
VENTAS.id_venta
```

y:

```text
id_producto
     ↓
PRODUCTOS.id_producto
```

Al finalizar, el modelo físico deberá representar:

```text
CLIENTES
   1
   │
   N
VENTAS
   1
   │
   N
DETALLE_VENTAS
   N
   │
   1
PRODUCTOS
```

---

# Etapa 6 — Inspeccionar el modelo

### 10 minutos

Ingresar a:

```text
SQL Workshop
→ Object Browser
→ Tables
```

Comprobar:

* cuatro tablas;
* columnas;
* tipos;
* PK;
* FK.

Aquí cada estudiante debe comparar el modelo implementado con el diagrama diseñado en S1.

---

# Etapa 7 — Primera carga de datos

### 20 minutos

Ahora recuperamos parte del `INSERT` que antes aparecía inmediatamente junto a todo el CRUD en la antigua S2. 

Cargar un conjunto pequeño de información:

### CLIENTES

3 clientes.

### PRODUCTOS

5 productos.

### VENTAS

3 ventas.

### DETALLE_VENTAS

al menos 6 registros.

Pero hay una condición:

> **No entregar inmediatamente el orden de inserción.**

Los estudiantes deberán descubrir que no pueden comenzar por `DETALLE_VENTAS`.

El orden correcto emerge de las dependencias:

```text
CLIENTES ─┐
          ├──→ VENTAS ───→ DETALLE_VENTAS
PRODUCTOS ┘
```

Más exactamente:

```text
CLIENTES
PRODUCTOS
    ↓
VENTAS
    ↓
DETALLE_VENTAS
```

Esto permite experimentar realmente la integridad referencial, algo que en el solucionario anterior simplemente se advertía mediante notas como "los valores deben existir previamente". 

---

# Etapa 8 — Provocar un error

### 10 minutos

Esta actividad la incorporaría deliberadamente.

Cada estudiante deberá intentar insertar un detalle con un producto inexistente.

Por ejemplo:

```sql
INSERT INTO detalle_ventas
(id_detalle, id_venta, id_producto, cantidad, precio_unitario)
VALUES
(100, 1, 9999, 2, 1500);
```

Observar el error.

Luego responder:

**¿Por qué Oracle rechazó el registro?**

La respuesta deberá relacionarse con:

* FK;
* integridad referencial;
* consistencia de datos.

Así el error se transforma en recurso pedagógico.

---

# Cierre

## 22:15–22:30

```sql
SELECT * FROM clientes;

SELECT * FROM productos;

SELECT * FROM ventas;

SELECT * FROM detalle_ventas;
```

Al final de esta sesión usted deberá tener:

* cuatro tablas creadas;
* PK correctamente definidas;
* FK correctamente definidas;
* relaciones funcionando;
* datos iniciales cargados;
* comprensión básica de integridad referencial.

---

# Producto de la sesión

**Script `01_modelo_comercial.sql`**

que contendrá:

```text
CREATE TABLE CLIENTES
CREATE TABLE PRODUCTOS
CREATE TABLE VENTAS
CREATE TABLE DETALLE_VENTAS

+ carga inicial mediante INSERT
```

---

# Conexión con la Sesión 3

Ya tenemos una base de datos y tenemos datos. Ahora necesitamos aprender a trabajar con ellos.

La **Sesión 3** será entonces:

### SQL básico y operaciones CRUD

* `SELECT`;
* selección de columnas;
* `WHERE`;
* operadores;
* `ORDER BY`;
* `INSERT`;
* `UPDATE`;
* `DELETE`;
* seguridad con `WHERE`.

