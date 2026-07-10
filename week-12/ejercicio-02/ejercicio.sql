-- Semana 12: CTEs y CASE WHEN — Ejercicio 02
-- Ejecuta primero: setup.sql

-- PASO 1: CASE WHEN — banda salarial
-- Clasificamos a los empleados activos creando una nueva columna calculada según su salario.
select
    first_name,
    last_name,
    salary,
    case
        when salary >= 70000 then 'Alto'
        when salary >= 50000 then 'Medio'
        else                      'Bajo'
    end as salary_band
from employees
where is_active = 1
order by salary desc;


-- PASO 2: CASE simple — etiqueta corta del depto
-- Creamos un mapeo directo para cambiar el ID numérico del departamento por un texto corto.
select
    first_name,
    department_id,
    case department_id
        when 1 then 'Tech'
        when 2 then 'Mkt'
        when 3 then 'HR'
        else        'Otro'
    end as dept_short
from employees
order by department_id;


-- PASO 3: CASE WHEN con COUNT condicional
-- Agrupamos por departamento y usamos contadores condicionales para pivotar los datos en columnas.
select
    department_id,
    count(*) as total,
    count(case when salary >= 70000 then 1 end) as high_earners,
    count(case when salary between 50000 and 69999 then 1 end) as mid_earners,
    count(case when salary < 50000 then 1 end) as low_earners
from employees
where is_active = 1
group by department_id
order by department_id;


-- PASO 4: CTE con CASE WHEN — reporte por banda
-- Pre-procesamos la clasificación en memoria (CTE) y luego generamos un reporte agrupado por esa nueva categoría.
with clasificados as (
    select
        e.first_name,
        e.salary,
        d.name as department_name,
        case
            when e.salary >= 70000 then 'Alto'
            when e.salary >= 50000 then 'Medio'
            else                        'Bajo'
        end as salary_band
    from employees e
    inner join departments d on e.department_id = d.id
    where e.is_active = 1
)
select
    salary_band,
    count(*) as total,
    round(avg(salary), 2) as avg_salary
from clasificados
group by salary_band
order by avg_salary desc;