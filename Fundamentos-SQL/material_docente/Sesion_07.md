# Sesión 7

# Del modelo relacional al Data Warehouse

**Asignatura:** Fundamentos de Ingeniería de Datos y SQL
**Duración:** 3 horas
**Modalidad:** Online sincrónica
**Entorno práctico:** Oracle APEX + herramienta de diagramación
**RAA dominante:** RAA3

## Objetivo de aprendizaje

Diseñar un modelo dimensional a partir de una base de datos operacional, identificando procesos de negocio, hechos, dimensiones, medidas y granularidad, y aplicando los principios fundamentales de un esquema estrella orientado al análisis.

## Descripción de la jornada

Durante las primeras seis sesiones los estudiantes construyeron y utilizaron una base de datos relacional destinada a registrar clientes, productos y ventas.

Mediante SQL fue posible consultar las transacciones, relacionar tablas y generar indicadores comerciales.

En esta sesión se planteará una nueva necesidad: **analizar el comportamiento histórico del negocio de manera eficiente y desde diferentes perspectivas**.

A partir de esta problemática se introducirán los fundamentos de Data Warehouse y modelamiento dimensional. Los estudiantes transformarán conceptualmente el modelo operacional utilizado durante el curso en un modelo analítico compuesto por una tabla de hechos y diferentes dimensiones.

El foco no estará en memorizar definiciones, sino en comprender **por qué una estructura diseñada para registrar transacciones no necesariamente es la estructura más apropiada para analizarlas**.

# Agenda

| Bloque                    |      Tiempo | Actividad                                                                        |
| ------------------------- | ----------: | -------------------------------------------------------------------------------- |
| Exposición y demostración |  **45 min** | OLTP vs DW, hechos, dimensiones, medidas, granularidad, estrella y copo de nieve |
| Break                     |  **15 min** | Descanso                                                                         |
| Taller práctico           | **120 min** | Transformación del modelo comercial en modelo dimensional                        |
| Cierre                    |  **15 min** | Validación del modelo y preparación del ETL                                      |

# Bloque 1 — Exposición y demostración

## 19:15–20:00

## 1. Nuestro modelo funciona

Comenzar recuperando el sistema construido:

```text
CLIENTES
   │
   ▼
VENTAS
   │
   ▼
DETALLE_VENTAS
   │
   ▼
PRODUCTOS
```

Podemos:

* registrar clientes;
* registrar productos;
* almacenar ventas;
* consultar transacciones;
* construir indicadores.

Por tanto:

> **¿Qué problema tenemos?**

En principio, ninguno.

El modelo funciona correctamente para el propósito para el cual fue diseñado.

Y ese punto es fundamental.

**No introducimos Data Warehouse porque el modelo relacional esté "mal".**

Introducimos Data Warehouse porque aparece **otro propósito**.

---

# 2. Operar y analizar no son exactamente lo mismo

Nuestro sistema responde muy bien preguntas operacionales:

> ¿Qué compró el cliente 15?

> ¿Qué productos pertenecen a la venta 203?

> ¿Cuál es el stock actual del producto 8?

Pero imaginemos que la empresa crece.

Ahora la gerencia solicita:

> ¿Cómo han evolucionado las ventas durante los últimos cinco años?

> ¿Qué categorías crecen más?

> ¿Qué meses presentan mayores ingresos?

> ¿Qué ciudades concentran nuestras ventas?

> ¿Cómo se comportan las categorías por período y ubicación?

La necesidad ha cambiado.

Visualmente:

```text
SISTEMA OPERACIONAL
Registrar lo que ocurre
        ↓
CLIENTES
PRODUCTOS
VENTAS
DETALLE
```

frente a:

```text
SISTEMA ANALÍTICO
Comprender lo que ocurrió
        ↓
Tiempo
Cliente
Producto
Ubicación
Ventas
```

---

# 3. OLTP y Data Warehouse

Introducir una comparación simple.

| Base operacional                 | Data Warehouse           |
| -------------------------------- | ------------------------ |
| Orientada a transacciones        | Orientado al análisis    |
| Estado actual                    | Información histórica    |
| Muchas operaciones INSERT/UPDATE | Principalmente consultas |
| Modelo normalizado               | Modelo dimensional       |
| Procesos operacionales           | Toma de decisiones       |
| Consultas específicas            | Análisis agregado        |

Una precisión importante:

> **Un Data Warehouse no reemplaza necesariamente la base operacional.**

Ambos cumplen funciones distintas.

La antigua sesión ya establecía esta diferencia al contrastar preguntas como "¿cuál es la nota de este estudiante?" frente a "¿cómo ha evolucionado el rendimiento durante los últimos cinco años?".  Ahora utilizamos esa misma lógica sobre nuestro caso comercial.

---

# 4. Del modelo relacional al modelo dimensional

Presentar el cambio:

### Modelo operacional

```text
CLIENTES
VENTAS
DETALLE_VENTAS
PRODUCTOS
```

### Modelo dimensional

```text
                DIM_TIEMPO
                    │
                    │
DIM_CLIENTE ─── FACT_VENTAS ─── DIM_PRODUCTO
```

Esta imagen conceptual debe ser uno de los momentos centrales de la sesión.

No estamos simplemente cambiando nombres.

Estamos **reorganizando los datos según las preguntas que queremos responder**.

---

# 5. ¿Qué es un hecho?

Preguntar:

> ¿Qué evento del negocio queremos analizar?

Respuesta:

**La venta.**

Más específicamente, podríamos analizar cada producto contenido en una venta.

La tabla central podría ser:

```text
FACT_VENTAS
```

Contendrá las observaciones cuantificables del proceso.

Por ejemplo:

```text
cantidad
precio_unitario
importe
```

Introducir entonces:

> **Un hecho representa un evento medible del negocio.**

---

# 6. ¿Qué es una medida?

Preguntar:

> ¿Qué podemos medir sobre las ventas?

Por ejemplo:

```text
cantidad
importe
```

Podemos calcular:

```text
importe = cantidad × precio_unitario
```

Estas medidas posteriormente permitirán:

```text
SUM(importe)
SUM(cantidad)
AVG(importe)
```

Conectar directamente con S5.

Lo que antes eran agregaciones SQL ahora comienza a formar parte del **diseño analítico**.

---

# 7. ¿Qué es una dimensión?

Ahora:

> ¿Desde qué perspectivas queremos analizar las ventas?

Podemos preguntar:

**¿Cuándo?**

```text
DIM_TIEMPO
```

**¿Quién compró?**

```text
DIM_CLIENTE
```

**¿Qué compró?**

```text
DIM_PRODUCTO
```

Conceptualmente:

```text
                 TIEMPO
                   │
                   │
CLIENTE ─────── VENTA ─────── PRODUCTO
```

Introducir:

> **Las dimensiones describen el contexto desde el cual analizamos los hechos.**

---

# 8. Granularidad

Este concepto merece atención especial.

Preguntar:

> ¿Qué representa exactamente una fila de `FACT_VENTAS`?

Podría ser:

**una venta completa**

o:

**un producto dentro de una venta.**

No es lo mismo.

Para nuestro proyecto estableceremos:

> **Una fila de FACT_VENTAS representa un producto incluido en una venta determinada.**

Por tanto, el grano corresponde esencialmente al antiguo:

```text
DETALLE_VENTAS
```

enriquecido con las dimensiones necesarias.

Esta decisión permitirá analizar:

* productos;
* categorías;
* clientes;
* fechas;
* unidades;
* ingresos.

Introducir una regla:

> **Antes de diseñar una tabla de hechos debemos definir su granularidad.**

---

# 9. Esquema estrella

Nuestro primer diseño:

```text
                    DIM_TIEMPO
                         │
                         │
                         ▼
DIM_CLIENTE ─────── FACT_VENTAS ─────── DIM_PRODUCTO
```

### FACT_VENTAS

```text
id_tiempo
id_cliente
id_producto
id_venta
cantidad
precio_unitario
importe
```

### DIM_TIEMPO

```text
id_tiempo
fecha
dia
mes
nombre_mes
trimestre
anio
```

### DIM_CLIENTE

```text
id_cliente
nombre
ciudad
```

### DIM_PRODUCTO

```text
id_producto
nombre_producto
categoria
```

No necesitamos complicarlo todavía.

---

# 10. ¿Por qué DIM_TIEMPO?

Esta dimensión merece una explicación explícita porque no existía como tabla en nuestro modelo operacional.

En `VENTAS` teníamos:

```text
fecha_venta
```

Pero analíticamente queremos:

```text
día
mes
trimestre
año
```

Esto permitirá posteriormente preguntas como:

> ¿Cuánto vendimos por mes?

> ¿Qué trimestre tuvo mayores ingresos?

> ¿Cómo evolucionaron las ventas por año?

Aquí los estudiantes empiezan a ver que el modelo dimensional **no es simplemente una copia de las tablas operacionales**.

---

# 11. Estrella vs copo de nieve

Introducir brevemente ambos conceptos porque aparecen explícitamente en el programa.

### Estrella

```text
DIM_CLIENTE
     │
     │
FACT_VENTAS ─── DIM_PRODUCTO
     │
     │
DIM_TIEMPO
```

Dimensiones relativamente desnormalizadas.

### Snowflake

Podríamos separar:

```text
DIM_PRODUCTO
      │
DIM_CATEGORIA
```

o:

```text
DIM_CLIENTE
      │
DIM_CIUDAD
```

La estructura se normaliza parcialmente.

Comparación muy breve:

| Estrella               | Snowflake         |
| ---------------------- | ----------------- |
| Más simple             | Más normalizado   |
| Menos JOIN             | Más relaciones    |
| Fácil para análisis    | Mayor complejidad |
| Dimensiones más anchas | Menor redundancia |

Para nuestro proyecto:

> **Utilizaremos esquema estrella.**

No necesitamos convertir esta parte en una discusión arquitectónica extensa.

# Break

## 20:00–20:15

# Taller práctico

## 20:15–22:15

La práctica de S7 debe ser principalmente **diseño y razonamiento**, no programación.

## Etapa 1 — Cambiar la pregunta

### 15 minutos

Entregar requerimientos:

> La gerencia necesita analizar las ventas históricas por año, trimestre y mes.

> Necesita comparar ingresos entre categorías de productos.

> Necesita determinar qué clientes generan mayores ingresos.

> Necesita analizar ventas según ciudad del cliente.

Los estudiantes deberán identificar:

**¿Qué queremos medir?**

y:

**¿Desde qué perspectivas queremos analizarlo?**

---

# Etapa 2 — Identificar el proceso de negocio

### 15 minutos

Pregunta:

> ¿Cuál es el proceso que estamos analizando?

Respuesta esperada:

```text
VENTAS
```

Luego:

> ¿Qué evento concreto registrará una fila de nuestra tabla de hechos?

Aquí deben llegar a:

```text
un producto vendido dentro de una venta
```

---

# Etapa 3 — Definir la granularidad

### 15 minutos

Cada grupo deberá redactar una frase:

> **Una fila de FACT_VENTAS representa...**

Resultado esperado:

> Una línea de producto asociada a una venta, realizada por un cliente en una fecha determinada.

Esta frase debe quedar escrita antes de continuar.

Me parece importante convertir la granularidad en un **artefacto explícito**, no asumir que se comprende.

---

# Etapa 4 — Identificar medidas

### 15 minutos

A partir del modelo operacional:

```text
cantidad
precio_unitario
```

determinar qué medidas requiere el análisis.

Propuesta:

```text
cantidad
precio_unitario
importe
```

Preguntar:

> ¿`nombre_producto` es una medida?

No.

> ¿`categoria` es una medida?

No.

> ¿`importe` es una medida?

Sí.

Así consolidamos la diferencia **medida/dimensión**.

---

# Etapa 5 — Identificar dimensiones

### 20 minutos

Los estudiantes deberán identificar las dimensiones necesarias para responder los requerimientos.

Esperamos:

```text
DIM_TIEMPO
DIM_CLIENTE
DIM_PRODUCTO
```

Luego determinar atributos.

### DIM_TIEMPO

```text
fecha
dia
mes
nombre_mes
trimestre
anio
```

### DIM_CLIENTE

```text
nombre
ciudad
```

### DIM_PRODUCTO

```text
nombre_producto
categoria
```

---

# Etapa 6 — Construcción del modelo estrella

### 20 minutos

Cada grupo construye gráficamente:

```text
                    DIM_TIEMPO
                         │
                         │
                         ▼
DIM_CLIENTE ─────── FACT_VENTAS ─────── DIM_PRODUCTO
```

Indicando:

* claves;
* atributos;
* medidas;
* relaciones.

El resultado debe ser un **modelo dimensional completo**, no solamente cajas con nombres.

---

# Etapa 7 — Validación mediante preguntas

### 10 minutos

Ahora probamos el modelo.

### Pregunta 1

> ¿Podemos calcular ingresos por año?

Necesitamos:

```text
FACT_VENTAS + DIM_TIEMPO
```

### Pregunta 2

> ¿Podemos calcular ingresos por categoría?

```text
FACT_VENTAS + DIM_PRODUCTO
```

### Pregunta 3

> ¿Podemos calcular ingresos por ciudad?

```text
FACT_VENTAS + DIM_CLIENTE
```

### Pregunta 4

> ¿Podemos analizar categoría por mes?

```text
FACT_VENTAS
+
DIM_PRODUCTO
+
DIM_TIEMPO
```

Si el modelo no puede responder alguna pregunta requerida, debemos revisar el diseño.

---

# Etapa 8 — Estrella vs snowflake

### 10 minutos

Solicitar una modificación conceptual:

Separar:

```text
categoria
```

desde `DIM_PRODUCTO` hacia:

```text
DIM_CATEGORIA
```

Ahora comparar ambos diseños.

Preguntar:

> ¿Cuál utilizarían para nuestro caso y por qué?

La respuesta esperada no necesita ser absoluta.

Queremos que puedan argumentar la decisión.

# Desafío final

### 15 minutos

Entregar un nuevo requerimiento:

> **La gerencia informa que próximamente abrirá varias sucursales y necesitará comparar ventas por sucursal, ciudad y región.**

Pregunta:

> ¿Nuestro modelo actual puede responder completamente ese requerimiento?

No.

Entonces:

> ¿Cómo modificarían el modelo dimensional?

Esperamos que propongan algo parecido a:

```text
DIM_SUCURSAL
```

con atributos como:

```text
sucursal
ciudad
region
```

Esto permite comprobar si realmente comprendieron la lógica dimensional o simplemente reprodujeron el ejemplo.

# Producto de la sesión

El producto será:

**`06_modelo_dimensional`**

compuesto por:

1. definición del proceso de negocio;
2. declaración explícita de granularidad;
3. identificación de medidas;
4. identificación de dimensiones;
5. modelo estrella;
6. breve justificación de las decisiones de diseño.

Así nuestro portafolio comienza a cambiar:

```text
01_modelo_comercial.sql
02_crud_comercial.sql
03_consultas_join.sql
04_indicadores_comerciales.sql
05_consultas_aplicadas.sql

            ↓

06_modelo_dimensional
```

Ya no estamos solamente escribiendo consultas. Estamos **diseñando arquitectura de datos**.

# Cierre

## 22:15–22:30

### Modelo operacional

```text
CLIENTES
VENTAS
DETALLE_VENTAS
PRODUCTOS
```

Diseñado fundamentalmente para:

**registrar transacciones.**

### Modelo dimensional

```text
                 DIM_TIEMPO
                      │
                      ▼
DIM_CLIENTE ─── FACT_VENTAS ─── DIM_PRODUCTO
```

Diseñado fundamentalmente para:

**analizar el negocio.**

## Puente hacia S8

> Tenemos la base operacional en un lado y acabamos de diseñar nuestro Data Warehouse en otro.

```text
BASE OPERACIONAL                 DATA WAREHOUSE

CLIENTES                         DIM_CLIENTE
PRODUCTOS                        DIM_PRODUCTO
VENTAS             ???           DIM_TIEMPO
DETALLE_VENTAS                   FACT_VENTAS
```

> **¿Cómo llevamos los datos desde un modelo hasta el otro?**

# Sesión 8 — ETL y construcción del Data Warehouse

