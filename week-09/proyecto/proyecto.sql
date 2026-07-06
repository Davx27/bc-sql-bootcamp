-- Proyecto de la Semana 09 - Distribuidora de Alimentos
-- Aprendiz: David Alejandro Mendieta Aponte

-- 1. Creación de las tablas base para la distribuidora
create table routes (
    id integer primary key autoincrement,
    name text not null,
    zone text not null
);

create table clients (
    id integer primary key autoincrement,
    name text not null,
    route_id integer,
    foreign key (route_id) references routes(id)
);

create table products (
    id integer primary key autoincrement,
    name text not null,
    category text not null,
    price real not null
);

create table deliveries (
    id integer primary key autoincrement,
    client_id integer,
    product_id integer,
    quantity integer not null,
    status text not null,
    delivery_date text default current_timestamp,
    foreign key (client_id) references clients(id),
    foreign key (product_id) references products(id)
);


-- 2. Inserción de datos de prueba para los reportes
insert into routes (name, zone) values 
('Ruta Bogotá Norte', 'Norte'), ('Ruta Bogotá Sur', 'Sur'),
('Ruta Occidente', 'Fontibón'), ('Ruta Oriente', 'Chapinero'),
('Ruta Respaldo Especial', 'Teusaquillo');

insert into clients (name, route_id) values
('Supermercado Éxito', 1), ('Tienda Don Pedro', 1), ('Kiosko Urbano', 1),
('Surtifruver del Sur', 2), ('Mercado Vecinal', 2), ('MiniMarket Express', 2),
('Distribuidora El Mono', 3), ('Tienda La Esquina', 3), ('Granos y Abarrotes', 4),
('Cliente Flotante Sin Ruta', null);

-- Meto bastantes productos para cumplir el mínimo de filas de la guía
insert into products (name, category, price) values
('Leche Entera 1L', 'Lácteos', 4200), ('Queso Doble Crema', 'Lácteos', 12000), ('Yogurt Fresa', 'Lácteos', 3500), ('Mantequilla 250g', 'Lácteos', 5000), ('Crema de Leche', 'Lácteos', 4500),
('Arroz Blanco 1kg', 'Abarrotes', 3800), ('Frijol Bola Roja', 'Abarrotes', 8500), ('Lentejas 500g', 'Abarrotes', 4000), ('Aceite Vegetal 1L', 'Abarrotes', 11000), ('Panela Cuadrada', 'Abarrotes', 3200),
('Pasta Spaghetti', 'Abarrotes', 2800), ('Sal Refinada 1kg', 'Abarrotes', 1800), ('Azúcar Morena 1kg', 'Abarrotes', 3600), ('Café Molido 500g', 'Abarrotes', 14000), ('Chocolate en Barra', 'Abarrotes', 5500),
('Atún en Aceite', 'Enlatados', 6500), ('Sardinas en Tomate', 'Enlatados', 5200), ('Maíz Dulce Lata', 'Enlatados', 4100), ('Arvejas con Zanahoria', 'Enlatados', 3900), ('Duraznos en Almíbar', 'Enlatados', 12500),
('Harina de Maíz', 'Abarrotes', 3300), ('Harina de Trigo', 'Abarrotes', 3100), ('Galletas Saltinas', 'Snacks', 2500), ('Papas Fritas Mega', 'Snacks', 4500), ('Platanitos Con Sal', 'Snacks', 2300),
('Refresco de Naranja 2L', 'Bebidas', 4800), ('Agua Mineral 500ml', 'Bebidas', 1500), ('Jugo de Caja 1L', 'Bebidas', 3800), ('Gaseosa Cola 1.5L', 'Bebidas', 5200), ('Té Helado Botella', 'Bebidas', 2900),
('Detergente en Polvo', 'Aseo', 8900), ('Jabón de Loza', 'Aseo', 4200), ('Esponja de Brillo', 'Aseo', 1500), ('Limpiapisos Lavanda', 'Aseo', 3500), ('Cloro Desinfectante', 'Aseo', 2800),
('Papel Higiénico 4ud', 'Aseo', 6500), ('Servilletas Paquete', 'Aseo', 2200), ('Jabón de Baño x3', 'Aseo', 7500), ('Crema Dental', 'Aseo', 4800), ('Champú Anticaspa', 'Aseo', 13500),
('Lenteja Importada', 'Abarrotes', 4300), ('Garbanzo 500g', 'Abarrotes', 4800), ('Salsa de Tomate Doypack', 'Salsas', 3900), ('Mayonesa Frasco', 'Salsas', 5400), ('Mostaza Tarro', 'Salsas', 2700),
('Mermelada Mora', 'Dulces', 4600), ('Arequipe 250g', 'Dulces', 3800), ('Gelatina en Polvo', 'Dulces', 1800), ('Avena en Hojuelas', 'Abarrotes', 2900), ('Cereal de Maíz Box', 'Abarrotes', 11500),
('Saltinas Integral', 'Snacks', 2700), ('Tostadas de Trigo', 'Snacks', 3900), ('Maní Con Sal', 'Snacks', 1800), ('Barra de Granola', 'Snacks', 1500), ('Chocolatina Jet x12', 'Dulces', 6000),
('Salsa Soya', 'Salsas', 4100), ('Vinagre Blanco', 'Salsas', 2200), ('Color en Polvo', 'Condimentos', 1200), ('Comino Molido', 'Condimentos', 1500), ('Pimienta Negra', 'Condimentos', 2500),
('Salchicha Paquete', 'Embutidos', 5800), ('Mortadela Familiar', 'Embutidos', 4900), ('Jamón de Cerdo', 'Embutidos', 8200), ('Chorizo Cóctel', 'Embutidos', 9500), ('Tocineta Ahumada', 'Embutidos', 11000),
('Pan Tajado Molde', 'Panadería', 5500), ('Pan Hamburguesa x4', 'Panadería', 3800), ('Ponqué Casero', 'Panadería', 2500), ('Tostadas Integrales', 'Panadería', 4200), ('Bizcochos de Achira', 'Panadería', 3500),
('Suero Costeño', 'Lácteos', 4800), ('Kumis Vaso', 'Lácteos', 1800), ('Quesito Campesino', 'Lácteos', 6500), ('Bebida de Almendras', 'Lácteos', 9800), ('Tofú Orgánico', 'Lácteos', 7500),
('Fécula de Maíz', 'Abarrotes', 2100), ('Polvo de Hornear', 'Abarrotes', 1900), ('Levadura Seca', 'Abarrotes', 2400), ('Caldo de Gallina x12', 'Condimentos', 4200), ('Salsa BBQ', 'Salsas', 5100);

insert into deliveries (client_id, product_id, quantity, status) values
(1, 1, 10, 'Entregado'), (1, 6, 5, 'Entregado'), (2, 2, 2, 'Entregado'),
(3, 11, 4, 'Pendiente'), (4, 16, 20, 'Entregado'), (5, 21, 12, 'Entregado'),
(6, 26, 8, 'Cancelado'), (7, 31, 3, 'Entregado'), (8, 36, 15, 'Entregado'),
(9, 41, 6, 'Pendiente'), (1, 46, 2, 'Entregado'), (2, 51, 7, 'Entregado');


-- 3. Consultas requeridas por la guía

-- Consulta 1: INNER JOIN principal
-- Cruzo las entregas con la tabla de productos para calcular el subtotal vendido por cada ítem.
select 
    d.id as delivery_id,
    p.name as product_name,
    p.category,
    d.quantity,
    (d.quantity * p.price) as total_sale,
    d.status
from deliveries d
inner join products p on d.product_id = p.id;


-- Consulta 2: JOIN con tres tablas
-- Uno entregas, clientes y productos para armar un reporte completo de los pedidos.
select 
    d.id as delivery_id,
    c.name as client_name,
    p.name as product_name,
    d.quantity,
    d.delivery_date
from deliveries d
inner join clients c on d.client_id = c.id
inner join products p on d.product_id = p.id;


-- Consulta 3: LEFT JOIN completo
-- Traigo todas las rutas de la distribuidora para revisar cuáles tienen clientes asociados y cuáles no.
select 
    r.id as route_id,
    r.name as route_name,
    r.zone,
    c.name as client_assigned
from routes r
left join clients c on r.id = c.route_id;


-- Consulta 4: Detectar registros huérfanos
-- Uso el filtro IS NULL sobre el ID del cliente para sacar solo las rutas logísticas que están vacías.
select 
    r.id as route_id,
    r.name as route_vacia,
    r.zone
from routes r
left join clients c on r.id = c.route_id
where c.id is null;


-- Consulta 5: Reporte agrupado con funciones de agregación
-- Agrupo por ruta y hago un COUNT para sacar el total de clientes por zona. Las vacías muestran 0.
select 
    r.name as route_name,
    r.zone,
    count(c.id) as total_clients_assigned
from routes r
left join clients c on r.id = c.route_id
group by r.id, r.name, r.zone
order by total_clients_assigned desc;