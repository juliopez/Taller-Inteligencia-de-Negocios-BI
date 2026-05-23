# TRANSFORMACIÓN DE DATOS EN ETL (SSIS – COLUMNAS DERIVADAS)

## 1. Introducción: El verdadero valor del ETL
En la sesión anterior trabajamos un proceso básico de extracción y carga de datos. En ese contexto, vimos cómo es posible mover datos desde una fuente hacia un destino, lo que en muchos casos se denomina un proceso E-L.

Sin embargo, en entornos reales de Business Intelligence, este tipo de procesos es insuficiente. Las organizaciones no necesitan únicamente trasladar datos, sino **transformarlos** para que estos tengan sentido analítico.

Aquí es donde aparece el componente más importante del ETL: la **Transformación**.

Transformar datos implica tomar datos crudos, generalmente provenientes de sistemas operacionales, y convertirlos en información útil, coherente y preparada para el análisis.

---
## 2. Problema real: datos correctos, pero no útiles
Uno de los errores más comunes al trabajar con datos es asumir que si los datos están completos, entonces están listos para ser utilizados. Esto no es necesariamente cierto.

Por ejemplo, consideremos los siguientes campos en una base de datos:

* Nombre
* Apellido
* Dirección
* Código Postal
* País

Desde una perspectiva transaccional, estos datos son correctos y cumplen su función. Sin embargo, desde una perspectiva analítica, pueden presentar problemas:

* No existe un campo unificado de identificación (ej: nombre completo)
* La dirección está fragmentada
* La estructura no facilita visualización ni reporte

En otras palabras, **los datos existen, pero no están diseñados para responder preguntas**.

---
## 3. La transformación como solución

La transformación de datos busca resolver este problema mediante la creación de nuevas estructuras a partir de los datos existentes.

En esta sesión trabajaremos con una de las transformaciones más comunes en ETL: la creación de **columnas derivadas**.

Una columna derivada es un nuevo atributo que se genera a partir de uno o más campos existentes, utilizando reglas o expresiones.

Este tipo de transformación es fundamental porque:

* Mejora la legibilidad de los datos
* Facilita el análisis
* Reduce la complejidad en etapas posteriores (modelo dimensional, dashboards)

---
## 4. SSIS como herramienta de transformación

En el contexto de esta clase utilizaremos SQL Server Integration Services (SSIS), una herramienta que permite diseñar procesos ETL de manera visual.

Dentro de SSIS, existen múltiples componentes de transformación. Uno de los más utilizados es el componente:

 **Derived Column (Columna Derivada)**

Este componente permite:

* Crear nuevas columnas
* Modificar columnas existentes
* Aplicar expresiones sobre los datos

---
## 5. Caso práctico: construcción de atributos analíticos

A partir del video que revisaremos en esta sesión, trabajaremos con dos ejemplos fundamentales.

---

### 5.1 Concatenación de nombres

Problema:
Los datos están separados en:

* Nombre
* Apellido

Desde el punto de vista analítico, muchas veces se requiere un único campo:

$$Nombre \ Completo$$
Solución:

A través de una columna derivada, se construye una expresión que concatena ambos campos.

Conceptualmente:

```
Nombre + " " + Apellido
```

Resultado:

* Se obtiene un nuevo atributo más útil para reportes
* Se mejora la interpretación de los datos

---
###  5.2 Construcción de dirección completa

Problema:
La dirección está fragmentada en múltiples campos:

* Dirección
* Código Postal
* País

Esto dificulta su uso en análisis o visualización.

Solución:

Se crea una nueva columna:

$$ Dirección \ Completa$$
A partir de una expresión que integra los distintos campos.

Ejemplo conceptual:

```
Dirección + ", " + Código Postal + ", " + País
```

Resultado:

* Se genera un atributo más interpretable
* Se facilita su uso en reportes o dashboards

---
## 6. Aspectos técnicos relevantes (clave conceptual)

Durante el proceso de transformación, SSIS realiza automáticamente ciertas tareas que es importante comprender:

### ✔ Tipo de dato

El sistema infiere el tipo de dato de la nueva columna en función de la expresión utilizada.

### ✔ Longitud de campo

La longitud del nuevo atributo también es calculada automáticamente.

Esto es importante porque:

* evita errores de truncamiento
* garantiza consistencia en el flujo de datos

---
## 7. Reflexión crítica: ¿por qué esto es importante en BI?

La transformación de datos no es un detalle técnico menor. Es una etapa central en cualquier proyecto de Business Intelligence.

Sin una adecuada transformación:

* Los datos pueden ser difíciles de interpretar
* Se generan inconsistencias en reportes
* Se traslada complejidad a capas posteriores

En cambio, cuando la transformación está bien diseñada:

* El modelo dimensional es más limpio
* Los dashboards son más claros
* El análisis es más eficiente

---

## 8. Conexión con el proyecto del curso

Lo que estamos viendo en esta sesión tiene una relación directa con el proyecto que están desarrollando.

En particular:

* Las decisiones que tomen hoy sobre los datos
* Cómo interpretan los atributos
* Qué campos consideran relevantes

influirán directamente en:

* la definición del hecho
* la construcción de dimensiones
* la calidad del modelo dimensional

---
## 9. Cierre

En esta sesión hemos pasado desde un enfoque básico de ETL hacia una etapa más avanzada, donde los datos no solo se mueven, sino que se transforman para generar valor.

El objetivo no es solo aprender a usar una herramienta, sino comprender que **los datos deben ser diseñados para el análisis**, y que esta responsabilidad recae principalmente en la etapa de transformación.

---


