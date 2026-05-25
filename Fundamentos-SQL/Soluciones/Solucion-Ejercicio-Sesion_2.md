
# Solucionario — Sesión 2  
## Actividad práctica CRUD sobre el modelo académico

## 1. Contexto

La universidad necesita comenzar a cargar y administrar información académica dentro del sistema. Para ello, se trabajará sobre el modelo académico implementado en Oracle APEX, utilizando operaciones básicas de SQL.

Las operaciones consideradas son:

- `INSERT`
- `SELECT`
- `WHERE`
- `ORDER BY`
- `UPDATE`
- `DELETE`

---

# Parte 1 — Inserción de datos

## 1.1 Insertar 2 carreras

```sql
INSERT INTO carreras (nombre_carrera, facultad)
VALUES ('Ingeniería Civil Informática', 'Facultad de Ingeniería');

INSERT INTO carreras (nombre_carrera, facultad)
VALUES ('Ingeniería Comercial', 'Facultad de Economía y Negocios');
````

## Verificación

```sql
SELECT *
FROM carreras;
```

---

## 1.2 Insertar 3 estudiantes

> Nota: los valores de `id_carrera` deben existir previamente en la tabla `carreras`.

```sql
INSERT INTO estudiantes (rut, nombre, edad, id_carrera)
VALUES ('21.111.111-1', 'Camila Torres', 24, 1);

INSERT INTO estudiantes (rut, nombre, edad, id_carrera)
VALUES ('22.222.222-2', 'Felipe González', 21, 1);

INSERT INTO estudiantes (rut, nombre, edad, id_carrera)
VALUES ('23.333.333-3', 'Daniela Rojas', 27, 2);
```

## Verificación

```sql
SELECT *
FROM estudiantes;
```

---

## 1.3 Insertar 2 asignaturas

> Nota: antes de insertar asignaturas debe existir al menos un docente registrado en la tabla `docentes`.

```sql
INSERT INTO docentes (nombre_docente, especialidad)
VALUES ('María López', 'Bases de Datos');

INSERT INTO docentes (nombre_docente, especialidad)
VALUES ('Carlos Muñoz', 'Business Intelligence');
```

```sql
INSERT INTO asignaturas (nombre_asignatura, creditos, id_docente)
VALUES ('Fundamentos de SQL', 4, 1);

INSERT INTO asignaturas (nombre_asignatura, creditos, id_docente)
VALUES ('Modelamiento de Datos', 5, 2);
```

## Verificación

```sql
SELECT *
FROM docentes;

SELECT *
FROM asignaturas;
```

---

## 1.4 Insertar 2 matrículas

> Nota: los valores de `id_estudiante` e `id_asignatura` deben existir previamente.

```sql
INSERT INTO matriculas (id_estudiante, id_asignatura, semestre, anio, estado)
VALUES (1, 1, 'Primer semestre', 2026, 'Activa');

INSERT INTO matriculas (id_estudiante, id_asignatura, semestre, anio, estado)
VALUES (2, 2, 'Primer semestre', 2026, 'Activa');
```

## Verificación

```sql
SELECT *
FROM matriculas;
```

---

# Parte 2 — Consultas

## 2.1 Consultar estudiantes mayores de 22 años

```sql
SELECT *
FROM estudiantes
WHERE edad > 22;
```

## Resultado esperado

La consulta debe mostrar estudiantes cuya edad sea superior a 22 años.

---

## 2.2 Consultar asignaturas ordenadas por nombre

```sql
SELECT *
FROM asignaturas
ORDER BY nombre_asignatura;
```

## Resultado esperado

La consulta debe mostrar las asignaturas ordenadas alfabéticamente según la columna `nombre_asignatura`.

---

## 2.3 Consultar matrículas del año 2026

```sql
SELECT *
FROM matriculas
WHERE anio = 2026;
```

## Resultado esperado

La consulta debe mostrar únicamente las matrículas correspondientes al año 2026.

---

# Parte 3 — Actualización de datos

## 3.1 Modificar la edad de un estudiante

```sql
UPDATE estudiantes
SET edad = 25
WHERE id_estudiante = 1;
```

## Verificación

```sql
SELECT *
FROM estudiantes
WHERE id_estudiante = 1;
```

## Resultado esperado

El estudiante con `id_estudiante = 1` debe aparecer con edad igual a 25.

---

## 3.2 Modificar el estado de una matrícula

```sql
UPDATE matriculas
SET estado = 'Finalizada'
WHERE id_matricula = 1;
```

## Verificación

```sql
SELECT *
FROM matriculas
WHERE id_matricula = 1;
```

## Resultado esperado

La matrícula con `id_matricula = 1` debe aparecer con estado `Finalizada`.

---

# Parte 4 — Eliminación de datos

## 4.1 Insertar una evaluación de prueba

Antes de eliminar una evaluación, se crea un registro de prueba.

```sql
INSERT INTO evaluaciones (id_matricula, nombre_evaluacion, nota, ponderacion)
VALUES (1, 'Evaluación de prueba', 5.5, 30);
```

## Verificación

```sql
SELECT *
FROM evaluaciones;
```

---

## 4.2 Eliminar una evaluación

```sql
DELETE FROM evaluaciones
WHERE nombre_evaluacion = 'Evaluación de prueba';
```

## Verificación

```sql
SELECT *
FROM evaluaciones
WHERE nombre_evaluacion = 'Evaluación de prueba';
```

## Resultado esperado

La consulta no debería devolver registros, ya que la evaluación fue eliminada.

---

## 4.3 Insertar una matrícula de prueba

Antes de eliminar una matrícula, se crea un registro de prueba.

```sql
INSERT INTO matriculas (id_estudiante, id_asignatura, semestre, anio, estado)
VALUES (3, 1, 'Primer semestre', 2026, 'Activa');
```

## Verificación

```sql
SELECT *
FROM matriculas;
```

---

## 4.4 Eliminar una matrícula específica

```sql
DELETE FROM matriculas
WHERE id_estudiante = 3
  AND id_asignatura = 1
  AND anio = 2026;
```

## Verificación

```sql
SELECT *
FROM matriculas
WHERE id_estudiante = 3
  AND id_asignatura = 1
  AND anio = 2026;
```

## Resultado esperado

La consulta no debería devolver registros, ya que la matrícula fue eliminada.

---

# Verificación final del modelo

Ejecute las siguientes consultas para revisar el estado final de las tablas principales:

```sql
SELECT *
FROM carreras;

SELECT *
FROM docentes;

SELECT *
FROM estudiantes;

SELECT *
FROM asignaturas;

SELECT *
FROM matriculas;

SELECT *
FROM evaluaciones;
```

---

# Consideraciones importantes

## Uso de claves foráneas

Al insertar datos en tablas relacionadas, primero deben existir los registros en las tablas principales.

Por ejemplo:

* antes de insertar estudiantes, deben existir carreras;
* antes de insertar asignaturas, deben existir docentes;
* antes de insertar matrículas, deben existir estudiantes y asignaturas;
* antes de insertar evaluaciones, deben existir matrículas.

---

## Cuidado con UPDATE y DELETE

Siempre se recomienda utilizar `WHERE` en operaciones de actualización y eliminación.

Ejemplo peligroso:

```sql
UPDATE estudiantes
SET edad = 25;
```

Esta instrucción modificaría la edad de todos los estudiantes.

Ejemplo peligroso:

```sql
DELETE FROM estudiantes;
```

Esta instrucción eliminaría todos los registros de la tabla `estudiantes`.

---

# Cierre

Esta actividad permite practicar las operaciones básicas de SQL sobre un modelo académico relacional. Estas operaciones son fundamentales para trabajar con bases de datos estructuradas y constituyen la base para consultas más avanzadas, análisis de datos y procesos de Business Intelligence.
