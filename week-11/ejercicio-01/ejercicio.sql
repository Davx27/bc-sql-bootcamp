-- Semana 11: Subqueries
-- Ejercicio 01 - Solución de los bloques en orden

-- PASO 1: Subquery escalar en WHERE
-- Traigo los empleados cuyo salario supera la media global de la compañía.
select
     first_name,
     salary
from employees
where salary > (select avg(salary) from employees)
order by salary desc;


-- PASO 2: Subquery escalar en SELECT
-- Agrego el promedio global de la empresa como una columna calculada y redondeada en cada registro.
select
     first_name,
     salary,
     round((select avg(salary) from employees), 2) as company_avg
from employees
order by salary desc;


-- PASO 3: Filtrar con IN
-- Filtro el personal para obtener solo los que pertenecen a departamentos que están activos.
select
     first_name,
     department_id
from employees
where department_id in (
     select id
     from departments
     where is_active = 1
);


-- PASO 4: NOT IN con protección NULL
-- Saco los empleados de departamentos con presupuesto bajo, protegiendo la subconsulta de valores nulos.
select first_name
from employees
where department_id not in (
     select id
     from departments
     where budget > 100000
       and id is not null
);