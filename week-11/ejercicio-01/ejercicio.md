Respuestas a la Verificación (Ejercicio 01 — Subqueries)
- ¿El Paso 1 excluye al CEO y a Carol (sueldo < promedio)?
A Carol sí la excluye, pero al CEO no. La subconsulta calcula el promedio salarial de toda la empresa. Como Carol gana menos que ese promedio, queda fuera del reporte de inmediato. En cambio, el CEO usualmente tiene el salario más alto de todos, por lo que supera el promedio con creces y sí aparece en el resultado (a menos que su salario estuviera en NULL, pero en estos talleres del SENA siempre viene con el sueldo más alto).

- ¿El Paso 3 excluye empleados del departamento inactivo?
Sí, los excluye por completo. La subquery interna genera una lista únicamente con los id de los departamentos que tienen is_active = 1. Al usar la condición WHERE department_id IN (...) en la consulta principal, cualquier empleado que pertenezca a un departamento con is_active = 0 (inactivo) es ignorado automáticamente y no sale en el listado.