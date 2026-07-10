-- Semana 10: SELF JOIN
-- Ejercicio 02 - Solución de los bloques en orden

-- PASO 1: SELF JOIN básico (INNER JOIN)
-- Relaciona la tabla de empleados consigo misma para traer cada trabajador con su jefe directo.
-- Nota: Excluye automáticamente al CEO por tener su manager_id en NULL.
select
     e.first_name  as employee,
     m.first_name  as manager
from employees e
inner join employees m on e.manager_id = m.id;


-- PASO 2: Incluir al CEO con LEFT JOIN + COALESCE
-- Cambiamos a LEFT JOIN para no perder al CEO y usamos COALESCE para ponerle la etiqueta directamente.
select
     e.first_name                   as employee,
     coalesce(m.first_name, 'CEO')  as manager
from employees  e
left join employees m on e.manager_id = m.id
order by manager, employee;


-- PASO 3: Contar reportes directos por manager
-- Agrupamos por los identificadores de los jefes para calcular cuánta gente tienen a cargo.
select
     m.first_name    as manager,
     count(e.id)     as direct_reports
from employees  m
left join employees e on e.manager_id = m.id
group by m.id, m.first_name
having count(e.id) > 0
order by direct_reports desc;


-- PASO 4: Jerarquía de dos niveles
-- Usamos tres alias de la misma tabla (e, m, gm) para mapear la cadena completa: empleado -> jefe -> jefe del jefe.
select
     e.first_name   as employee,
     m.first_name   as manager,
     gm.first_name  as grand_manager
from employees e
left join employees m  on e.manager_id = m.id
left join employees gm on m.manager_id = gm.id
order by gm.first_name, m.first_name, e.first_name;