
# Solucionario — Sesión 3  
## Consultas relacionales y agregaciones

---

# Parte 1 — INNER JOIN

## Ejercicio 1

```sql
SELECT e.nombre,
       c.nombre_carrera
FROM estudiantes e
INNER JOIN carreras c
    ON e.id_carrera = c.id_carrera;
````

---

## Ejercicio 2

```sql
SELECT e.nombre,
       a.nombre_asignatura,
       m.semestre,
       m.anio
FROM estudiantes e
INNER JOIN matriculas m
    ON e.id_estudiante = m.id_estudiante
INNER JOIN asignaturas a
    ON m.id_asignatura = a.id_asignatura;
```

---

# Parte 2 — LEFT JOIN

## Ejercicio 3

```sql
SELECT a.nombre_asignatura,
       m.id_matricula
FROM asignaturas a
LEFT JOIN matriculas m
    ON a.id_asignatura = m.id_asignatura;
```

---

## Ejercicio 4

```sql
SELECT e.nombre,
       m.id_matricula
FROM estudiantes e
LEFT JOIN matriculas m
    ON e.id_estudiante = m.id_estudiante;
```

---

# Parte 3 — Alias

## Ejercicio 5

```sql
SELECT e.nombre,
       c.nombre_carrera
FROM estudiantes e
INNER JOIN carreras c
    ON e.id_carrera = c.id_carrera;
```

---

# Parte 4 — JOIN múltiples

## Ejercicio 6

```sql
SELECT e.nombre AS estudiante,
       c.nombre_carrera AS carrera,
       a.nombre_asignatura AS asignatura,
       d.nombre_docente AS docente
FROM estudiantes e
INNER JOIN carreras c
    ON e.id_carrera = c.id_carrera
INNER JOIN matriculas m
    ON e.id_estudiante = m.id_estudiante
INNER JOIN asignaturas a
    ON m.id_asignatura = a.id_asignatura
INNER JOIN docentes d
    ON a.id_docente = d.id_docente;
```

---

# Parte 5 — Funciones de agregación

## Ejercicio 7

```sql
SELECT COUNT(*) AS total_estudiantes
FROM estudiantes;
```

---

## Ejercicio 8

```sql
SELECT AVG(nota) AS promedio_general
FROM evaluaciones;
```

---

## Ejercicio 9

```sql
SELECT SUM(creditos) AS total_creditos
FROM asignaturas;
```

---

## Ejercicio 10

```sql
SELECT MAX(nota) AS nota_maxima,
       MIN(nota) AS nota_minima
FROM evaluaciones;
```

---

# Parte 6 — GROUP BY

## Ejercicio 11

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

## Ejercicio 12

```sql
SELECT m.id_matricula,
       AVG(ev.nota) AS promedio_notas
FROM matriculas m
LEFT JOIN evaluaciones ev
    ON m.id_matricula = ev.id_matricula
GROUP BY m.id_matricula
ORDER BY m.id_matricula;
```

---

## Ejercicio 13

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

## Ejercicio 14

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

# Consideraciones finales

* `INNER JOIN` muestra solo registros relacionados.
* `LEFT JOIN` permite conservar todos los registros de la tabla izquierda.
* Los alias facilitan la lectura de consultas extensas.
* Las funciones de agregación resumen información.
* `GROUP BY` permite agrupar registros por categorías.
* En consultas con agregaciones, toda columna que no esté dentro de una función debe incluirse en `GROUP BY`.
