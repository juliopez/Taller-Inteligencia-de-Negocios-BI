# Guía de Implementación del Modelo Académico en Oracle APEX

## Taller Fundamentos SQL

Esta guía tiene como propósito orientar la implementación del modelo académico en Oracle APEX. Este modelo será utilizado durante la Sesión 2 del taller para desarrollar consultas SQL básicas y operaciones de manipulación de datos.

> Si necesita soporte para trabajar en Orcale APEX se recomienda ver el  siguiente video: https://youtu.be/le0TFfD1DtA

---

## 1. Objetivo de la actividad

Implementar en Oracle APEX el modelo relacional académico trabajado durante la Sesión 1.

Al finalizar esta actividad, cada estudiante deberá contar con las siguientes tablas creadas en su entorno de trabajo:

- `ASIGNATURAS`
- `CARRERAS`
- `DOCENTES`
- `ESTUDIANTES`
- `EVALUACIONES`
- `MATRICULAS`

Estas tablas serán utilizadas posteriormente para ejecutar instrucciones SQL como:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `INSERT`
- `UPDATE`
- `DELETE`

---

## 2. Requisitos previos

Antes de comenzar, debe contar con:

- acceso a Oracle APEX;
- usuario y contraseña de ingreso;
- acceso al repositorio GitHub del taller;
- archivo SQL de creación del modelo académico.

Archivo requerido:

```text
01_creacion_modelo_academico.sql
````

---

## 3. Acceso a Oracle APEX

Ingrese a Oracle APEX desde el navegador web:

```text
https://apex.oracle.com/
```

Luego complete los datos solicitados:

* Workspace
* Username
* Password

Finalmente, haga clic en:

```text
Sign In
```

---

## 4. Ingresar a SQL Workshop

Una vez dentro de Oracle APEX, diríjase al menú principal y seleccione:

```text
SQL Workshop
```

Luego ingrese a:

```text
SQL Scripts
```

Esta sección permite crear, guardar y ejecutar scripts SQL dentro del entorno Oracle APEX.

---

## 5. Crear un nuevo script SQL

Dentro de `SQL Scripts`, seleccione la opción:

```text
Create
```

Asigne el siguiente nombre al script:

```text
01_creacion_modelo_academico
```

Luego copie el contenido del archivo:

```text
01_creacion_modelo_academico.sql
```

y péguelo en el editor de scripts.

---

## 6. Ejecutar el script

Una vez pegado el contenido del archivo SQL, guarde el script y ejecútelo utilizando la opción:

```text
Run
```

Oracle APEX procesará las instrucciones SQL y creará las tablas correspondientes al modelo académico.

---

## 7. Verificar la ejecución del script

Después de ejecutar el script, revise el resultado de ejecución.

El estado esperado es:

```text
Complete
```

Además, las sentencias del script deberían aparecer como ejecutadas correctamente.

Si aparece un error, revise:

* si el script fue copiado completamente;
* si ya existían tablas con el mismo nombre;
* si se ejecutó el script en el workspace correcto;
* si faltó alguna línea del archivo SQL.

---

## 8. Verificar las tablas creadas

Para confirmar que el modelo fue implementado correctamente, ingrese a:

```text
SQL Workshop → Object Browser → Tables
```

Debe visualizar las siguientes tablas:

* `ASIGNATURAS`
* `CARRERAS`
* `DOCENTES`
* `ESTUDIANTES`
* `EVALUACIONES`
* `MATRICULAS`

Si las tablas aparecen en el panel izquierdo de `Object Browser`, la implementación fue realizada correctamente.

---

## 9. Consulta de verificación

Como comprobación adicional, puede ingresar a:

```text
SQL Workshop → SQL Commands
```

y ejecutar la siguiente consulta:

```sql
SELECT table_name
FROM user_tables
WHERE table_name IN (
    'ASIGNATURAS',
    'CARRERAS',
    'DOCENTES',
    'ESTUDIANTES',
    'EVALUACIONES',
    'MATRICULAS'
)
ORDER BY table_name;
```

El resultado esperado debe mostrar las seis tablas del modelo académico.

---

## 10. Revisión del modelo implementado

El modelo académico considera las siguientes relaciones principales:

* una carrera puede tener muchos estudiantes;
* un docente puede dictar muchas asignaturas;
* un estudiante puede registrar muchas matrículas;
* una asignatura puede estar asociada a muchas matrículas;
* una matrícula puede tener muchas evaluaciones.

Estas relaciones permiten representar un sistema académico básico y serán utilizadas para practicar consultas SQL durante las siguientes sesiones.

---

## 11. Resultado esperado de la actividad

Al finalizar esta actividad, cada estudiante debe contar con:

* el modelo académico implementado en Oracle APEX;
* las seis tablas creadas correctamente;
* acceso al `Object Browser`;
* capacidad de ejecutar consultas SQL sobre el modelo.

---

## 12. Importante para la Sesión 2

Durante la Sesión 2 se trabajará directamente sobre este modelo académico.

Por esta razón, es importante que cada estudiante complete esta actividad antes de la próxima clase.

En la Sesión 2 se desarrollarán ejercicios asociados a:

* consulta de datos;
* inserción de registros;
* actualización de información;
* eliminación controlada de datos;
* revisión de resultados mediante SQL.

---

## 13. Problemas frecuentes

### El script muestra error porque la tabla ya existe

Si aparece un mensaje indicando que una tabla ya existe, significa que el modelo fue creado previamente.

En ese caso, no es necesario volver a ejecutar el script, salvo que el docente indique lo contrario.

---

### No aparecen todas las tablas

Revise si el script fue copiado completamente y vuelva a ejecutarlo desde `SQL Scripts`.

---

### No encuentro SQL Workshop

Verifique que ingresó correctamente al workspace de Oracle APEX. El menú `SQL Workshop` debe aparecer dentro del entorno principal.

---

### No puedo ejecutar el script

Revise que tenga permisos dentro del workspace y que esté utilizando el usuario correcto.

---

## 14. Cierre

Esta actividad permite pasar desde el diseño conceptual del modelo relacional hacia su implementación física en una base de datos Oracle.

El modelo implementado será la base de trabajo para las actividades prácticas de SQL del taller.

