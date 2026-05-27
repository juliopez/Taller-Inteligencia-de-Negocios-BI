# Dataset — Productividad Científica Universitaria

Este directorio contiene los archivos CSV utilizados en el taller:

# De Excel a Power BI

## Evolucionando hacia el análisis visual e interactivo de datos

Los datasets simulan un escenario institucional de productividad científica universitaria y fueron diseñados para trabajar conceptos básicos de:

* modelos relacionales;
* visualización de datos;
* dashboards;
* y análisis interactivo en Power BI Desktop.

---

# Archivos incluidos

| Archivo            | Descripción                                                                  |
| ------------------ | ---------------------------------------------------------------------------- |
| Investigadores.csv | Información general de investigadores y académicos                           |
| Proyectos.csv      | Información relacionada con proyectos de investigación                       |
| Publicaciones.csv  | Registro de publicaciones científicas asociadas a investigadores y proyectos |

---

# Descripción de tablas y atributos

---

# 1. Investigadores.csv

Contiene información general de académicos e investigadores.

| Campo               | Descripción                          |
| ------------------- | ------------------------------------ |
| ID_Investigador     | Identificador único del investigador |
| Nombre_Investigador | Nombre completo del investigador     |
| Departamento        | Departamento académico asociado      |
| Categoria_Academica | Jerarquía o categoría académica      |
| Jornada             | Tipo de jornada contractual          |

---

# 2. Proyectos.csv

Contiene información relacionada con proyectos de investigación.

| Campo            | Descripción                          |
| ---------------- | ------------------------------------ |
| ID_Proyecto      | Identificador único del proyecto     |
| Nombre_Proyecto  | Nombre del proyecto de investigación |
| Tipo_Proyecto    | Tipo de financiamiento o proyecto    |
| Estado_Proyecto  | Estado actual del proyecto           |
| Monto_Adjudicado | Financiamiento adjudicado            |
| Año_Inicio       | Año de inicio del proyecto           |

---

# 3. Publicaciones.csv

Contiene información relacionada con publicaciones científicas.

| Campo              | Descripción                             |
| ------------------ | --------------------------------------- |
| ID_Publicacion     | Identificador único de la publicación   |
| Año_Publicacion    | Año de publicación                      |
| Titulo_Publicacion | Título de la publicación                |
| Tipo_Publicacion   | Tipo de publicación científica          |
| Revista_Evento     | Revista o evento asociado               |
| Indexacion         | Tipo de indexación                      |
| ID_Investigador    | Identificador del investigador asociado |
| ID_Proyecto        | Identificador del proyecto asociado     |

---

# Relaciones entre tablas

Las relaciones utilizadas en el modelo son las siguientes:

Publicaciones.ID_Investigador
→ Investigadores.ID_Investigador


Publicaciones.ID_Proyecto
→ Proyectos.ID_Proyecto

---

# Consideraciones del dataset

* Los datos fueron generados con fines educativos.
* El modelo simula un escenario universitario realista.
* Las relaciones fueron diseñadas para trabajar conceptos básicos de Business Intelligence.
* El dataset se encuentra preparado para ser utilizado directamente en Power BI Desktop.

---
