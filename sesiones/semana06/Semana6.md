## ¿Por qué es importante la carga incremental?

En entornos reales, los sistemas de información generan datos de manera continua.

Si un proceso ETL carga todos los datos en cada ejecución:

- Aumenta innecesariamente el tiempo de procesamiento  
- Se consumen más recursos computacionales  
- Se incrementa el riesgo de duplicar información  

La carga incremental permite resolver este problema al enfocarse únicamente en los cambios:

✔ Registros nuevos  
✔ Registros que no han sido previamente cargados  

Desde una perspectiva de Business Intelligence, este enfoque no es solo una optimización técnica, sino una condición necesaria para:

- Escalar soluciones en el tiempo  
- Mantener la integridad de los datos  
- Garantizar procesos eficientes  

En otras palabras, un proceso ETL sin carga incremental difícilmente es viable en escenarios reales.

### 1. Configuración de los Orígenes de Datos
El proceso requiere conectar dos fuentes distintas:
*   **Origen Transaccional (Fuente):** Se conecta a la base de datos *Northwind*. Debido a que la información del "Empleado" está dispersa, se utiliza una consulta SQL con *joins* para extraer datos de las tablas de empleados, territorios y regiones. De aquí se extraen **todos los atributos** que se desean cargar.
*   **Origen Dimensional (Destino actual):** Se conecta a la base de datos donde se cargaron los datos anteriormente (hace un mes, en el ejemplo). De esta fuente **solo se extrae la Primary Key** (el ID del empleado) para usarla como punto de comparación.

### 2. Preparación: El componente "Sort" (Ordenar)
Antes de realizar la comparación, es obligatorio utilizar el objeto **Sort** en ambos flujos de datos.
*   Se deben ordenar los registros de forma ascendente basándose en el ID del empleado (*EmployeeID*).
*   Esto es un requisito técnico indispensable para que el siguiente componente (Merge Join) pueda funcionar correctamente.

### 3. Comparación: "Merge Join" (Combinación de mezclas)
Se utiliza este componente para poner frente a frente los datos de ambas bases de datos.
*   **Lógica de flujo:** Se define el flujo transaccional como el "lado izquierdo" (el que manda), ya que se quiere verificar si lo que está en el origen ya existe en el destino.
*   **Manejo de nombres:** Como ambas tablas tienen una columna llamada igual (ej. *EmployeeID*), el sistema renombra automáticamente la columna del destino (por ejemplo, a `EmployeeID1`) para poder diferenciarlas en el flujo de salida.

### 4. Filtrado: "Conditional Split" (División condicional)
Este es el punto crucial donde se decide qué se carga. El instructor explica que:
*   Si un registro existe en el origen pero no en el destino, la columna del destino (`EmployeeID1`) llegará **nula o en blanco**.
*   Se configura una condición usando la función `ISNULL([EmployeeID1])`.
*   Este filtro crea un flujo de salida llamado **"Registros nuevos"**, que contiene exclusivamente a las personas contratadas recientemente que aún no figuran en el Data Warehouse.

### 5. Ejecución y Resultado
El video finaliza mostrando una prueba real:
*   Se eliminan algunos registros del destino para simular que son nuevos.
*   Al ejecutar el paquete, el sistema identifica, por ejemplo, que de 49 registros totales, 42 ya existían y solo **7 son nuevos**.
*   El flujo dirige únicamente esos 7 registros hacia el destino final, completando la carga incremental de manera exitosa.

En este flujo de carga incremental, el componente **Merge Join** (o Combinación de mezclas) cumple la función crítica de **comparar y emparejar los registros** provenientes de dos fuentes distintas para identificar qué información es nueva.

Sus funciones específicas dentro del proceso son:

*   **Poner los datos "frente a frente":** El componente toma los registros del origen transaccional (datos actuales) y los del destino dimensional (datos cargados previamente) y los coloca uno al lado del otro basándose en un atributo común, generalmente la **Primary Key** (como el ID del empleado),.
*   **Establecer una relación de referencia:** Permite definir cuál es el flujo que "manda". En este caso, se configura el flujo transaccional a la izquierda como el dominante para verificar si sus datos ya existen en la base de datos dimensional,.
*   **Generar un flujo de salida combinado:** Crea una salida que contiene los atributos de ambas fuentes. Si un registro existe en ambas, los campos de ambas tablas aparecerán con datos; si el registro es nuevo y solo existe en la fuente transaccional, los campos correspondientes a la base dimensional aparecerán **en blanco o nulos**,.
*   **Facilitar la identificación de novedades:** Gracias a esta combinación, el sistema puede detectar registros donde el ID de la base dimensional es nulo, lo que indica que esa persona acaba de ser contratada y debe ser cargada al sistema,.

Es importante destacar que, para que el **Merge Join** funcione correctamente, los datos de ambas fuentes deben haber pasado previamente por un componente de **Ordenación (Sort)** para estar organizados de forma ascendente.

El componente **Sort** (Ordenar) cumple una función técnica **obligatoria e indispensable** para que el componente *Merge Join* pueda funcionar correctamente dentro del flujo de datos.

Sus funciones específicas son:

*   **Organización ascendente:** Se encarga de ordenar los registros de ambos flujos de datos (el origen transaccional y el destino dimensional) de forma **ascendente** basándose en un atributo común, como la *Primary Key* o el ID del empleado,.
*   **Habilitar la comparación:** El *Merge Join* requiere que las entradas estén previamente ordenadas para poder realizar la "mezcla" o combinación de los datos. Sin este paso previo, el sistema no podría poner los registros "uno frente al otro" para comparar si la información del origen ya existe en el destino,.
*   **Identificación de flujos:** Al configurar el componente *Sort*, se definen qué atributos pasarán a través del flujo ordenado para ser comparados posteriormente en el proceso de mezcla,.

En resumen, el **Sort** prepara los datos para que el *Merge Join* pueda realizar el emparejamiento lógico necesario para identificar registros nuevos o existentes de manera eficiente.

## Idea clave de la sesión

> La carga incremental no es solo una optimización técnica, es el mecanismo que permite mantener actualizado un sistema analítico sin comprometer su integridad.

> En otras palabras, el valor del BI está en saber qué datos deben incorporarse y cuáles no.

## Reflexión

¿Qué ocurriría en un sistema real si no se implementa carga incremental?

Considere:
- Volumen de datos
- Tiempo de procesamiento
- Riesgo de duplicidad
