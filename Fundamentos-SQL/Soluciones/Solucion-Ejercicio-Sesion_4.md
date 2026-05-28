
# Solucionario — Sesión 4  
## Consultas SQL aplicadas

---

# Parte 1 — Consultas con filtros

## Ejercicio 1

Mostrar todos los estudiantes cuyo nombre comience con la letra “A”.

```sql
SELECT *
FROM estudiantes
WHERE nombre LIKE 'A%';
````

---

## Ejercicio 2

Mostrar todas las evaluaciones con notas entre 5.0 y 7.0.

```sql
SELECT *
FROM evaluaciones
WHERE nota BETWEEN 5.0 AND 7.0;
```

---

## Ejercicio 3

Mostrar carreras específicas.

```sql
SELECT *
FROM carreras
WHERE nombre_carrera IN ('Ingeniería de Datos',
                         'Analítica de Negocios');
```

---

## Ejercicio 4

Mostrar estudiantes que no poseen correo registrado.

```sql
SELECT *
FROM estudiantes
WHERE correo IS NULL;
```

> Nota: esta consulta solo funcionará si la tabla `estudiantes` posee una columna `correo`.

---

# Parte 2 — Consultas con ORDER BY

## Ejercicio 5

Mostrar evaluaciones ordenadas desde la nota más alta a la más baja.

```sql
SELECT *
FROM evaluaciones
ORDER BY nota DESC;
```

---

## Ejercicio 6

Mostrar matrículas ordenadas por año y semestre.

```sql
SELECT *
FROM matriculas
ORDER BY anio DESC,
         semestre ASC;
```

---

# Parte 3 — Consultas analíticas

## Ejercicio 7

Mostrar la cantidad de estudiantes por carrera.

```sql
SELECT c.nombre_carrera,
       COUNT(e.id_estudiante) AS total_estudiantes
FROM carreras c
LEFT JOIN estudiantes e
    ON c.id_carrera = e.id_carrera
GROUP BY c.nombre_carrera
ORDER BY total_estudiantes DESC;
```

---

## Ejercicio 8

Mostrar el promedio de notas por asignatura.

```sql
SELECT a.nombre_asignatura,
       AVG(ev.nota) AS promedio_notas
FROM asignaturas a
INNER JOIN matriculas m
    ON a.id_asignatura = m.id_asignatura
INNER JOIN evaluaciones ev
    ON m.id_matricula = ev.id_matricula
GROUP BY a.nombre_asignatura
ORDER BY promedio_notas DESC;
```

---

## Ejercicio 9

Mostrar la cantidad de asignaturas dictadas por cada docente.

```sql
SELECT d.nombre_docente,
       COUNT(a.id_asignatura) AS total_asignaturas
FROM docentes d
LEFT JOIN asignaturas a
    ON d.id_docente = a.id_docente
GROUP BY d.nombre_docente
ORDER BY total_asignaturas DESC;
```

---

# Parte 4 — Consultas aplicadas

## Ejercicio 10

Identificar estudiantes que aún no poseen evaluaciones registradas.

```sql
SELECT e.nombre AS estudiante,
       ev.id_evaluacion
FROM estudiantes e
LEFT JOIN matriculas m
    ON e.id_estudiante = m.id_estudiante
LEFT JOIN evaluaciones ev
    ON m.id_matricula = ev.id_matricula
WHERE ev.id_evaluacion IS NULL;
```

---

## Ejercicio 11

Mostrar estudiante, carrera, asignatura, docente y promedio de notas.

```sql
SELECT e.nombre AS estudiante,
       c.nombre_carrera AS carrera,
       a.nombre_asignatura AS asignatura,
       d.nombre_docente AS docente,
       AVG(ev.nota) AS promedio_notas
FROM estudiantes e
INNER JOIN carreras c
    ON e.id_carrera = c.id_carrera
INNER JOIN matriculas m
    ON e.id_estudiante = m.id_estudiante
INNER JOIN asignaturas a
    ON m.id_asignatura = a.id_asignatura
INNER JOIN docentes d
    ON a.id_docente = d.id_docente
LEFT JOIN evaluaciones ev
    ON m.id_matricula = ev.id_matricula
GROUP BY e.nombre,
         c.nombre_carrera,
         a.nombre_asignatura,
         d.nombre_docente
ORDER BY e.nombre,
         a.nombre_asignatura;
```

---

## Ejercicio 12

Reporte institucional por carrera.

```sql
SELECT c.nombre_carrera AS carrera,
       COUNT(DISTINCT e.id_estudiante) AS total_estudiantes,
       AVG(ev.nota) AS promedio_general_notas,
       COUNT(ev.id_evaluacion) AS total_evaluaciones
FROM carreras c
LEFT JOIN estudiantes e
    ON c.id_carrera = e.id_carrera
LEFT JOIN matriculas m
    ON e.id_estudiante = m.id_estudiante
LEFT JOIN evaluaciones ev
    ON m.id_matricula = ev.id_matricula
GROUP BY c.nombre_carrera
ORDER BY promedio_general_notas DESC;
```

---

# Consideraciones finales

* `LIKE` permite buscar patrones de texto.
* `BETWEEN` permite filtrar rangos.
* `IN` permite comparar contra varios valores.
* `IS NULL` permite detectar datos faltantes.
* `ORDER BY` permite organizar resultados.
* `JOIN` permite relacionar tablas.
* `GROUP BY` permite construir reportes resumidos.
* Las funciones de agregación permiten generar indicadores básicos.

---
