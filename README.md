# Bootcamp SQL Developer - Repositorio de Evidencias

Repositorio de código y proyectos prácticos desarrollados durante el bootcamp de bases de datos relacionales y SQL.

## Perfil del Desarrollador
**David Alejandro Mendieta Aponte** * Tecnólogo en Análisis y Desarrollo de Software (ADSO) - SENA.
* Experiencia profesional actual en Disico S.A.

## Dominio de Negocio Asignado: Distribuidora de Alimentos
Para el componente práctico de este bootcamp, se implementa una base de datos relacional enfocada en la logística y gestión de una distribuidora de alimentos. El esquema principal está compuesto por las siguientes entidades:

* `products`: Catálogo de productos, categorías y precios.
* `clients`: Registro de clientes y asignación de zonas.
* `routes`: Rutas de distribución logística.
* `deliveries`: Movimientos, despachos y control de entregas.

## Stack Tecnológico

El proyecto está dividido en dos etapas tecnológicas progresivas:

* **Etapa 0 y 1 (Semanas 1-12):** `SQLite3`. Enfoque en fundamentos de SQL estándar, DDL, DML, operaciones de conjuntos (JOINs), y subconsultas.
* **Etapa 2 (Semanas 13-24):** `PostgreSQL 16` containerizado con `Docker`. Enfoque en SQL avanzado, funciones de ventana, transacciones ACID, optimización de consultas (EXPLAIN ANALYZE) y triggers.

## Estructura del Proyecto

Cada carpeta semanal sigue este patrón de estructuración:
* `/1-teoria`: Documentación y conceptos SQL.
* `/2-practicas`: Scripts de resolución de ejercicios guiados.
* `/3-proyecto`: Proyecto integrador semanal aplicado estrictamente al dominio de la Distribuidora de Alimentos.

## Instrucciones de Ejecución Local

**Para la fase actual (SQLite - Semanas 1 a 12):**
Ejecutar los scripts `.sql` de las carpetas `starter/` utilizando DB Browser for SQLite o la línea de comandos:
```bash
sqlite3 base_de_datos.db < ruta_del_archivo.sql

Para la fase avanzada (PostgreSQL - Semanas 13 en adelante):
Levantar los contenedores de Docker mediante el archivo de configuración proporcionado:

Bash
docker compose -f scripts/docker-compose.yml up -d