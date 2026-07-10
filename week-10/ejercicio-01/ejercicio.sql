-- Semana 10: CROSS JOIN
-- Ejercicio 01 - Solución de los bloques en orden

-- PASO 1: CROSS JOIN básico
-- Genera la combinación completa de cada departamento con cada nivel de cargo sin usar cláusula ON.
select
    d.name  as department,
    l.name  as level
from departments d
cross join job_levels l
order by d.name, l.rank;


-- PASO 2: Verificar el total de combinaciones
-- Valida el producto cartesiano total en la base de datos (debe dar 12 filas).
select count(*) as total_combinations
from departments d
cross join job_levels l;


-- PASO 3: Filtrar con WHERE
-- Hago el mismo cruce masivo pero aplicando un filtro para aislar solo lo que pertenece a Engineering.
select
    d.name  as department,
    l.name  as level
from departments  d
cross join job_levels l
where d.name = 'Engineering'
order by l.rank;


-- PASO 4: Grilla con salario base
-- Arma la matriz de sueldos estimados cruzando todos los departamentos con la columna base de los niveles.
select
    d.name          as department,
    l.name          as level,
    l.base_salary   as base_salary
from departments  d
cross join job_levels l
order by d.name, l.rank;