# Evaluación Aplicada

## Fundamentos de Ingeniería de Datos y SQL

## Contexto del caso

Un supermercado necesita organizar mejor la información de sus ventas para comenzar a analizar sus datos de manera más estructurada.

Actualmente registra información sobre clientes, productos, ventas y detalle de ventas, pero requiere implementar una pequeña base de datos relacional que permita consultar información relevante para la gestión del negocio.

Usted deberá crear el modelo en Oracle APEX, cargar datos de prueba y desarrollar consultas SQL que permitan responder preguntas básicas de análisis.

---

# Modelo de datos requerido

## CLIENTES

| Campo          | Tipo          | Descripción                     |
| -------------- | ------------- | ------------------------------- |
| id_cliente     | NUMBER        | Identificador único del cliente |
| nombre_cliente | VARCHAR2(100) | Nombre del cliente              |
| ciudad         | VARCHAR2(100) | Ciudad del cliente              |
| telefono       | VARCHAR2(20)  | Teléfono de contacto            |

## PRODUCTOS

| Campo           | Tipo          | Descripción                      |
| --------------- | ------------- | -------------------------------- |
| id_producto     | NUMBER        | Identificador único del producto |
| nombre_producto | VARCHAR2(100) | Nombre del producto              |
| categoria       | VARCHAR2(50)  | Categoría del producto           |
| precio          | NUMBER(10,2)  | Precio unitario                  |
| stock           | NUMBER        | Stock disponible                 |

## VENTAS

| Campo       | Tipo   | Descripción                     |
| ----------- | ------ | ------------------------------- |
| id_venta    | NUMBER | Identificador único de la venta |
| fecha_venta | DATE   | Fecha de la venta               |
| id_cliente  | NUMBER | Cliente asociado a la venta     |

## DETALLE_VENTAS

| Campo       | Tipo   | Descripción                     |
| ----------- | ------ | ------------------------------- |
| id_detalle  | NUMBER | Identificador único del detalle |
| id_venta    | NUMBER | Venta asociada                  |
| id_producto | NUMBER | Producto vendido                |
| cantidad    | NUMBER | Cantidad vendida                |

---

# Relaciones y cardinalidad

* Un cliente puede realizar muchas ventas.
* Una venta pertenece a un solo cliente.
* Una venta puede tener muchos detalles de venta.
* Cada detalle de venta pertenece a una sola venta.
* Un producto puede aparecer en muchos detalles de venta.
* Cada detalle de venta corresponde a un solo producto.

<img src=IMG-1.png width=800>

---

# Actividades solicitadas

## Parte 1 — Creación del modelo

Crear en Oracle APEX las cuatro tablas del modelo:

* CLIENTES
* PRODUCTOS
* VENTAS
* DETALLE_VENTAS

Cada tabla debe incluir:

* clave primaria;
* claves foráneas cuando corresponda;
* tipos de datos adecuados;
* restricciones básicas necesarias.

---

## Parte 2 — Carga de datos

Insertar datos de prueba suficientes para ejecutar las consultas.

Como mínimo, debe ingresar:

* 5 clientes;
* 8 productos;
* 6 ventas;
* 12 registros en detalle_ventas.

---

# Parte 3 — Consultas SQL solicitadas

## Consulta 1 — SELECT básico

Mostrar todos los productos registrados, incluyendo:

* id_producto;
* nombre_producto;
* categoría;
* precio;
* stock.

---

## Consulta 2 — SELECT con JOIN

Mostrar las ventas realizadas junto con el nombre del cliente.

Debe incluir:

* id_venta;
* fecha_venta;
* nombre_cliente;
* ciudad.

Debe utilizar:

* SELECT;
* INNER JOIN;
* alias.

---

## Consulta 3 — SELECT avanzado con agregación

Mostrar el total vendido por producto.

Debe incluir:

* nombre_producto;
* categoría;
* cantidad total vendida.

Debe utilizar:

* INNER JOIN;
* SUM();
* GROUP BY;
* ORDER BY.

---

## Consulta 4 — UPDATE

Actualizar el precio de un producto específico.

El script debe mostrar claramente:

* el producto antes de la actualización;
* la sentencia UPDATE;
* el producto después de la actualización.

---

## Consulta 5 — DELETE

Eliminar un registro específico de la tabla DETALLE_VENTAS.

El script debe mostrar claramente:

* el registro antes de eliminarlo;
* la sentencia DELETE;
* la verificación posterior.

---

# Entregables

El estudiante deberá entregar dos archivos:

## Archivo 1 — Script SQL

Nombre sugerido:

```text
apellido_nombre_script.sql
```

Debe incluir:

* creación de tablas;
* inserción de datos;
* las cinco consultas solicitadas;
* UPDATE;
* DELETE.

## Archivo 2 — Informe breve

Nombre sugerido:

```text
apellido_nombre_informe.pdf
```

Extensión máxima: 3 páginas.

Debe incluir:

1. Breve descripción del modelo creado.
2. Imagen o captura del modelo en Oracle APEX.
3. Capturas o resultados de las consultas.
4. Breve interpretación de los resultados obtenidos.

---

# Criterios de evaluación

| Criterio                                      | Ponderación |
| --------------------------------------------- | ----------: |
| Diseño e implementación del modelo relacional |         25% |
| Carga de datos y consistencia del script      |         20% |
| Consultas SQL solicitadas                     |         35% |
| Informe breve e interpretación de resultados  |         20% |
| **Total**                                     |    **100%** |

---

# Rúbrica de Evaluación

## Evaluación Aplicada – Fundamentos de Ingeniería de Datos y SQL

| Criterio                                          | Excelente (5)                                                                                                                                               | Adecuado (4)                                                                                                                              | Básico (2)                                                                                                                      | Insuficiente (0)                                                                     | Pond. |
| ------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ | ----: |
| **Diseño e implementación del modelo relacional** | Implementa correctamente las cuatro tablas, claves primarias, claves foráneas, tipos de datos y relaciones definidas. El modelo funciona sin errores.       | Implementa la mayor parte del modelo correctamente, presentando errores menores que no afectan significativamente su funcionamiento.      | El modelo presenta errores relevantes en relaciones, claves o estructura, afectando parcialmente su funcionamiento.             | El modelo no se implementa o presenta errores graves que impiden su utilización.     |   25% |
| **Carga de datos y consistencia del script**      | Inserta correctamente todos los datos solicitados, respetando integridad referencial y estructura del modelo. El script ejecuta sin errores.                | Inserta la mayoría de los datos requeridos. Presenta pequeños problemas de consistencia o ejecución.                                      | La carga de datos es incompleta o presenta errores que afectan parcialmente las consultas posteriores.                          | No carga los datos requeridos o el script presenta errores que impiden su ejecución. |   20% |
| **Consultas SQL solicitadas**                     | Las cinco consultas son correctas, utilizan adecuadamente SELECT, JOIN, agregaciones, GROUP BY, ORDER BY, UPDATE y DELETE, obteniendo resultados correctos. | La mayoría de las consultas son correctas. Existen errores menores de sintaxis o lógica que no afectan significativamente los resultados. | Varias consultas presentan errores de construcción o resultados incorrectos, evidenciando comprensión parcial de los conceptos. | Las consultas no funcionan o no evidencian dominio de los contenidos trabajados.     |   35% |
| **Informe e interpretación de resultados**        | Presenta un informe claro, ordenado y completo. Incluye modelo, evidencias de ejecución, resultados e interpretación pertinente de la información obtenida. | Presenta un informe adecuado con la mayoría de los elementos solicitados y una interpretación básica de los resultados.                   | El informe es incompleto o presenta escasa interpretación de los resultados obtenidos.                                          | No entrega informe o este carece de los elementos mínimos solicitados.               |   20% |

## Escala de evaluación

* **Excelente:** 5 puntos
* **Adecuado:** 4 puntos
* **Básico:** 2 puntos
* **Insuficiente:** 0 puntos

## Cálculo del porcentaje de logro

Para cada criterio:

```text
(Puntaje obtenido / 5) × Ponderación
```

El porcentaje de logro final corresponde a la suma de los porcentajes obtenidos en cada criterio.

La nota final se calculará utilizando la escala institucional de 1,0 a 7,0 con exigencia del 60%.

---

# Recomendaciones

* Ejecutar el script por partes.
* Verificar primero la creación de tablas.
* Insertar datos respetando las claves foráneas.
* Probar cada consulta individualmente.
* Utilizar alias para mejorar la lectura de las consultas.
* Revisar que UPDATE y DELETE afecten solo los registros solicitados.

---

# Resultado esperado

Al finalizar la evaluación, el estudiante habrá implementado un pequeño modelo relacional en Oracle APEX y habrá desarrollado consultas SQL orientadas a la gestión básica de ventas de un supermercado.

La actividad permite evidenciar el uso integrado de:

* modelamiento relacional;
* claves primarias y foráneas;
* CRUD;
* SELECT;
* JOIN;
* funciones de agregación;
* GROUP BY;
* ORDER BY;
* interpretación básica de resultados.

