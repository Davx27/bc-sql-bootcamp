- ¿El Paso 1 incluye solo departamentos con al menos un empleado?
Sí. La cláusula EXISTS actúa como un interruptor booleano (verdadero/falso). En cuanto la subconsulta encuentra la primera fila que coincide con el d.id, detiene la búsqueda para ese departamento y lo añade al resultado. Si el departamento no tiene a nadie, la subquery devuelve vacío y el departamento se descarta automáticamente.

- ¿El Paso 3 muestra solo departamentos con avg_salary > 65 000?
Sí. La tabla derivada dept_stats agrupa y calcula la media salarial completa de los departamentos en memoria. Una vez estructurada esa tabla temporal, la consulta externa aplica el filtro estricto WHERE dept_stats.avg_salary > 65000, bloqueando la salida de cualquier área que no cumpla con esa condición.