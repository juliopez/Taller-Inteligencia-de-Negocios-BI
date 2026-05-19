# Orientaciones Evaluación 2

---

## **Proceso de integración de datos y preparación para modelo multidimensional**

### **Descripción general**

En esta segunda entrega del proyecto, los estudiantes deberán diseñar e implementar el proceso de integración de datos **(ETL)**, incorporando múltiples fuentes de información y preparando los datos para su posterior análisis en un entorno multidimensional.

Esta etapa tiene como objetivo construir la base de datos que servirá como insumo para la siguiente evaluación, donde se desarrollará un cubo de datos utilizando ***Analysis Services***.

---
### **Objetivo de la evaluación**

Diseñar e implementar un proceso de integración de datos que permita:
* Consolidar información desde distintas fuentes
* Transformar los datos para su análisis
* Construir una base de datos estructurada bajo un modelo dimensional

---
### **Requerimientos generales**

Los estudiantes deberán desarrollar los siguientes componentes:
### **1. Construcción de base de datos operacional (staging)**

* Crear una base de datos que contenga los datos crudos provenientes de:
  * Datos abiertos del Mineduc
  * **Al menos una fuente externa adicional**
* Esta base debe funcionar como repositorio inicial de datos (capa de integración).

---
### **2. Integración de fuentes de datos**

Se debe incorporar al menos una fuente externa distinta a Mineduc, pudiendo ser:
* Web Services (WSDL)
* APIs
* Web scraping
* Otros servicios de datos

El estudiante deberá demostrar la extracción de datos desde dicha fuente.

---
### **3. Desarrollo de procesos ETL**

Se deberán implementar procesos ETL utilizando al menos **dos de las siguientes herramientas**:
* Visual Studio (SSIS)
* Pentaho Data Integration
* Power Automate

Los procesos ETL deben incluir:
* Extracción de datos (E)
* Transformación (T)
* Carga (L)

---
### **4. Tipos de ETL requeridos**

El conjunto de procesos desarrollados debe incluir:
* ETL básico (extracción y carga)
* Transformación mediante columna derivada
* Proceso de carga incremental

---
### **5. Construcción del modelo dimensional**

A partir de los datos integrados, se deberá:
* Construir un modelo estrella (o copo de nieve)
* Definir tabla de hechos y dimensiones
* Incorporar al menos una dimensión proveniente de la fuente externa

El modelo debe ser coherente con lo definido en la Evaluación 1.

---
### **6. Preparación para análisis multidimensional**

La estructura de datos generada debe permitir su uso posterior en ***Analysis Services***, considerando:
* Integridad de claves
* Relaciones entre tablas
* Consistencia de datos

---
### **Entregables**

Los estudiantes deberán presentar:
#### **1. Informe (3 a 4 páginas)**

Debe incluir:
* Descripción de fuentes de datos utilizadas
* Explicación del proceso de integración
* Descripción de los procesos ETL implementados
* Justificación de decisiones técnicas
* Modelo dimensional propuesto
---
#### **2. Video explicativo (5 a 7 minutos)**

*El video se debe publicar (modo privado) en **Youtube**,  o en alguna plataforma similar*

El vídeo debe mostrar y explicar:
* Base de datos operacional (staging)
* Procesos ETL desarrollados
* Uso de al menos dos herramientas
* Integración de múltiples fuentes de datos
* Modelo dimensional construido

---
### **Consideraciones importantes**
* El proyecto debe mantenerse coherente con la definición inicial (Evaluación 1)
* No se permite cambiar el problema analítico ni los datasets principales
* Se evaluará tanto la implementación técnica como la claridad en la explicación del proceso

---
### Nota importante sobre evidencia de autoría y participación

El video constituye el principal medio de verificación del trabajo realizado por el grupo. En este sentido, se establecen las siguientes condiciones obligatorias:

- Durante el video se debe evidenciar el uso real de las herramientas trabajadas en clases (por ejemplo: Visual Studio, Pentaho, Power Automate), mostrando procesos en ejecución y resultados obtenidos.
- Todos los integrantes del grupo deben participar activamente en el video, apareciendo en cámara (rostro visible) y explicando parte del trabajo realizado.
- No se aceptarán videos reutilizados, editados a partir de material externo (por ejemplo, YouTube u otros grupos), ni demostraciones que no correspondan al trabajo desarrollado por el propio equipo.
- El docente podrá realizar preguntas de verificación en caso de dudas sobre la autoría o participación.

El incumplimiento de estas condiciones podrá afectar directamente la evaluación en los criterios asociados a implementación, presentación e integridad académica.

---
## **Rúbrica de evaluación — Evaluación 2: Integración de datos y modelo dimensional**

Cada evaluación será calificada considerando los siguientes criterios:

---

| Criterio                                                      | Descripción                                                                    | Excelente (5 pts)                                                                                                                                         | Adecuado (4 pts)                                                                                          | Básico (2 pts)                                                                              | Insuficiente (0 pts)                                                                                                   | Ponderación |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ----------- |
| Integración de fuentes de datos                               | Capacidad de integrar datos desde múltiples fuentes (Mineduc + fuente externa) | Integra correctamente múltiples fuentes de datos (incluyendo fuente externa), con coherencia total respecto al problema analítico.                        | Integra más de una fuente de datos, aunque con limitaciones en coherencia o profundidad.                  | Integra datos de forma parcial o con dificultades en la incorporación de la fuente externa. | No integra múltiples fuentes o la integración es incorrecta/inexistente.                                               | 15%         |
| Desarrollo de procesos ETL                                    | Implementación de procesos ETL utilizando herramientas vistas en clases        | Implementa correctamente procesos ETL utilizando al menos dos herramientas, incluyendo ETL básico, transformación (columna derivada) y carga incremental. | Implementa procesos ETL funcionales, pero con menor diversidad de herramientas o con aspectos mejorables. | Implementa ETL incompleto o con errores importantes en alguno de los procesos requeridos.   | No implementa procesos ETL o estos son incorrectos.                                                                    | 20%         |
| Diseño conceptual de la base de datos y modelo dimensional    | Diseño de la base de datos operacional y modelo estrella                       | Construye correctamente la base de datos operacional y un modelo estrella coherente, incluyendo dimensiones relevantes (con al menos una fuente externa). | Modelo dimensional adecuado, aunque con problemas menores en su estructura o coherencia.                  | Modelo incompleto o con errores en la definición de hechos y dimensiones.                   | No existe modelo dimensional o es incorrecto.                                                                          | 15%         |
| Preparación técnica del modelo para análisis multidimensional | Preparación del modelo para su uso en entornos analíticos (Analysis Services)  | Modelo completamente preparado para su uso en cubos (claves, relaciones e integridad correctas).                                                          | Modelo funcional con algunos aspectos mejorables para su uso en Analysis Services.                        | Modelo con limitaciones importantes para su uso analítico.                                  | Modelo no utilizable en un entorno multidimensional.                                                                   | 10%         |
| Análisis y justificación del proceso                          | Capacidad de explicar y justificar decisiones técnicas                         | Explica y justifica claramente las decisiones (fuentes, ETL, modelo), demostrando comprensión profunda.                                                   | Explica el proceso, aunque con menor profundidad o claridad en la justificación.                          | Explicación superficial, sin justificar adecuadamente las decisiones.                       | No existe explicación o es incorrecta.                                                                                 | 10%         |
| Informe                                                       | Claridad y estructura del informe                                              | Informe claro, bien estructurado y acorde a la plantilla.                                                                                                 | Informe adecuado con algunos problemas de claridad.                                                       | Informe desorganizado o incompleto.                                                         | Informe inexistente o muy deficiente.                                                                                  | 5%          |
| Video explicativo y participación del equipo                  | Calidad de la explicación y participación de todos los integrantes             | Explicación clara del proceso, participación activa de todos los integrantes y dominio del trabajo realizado.                                             | Explicación comprensible, con participación parcial del equipo.                                           | Explicación poco clara o participación limitada de los integrantes.                         | Video deficiente o sin participación del equipo.                                                                       | 10%         |
| Integridad académica y autoría                                | Originalidad del trabajo y coherencia entre lo presentado y lo explicado       | Trabajo original, consistente y completamente explicable por el equipo. Evidencia clara de desarrollo propio.                                             | Trabajo mayormente original, con algunos elementos poco claros.                                           | Dudas sobre autoría o limitada comprensión del trabajo presentado.                          | Evidencia de copia, reutilización de material externo o falta de correspondencia entre lo explicado y lo implementado. | 15%         |

---
## **Cálculo del porcentaje de logro**

Cada criterio de la rúbrica se evalúa con un puntaje en la siguiente escala:

|**Nivel**|**Puntaje**|
|---|---|
|Excelente|5|
|Adecuado|4|
|Básico|2|
|Insuficiente|0|

Cada criterio tiene además una **ponderación dentro de la evaluación**.

| **Criterio**                                       | **Ponderación** |
| -------------------------------------------------- | --------------- |
| Integración de fuentes de datos                    | 15%             |
| Desarrollo de procesos ETL                         | 20%             |
| Construcción de base de datos y modelo dimensional | 15%             |
| Preparación para análisis multidimensional         | 10%             |
| Análisis y justificación del proceso               | 10%             |
| Informe                                            | 5%              |
| Video explicativo y participación del equipo       | 10%             |
| Integridad académica y autoría                     | 15%             |
| Total                                              | 100%            |

### **Fórmula de cálculo**

El porcentaje de logro final se calcula mediante la siguiente fórmula:  
$$
\text{Logro final} =  
\left(\frac{P_1}{5}\right)\times 15 +  
\left(\frac{P_2}{5}\right)\times 20 +  
\left(\frac{P_3}{5}\right)\times 15 +  
\left(\frac{P_4}{5}\right)\times 10 +  
\left(\frac{P_5}{5}\right)\times 10 +  
\left(\frac{P_6}{5}\right)\times 5 +  
\left(\frac{P_7}{5}\right)\times 10 +  
\left(\frac{P_8}{5}\right)\times 15  
$$

donde:
- **P1** = puntaje en *Integración de fuentes de datos*  
- **P2** = puntaje en *Desarrollo de procesos ETL*  
- **P3** = puntaje en *Construcción de base de datos y modelo dimensional*  
- **P4** = puntaje en *Preparación para análisis multidimensional*  
- **P5** = puntaje en *Análisis y justificación del proceso*  
- **P6** = puntaje en *Informe*  
- **P7** = puntaje en *Video explicativo y participación del equipo*  
- **P8** = puntaje en *Integridad académica y autoría*  
  
El resultado corresponde al **porcentaje de logro final**.

### Ejemplo de cálculo

Supongamos el siguiente resultado en la rúbrica:

| Criterio                                           | Puntaje |
| -------------------------------------------------- | ------- |
| Integración de fuentes de datos                    | 4       |
| Desarrollo de procesos ETL                         | 5       |
| Construcción de base de datos y modelo dimensional | 5       |
| Preparación para análisis multidimensional         | 4       |
| Análisis y justificación del proceso               | 4       |
| Informe                                            | 5       |
| Video explicativo y participación del equipo       | 5       |
| Integridad académica y autoría                     | 5       |
**Ahora se aplica la fórmula:**
$\left(\frac{4}{5}\right)\times 15 = 12$
$\left(\frac{5}{5}\right)\times 20 = 20$
$\left(\frac{5}{5}\right)\times 15 = 15$
$\left(\frac{4}{5}\right)\times 10 = 8$
$\left(\frac{4}{5}\right)\times 10 = 8$
$\left(\frac{5}{5}\right)\times 5 = 5$
$\left(\frac{5}{5}\right)\times 10 = 10$
$\left(\frac{5}{5}\right)\times 15 = 15$

**Resultado final**
$\text{Logro final} = 12 + 20 + 15 + 8 + 8 + 5 + 10 + 15 = 93\%$

El estudiante obtiene un **93% de logro**.

Luego, este porcentaje se convierte a nota utilizando la **tabla de conversión de porcentaje a nota**  https://escaladenotas.cl/ . Alternativamente, la nota puede calcularse de la siguiente forma:

A partir de los parámetros definidos, la conversión de porcentaje a nota se modela mediante una función lineal por tramos:
$$n =
\begin{cases}
(n_{apr} - n_{min}) \cdot \dfrac{p}{e \cdot p_{max}} + n_{min}, & \text{si } p < e \cdot p_{max} \\\\
(n_{max} - n_{apr}) \cdot \dfrac{p - e \cdot p_{max}}{p_{max} \cdot (1 - e)} + n_{apr}, & \text{si } p \geq e \cdot p_{max}
\end{cases}$$
Donde:

- $n_{max} = 7.0$ (nota máxima)
- $n_{min} = 1.0$ (nota mínima)
- $n_{apr} = 4.0$ (nota de aprobación)
- $e = 0.6$ (exigencia, equivalente al 60%)
- $p_{max} = 100$ (puntaje máximo)
- $p$ = porcentaje de logro obtenido

Reemplazando los valores anteriores, la función queda:
$$n =
\begin{cases}
3 \cdot \dfrac{p}{60} + 1, & \text{si } p < 60 \\\\
3 \cdot \dfrac{p - 60}{40} + 4, & \text{si } p \geq 60
\end{cases}$$
