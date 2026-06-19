# Evaluación N°3: Implementación de Cubo OLAP y Dashboard Analítico

**Ponderación:** 35% de la nota final del curso.

**Fecha de publicación:** lunes 22 de junio.

**Fecha de entrega (impostergable):** domingo 28 de junio, 23:59 horas.

**Modalidad:** trabajo grupal.

## Descripción general

La tercera evaluación del curso tiene como objetivo implementar una solución de análisis multidimensional basada en un cubo OLAP y un dashboard analítico en Power BI.

Para esta evaluación, cada equipo deberá utilizar el mismo modelo estrella o copo de nieve diseñado en la Evaluación 1 e implementado durante la Evaluación 2. No se deberán crear nuevos modelos de datos ni modificar sustancialmente la estructura analítica previamente aprobada.

El cubo OLAP y el dashboard deberán diseñarse para responder las preguntas de negocio definidas por el equipo en la Evaluación 1.

Como mínimo, el proyecto deberá responder **tres preguntas de negocio**, las cuales deberán ser las mismas planteadas originalmente en la primera entrega del proyecto.

Durante la semana de desarrollo de esta evaluación, la sesión de clases programada en el horario habitual será destinada exclusivamente a la resolución de dudas y consultas relacionadas con la actividad evaluativa.

## 1.- Requisitos del cubo OLAP

El cubo OLAP deberá construirse siguiendo la misma metodología y procedimientos desarrollados durante las sesiones prácticas del curso utilizando SQL Server Analysis Services (SSAS) y Visual Studio.

Como mínimo, el cubo deberá incluir:

* Una tabla de hechos.
* Al menos tres dimensiones.
* Al menos una jerarquía en aquellas dimensiones donde resulte pertinente.
* Al menos una medida asociada a la tabla de hechos.
* Procesamiento exitoso del cubo.
* Navegación y exploración mediante el Browser de Visual Studio.

Las dimensiones, medidas y jerarquías deberán estar alineadas con las preguntas de negocio definidas por el equipo en la Evaluación 1.

***No se evaluarán funcionalidades avanzadas que no hayan sido abordadas durante las clases, tales como***:

* KPIs en Analysis Services.
* Perspectivas (Perspectives).
* Acciones (Actions).
* Writeback.
* Seguridad por roles.
* Cubos enlazados.
* Traducciones.
* Modelos tabulares avanzados.

## 2.- Requisitos del dashboard

El dashboard deberá construirse utilizando como fuente de datos el cubo OLAP desarrollado por el equipo.

El dashboard deberá contener una única página.

Como mínimo deberá incorporar:

* Al menos una tarjeta (Card).
* Al menos tres visualizaciones analíticas.
* Al menos un segmentador (Slicer).
* Al menos una visualización que utilice una jerarquía y permita realizar Drill-down.

Las visualizaciones deberán estar orientadas a responder las tres preguntas de negocio definidas en la Evaluación 1.

No se evaluará la cantidad de visualizaciones incorporadas ni el diseño gráfico avanzado del dashboard. El foco de la evaluación estará en la capacidad del dashboard para explotar correctamente la información contenida en el cubo OLAP y responder las preguntas de negocio planteadas por el equipo.

## Entregables

### 1.- Video explicativo (obligatorio)

El equipo deberá entregar un único video, **cuya duración máxima sera de 7 minutos** donde se evidencie el proceso de construcción y funcionamiento del cubo OLAP.

El video deberá mostrar y explicar:

- Las tres preguntas de negocio definidas en la Evaluación 1.
- El modelo estrella o copo de nieve utilizado como base para la construcción del cubo.
- La **creación** y configuración de las dimensiones.
- La **creación** de jerarquías (cuando corresponda).
- La definición de medidas.
- El procesamiento exitoso del cubo OLAP.
- La navegación y exploración del cubo mediante el Browser de Visual Studio.
- La forma en que el cubo permite responder las preguntas de negocio definidas por el equipo.

Cada integrante deberá:

* Aparecer en cámara mostrando su rostro (**OBLIGATORIO**).
* Explicar verbalmente una parte del trabajo realizado.
* Demostrar conocimiento sobre el cubo OLAP desarrollado.

_El video deberá publicarse en **YouTube** (modo oculto o privado) o en una plataforma equivalente que permita su visualización mediante enlace._

### 2. Dashboard Power BI (obligatorio)

El dashboard deberá publicarse en Power BI Service y compartirse con la cuenta institucional del profesor:

**[julio.lopez05@inacapmail.cl](mailto:julio.lopez05@inacapmail.cl)**

***Los dashboards que no sean compartidos correctamente (o enviados por email) no serán  revisados ni evaluados.***

- El dashboard desarrollado en Power BI **debe** tener relación con las preguntas de negocio planteadas en la Evaluación 1.
## Consideraciones finales

El objetivo principal de esta evaluación es demostrar la capacidad del equipo para **construir** una capa analítica basada en tecnologías OLAP y utilizarla para responder preguntas de negocio mediante herramientas de Business Intelligence.

La evaluación se centrará en la correcta aplicación de los contenidos **revisados durante el curso** y en la coherencia existente entre:

* El proyecto debe mantenerse coherente con la definición inicial realizada en la Evaluación 1.
* El modelo dimensional implementado en la Evaluación 2.
* Las preguntas de negocio utilizadas en esta evaluación deben corresponder a las definidas originalmente por el equipo.
- Como mínimo, el cubo OLAP y el dashboard deberán responder tres preguntas de negocio.
- El dashboard deberá construirse utilizando como **fuente de datos el cubo OLAP** desarrollado por el equipo.
- El dashboard deberá publicarse en Power BI Service y compartirse con la cuenta institucional del profesor: **[julio.lopez05@inacapmail.cl](mailto:julio.lopez05@inacapmail.cl)**.
- Se evaluará tanto la implementación técnica (creación) como la capacidad analítica para responder las preguntas planteadas.

### **Nota importante sobre evidencia de autoría y participación**

El video constituye el principal medio de verificación del trabajo realizado por el grupo. En este sentido, se establecen las siguientes **condiciones obligatorias**:

- Durante el video se debe evidenciar el uso real de las herramientas trabajadas en clases (Visual Studio, SQL Server Analysis Services y Power BI).

- Todos los integrantes del grupo deben participar activamente en el video, apareciendo en cámara (rostro visible) y explicando parte del trabajo realizado.

- Cada integrante deberá demostrar conocimiento sobre algún aspecto del cubo OLAP desarrollado.

- No se aceptarán videos reutilizados, editados a partir de material externo (por ejemplo, YouTube u otros grupos), ni demostraciones que **no correspondan** al trabajo desarrollado por el propio equipo.

- El docente podrá realizar preguntas de verificación en caso de dudas sobre la autoría o participación.

El incumplimiento de estas condiciones podrá afectar directamente la evaluación en los criterios asociados a implementación, presentación e integridad académica.

**No basta con mostrar el cubo OLAP terminado. El video debe evidenciar claramente que fue construido por el equipo y que permiten responder las preguntas de negocio definidas en la Evaluación 1.**

## Rubrica

### Importante

El video constituye el único medio formal de evaluación de esta actividad. En consecuencia, ***la ausencia del video o la imposibilidad de acceder a él impedirá evaluar la construcción del cubo OLAP***,  afectando la totalidad de los criterios de la rúbrica.

Asimismo, el video debe evidenciar de forma clara y verificable el trabajo desarrollado por el equipo, la participación de todos sus integrantes y la correcta utilización de las herramientas revisadas durante el curso.

| Criterio                                                                        | Descripción                                                                                                              | Excelente (5 pts)                                                                                                                                    | Adecuado (4 pts)                                                                                      | Básico (2 pts)                                                                                            | Insuficiente (0 pts)                                                                                                                                    | Ponderación |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------: |
| Construcción del cubo OLAP **(mediante video)**                                 | Muestra la Implementación técnica del cubo utilizando el modelo dimensional desarrollado en las evaluaciones anteriores. | El cubo se construye correctamente, procesa sin errores y permite una navegación completa mediante el Browser de Visual Studio.                      | El cubo procesa correctamente, aunque presenta detalles menores de configuración o navegación.        | El cubo presenta errores parciales, limitaciones de funcionamiento o navegación incompleta.               | No se evidencia la construcción del cubo o este no funciona correctamente,  **y/o no entrega video.**                                                   |         20% |
| Definición de dimensiones y medidas **(mediante video)**                        | Video evidencia calidad y pertinencia de las dimensiones y medidas implementadas en el cubo.                             | Las dimensiones y medidas son completas, coherentes con el modelo dimensional y permiten responder adecuadamente las preguntas de negocio.           | Las dimensiones y medidas son mayoritariamente correctas, con pequeñas omisiones o inconsistencias.   | Las dimensiones o medidas son incompletas, presentan errores o limitan el análisis.                       | No se implementan dimensiones o medidas funcionales,  **y/o no entrega video.**                                                                         |         15% |
| Implementación de jerarquías **(mediante video)**                               | Exhibe en video el uso de jerarquías para facilitar la exploración multidimensional de la información.                   | Las jerarquías relevantes se encuentran correctamente implementadas y funcionan adecuadamente durante la navegación.                                 | La mayoría de las jerarquías están implementadas correctamente, con limitaciones menores.             | Existen jerarquías básicas o parcialmente funcionales.                                                    | No se implementan jerarquías o estas no funcionan,  **y/o no entrega video.**                                                                           |         10% |
| Capacidad del cubo para responder las preguntas de negocio **(mediante video)** | Relata en video la relación entre el cubo construido y las preguntas definidas en la Evaluación 1.                       | El cubo permite responder claramente las tres preguntas de negocio definidas por el equipo.                                                          | El cubo responde adecuadamente la mayoría de las preguntas planteadas.                                | El cubo responde parcialmente las preguntas o requiere interpretaciones adicionales.                      | El cubo no permite responder las preguntas de negocio definidas,  **y/o no entrega video.**                                                             |         15% |
| Dashboard Power BI **(mediante Servicio Publicación)**                          | Usando Power BI Service evidencia la construcción y utilización del dashboard conectado al cubo OLAP.                    | El dashboard se encuentra correctamente conectado al cubo, incorpora los elementos mínimos solicitados y permite responder las preguntas de negocio. | El dashboard es funcional y responde adecuadamente a las preguntas, con limitaciones menores.         | El dashboard presenta funcionalidades limitadas o una conexión parcial con el cubo OLAP.                  | No existe dashboard funcional o no se encuentra conectado al cubo OLAP, **y/o no comparte vía Power Service Dashboard**                                 |         15% |
| Análisis e interpretación de resultados **(mediante video)**                    | Video logra demostrar capacidad para analizar e interpretar la información obtenida desde el cubo.                       | El equipo interpreta correctamente los resultados, identifica hallazgos relevantes y responde claramente las preguntas de negocio.                   | El análisis es adecuado, aunque algunas conclusiones presentan menor profundidad.                     | El análisis es superficial o responde parcialmente las preguntas planteadas.                              | No se evidencia análisis ni interpretación de resultados,  **y/o no entrega video.**                                                                    |         10% |
| Participación, autoría e integridad académica **(mediante video)**              | Video evidencia la participación efectiva de todos los integrantes y autenticidad del trabajo presentado.                | Todos los integrantes participan activamente, aparecen en cámara, explican parte del trabajo y demuestran dominio de la solución desarrollada.       | La mayoría de los integrantes participa activamente y demuestra conocimiento suficiente del proyecto. | La participación es desigual o algunos integrantes evidencian escaso conocimiento del trabajo presentado. | No se evidencia participación efectiva de todos los integrantes o existen dudas fundadas respecto de la autoría del trabajo,  **y/o no entrega video.** |         15% |
| **Total**                                                                       |                                                                                                                          |                                                                                                                                                      |                                                                                                       |                                                                                                           |                                                                                                                                                         |    **100%** |

