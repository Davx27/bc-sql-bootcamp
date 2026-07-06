**Verificación**


- ¿El Paso 1 devuelve filas solo para empleados con departamento asignado?
Sí. Al usar INNER JOIN, si un empleado tiene el campo department_id vacío (NULL) o con un ID que no existe en la tabla departments, ese registro es completamente excluido del resultado.

- ¿El Paso 4 muestra el país de cada empleado?
Sí. Se logra encadenando el segundo INNER JOIN con la tabla locations, lo que permite acceder a la columna l.country usando el puente del departamento.

