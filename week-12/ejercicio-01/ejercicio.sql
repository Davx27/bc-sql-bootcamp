-- Semana 12: CTEs y CASE WHEN — Ejercicio 01
-- Ejecuta primero: setup.sql

-- PASO 1: CTE simple — empleados activos
-- Filtro los empleados activos en una tabla temporal (CTE) para luego listarlos ordenados por salario.
with activos as (
     select
         employee_id,
         first_name,
         last_name,
         salary,
         department_id
     from employees
     where is_active = 1
)
select first_name, last_name, salary
from activos
order by salary desc;


-- PASO 2: CTE con JOIN en la consulta principal
-- Preparo los empleados activos en el CTE y luego cruzo esa información limpia con los departamentos.
with activos as (
     select employee_id, first_name, salary, department_id
     from employees
     where is_active = 1
)
select
     a.first_name,
     d.name as department_name,
     a.salary
from activos a
inner join departments d on a.department_id = d.id
order by d.name, a.salary desc;


-- PASO 3: Dos CTEs encadenados
-- Pipeline de datos: calculo el promedio por depto, luego aislo los que superan 55k, y por último saco los empleados de esas áreas.
with promedios as (
     select
         department_id,
         avg(salary) as avg_sal
     from employees
     where is_active = 1
     group by department_id
),
deptos_premium as (
     select department_id
     from promedios
     where avg_sal > 55000
)
select
     e.first_name,
     e.salary
from employees e
where e.department_id in (select department_id from deptos_premium)
order by e.salary desc;


-- PASO 4: CTE que resume, consulta que filtra
-- Armo las métricas por departamento en memoria y aplico el umbral de cantidad de empleados en el select final.
with resumen_depto as (
     select
         d.name as department_name,
         count(e.employee_id) as total_employees,
         round(avg(e.salary), 2) as avg_salary
     from departments d
     left join employees e on e.department_id = d.id
     group by d.id, d.name
)
select department_name, total_employees, avg_salary
from resumen_depto
where total_employees >= 2
order by avg_salary desc;