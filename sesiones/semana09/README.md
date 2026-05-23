# Semana 9 — Power Automate: Automatización e integración de datos

## Objetivo de la sesión

Comprender el funcionamiento de **Power Automate (Microsoft Flow)** como herramienta de integración de datos basada en eventos, analizando su rol dentro de un ecosistema de Business Intelligence y su relación con procesos ETL tradicionales.

---

## Material de la sesión

En esta sesión se trabajará con los siguientes videos del curso:

### 1. Creación de flujo con Twitter
https://youtu.be/e1dhPeX_re4  

En este video se muestra cómo construir un flujo automatizado que captura información desde Twitter en función de un criterio definido (texto o hashtag), almacenando los resultados en una hoja de cálculo.

---

### 2. Consumo de datos climáticos (MSN Weather)
https://youtu.be/4QJotbMffPU  

Este video presenta un flujo programado que consulta periódicamente datos climáticos desde un servicio externo, incorporando lógica condicional y generación de alertas.

---

## Conceptos clave

Durante esta sesión se abordarán los siguientes conceptos:

- Automatización de procesos
- Integración de datos basada en eventos
- Uso de conectores
- Triggers (disparadores)
- Acciones y lógica condicional (If/Else)
- Flujos programados vs automatizados
- Monitoreo y control de ejecución

---

## Power Automate en el contexto de BI

Power Automate permite diseñar procesos de integración de datos mediante un enfoque visual, basado en conectores y eventos. A diferencia de herramientas como **SSIS** o **Pentaho Data Integration**, que trabajan sobre procesos ETL estructurados, Power Automate se orienta a:

- capturar datos desde servicios externos en tiempo real  
- automatizar tareas repetitivas  
- integrar múltiples aplicaciones sin programación compleja  

Su uso es especialmente relevante en escenarios donde los datos provienen de:

- redes sociales  
- APIs  
- servicios en la nube  

---

## Análisis de los casos

### Caso 1: Twitter (flujo basado en eventos)

- El flujo se activa cuando ocurre un evento (nuevo tweet)
- Permite capturar datos no estructurados
- Puede integrarse con condiciones (filtros)
- Ejemplo típico de monitoreo de información en tiempo real

---

### Caso 2: Clima (flujo programado)

- El flujo se ejecuta cada cierto intervalo de tiempo
- Consume datos desde una API estructurada
- Aplica lógica de negocio (alertas por temperatura)
- Registra información histórica

---

## Conectores utilizados

Los videos permiten observar el uso de distintos conectores, entre ellos:

- Twitter  
- Gmail  
- Google Sheets  
- MSN Weather  

Estos conectores permiten integrar múltiples servicios dentro de un mismo flujo de trabajo.

---

## Limitaciones observadas

Si bien los ejemplos muestran procesos funcionales, presentan una limitación importante:

los datos son almacenados en archivos (Excel / Google Sheets)

En un entorno real de Business Intelligence, estos datos deberían ser almacenados en:

- bases de datos relacionales  
- data warehouses  
- data lakes  

---

## Conexión con el curso

Esta sesión se vincula directamente con los contenidos previamente revisados:

| Herramienta | Enfoque |
|------------|--------|
| SSIS | ETL estructurado |
| Pentaho (PDI) | Integración de datos |
| Power Automate | Automatización basada en eventos |

En las próximas sesiones, se trabajará en la adaptación de estos flujos para que los datos sean almacenados en **SQL Server**, integrando así los distintos enfoques revisados.

---

## Reflexión

Power Automate no reemplaza a herramientas ETL tradicionales, pero sí amplía las posibilidades de integración de datos, especialmente en entornos donde la información se genera de manera continua y distribuida.

---

## Próximo paso

Modificar los flujos desarrollados en esta sesión para:

- reemplazar almacenamiento en archivos  
- integrar datos en SQL Server  
- avanzar hacia una arquitectura de datos más robusta  

---
