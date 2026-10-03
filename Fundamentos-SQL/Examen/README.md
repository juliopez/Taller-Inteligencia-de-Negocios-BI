# EXAMEN FINAL  
## Fundamentos de Ingeniería de Datos y SQL

**Programa:** Diplomado en Ingeniería de Datos con Python  
**Asignatura:** Fundamentos de Ingeniería de Datos y SQL  
**Código:** DPL1036  
**Tipo de evaluación:** Examen final – Proyecto  
**Ponderación:** 100%  
**Modalidad de entrega:** Individual  
**Formato de entrega:** Un archivo PDF  

---

# 1. Propósito de la evaluación

La presente evaluación tiene como propósito integrar los aprendizajes desarrollados durante la asignatura mediante la resolución de un caso aplicado de gestión de datos.

A partir del caso de estudio **“Gestión de mantenimiento de una flota de vehículos”**, deberá diseñar e implementar una solución que considere el modelamiento relacional de los datos, su implementación mediante SQL, operaciones CRUD, consultas orientadas a responder preguntas de negocio y el diseño de un modelo dimensional para el análisis de la información.

La evaluación se organiza en cinco partes:

| Parte | Evidencia | Ponderación |
|---|---|---:|
| 1. Modelamiento relacional | Diagrama Entidad-Relación | 20% |
| 2. Implementación | `CREATE TABLE` + carga de datos | 20% |
| 3. CRUD | `INSERT`, `SELECT`, `UPDATE`, `DELETE` | 15% |
| 4. Consultas SQL | Dos consultas orientadas al negocio | 25% |
| 5. Modelamiento dimensional | Modelo estrella o copo de nieve | 20% |
| **Total** | | **100%** |

---

# 2. Instrucciones generales

La evaluación deberá entregarse en **un único archivo PDF**, organizado de acuerdo con la numeración de las cinco preguntas.

El documento deberá incorporar:

1. El **Diagrama Entidad-Relación (DER)** correspondiente al caso.
2. Las instrucciones SQL utilizadas para la creación de las tablas y la carga de los datos necesarios.
3. Las instrucciones SQL correspondientes a las operaciones CRUD solicitadas.
4. Las dos consultas SQL requeridas para responder las preguntas de negocio.
5. El **diagrama del modelo dimensional**, utilizando un esquema estrella o copo de nieve, acompañado de la identificación de su granularidad y principales medidas.

Los diagramas deberán ser legibles e incorporarse directamente en el documento. El código SQL deberá presentarse como texto y no exclusivamente mediante capturas de pantalla.

## Datos para el desarrollo

No se establece una cantidad fija de registros que deban ser incorporados en cada tabla. Cada estudiante deberá generar una cantidad **acotada pero suficiente de datos**, mediante instrucciones `INSERT`, que permita ejecutar las operaciones y consultas solicitadas.

Los datos deberán ser coherentes con las reglas de negocio del caso y permitir obtener resultados significativos en las consultas desarrolladas.

Por lo tanto, antes de definir los datos de prueba, se recomienda revisar la totalidad de las preguntas de la evaluación, especialmente las consultas solicitadas.

**Una mayor cantidad de registros no implica una mejor evaluación.** Se considerará su pertinencia, coherencia y suficiencia para demostrar el funcionamiento de la solución propuesta.

## Consideraciones generales

Cuando algún aspecto del caso no se encuentre definido explícitamente, podrá adoptar decisiones de diseño razonables, siempre que sean coherentes con las reglas de negocio planteadas y se mantengan consistentemente durante el desarrollo.

Las respuestas deberán corresponder al modelo propuesto por el propio estudiante. Por tanto, deberá existir consistencia entre el DER, las tablas implementadas, los datos ingresados, las consultas SQL y el posterior modelo dimensional.

---

# 3. Caso de estudio  
## Gestión de mantenimiento de una flota de vehículos

Una organización dispone de una flota de vehículos que utiliza diariamente para apoyar sus distintas actividades operacionales. Debido al uso permanente de estos vehículos, la organización necesita registrar y controlar los mantenimientos que se realizan sobre ellos.

Actualmente, la información relacionada con los vehículos y sus mantenimientos se encuentra distribuida en diferentes registros, lo que dificulta consultar el historial de intervenciones, identificar los servicios realizados y analizar los costos asociados al mantenimiento de la flota.

De cada **vehículo** se requiere mantener información que permita identificarlo y caracterizarlo, considerando al menos su patente, marca, modelo y año.

Los vehículos ingresan periódicamente a **mantenimiento**, ya sea por razones preventivas o correctivas. Para cada mantenimiento se necesita conocer la fecha en que fue realizado, el vehículo intervenido y el técnico responsable del trabajo.

La organización dispone de diferentes **técnicos**, de quienes se requiere registrar información básica de identificación y su especialidad. Un técnico puede ser responsable de múltiples mantenimientos a lo largo del tiempo, mientras que cada mantenimiento queda asignado a un técnico responsable.

Durante un mantenimiento pueden realizarse uno o varios **servicios**, tales como cambio de aceite, revisión de frenos, alineación, diagnóstico electrónico o cambio de neumáticos. Cada tipo de servicio posee una descripción y un valor de referencia.

Un mismo tipo de servicio puede ser realizado en diferentes mantenimientos y, a su vez, un mantenimiento puede incorporar varios servicios. Para cada servicio efectivamente realizado se requiere conservar el costo aplicado en esa intervención, ya que este puede diferir de su valor de referencia.

La organización espera que el sistema permita consultar el historial de mantenimiento de sus vehículos y responder posteriormente preguntas como:

> **¿Qué servicios se han realizado a cada vehículo?**

> **¿Cuál es el costo total acumulado de mantenimiento de cada vehículo?**

Además de apoyar la operación cotidiana, la organización desea utilizar en el futuro la información histórica acumulada para analizar el comportamiento de los mantenimientos desde distintas perspectivas, tales como vehículos, servicios, técnicos y períodos de tiempo.

---

# 4. Preguntas

## Pregunta 1. Modelamiento relacional — 20%

A partir del caso de estudio, diseñe un **Diagrama Entidad-Relación (DER)** que permita representar adecuadamente la información y las reglas de negocio descritas.

Su modelo deberá identificar:

- entidades y sus atributos;
- claves primarias (PK) y claves foráneas (FK);
- relaciones entre las entidades;
- cardinalidades correspondientes.

Cuando sea necesario resolver relaciones de muchos a muchos (N:M), deberá hacerlo mediante una estructura apropiada dentro del modelo relacional.

**Evidencia:** Diagrama Entidad-Relación completo y legible incorporado en el PDF.

---

## Pregunta 2. Implementación del modelo y preparación de datos — 20%

Implemente mediante SQL el modelo relacional desarrollado en la pregunta anterior.

Construya las instrucciones `CREATE TABLE` necesarias, considerando:

- tipos de datos apropiados;
- claves primarias;
- claves foráneas;
- restricciones necesarias para preservar la integridad de los datos.

Posteriormente, incorpore mediante instrucciones `INSERT` los datos necesarios para probar su solución.

**No existe una cantidad mínima fija de registros.** Los datos deberán ser acotados, coherentes con el caso y suficientes para que las operaciones y consultas solicitadas en las preguntas 3 y 4 puedan ejecutarse y producir resultados significativos.

**Evidencia:** Código SQL correspondiente a la creación de las tablas y carga de los datos.

---

## Pregunta 3. Operaciones CRUD — 15%

Utilizando el modelo y los datos implementados, realice las siguientes operaciones sobre **un nuevo vehículo**:

**a)** Incorpore un nuevo vehículo mediante una instrucción `INSERT`.

**b)** Consulte mediante `SELECT` el registro recién incorporado.

**c)** Modifique mediante `UPDATE` uno de sus atributos.

**d)** Elimine posteriormente el registro mediante `DELETE`.

En las operaciones que corresponda, utilice una condición `WHERE` que permita identificar específicamente el registro afectado.

El vehículo utilizado para esta pregunta deberá ser un registro adicional destinado a demostrar las operaciones CRUD. Su posterior eliminación **no deberá afectar los datos necesarios para resolver las consultas de la Pregunta 4**.

**Evidencia:** Las cuatro instrucciones SQL, presentadas en el orden solicitado.

---

## Pregunta 4. Consultas SQL orientadas al negocio — 25%

Utilizando los datos incorporados en su solución, construya las consultas SQL necesarias para responder las siguientes preguntas de negocio.

### a) ¿Qué servicios se han realizado a cada vehículo?

La consulta deberá integrar la información almacenada en las tablas correspondientes mediante operaciones `JOIN` y presentar información que permita identificar tanto el vehículo como los servicios realizados.

### b) ¿Cuál es el costo total acumulado de mantenimiento de cada vehículo?

La consulta deberá integrar las tablas necesarias mediante `JOIN`, utilizar una función de agregación y `GROUP BY`, y presentar los vehículos **ordenados de mayor a menor según su costo total acumulado de mantenimiento**.

**Evidencia:** Código SQL correspondiente a las dos consultas.

---

## Pregunta 5. Modelamiento dimensional — 20%

La organización desea utilizar la información histórica de los mantenimientos para apoyar procesos de análisis y toma de decisiones.

A partir del modelo operacional desarrollado en las preguntas anteriores, diseñe un **modelo dimensional** que permita analizar los mantenimientos realizados desde distintas perspectivas.

Su propuesta deberá:

- definir la **granularidad** del modelo;
- identificar la **tabla de hechos**;
- identificar las **medidas** relevantes;
- identificar las **dimensiones** necesarias para el análisis;
- representar gráficamente las relaciones entre los componentes del modelo.

Puede utilizar un **esquema estrella o copo de nieve**, justificando brevemente las decisiones adoptadas.

**Evidencia:** Diagrama del modelo dimensional y una explicación de **máximo 150 palabras**, indicando la granularidad, las medidas principales y las decisiones fundamentales de diseño.

---

# 5. Rúbrica de evaluación

| Criterio | Logrado | Parcialmente logrado | Inicial | No logrado | Pond. |
|---|---|---|---|---|---:|
| **1. Modelamiento relacional** | El DER representa correctamente las reglas de negocio e identifica entidades, atributos, PK, FK, relaciones y cardinalidades de manera consistente. | El modelo representa el caso, pero presenta errores u omisiones menores en atributos, claves, relaciones o cardinalidades. | El modelo representa solo parcialmente el caso y presenta errores relevantes en su estructura o relaciones. | No presenta el DER o el modelo no permite representar las reglas fundamentales del caso. | **20%** |
| **2. Implementación SQL** | El script `CREATE TABLE` implementa consistentemente el modelo, utilizando tipos de datos apropiados, PK, FK y restricciones. Los datos incorporados son coherentes y suficientes para las consultas posteriores. | La implementación es funcional en términos generales, pero presenta errores u omisiones menores en tipos, claves, restricciones o datos de prueba. | La implementación presenta errores importantes que afectan la integridad del modelo o su utilización posterior. | No implementa las tablas requeridas o el código presentado no permite construir el modelo. | **20%** |
| **3. Operaciones CRUD** | Implementa correctamente `INSERT`, `SELECT`, `UPDATE` y `DELETE`, utilizando condiciones apropiadas cuando corresponde. | Implementa la mayoría de las operaciones correctamente, con errores menores que no alteran sustancialmente su propósito. | Solo algunas operaciones son correctas o existen errores importantes, particularmente en la identificación de los registros afectados. | No demuestra adecuadamente las operaciones CRUD solicitadas. | **15%** |
| **4. Consultas SQL** | Las dos consultas utilizan correctamente las relaciones entre las tablas y permiten responder las preguntas de negocio. La consulta analítica aplica apropiadamente agregación y `GROUP BY`. | Las consultas responden en términos generales a los requerimientos, pero presentan errores menores en `JOIN`, agregaciones, agrupación u ordenamiento. | Las consultas presentan errores relevantes o solo permiten responder parcialmente las preguntas de negocio. | Las consultas no responden los requerimientos planteados o no son funcionalmente coherentes con el modelo. | **25%** |
| **5. Modelamiento dimensional** | Propone un modelo dimensional coherente con el proceso de negocio, identificando correctamente granularidad, tabla de hechos, medidas y dimensiones mediante un esquema estrella o copo de nieve. | El modelo dimensional es adecuado en términos generales, pero presenta omisiones o inconsistencias menores en granularidad, hechos, medidas o dimensiones. | El modelo presenta dificultades conceptuales importantes para representar analíticamente el proceso de negocio. | No presenta el modelo dimensional o la propuesta no corresponde a un modelo dimensional. | **20%** |
| | | | | **TOTAL** | **100%** |

---

## 6. Lista de verificación antes de entregar

Antes de generar y enviar el PDF definitivo, verifique que:

- el DER sea legible y coincida con las tablas implementadas;
- todo el código SQL se encuentre incorporado como texto;
- los datos ingresados permitan obtener resultados significativos en las dos consultas;
- las cuatro operaciones CRUD estén presentes;
- las dos consultas respondan efectivamente las preguntas de negocio;
- el modelo dimensional identifique claramente hechos, dimensiones, medidas y granularidad;
- exista coherencia entre las cinco partes de la solución;
- el archivo entregado corresponda a **un único documento PDF**.

---
