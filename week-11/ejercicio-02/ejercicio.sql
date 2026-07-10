-- Semana 11: Subqueries
-- Ejercicio 02 - Solución de los bloques en orden

-- PASO 1: EXISTS — departamentos con empleados
-- Trae los departamentos que tienen al menos un trabajador activo mediante subquery correlacionada.
select name
from departments d
where exists (
     select 1
     from employees e
     where e.department_id = d.id
);


-- PASO 2: NOT EXISTS — departamentos sin empleados
-- Busca de manera segura los departamentos huérfanos que no tienen a nadie asignado.
select name as department_sin_empleados
from departments d
where not exists (
     select 1
     from employees e
     where e.department_id = d.id
);


-- PASO 3: Tabla derivada en FROM
-- Genera una tabla temporal en memoria con los promedios y luego filtra las áreas con más de 65.000.
select
     dept_stats.department,
     dept_stats.avg_salary
from (
     select
         d.name        as department,
         avg(e.salary) as avg_salary
     from employees   e
     inner join departments d on e.department_id = d.id
     group by d.name
) as dept_stats
where dept_stats.avg_salary > 65000
order by dept_stats.avg_salary desc;


-- PASO 4: JOIN con tabla derivada
-- Cruza la tabla física de empleados con el promedio acumulado por área de la subquery.
select
     e.first_name,
     e.salary,
     dept_avg.avg_salary as dept_avg_salary
from employees e
inner join (
     select
         department_id,
         avg(salary) as avg_salary
     from employees
     group by department_id
) as dept_avg on e.department_id = dept_avg.department_id
order by e.salary desc;