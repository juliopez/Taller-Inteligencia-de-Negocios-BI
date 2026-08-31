# Modelo operacional y diccionario de datos

## Caso NovaMarket

## 1. Propósito

Este documento define el **modelo operacional de referencia** utilizado en el caso transversal NovaMarket.

El modelo representa las operaciones comerciales fundamentales de la empresa y constituye la base para las actividades de:

* implementación de bases de datos;
* manipulación de información;
* consultas SQL;
* integración de tablas;
* construcción de indicadores;
* diseño dimensional;
* procesos ETL;
* construcción del Data Warehouse.

---

# 2. Modelo conceptual

A partir de las reglas de negocio de NovaMarket se identifican cuatro entidades principales:

```text
CLIENTES
PRODUCTOS
VENTAS
DETALLE_VENTAS
```

Sus relaciones son:

```text
CLIENTES  1 ─────────── N  VENTAS

VENTAS    1 ─────────── N  DETALLE_VENTAS

PRODUCTOS 1 ─────────── N  DETALLE_VENTAS
```

`DETALLE_VENTAS` permite resolver la relación conceptualmente **N:M entre VENTAS y PRODUCTOS**.

Una venta puede contener varios productos y un mismo producto puede aparecer en múltiples ventas.

---

# 3. Modelo lógico

```text
┌───────────────────┐
│     CLIENTES      │
├───────────────────┤
│ PK id_cliente     │
│    nombre         │
│    correo         │
│    ciudad         │
└─────────┬─────────┘
          │ 1
          │
          │ N
┌─────────▼─────────┐
│      VENTAS       │
├───────────────────┤
│ PK id_venta       │
│ FK id_cliente     │
│    fecha_venta    │
└─────────┬─────────┘
          │ 1
          │
          │ N
┌─────────▼─────────────┐
│    DETALLE_VENTAS     │
├───────────────────────┤
│ PK id_detalle         │
│ FK id_venta           │
│ FK id_producto        │
│    cantidad           │
│    precio_unitario    │
└────────────┬───────────┘
             │ N
             │
             │ 1
     ┌───────▼─────────┐
     │    PRODUCTOS    │
     ├─────────────────┤
     │ PK id_producto  │
     │    nombre       │
     │    categoria    │
     │    precio       │
     │    stock        │
     └─────────────────┘
```

---

# 4. Diccionario de datos

## 4.1 CLIENTES

Almacena información básica de los clientes registrados en NovaMarket.

| Campo        | Tipo Oracle     | Restricción  | Descripción                     |
| ------------ | --------------- | ------------ | ------------------------------- |
| `id_cliente` | `NUMBER`        | PK, NOT NULL | Identificador único del cliente |
| `nombre`     | `VARCHAR2(100)` | NOT NULL     | Nombre completo del cliente     |
| `correo`     | `VARCHAR2(150)` | —            | Correo electrónico              |
| `ciudad`     | `VARCHAR2(100)` | NOT NULL     | Ciudad de residencia            |

### Clave primaria

```text
id_cliente
```

### Ejemplo

| id_cliente | nombre         | correo                                                          | ciudad       |
| ---------: | -------------- | --------------------------------------------------------------- | ------------ |
|          1 | Ana Pérez      | [ana.perez@example.com](mailto:ana.perez@example.com)           | Valparaíso   |
|          2 | Carlos Soto    | [carlos.soto@example.com](mailto:carlos.soto@example.com)       | Santiago     |
|          3 | María González | [maria.gonzalez@example.com](mailto:maria.gonzalez@example.com) | Viña del Mar |

---

# 5. PRODUCTOS

Almacena el catálogo comercial vigente de NovaMarket.

| Campo         | Tipo Oracle     | Restricción  | Descripción                      |
| ------------- | --------------- | ------------ | -------------------------------- |
| `id_producto` | `NUMBER`        | PK, NOT NULL | Identificador único del producto |
| `nombre`      | `VARCHAR2(120)` | NOT NULL     | Nombre comercial                 |
| `categoria`   | `VARCHAR2(80)`  | NOT NULL     | Categoría a la que pertenece     |
| `precio`      | `NUMBER(10,2)`  | NOT NULL     | Precio actual del producto       |
| `stock`       | `NUMBER`        | NOT NULL     | Unidades actualmente disponibles |

### Clave primaria

```text
id_producto
```

### Ejemplo

| id_producto | nombre             | categoria  | precio | stock |
| ----------: | ------------------ | ---------- | -----: | ----: |
|         101 | Mouse inalámbrico  | Tecnología |  14990 |    35 |
|         102 | Teclado mecánico   | Tecnología |  39990 |    20 |
|         103 | Lámpara escritorio | Hogar      |  18990 |    17 |

---

# 6. VENTAS

Representa las transacciones comerciales realizadas por los clientes.

| Campo         | Tipo Oracle | Restricción  | Descripción                      |
| ------------- | ----------- | ------------ | -------------------------------- |
| `id_venta`    | `NUMBER`    | PK, NOT NULL | Identificador único de la venta  |
| `id_cliente`  | `NUMBER`    | FK, NOT NULL | Cliente que realizó la compra    |
| `fecha_venta` | `DATE`      | NOT NULL     | Fecha de realización de la venta |

### Clave primaria

```text
id_venta
```

### Clave foránea

```text
id_cliente → CLIENTES.id_cliente
```

### Ejemplo

| id_venta | id_cliente | fecha_venta |
| -------: | ---------: | ----------- |
|     1001 |          1 | 15-03-2025  |
|     1002 |          3 | 18-03-2025  |
|     1003 |          2 | 21-03-2025  |

---

# 7. DETALLE_VENTAS

Representa cada producto incorporado a una venta.

| Campo             | Tipo Oracle    | Restricción  | Descripción                                        |
| ----------------- | -------------- | ------------ | -------------------------------------------------- |
| `id_detalle`      | `NUMBER`       | PK, NOT NULL | Identificador único de la línea de venta           |
| `id_venta`        | `NUMBER`       | FK, NOT NULL | Venta a la que pertenece                           |
| `id_producto`     | `NUMBER`       | FK, NOT NULL | Producto comercializado                            |
| `cantidad`        | `NUMBER`       | NOT NULL     | Cantidad vendida                                   |
| `precio_unitario` | `NUMBER(10,2)` | NOT NULL     | Precio aplicado al producto al momento de la venta |

### Clave primaria

```text
id_detalle
```

### Claves foráneas

```text
id_venta
    ↓
VENTAS.id_venta
```

```text
id_producto
    ↓
PRODUCTOS.id_producto
```

### Ejemplo

| id_detalle | id_venta | id_producto | cantidad | precio_unitario |
| ---------: | -------: | ----------: | -------: | --------------: |
|          1 |     1001 |         101 |        2 |           14990 |
|          2 |     1001 |         103 |        1 |           18990 |
|          3 |     1002 |         102 |        1 |           39990 |

---

# 8. Una decisión fundamental: precio vs. precio_unitario

### PRODUCTOS.precio

Representa el **precio actual** del producto.

### DETALLE_VENTAS.precio_unitario

Representa el **precio aplicado históricamente** cuando ocurrió una determinada venta.

Ejemplo:

```text
01/03/2025
Producto A = $10.000
Cliente compra 2 unidades
```

Posteriormente:

```text
01/08/2026
Producto A = $12.000
```

La venta histórica debe continuar mostrando:

```text
2 × $10.000 = $20.000
```

y no:

```text
2 × $12.000 = $24.000
```

---

# 9. Cálculo del importe

No almacenaremos inicialmente una columna `importe` en `DETALLE_VENTAS`.

El importe puede derivarse mediante:

```text
importe = cantidad × precio_unitario
```

Por ejemplo:

```sql
SELECT cantidad,
       precio_unitario,
       cantidad * precio_unitario AS importe
FROM detalle_ventas;
```

---

# 10. Reglas de integridad

El modelo deberá cumplir las siguientes reglas.

### CLIENTES

```text
id_cliente → obligatorio y único
nombre     → obligatorio
ciudad     → obligatoria
```

### PRODUCTOS

```text
id_producto → obligatorio y único
nombre      → obligatorio
categoria   → obligatoria
precio      → obligatorio
stock       → obligatorio
```

### VENTAS

```text
id_venta    → obligatorio y único
id_cliente  → obligatorio y debe existir en CLIENTES
fecha_venta → obligatoria
```

### DETALLE_VENTAS

```text
id_detalle      → obligatorio y único
id_venta        → debe existir en VENTAS
id_producto     → debe existir en PRODUCTOS
cantidad        → obligatoria
precio_unitario → obligatorio
```

---

# 11. Restricciones de dominio

Además de PK/FK/NOT NULL, el modelo de referencia debería considerar conceptualmente:

```text
precio >= 0
stock >= 0
cantidad > 0
precio_unitario >= 0
```

En Oracle podrían implementarse mediante `CHECK`.

Por ejemplo:

```sql
CHECK (precio >= 0)
```

```sql
CHECK (stock >= 0)
```

```sql
CHECK (cantidad > 0)
```

---

# 12. Normalización práctica

El modelo evita almacenar repetidamente información del cliente dentro de cada venta.

No utilizamos:

```text
VENTAS
--------------------------------
id_venta
fecha
nombre_cliente
correo_cliente
ciudad_cliente
producto_1
producto_2
producto_3
...
```

En su lugar:

```text
CLIENTES
   ↓
VENTAS
   ↓
DETALLE_VENTAS
   ↑
PRODUCTOS
```

Esto permite:

* reducir redundancia;
* mantener consistencia;
* representar múltiples productos por venta;
* reutilizar clientes y productos;
* preservar relaciones explícitas mediante claves.

---

# 13. Orden de creación

Las tablas deberán crearse respetando las dependencias:

```text
1. CLIENTES
2. PRODUCTOS
3. VENTAS
4. DETALLE_VENTAS
```

Porque:

```text
VENTAS
depende de
CLIENTES
```

y:

```text
DETALLE_VENTAS
depende de
VENTAS + PRODUCTOS
```

---

# 14. Orden de carga

La carga inicial seguirá la misma lógica:

```text
CLIENTES ─────┐
              ├──► VENTAS ───► DETALLE_VENTAS
PRODUCTOS ────┘
```

Más exactamente:

```text
1. CLIENTES
2. PRODUCTOS
3. VENTAS
4. DETALLE_VENTAS
```

---

# 15. Consultas que debe soportar el modelo

### S3 — CRUD

```text
✓ consultar productos
✓ insertar clientes/productos/ventas
✓ modificar precio/stock
✓ eliminar registros
```

### S4 — JOIN

```text
✓ cliente + venta
✓ venta + detalle
✓ detalle + producto
✓ cliente + venta + detalle + producto
✓ clientes sin ventas
✓ productos sin ventas
```

### S5 — Agregaciones

```text
✓ cantidad de ventas
✓ unidades vendidas
✓ ingresos
✓ ingresos por producto
✓ ingresos por cliente
✓ ingresos por categoría
```

### S6 — Análisis

```text
✓ productos sobre precio promedio
✓ rankings
✓ categorías
✓ clientes sin actividad
✓ productos sin ventas
✓ consultas integradoras
```

---

# 16. Transformación posterior hacia el Data Warehouse

Este documento define **solo el sistema operacional**.

```text
                    DIM_TIEMPO
                         │
                         ▼
DIM_CLIENTE ─────── FACT_VENTAS ─────── DIM_PRODUCTO
```

Una correspondencia inicial será:

| Modelo operacional        | Modelo dimensional |
| ------------------------- | ------------------ |
| `CLIENTES`                | `DIM_CLIENTE`      |
| `PRODUCTOS`               | `DIM_PRODUCTO`     |
| `VENTAS.fecha_venta`      | `DIM_TIEMPO`       |
| `VENTAS + DETALLE_VENTAS` | `FACT_VENTAS`      |

Pero **no debe asumirse que simplemente copiaremos las tablas**.

El proceso ETL deberá transformarlas para responder a las necesidades del modelo analítico.

---

# 17. Granularidad futura

El diseño operacional determina naturalmente una posible granularidad analítica:

> **Una fila de FACT_VENTAS representará una línea de producto asociada a una venta, realizada por un cliente en una fecha determinada.**

Esta granularidad corresponde conceptualmente al nivel de detalle representado actualmente por:

```text
DETALLE_VENTAS
```

enriquecido con información proveniente de:

```text
VENTAS
```

---

# 18. Decisión sobre claves sustitutas

Para el modelo operacional utilizaremos claves simples:

```text
id_cliente
id_producto
id_venta
id_detalle
```

En el Data Warehouse recomiendo que posteriormente introduzcamos:

```text
sk_cliente
sk_producto
sk_tiempo
```

como **surrogate keys**, conservando también los identificadores de origen:

```text
id_cliente_origen
id_producto_origen
```

Esto nos permitirá enseñar una práctica auténtica de Data Warehousing sin entrar todavía en Slowly Changing Dimensions.

Es decir:

```text
OPERACIONAL

id_cliente = 25
```

podría convertirse en:

```text
DIM_CLIENTE

sk_cliente       = 103
id_cliente_origen = 25
```

---

# 19. Modelo operacional canónico

```text
CLIENTES
────────────────────────
PK  id_cliente
    nombre
    correo
    ciudad


PRODUCTOS
────────────────────────
PK  id_producto
    nombre
    categoria
    precio
    stock


VENTAS
────────────────────────
PK  id_venta
FK  id_cliente
    fecha_venta


DETALLE_VENTAS
────────────────────────
PK  id_detalle
FK  id_venta
FK  id_producto
    cantidad
    precio_unitario
```

Y las relaciones:

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


