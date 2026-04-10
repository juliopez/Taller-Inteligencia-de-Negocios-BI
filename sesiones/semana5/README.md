# Semana 5 — Transformación de Datos en ETL (SSIS – Columnas Derivadas)

En esta sesión, los estudiantes avanzarán desde un proceso básico de integración de datos hacia un enfoque completo de ETL, incorporando la etapa de **Transformación**, elemento clave en cualquier solución de Business Intelligence.

---

## Objetivo de la sesión

Comprender el rol de la transformación de datos en ETL y aplicar técnicas básicas de transformación utilizando el componente **Columna Derivada** en SSIS.

---

## Contexto

En la sesión anterior se implementó un proceso de tipo **E-L (Extract - Load)**, donde los datos eran trasladados desde una fuente hacia un destino sin ser modificados.

Sin embargo, en entornos reales de Business Intelligence, mover datos no es suficiente.

Tal como se plantea en el material de la sesión, **el valor del BI no está en mover datos, sino en estructurarlos para responder preguntas** :contentReference[oaicite:1]{index=1}

Esto implica:

- Transformar datos crudos  
- Generar nuevos atributos  
- Preparar la información para el análisis  

---

## Problema central

Los datos operacionales suelen estar correctamente almacenados, pero no necesariamente diseñados para el análisis.

Ejemplo:

- Nombre  
- Apellido  
- Dirección  
- Código Postal  
- País  

Desde una perspectiva transaccional, estos datos son válidos.  
Sin embargo, desde una perspectiva analítica:

- No existe un identificador claro (nombre completo)  
- La información está fragmentada  
- No facilita visualización ni interpretación  

👉 En otras palabras: **los datos existen, pero no responden preguntas de negocio** :contentReference[oaicite:2]{index=2}

---

## La transformación como solución

La transformación permite convertir datos fragmentados en información útil mediante la creación de nuevos atributos.

En esta sesión se trabajará con:

✔ Creación de columnas derivadas  
✔ Integración de atributos  
✔ Aplicación de lógica sobre los datos  

---

## Recurso principal

El taller se basa en el siguiente video:

**ETL Intermedio en SSIS: Transformación de Datos con Columnas Derivadas**  
https://youtu.be/aC-Aa-9fOXA

---

## Actividad práctica

Durante la sesión, los estudiantes deberán:

1. Revisar el flujo ETL implementado en la sesión anterior  
2. Incorporar una etapa de transformación en SSIS  
3. Utilizar el componente **Derived Column**  
4. Crear nuevos atributos a partir de datos existentes  

---

## Casos prácticos

### 1. Construcción de nombre completo

A partir de:

- Nombre  
- Apellido  

Se construye: $Nombre +$ " " $+ Apellido$


Resultado:

✔ Mejora la legibilidad  
✔ Facilita reportes  
✔ Evita cálculos en la capa de visualización  

---

### 2. Construcción de dirección completa

A partir de:

- Dirección  
- Código Postal  
- País  

Se construye:
$Dirección + ", " + Código Postal + ", " + País$


Resultado:

✔ Mejora interpretación  
✔ Permite segmentación  
✔ Reduce complejidad en dashboards  

---

## Aspectos técnicos relevantes

Durante el uso de columnas derivadas, SSIS gestiona automáticamente:

- Tipo de dato del nuevo atributo  
- Longitud de la columna  

Esto permite:

✔ Evitar errores de truncamiento  
✔ Mantener consistencia en el flujo de datos  

---

## Alcance

Este ejercicio incorpora por primera vez:

✔ Transformación de datos  
✔ Creación de atributos analíticos  
✔ Preparación para modelado dimensional  

---

## Relación con el curso

Esta sesión marca un punto de inflexión en el curso:

- Se pasa de mover datos → a diseñarlos para el análisis  
- Se prepara el terreno para el modelo dimensional  
- Se conecta directamente con el proyecto del curso  

Las decisiones tomadas en esta etapa impactarán en:

- Definición del hecho  
- Construcción de dimensiones  
- Calidad del modelo final  

---

## Archivos de la sesión

- `Semana5.md` → desarrollo conceptual de la clase  
- `Semana5.pdf` → material visual de apoyo  

---

## Pregunta guía

> ¿Cómo debo transformar los datos para que realmente aporten valor al análisis?

---

## Idea clave de la sesión

> "Una transformación de segundos en ETL puede ahorrar horas de complejidad en la capa de análisis"
