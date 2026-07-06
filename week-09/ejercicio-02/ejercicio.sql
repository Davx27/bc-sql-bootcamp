-- Semana 09: LEFT JOIN
-- Ejercicio 02 — Descomenta cada bloque en orden

-- PASO 1: LEFT JOIN básico

-- Todos los departamentos, con o sin empleados
-- Los departamentos sin empleados aparecerán con NULL en la columna employee.
SELECT
    d.name        AS department,
    e.first_name  AS employee
FROM departments d
LEFT JOIN employees e ON e.department_id = d.id;


-- PASO 2: Detectar "departamentos huérfanos"

-- Ver solo los departamentos que no tienen ningún empleado asignado
SELECT
    d.name AS department_sin_empleados
FROM departments d
LEFT JOIN employees e ON e.department_id = d.id
WHERE e.id IS NULL;


-- PASO 3: Contar empleados por departamento

-- Con COUNT(e.id) los departamentos vacíos muestran 0 correctamente en lugar de 1.
SELECT
    d.name          AS department,
    COUNT(e.id)     AS total_employees
FROM departments d
LEFT JOIN employees e ON e.department_id = d.id
GROUP BY d.name
ORDER BY total_employees DESC;


-- PASO 4: LEFT JOIN + tres tablas + condición

-- Departamentos con su ubicación y cantidad de empleados activos
-- Nota: La condición de actividad va en el ON del JOIN para mantener los departamentos vacíos en el resultado.
SELECT
    d.name          AS department,
    l.name          AS location,
    COUNT(e.id)     AS active_employees
FROM departments  d
LEFT JOIN locations   l ON d.location_id   = l.id
LEFT JOIN employees   e ON e.department_id = d.id
                        AND e.is_active    = 1
GROUP BY d.name, l.name
ORDER BY active_employees DESC;