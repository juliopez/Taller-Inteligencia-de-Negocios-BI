# Caso transversal

## Comercial NovaMarket

### 1. Contexto organizacional

**NovaMarket** es una empresa ficticia dedicada a la comercialización de productos de consumo mediante distintos puntos de venta. Su catálogo incluye productos pertenecientes a diversas categorías y atiende regularmente a clientes provenientes de diferentes ciudades.

Durante sus primeros años de operación, la empresa concentró sus esfuerzos en registrar las transacciones comerciales necesarias para mantener el funcionamiento cotidiano del negocio. Sin embargo, el crecimiento sostenido de sus operaciones ha generado un volumen cada vez mayor de información relacionada con clientes, productos y ventas.

Actualmente, la organización necesita mejorar la forma en que sus datos son estructurados, almacenados y utilizados.

La gerencia considera que la información generada durante las operaciones comerciales constituye un activo relevante para comprender el comportamiento del negocio y apoyar sus procesos de toma de decisiones.

---

# 2. Situación actual

NovaMarket registra información relacionada con sus clientes, los productos disponibles y las ventas realizadas.

Cada cliente puede efectuar diferentes compras a lo largo del tiempo. Una compra puede contener uno o varios productos y cada producto puede participar en numerosas transacciones.

Además de registrar las operaciones, la empresa necesita conservar información suficiente para conocer qué productos fueron adquiridos, las cantidades involucradas, el precio aplicado al momento de la transacción y la fecha en que esta ocurrió.

Hasta ahora, la organización se ha concentrado principalmente en **registrar lo que ocurre**.

El crecimiento del negocio plantea una nueva necesidad:

> **utilizar los datos acumulados para comprender qué está ocurriendo y apoyar la toma de decisiones.**

---

# 3. Problemática

La información comercial de NovaMarket debe permitir responder tanto necesidades operacionales como requerimientos analíticos.

Desde una perspectiva operacional, la empresa necesita consultar información como:

* clientes registrados;
* productos disponibles;
* características y precios de los productos;
* ventas realizadas;
* productos incluidos en cada venta;
* cantidades comercializadas;
* precios aplicados en cada transacción.

Sin embargo, la gerencia también necesita responder preguntas de mayor nivel analítico.

Por ejemplo:

* ¿qué productos generan mayores ingresos?;
* ¿qué productos presentan mayor demanda?;
* ¿qué categorías concentran las ventas?;
* ¿qué clientes generan mayores ingresos?;
* ¿existen clientes registrados que no hayan realizado compras?;
* ¿existen productos que nunca hayan sido vendidos?;
* ¿cómo evolucionan las ventas a través del tiempo?;
* ¿qué meses o períodos presentan mayor actividad comercial?;
* ¿cómo se distribuyen las ventas entre diferentes ciudades?;
* ¿cómo cambia el comportamiento de las categorías de productos a través del tiempo?

Responder estas preguntas requiere evolucionar progresivamente desde el **registro de datos** hacia su **integración y análisis**.

---

# 4. Desafío de ingeniería de datos

NovaMarket ha decidido desarrollar una solución que permita organizar y explotar adecuadamente la información generada por sus operaciones.

La solución deberá evolucionar progresivamente a través de diferentes etapas.

```text
PROBLEMA DE NEGOCIO
        │
        ▼
ORGANIZACIÓN DE LOS DATOS
        │
        ▼
ALMACENAMIENTO
        │
        ▼
CONSULTA E INTEGRACIÓN
        │
        ▼
ANÁLISIS
        │
        ▼
INTEGRACIÓN Y TRANSFORMACIÓN
        │
        ▼
ALMACENAMIENTO ANALÍTICO
        │
        ▼
ANÁLISIS MULTIDIMENSIONAL
        │
        ▼
INFORMACIÓN PARA LA TOMA DE DECISIONES
```

El desafío no consiste únicamente en almacenar información.

La organización necesita construir una solución que permita que los datos sean:

**estructurados → relacionados → consultados → transformados → integrados → analizados.**

---

# 5. Primera necesidad: estructurar la información

La primera etapa del proyecto consiste en representar adecuadamente la operación comercial de NovaMarket.

La organización necesita registrar, como mínimo, información relacionada con:

### Clientes

Debe ser posible identificar a cada cliente y almacenar información básica que permita caracterizarlo.

### Productos

Cada producto debe encontrarse identificado y asociado con información comercial relevante, como su categoría, precio y disponibilidad.

### Ventas

Cada operación comercial debe quedar registrada, incluyendo el cliente que realizó la compra y el momento en que ocurrió.

### Productos incluidos en una venta

Una misma venta puede contener diferentes productos y distintas cantidades de cada uno.

Además, debe conservarse el **precio aplicado al producto en el momento de la venta**, ya que el precio actual de un producto puede cambiar posteriormente.

Este último requerimiento será importante para preservar correctamente la información histórica.

---

# 6. Reglas del negocio

La solución deberá respetar, al menos, las siguientes reglas:

1. Cada cliente debe poder identificarse de manera única.
2. Cada producto debe poder identificarse de manera única.
3. Un cliente puede realizar múltiples ventas a lo largo del tiempo.
4. Cada venta corresponde a un único cliente.
5. Una venta puede incluir uno o varios productos.
6. Un producto puede aparecer en múltiples ventas.
7. Para cada producto incluido en una venta debe registrarse la cantidad adquirida.
8. Debe conservarse el precio unitario aplicado al momento de realizar la venta.
9. Cada venta debe registrar la fecha en que ocurrió.
10. La información almacenada debe permitir reconstruir posteriormente una transacción completa.

La solución deberá permitir responder, por ejemplo:

> **¿Quién compró qué producto, cuándo lo compró, qué cantidad adquirió y a qué precio?**

---

# 7. Segunda necesidad: analizar la información

Una vez organizada la información operacional, NovaMarket necesita comenzar a utilizarla para comprender el comportamiento del negocio.

La gerencia solicita indicadores relacionados con:

### Clientes

* número de compras;
* unidades adquiridas;
* monto total comprado;
* clientes con mayor actividad comercial.

### Productos

* unidades vendidas;
* ingresos generados;
* productos con mayor y menor demanda;
* productos sin ventas.

### Categorías

* cantidad de productos vendidos;
* ingresos generados;
* participación en las ventas;
* comparación entre categorías.

### Tiempo

* ventas por período;
* evolución de los ingresos;
* identificación de períodos de mayor actividad;
* comparación temporal del comportamiento comercial.

Esto implica pasar progresivamente desde consultas sobre registros individuales hacia la construcción de **indicadores y análisis agregados**.

---

# 8. Tercera necesidad: análisis histórico

A medida que NovaMarket continúa creciendo, las consultas realizadas directamente sobre el sistema operacional comienzan a resultar insuficientes para las nuevas necesidades de análisis.

La organización desea conservar y analizar información histórica desde distintas perspectivas.

Por ejemplo:

> ¿Cómo han evolucionado los ingresos durante los últimos años?

> ¿Qué categorías han aumentado o disminuido su participación?

> ¿Qué períodos concentran las mayores ventas?

> ¿Cómo se comportan los diferentes productos a través del tiempo?

> ¿Qué clientes o ciudades presentan mayor contribución a los ingresos?

La empresa necesita, por tanto, diferenciar progresivamente dos propósitos:

```text
OPERACIÓN                         ANÁLISIS

¿Qué ocurrió?                    ¿Cómo evoluciona?
¿Qué compró un cliente?          ¿Qué clientes compran más?
¿Cuál es el stock actual?        ¿Qué productos tienen mayor demanda?
¿Qué contiene una venta?         ¿Qué categorías generan más ingresos?
```

Esta necesidad dará origen posteriormente a una arquitectura específicamente orientada al análisis.

---

# 9. Calidad e integración de los datos

El crecimiento de NovaMarket también ha generado algunos problemas habituales de calidad.

Por ejemplo, información equivalente podría aparecer registrada de distintas maneras:

```text
Tecnología
tecnologia
TECNOLOGÍA
```

o:

```text
Valparaíso
VALPARAISO
Valparaiso
```

También pueden existir:

* espacios innecesarios;
* valores incompletos;
* diferencias de formato;
* registros que requieren estandarización;
* información derivada que debe calcularse antes del análisis.

La organización necesita asegurar que los datos utilizados para análisis sean **consistentes, comprensibles y confiables**.

Por tanto, la solución deberá considerar mecanismos de extracción, transformación, validación e integración de información.

---

# 10. Necesidad analítica final

La gerencia espera disponer de una estructura que permita analizar el desempeño comercial utilizando distintas perspectivas simultáneamente.

Por ejemplo:

```text
                 TIEMPO
                    │
                    │
CLIENTE ──────── VENTAS ──────── PRODUCTO
                    │
                    │
                 UBICACIÓN
```

La organización debería poder explorar preguntas como:

> ¿Cuánto vendimos?

> ¿Cuándo?

> ¿Qué productos?

> ¿A qué clientes?

> ¿En qué categorías?

> ¿Desde qué ciudades?

y combinar estas perspectivas para construir nuevos análisis.

---

# 11. Escenario de crecimiento

NovaMarket espera continuar expandiendo sus operaciones.

Entre las posibilidades futuras se encuentra la apertura de diferentes sucursales en distintas ciudades y regiones.

Si esto ocurre, la organización necesitará incorporar nuevas perspectivas de análisis, tales como:

* sucursal;
* ciudad;
* región;
* desempeño territorial.

Por esta razón, la solución desarrollada debe permitir comprender que una arquitectura de datos **evoluciona conforme aparecen nuevos requerimientos del negocio**.

---

# 12. Pregunta central del proyecto


> **¿Cómo podemos transformar los datos generados por las operaciones comerciales de NovaMarket en información estructurada, confiable y útil para apoyar la toma de decisiones?**

Durante el proyecto, esta pregunta será abordada progresivamente desde diferentes perspectivas de la ingeniería de datos.

---

# 13. Resultado esperado

Al finalizar el proyecto, NovaMarket deberá disponer conceptualmente de un flujo capaz de transformar sus operaciones comerciales en información analítica:

```text
OPERACIONES COMERCIALES
          │
          ▼
   DATOS ESTRUCTURADOS
          │
          ▼
   BASE OPERACIONAL
          │
          ▼
    CONSULTAS SQL
          │
          ▼
     INDICADORES
          │
          ▼
INTEGRACIÓN Y TRANSFORMACIÓN
          │
          ▼
ALMACENAMIENTO ANALÍTICO
          │
          ▼
ANÁLISIS MULTIDIMENSIONAL
          │
          ▼
   TOMA DE DECISIONES
```

---


