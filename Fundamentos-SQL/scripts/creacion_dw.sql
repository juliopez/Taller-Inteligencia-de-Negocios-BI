/*
 NovaMarket - Data Warehouse de referencia
 SQL Server
 Modelo estrella: DIM_CLIENTE, DIM_PRODUCTO, DIM_TIEMPO, FACT_VENTAS
*/

IF DB_ID('DW_NovaMarket') IS NULL
    CREATE DATABASE DW_NovaMarket;
GO

USE DW_NovaMarket;
GO

CREATE TABLE dbo.DIM_CLIENTE (
    sk_cliente INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    id_cliente_origen INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    ciudad NVARCHAR(100) NOT NULL,
    region NVARCHAR(120) NULL,
    zona NVARCHAR(30) NULL,
    CONSTRAINT uq_dim_cliente_origen UNIQUE (id_cliente_origen)
);
GO

CREATE TABLE dbo.DIM_PRODUCTO (
    sk_producto INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    id_producto_origen INT NOT NULL,
    nombre_producto NVARCHAR(120) NOT NULL,
    categoria NVARCHAR(80) NOT NULL,
    CONSTRAINT uq_dim_producto_origen UNIQUE (id_producto_origen)
);
GO

CREATE TABLE dbo.DIM_TIEMPO (
    sk_tiempo INT NOT NULL PRIMARY KEY,             -- formato YYYYMMDD
    fecha DATE NOT NULL,
    dia TINYINT NOT NULL,
    mes TINYINT NOT NULL,
    nombre_mes NVARCHAR(20) NOT NULL,
    trimestre TINYINT NOT NULL,
    anio SMALLINT NOT NULL,
    CONSTRAINT uq_dim_tiempo_fecha UNIQUE (fecha)
);
GO

CREATE TABLE dbo.FACT_VENTAS (
    sk_venta_detalle BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    sk_cliente INT NOT NULL,
    sk_producto INT NOT NULL,
    sk_tiempo INT NOT NULL,
    id_venta_origen INT NOT NULL,
    id_detalle_origen INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    importe DECIMAL(14,2) NOT NULL,

    CONSTRAINT fk_fact_cliente
        FOREIGN KEY (sk_cliente) REFERENCES dbo.DIM_CLIENTE(sk_cliente),
    CONSTRAINT fk_fact_producto
        FOREIGN KEY (sk_producto) REFERENCES dbo.DIM_PRODUCTO(sk_producto),
    CONSTRAINT fk_fact_tiempo
        FOREIGN KEY (sk_tiempo) REFERENCES dbo.DIM_TIEMPO(sk_tiempo),

    CONSTRAINT ck_fact_cantidad CHECK (cantidad > 0),
    CONSTRAINT ck_fact_precio CHECK (precio_unitario >= 0),
    CONSTRAINT ck_fact_importe CHECK (importe >= 0),
    CONSTRAINT uq_fact_detalle_origen UNIQUE (id_detalle_origen)
);
GO

CREATE INDEX ix_fact_cliente ON dbo.FACT_VENTAS(sk_cliente);
CREATE INDEX ix_fact_producto ON dbo.FACT_VENTAS(sk_producto);
CREATE INDEX ix_fact_tiempo ON dbo.FACT_VENTAS(sk_tiempo);
GO

/*
 Granularidad:
 Una fila de FACT_VENTAS representa una línea de producto asociada
 a una venta, realizada por un cliente en una fecha determinada.

 Medida derivada:
 importe = cantidad * precio_unitario
*/
