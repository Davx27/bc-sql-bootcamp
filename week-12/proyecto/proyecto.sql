-- Proyecto Semanal: CTEs y CASE WHEN en tu dominio
-- Semana 12
-- Aprendiz: David Alejandro Mendieta Aponte
-- Dominio: Distribuidora de alimentos

pragma foreign_keys = on;

drop table if exists deliveries;
drop table if exists products;

-- 1. Estructura de tablas
create table products (
    id integer primary key autoincrement,
    name text not null,
    price real not null check (price > 0),
    category text not null
);

create table deliveries (
    id integer primary key autoincrement,
    product_id integer not null references products (id),
    quantity integer not null default 1,
    tx_date text not null -- formato YYYY-MM-DD
);

-- 2. Inserción masiva de productos (80 filas mínimas exigidas con variación de precios para las bandas)
insert into products (name, category, price) values
('Leche Entera 1L', 'Lácteos', 4200), ('Queso Doble Crema', 'Lácteos', 12000), ('Yogurt Fresa', 'Lácteos', 3500), 
('Mantequilla 250g', 'Lácteos', 5000), ('Crema de Leche', 'Lácteos', 4500), ('Queso Campesino', 'Lácteos', 6500),
('Suero Costeño', 'Lácteos', 4800), ('Kumis Vaso', 'Lácteos', 1800), ('Leche Deslactosada', 'Lácteos', 4500), 
('Leche en Polvo', 'Lácteos', 14500),
('Arroz Blanco 1kg', 'Abarrotes', 3800), ('Frijol Bola Roja', 'Abarrotes', 8500), ('Lentejas 500g', 'Abarrotes', 4000), 
('Aceite Vegetal 1L', 'Abarrotes', 11000), ('Panela Cuadrada', 'Abarrotes', 3200), ('Pasta Spaghetti', 'Abarrotes', 2800), 
('Sal Refinada 1kg', 'Abarrotes', 1800), ('Azúcar Morena 1kg', 'Abarrotes', 3600), ('Café Molido 500g', 'Abarrotes', 14000), 
('Chocolate en Barra', 'Abarrotes', 5500), ('Harina de Maíz', 'Abarrotes', 3300), ('Harina de Trigo', 'Abarrotes', 3100),
('Garbanzo 500g', 'Abarrotes', 4800), ('Fécula de Maíz', 'Abarrotes', 2100), ('Polvo de Hornear', 'Abarrotes', 1900),
('Avena en Hojuelas', 'Abarrotes', 2900), ('Levadura Seca', 'Abarrotes', 2400), ('Cereal de Maíz Box', 'Abarrotes', 11500),
('Lenteja Importada', 'Abarrotes', 4300), ('Frijol Blanquillo', 'Abarrotes', 7900),
('Atún en Aceite', 'Enlatados', 6500), ('Sardinas en Tomate', 'Enlatados', 5200), ('Maíz Dulce Lata', 'Enlatados', 4100), 
('Arvejas con Zanahoria', 'Enlatados', 3900), ('Duraznos en Almíbar', 'Enlatados', 12500),
('Galletas Saltinas', 'Snacks', 2500), ('Papas Fritas Mega', 'Snacks', 4500), ('Platanitos Con Sal', 'Snacks', 2300),
('Saltinas Integral', 'Snacks', 2700), ('Tostadas de Trigo', 'Snacks', 3900), ('Maní Con Sal', 'Snacks', 1800), 
('Barra de Granola', 'Snacks', 1500),
('Refresco de Naranja 2L', 'Bebidas', 4800), ('Agua Mineral 500ml', 'Bebidas', 1500), ('Jugo de Caja 1L', 'Bebidas', 3800), 
('Gaseosa Cola 1.5L', 'Bebidas', 5200), ('Té Helado Botella', 'Bebidas', 2900), ('Agua Con Gas', 'Bebidas', 2400),
('Gaseosa Limón 2L', 'Bebidas', 4800), ('Jugo de Manzana', 'Bebidas', 3800),
('Detergente en Polvo', 'Aseo', 8900), ('Jabón de Loza', 'Aseo', 4200), ('Esponja de Brillo', 'Aseo', 1500), 
('Limpiapisos Lavanda', 'Aseo', 3500), ('Cloro Desinfectante', 'Aseo', 2800), ('Papel Higiénico 4ud', 'Aseo', 6500), 
('Servilletas Paquete', 'Aseo', 2200), ('Jabón de Baño x3', 'Aseo', 7500), ('Crema Dental', 'Aseo', 4800), 
('Champú Anticaspa', 'Aseo', 13500), ('Suavizante Ropa', 'Aseo', 7500), ('Desengrasante', 'Aseo', 5400),
('Salsa de Tomate Doypack', 'Salsas', 3900), ('Mayonesa Frasco', 'Salsas', 5400), ('Mostaza Tarro', 'Salsas', 2700),
('Salsa Soya', 'Salsas', 4100), ('Vinagre Blanco', 'Salsas', 2200), ('Salsa BBQ', 'Salsas', 5100),
('Mermelada Mora', 'Dulces', 4600), ('Arequipe 250g', 'Dulces', 3800), ('Gelatina en Polvo', 'Dulces', 1800),
('Chocolatina Jet x12', 'Dulces', 6000),
('Color en Polvo', 'Condimentos', 1200), ('Comino Molido', 'Condimentos', 1500), ('Pimienta Negra', 'Condimentos', 2500),
('Caldo de Gallina x12', 'Condimentos', 4200),
('Pan Tajado Molde', 'Panadería', 5500), ('Pan Hamburguesa x4', 'Panadería', 3800), ('Ponqué Casero', 'Panadería', 2500), 
('Bizcochos de Achira', 'Panadería', 3500);

-- 3. Inserción de entregas distribuidas en diferentes fechas
insert into deliveries (product_id, quantity, tx_date) values
(1, 10, '2026-07-01'), (2, 5, '2026-07-02'), (3, 12, '2026-07-02'), 
(4, 8, '2026-07-03'), (5, 15, '2026-07-04'), (11, 20, '2026-07-04'), 
(12, 10, '2026-07-05'), (13, 25, '2026-07-06'), (14, 6, '2026-07-06'), 
(15, 18, '2026-07-07'), (31, 30, '2026-07-07'), (32, 14, '2026-07-08'), 
(35, 5, '2026-07-08'), (43, 24, '2026-07-09'), (44, 50, '2026-07-09');


-- ============================================
-- CONSULTA 1: CTE simple + CASE WHEN de clasificación
-- CTE: Agrupa los productos y cuenta cuántos despachos han tenido.
-- Principal: Clasifica los productos por su precio unitario en tres bandas.
-- ============================================

with items_con_actividad as (
     select
         p.id,
         p.name,
         p.price,
         p.category,
         count(d.id) as total_transactions
     from products p
     left join deliveries d on d.product_id = p.id
     group by p.id, p.name, p.price, p.category
)
select
     name,
     price,
     total_transactions,
     case
         when price >= 8000 then 'Premium'
         when price >= 4000 then 'Estándar'
         else                    'Económico'
     end as price_band
from items_con_actividad
order by price desc;


-- ============================================
-- CONSULTA 2: Dos CTEs encadenados
-- Primer CTE: Agrega la cantidad total de artículos despachados por categoría.
-- Segundo CTE: Filtra las categorías que superan el promedio general de despachos.
-- Principal: Muestra los resultados finales apoyándose en el filtro del segundo CTE.
-- ============================================

with ventas_por_categoria as (
     select
         p.category,
         sum(d.quantity) as total_vendido
     from products p
     inner join deliveries d on d.product_id = p.id
     group by p.category
),
categorias_top as (
     select category
     from ventas_por_categoria
     where total_vendido > (select avg(total_vendido) from ventas_por_categoria)
)
select
     vc.category,
     vc.total_vendido
from ventas_por_categoria vc
where vc.category in (select category from categorias_top)
order by vc.total_vendido desc;


-- ============================================
-- CONSULTA 3: CTE + COUNT condicional por banda
-- CTE: Asigna a cada producto su respectiva banda salarial (clasificación).
-- Principal: Genera un conteo pivotado por categoría y banda utilizando agregación condicional.
-- ============================================

with clasificados as (
     select
         name,
         category,
         price,
         case
             when price >= 8000 then 'Premium'
             when price >= 4000 then 'Estándar'
             else                    'Económico'
         end as price_band
     from products
)
select
     category,
     count(case when price_band = 'Premium'   then 1 end) as premium_count,
     count(case when price_band = 'Estándar'  then 1 end) as estandar_count,
     count(case when price_band = 'Económico' then 1 end) as economico_count
from clasificados
group by category
order by category;