# Diccionario de Datos --- NovaMarket

## 1. Descripción general

**NovaMarket** es el modelo de datos operacional utilizado como caso
transversal para los ejercicios de SQL de la asignatura. Representa un
escenario comercial simplificado en el que clientes realizan ventas
compuestas por uno o más productos.

El modelo está formado por cuatro tablas:

-   `CLIENTES`: almacena los datos básicos de los clientes.
-   `PRODUCTOS`: mantiene el catálogo de productos y su información
    operacional.
-   `VENTAS`: registra cada transacción comercial y el cliente asociado.
-   `DETALLE_VENTAS`: registra los productos incluidos en cada venta, su
    cantidad y el precio aplicado en la transacción.

## 2. Relaciones del modelo

``` text
CLIENTES
   │
   │ 1:N
   ▼
VENTAS
   │
   │ 1:N
   ▼
DETALLE_VENTAS
   ▲
   │ N:1
   │
PRODUCTOS
```

Las relaciones se implementan mediante claves foráneas:

-   `VENTAS.id_cliente` → `CLIENTES.id_cliente`
-   `DETALLE_VENTAS.id_venta` → `VENTAS.id_venta`
-   `DETALLE_VENTAS.id_producto` → `PRODUCTOS.id_producto`

La tabla `DETALLE_VENTAS` resuelve la relación conceptual de muchos a
muchos entre ventas y productos.

------------------------------------------------------------------------

## 3. Tabla `CLIENTES`

Almacena la información básica de cada cliente registrado en NovaMarket.

  ------------------------------------------------------------------------------
  Campo          Tipo de dato      Nulo           Clave          Descripción
  -------------- ----------------- -------------- -------------- ---------------
  `id_cliente`   `NUMBER`          No             PK             Identificador
                                                                 único del
                                                                 cliente.

  `nombre`       `VARCHAR2(100)`   No             ---            Nombre del
                                                                 cliente.

  `correo`       `VARCHAR2(150)`   Sí             ---            Dirección de
                                                                 correo
                                                                 electrónico del
                                                                 cliente.

  `ciudad`       `VARCHAR2(100)`   No             ---            Ciudad asociada
                                                                 al cliente.
  ------------------------------------------------------------------------------

### Clave primaria

``` sql
PRIMARY KEY (id_cliente)
```

------------------------------------------------------------------------

## 4. Tabla `PRODUCTOS`

Contiene el catálogo de productos comercializados por NovaMarket.

  -------------------------------------------------------------------------------
  Campo           Tipo de dato      Nulo           Clave          Descripción
  --------------- ----------------- -------------- -------------- ---------------
  `id_producto`   `NUMBER`          No             PK             Identificador
                                                                  único del
                                                                  producto.

  `nombre`        `VARCHAR2(120)`   No             ---            Nombre
                                                                  descriptivo del
                                                                  producto.

  `categoria`     `VARCHAR2(80)`    No             ---            Categoría
                                                                  comercial a la
                                                                  que pertenece
                                                                  el producto.

  `precio`        `NUMBER(10,2)`    No             ---            Precio actual
                                                                  del producto.
                                                                  Debe ser mayor
                                                                  o igual a cero.

  `stock`         `NUMBER`          No             ---            Cantidad
                                                                  disponible
                                                                  actualmente.
                                                                  Debe ser mayor
                                                                  o igual a cero.
  -------------------------------------------------------------------------------

### Restricciones

``` sql
PRIMARY KEY (id_producto)
CHECK (precio >= 0)
CHECK (stock >= 0)
```

> `precio` representa el precio **actual** del producto. El precio
> efectivamente aplicado en una venta se conserva en
> `DETALLE_VENTAS.precio_unitario`.

------------------------------------------------------------------------

## 5. Tabla `VENTAS`

Registra las transacciones comerciales realizadas por los clientes.

  -------------------------------------------------------------------------------------
  Campo           Tipo de dato   Nulo           Clave          Descripción
  --------------- -------------- -------------- -------------- ------------------------
  `id_venta`      `NUMBER`       No             PK             Identificador único de
                                                               la venta.

  `id_cliente`    `NUMBER`       No             FK             Cliente que realizó la
                                                               compra. Referencia a
                                                               `CLIENTES.id_cliente`.

  `fecha_venta`   `DATE`         No             ---            Fecha en que se realizó
                                                               la venta.
  -------------------------------------------------------------------------------------

### Restricciones

``` sql
PRIMARY KEY (id_venta)

CONSTRAINT fk_ventas_cliente
FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente)
```

### Cardinalidad

Un cliente puede realizar **muchas ventas**, mientras que cada venta
pertenece a **un solo cliente**:

``` text
CLIENTES 1 ─────── N VENTAS
```

------------------------------------------------------------------------

## 6. Tabla `DETALLE_VENTAS`

Contiene las líneas o ítems que componen cada venta. Constituye el nivel
de mayor detalle del modelo operacional.

  ---------------------------------------------------------------------------------------------
  Campo               Tipo de dato     Nulo           Clave          Descripción
  ------------------- ---------------- -------------- -------------- --------------------------
  `id_detalle`        `NUMBER`         No             PK             Identificador único de la
                                                                     línea de venta.

  `id_venta`          `NUMBER`         No             FK             Venta a la que pertenece
                                                                     el registro. Referencia a
                                                                     `VENTAS.id_venta`.

  `id_producto`       `NUMBER`         No             FK             Producto incluido en la
                                                                     venta. Referencia a
                                                                     `PRODUCTOS.id_producto`.

  `cantidad`          `NUMBER`         No             ---            Número de unidades
                                                                     vendidas. Debe ser mayor
                                                                     que cero.

  `precio_unitario`   `NUMBER(10,2)`   No             ---            Precio unitario aplicado
                                                                     al producto en el momento
                                                                     de la venta. Debe ser
                                                                     mayor o igual a cero.
  ---------------------------------------------------------------------------------------------

### Restricciones

``` sql
PRIMARY KEY (id_detalle)

CONSTRAINT fk_detalle_venta
FOREIGN KEY (id_venta)
REFERENCES ventas(id_venta)

CONSTRAINT fk_detalle_producto
FOREIGN KEY (id_producto)
REFERENCES productos(id_producto)

CHECK (cantidad > 0)
CHECK (precio_unitario >= 0)
```

### Cardinalidades

``` text
VENTAS    1 ─────── N DETALLE_VENTAS
PRODUCTOS 1 ─────── N DETALLE_VENTAS
```

Una venta puede contener varios productos y un mismo producto puede
participar en múltiples ventas.

------------------------------------------------------------------------

## 7. Claves del modelo

  Tabla              Clave primaria   Claves foráneas
  ------------------ ---------------- ---------------------------
  `CLIENTES`         `id_cliente`     ---
  `PRODUCTOS`        `id_producto`    ---
  `VENTAS`           `id_venta`       `id_cliente`
  `DETALLE_VENTAS`   `id_detalle`     `id_venta`, `id_producto`

------------------------------------------------------------------------

## 8. Reglas de integridad

El modelo implementa las siguientes reglas:

1.  Cada cliente, producto, venta y detalle posee un identificador
    único.
2.  Una venta solo puede registrar un cliente existente.
3.  Un detalle solo puede pertenecer a una venta existente.
4.  Un detalle solo puede utilizar un producto existente.
5.  El precio actual de un producto no puede ser negativo.
6.  El stock de un producto no puede ser negativo.
7.  La cantidad vendida debe ser mayor que cero.
8.  El precio unitario aplicado en una venta no puede ser negativo.
9.  El nombre y la ciudad del cliente son obligatorios; el correo
    electrónico es opcional.
10. La fecha de cada venta es obligatoria.

------------------------------------------------------------------------

## 9. Atributos derivados utilizados en los ejercicios

El modelo no almacena directamente el importe de una línea de venta.
Este valor se obtiene mediante:

``` sql
cantidad * precio_unitario
```

Ejemplo:

``` sql
SELECT
    id_detalle,
    cantidad,
    precio_unitario,
    cantidad * precio_unitario AS importe
FROM detalle_ventas;
```

Esta decisión permite trabajar expresiones calculadas, agregaciones e
indicadores mediante SQL.

------------------------------------------------------------------------

## 10. Preguntas que permite responder el modelo

A partir de estas tablas pueden desarrollarse consultas como:

-   ¿Qué clientes han realizado compras?
-   ¿Qué clientes no registran ventas?
-   ¿Qué productos fueron incluidos en cada venta?
-   ¿Cuántas unidades se han vendido por producto?
-   ¿Cuánto ingreso ha generado cada producto?
-   ¿Qué categorías generan mayores ingresos?
-   ¿Qué clientes concentran mayores montos de compra?
-   ¿Qué productos no presentan ventas?
-   ¿Cómo evolucionan las ventas a través del tiempo?
-   ¿Cómo se distribuyen las ventas según la ciudad de los clientes?

------------------------------------------------------------------------

## 11. Secuencia de dependencia

Para crear y cargar el modelo respetando la integridad referencial, se
recomienda el siguiente orden:

``` text
1. CLIENTES
2. PRODUCTOS
3. VENTAS
4. DETALLE_VENTAS
```

La eliminación de las tablas debe considerar el orden inverso cuando
existan registros o restricciones activas:

``` text
1. DETALLE_VENTAS
2. VENTAS
3. PRODUCTOS
4. CLIENTES
```

------------------------------------------------------------------------

## 12. Resumen del modelo

<img src=MER_NovaMarket.png >

``` text
CLIENTES
PK id_cliente
   nombre
   correo
   ciudad
      │
      │ 1:N
      ▼
VENTAS
PK id_venta
FK id_cliente
   fecha_venta
      │
      │ 1:N
      ▼
DETALLE_VENTAS
PK id_detalle
FK id_venta
FK id_producto
   cantidad
   precio_unitario
      ▲
      │ N:1
      │
PRODUCTOS
PK id_producto
   nombre
   categoria
   precio
   stock
```

------------------------------------------------------------------------

**Fuente:** estructura definida en `novamarket_completo.sql`.
