# Semana 6 — Carga Incremental en ETL (SSIS)

En esta sesión, los estudiantes implementarán un proceso de **carga incremental** utilizando SQL Server Integration Services (SSIS), permitiendo identificar y cargar únicamente los registros nuevos desde un sistema transaccional hacia un entorno analítico.

---

## Objetivo de la sesión

Comprender e implementar la lógica de una carga incremental, diferenciando registros nuevos de aquellos ya existentes en el destino.

---

## Contexto

En las sesiones anteriores:

- Semana 4 → se movieron datos (E-L)  
- Semana 5 → se transformaron datos (ETL)  

Sin embargo, ambos enfoques presentan una limitación crítica:

> Se procesan todos los datos en cada ejecución  

En entornos reales de Business Intelligence, esto no es viable.

---

## Problema central

El desafío no es mover datos, sino **mantener actualizado un repositorio analítico sin duplicar información**.

Ejemplo:

- Ya existen 42 registros en el Data Warehouse  
- Se agregan nuevos empleados en el sistema transaccional  

> ¿Cómo identificamos solo los nuevos registros?

---

## La carga incremental como solución

La carga incremental permite:

✔ Identificar registros nuevos  
✔ Evitar duplicados  
✔ Optimizar el procesamiento  

Esto se logra mediante la **comparación entre origen y destino**.

---

## Recurso principal

El taller se basa en el siguiente video:

**Carga Incremental en SSIS | ETL con Visual Studio Data Tools**  
https://youtu.be/gNtDZkjeoas

---

## Lógica del proceso (clave conceptual)

El proceso implementado en esta sesión se basa en una idea fundamental:

> Comparar el estado actual del sistema transaccional con el estado del Data Warehouse

A partir de esta comparación, se decide:

✔ Qué datos cargar  
✔ Qué datos ignorar  

---

## Componentes del flujo ETL

### 1. Origen transaccional (Fuente)

- Base de datos: Northwind  
- Se construye una consulta con joins  
- Se obtienen todos los atributos necesarios  

👉 Representa la “realidad actual”

---

### 2. Origen dimensional (Destino actual)

- Se consulta el Data Warehouse  
- Solo se extrae la Primary Key (EmployeeID)  

👉 Representa lo que ya fue cargado anteriormente

---

### 3. Sort (Ordenamiento)

Antes de comparar los datos:

- Ambos flujos deben ordenarse por EmployeeID  
- Orden ascendente  

⚠️ Este paso es obligatorio para el funcionamiento del Merge Join  

---

### 4. Merge Join (Comparación)

Este componente permite comparar ambos flujos:

- Lado izquierdo → sistema transaccional  
- Lado derecho → Data Warehouse  

Resultado:

- Se combinan los datos  
- Se identifican coincidencias y diferencias  

El sistema renombra columnas duplicadas (ej: EmployeeID1)

---

### 5. Conditional Split (Decisión)

Aquí ocurre la lógica clave del proceso.

Condición: $ISNULL([EmployeeID1])$


Interpretación:

- Si EmployeeID1 es NULL → el registro NO existe en el destino  
- Si tiene valor → ya existe  

👉 Se crea un flujo llamado:

**"Registros nuevos"**

---

### 6. Carga final

Solo los registros nuevos:

✔ Son enviados al destino  
✔ Se insertan en el Data Warehouse  

---

## Resultado esperado

El proceso permite:

- Identificar registros existentes  
- Detectar registros nuevos  
- Cargar únicamente lo necesario  

Ejemplo:

- Total registros: 49  
- Registros existentes: 42  
- Registros nuevos: 7  

👉 Solo se cargan los 7 nuevos  

---

## Alcance

Este ejercicio incorpora:

✔ Comparación entre sistemas  
✔ Control de duplicidad  
✔ Lógica de decisión en ETL  

---

## Relación con el curso

Esta sesión introduce un concepto fundamental en BI:

👉 **El ETL no solo transforma datos, también decide qué datos procesar**

Esto marca el paso desde un enfoque técnico hacia uno más analítico y estratégico.

---

## Conexión con el proyecto

Los estudiantes deberán reflexionar:

- ¿Cómo identifico registros nuevos en mi dataset?  
- ¿Qué campo actúa como clave de comparación?  
- ¿Cómo evito duplicados en mi modelo?  

---

## Archivos de la sesión

- `Semana6.md` → desarrollo conceptual  
- `Semana6_ETL_Incremental.pdf` → material de apoyo  

---

## Pregunta guía

> ¿Cómo puedo asegurar que mi Data Warehouse se actualice sin duplicar información?

---

## Idea clave de la sesión

> "El valor del BI no está en cargar datos, sino en decidir correctamente cuáles deben cargarse"

