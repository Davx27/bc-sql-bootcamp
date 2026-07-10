
-- PROYECTO SEMANAL: SELF JOIN en tu dominio
-- Semana 10 — CROSS JOIN y SELF JOIN
-- Aprendiz: David Alejandro Mendieta Aponte
-- Dominio: Distribuidora de alimentos

PRAGMA foreign_keys = ON;

-- Renombramos la tabla según el dominio: categories (categoría de productos)
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    name      TEXT    NOT NULL UNIQUE,
    details   TEXT, -- Columna específica de mi dominio para detallar la zona o tipo
    parent_id INTEGER REFERENCES categories (id)  -- auto-referencial
);

-- INSERCIÓN DE DATOS (Mínimo 80 filas con 3 niveles jerárquicos)

-- Nivel 1: Categorías Raíz (parent_id = NULL)
INSERT INTO categories (id, name, details, parent_id) VALUES 
(1, 'Lácteos y Refrigerados', 'Línea de frío obligatoria', NULL),
(2, 'Abarrotes y Granos', 'Almacenamiento seco general', NULL),
(3, 'Bebidas y Líquidos', 'Embotellados y paquetes de refrescos', NULL),
(4, 'Línea de Aseo y Hogar', 'Productos químicos y limpieza', NULL);

-- Nivel 2: Subcategorías (Hijos directos del Nivel 1)
INSERT INTO categories (id, name, details, parent_id) VALUES
(5, 'Leches Líquidas', 'Distribución diaria', 1),
(6, 'Quesos Madurados', 'Cavas de maduración', 1),
(7, 'Yogures y Kumis', 'Derivados fermentados', 1),
(8, 'Arroces y Cereales', 'Sacos y pacas', 2),
(9, 'Legumbres Secas', 'Granos al por mayor', 2),
(10, 'Pastas Alimenticias', 'Derivados del trigo', 2),
(11, 'Gaseosas y Sodas', 'Alta rotación', 3),
(12, 'Jugos y Néctares', 'Línea frutal', 3),
(13, 'Aguas Minerales', 'Presentaciones PET y vidrio', 3),
(14, 'Cuidado de Ropa', 'Detergentes y suavizantes', 4),
(15, 'Aseo de Superficies', 'Desinfectantes de pisos', 4);

-- Nivel 3: Productos Finales o Variantes (Nietos - Hijos del Nivel 2)
INSERT INTO categories (name, details, parent_id) VALUES
('Leche Entera 1L', 'Bolsa larga vida', 5),
('Leche Deslactosada 1L', 'Fácil digestión', 5),
('Leche Descremada 1L', 'Línea light', 5),
('Leche Entera Pack x6', 'Caja de cartón', 5),
('Queso Doble Crema Bloque', 'Presentación 1kg', 6),
('Queso Campesino Tajado', 'Paquete familiar', 6),
('Queso Parmesano Rallado', 'Sobre de 40g', 6),
('Queso Mozzarella Barra', 'Uso pizzería', 6),
('Yogurt de Fresa Vasito', 'Venta individual', 7),
('Yogurt de Mora Litro', 'Botella familiar', 7),
('Kumis Vaso Tradicional', 'Lácteo fermentado', 7),
('Yogurt de Melocotón 150g', 'Con trozos de fruta', 7),
('Arroz Blanco Premium 1kg', 'Grano seleccionado', 8),
('Arroz Integral Saco', 'Línea saludable', 8),
('Arroz Con Coco Bolsa', 'Especialidad caribeña', 8),
('Arroz Parbolizado 1kg', 'Precocido', 8),
('Frijol Bola Roja 500g', 'Grano nacional', 9),
('Lenteja Importada 500g', 'Canadiense', 9),
('Garbanzo Seleccionado 1kg', 'Alta calidad', 9),
('Frijol Blanquillo Bolsa', 'Grano tierno', 9),
('Pasta Spaghetti 500g', 'Tradicional', 10),
('Pasta Conchas Paquete', 'Para sopas', 10),
('Pasta Macarrones 250g', 'Para ensaladas', 10),
('Pasta Lasaña Caja', 'Láminas precocidas', 10),
('Gaseosa Cola 1.5L', 'Envase retornable', 11),
('Gaseosa Limón 2L', 'Mega familiar', 11),
('Gaseosa Naranja 350ml', 'Lata individual', 11),
('Gaseosa Uva 1.5L', 'Envase PET', 11),
('Jugo de Naranja Caja 1L', '100% natural', 12),
('Jugo de Mango Botella', 'Pulpa pasteurizada', 12),
('Néctar de Pera 250ml', 'Tetrapack infantil', 12),
('Jugo de Manzana 1L', 'Línea premium', 12),
('Agua Mineral Sin Gas 500ml', 'Manantial puro', 13),
('Agua Con Gas Litro', 'Alta gasificación', 13),
('Agua Saborizada Limón', 'Cero calorías', 13),
('Agua Mineral Con Gas 500ml', 'Botella de vidrio', 13),
('Detergente en Polvo 1kg', 'Multiusos ropa', 14),
('Suavizante de Ropa Aroma', 'Concentrado libre enjuague', 14),
('Jabón Azul en Barra', 'Para lavado a mano', 14),
('Detergente Líquido 3L', 'Para lavadora', 14),
('Limpiapisos Lavanda 1L', 'Aroma de larga duración', 15),
('Cloro Desinfectante Galón', 'Uso rudo sanidad', 15),
('Desengrasante de Cocina', 'Arranca grasa potente', 15),
('Limpia Vidrios Atomizador', 'Transparencia total', 15),
-- Filas de soporte para completar estrictamente los datos reales humanos
('Crema de Leche Bolsa', 'Repostería', 1),
('Mantequilla Con Sal 250g', 'Uso industrial', 1),
('Suero Costeño Tarro', 'Tradición costeña', 1),
('Avena en Hojuelas 500g', 'Desayunos', 2),
('Cereal de Maíz Azucarado', 'Caja grande', 2),
('Panela Cuadrada 1kg', 'Caja de 4 pastillas', 2),
('Chocolate en Barra Clásico', 'Para preparar con leche', 2),
('Café Molido Gourmet', 'Fuerte aroma', 2),
('Azúcar Morena Bolsa 1kg', 'Endulzante natural', 2),
('Sal Refinada Yodada', 'Alta pureza', 2),
('Harina de Maíz Precocida', 'Para arepas', 2),
('Harina de Trigo Tradicional', 'Panadería', 2),
('Atún en Aceite de Oliva', 'Premium enlatado', 2),
('Sardinas en Salsa de Tomate', 'Aperitivo listo', 2),
('Maíz Dulce Tierno', 'Lata para ensaladas', 2),
('Galletas Saltinas Taco', 'Acompañamiento', 2),
('Papas Fritas Onduladas', 'Snack familiar', 2),
('Platanitos Con Sal Crujientes', 'Pasabocas natural', 2),
('Té Helado Botella 500ml', 'Sabor limón', 3),
('Salsa de Tomate Doypack', 'Salsa de mesa', 2),
('Mayonesa Tradicional', 'Frasco plástico', 2),
('Mostaza Tipo Americana', 'Tarro dispensador', 2),
('Mermelada de Mora Frasco', 'Fruta natural', 2),
('Arequipe Casero 250g', 'Dulce de leche', 2),
('Jabón de Loza Líquido', 'Arranca grasa', 4),
('Esponja de Brillo Fibra', 'Pack por tres unidades', 4),
('Papel Higiénico Doble Hoja', 'Paquete de 4 rollos', 4),
('Servilletas Blancas Hogar', 'Paquete de 100 uds', 4),
('Jabón de Baño Cremoso', 'Cuidado de piel', 4),
('Crema Dental Protección', 'Anticaries familiar', 4),
('Champú Cuidado Intenso', 'Botella familiar', 4),
('Gelatina en Polvo Fresa', 'Postre rápido', 2),
('Tostadas de Trigo Integral', 'Línea de fibra', 2),
('Maní Salado Bolsa Pequeña', 'Snack de mostrador', 2);


-- CONSULTA 1: SELF JOIN básico (INNER JOIN)
-- Muestra el elemento clasificado (hij o) y la categoría de la que depende (padre).
SELECT
     child.name  AS item,
     parent.name AS parent_item
FROM categories child
INNER JOIN categories parent ON child.parent_id = parent.id;


-- CONSULTA 2: Incluir la raíz con LEFT JOIN
-- Muestra todo el catálogo, y etiqueta las categorías principales como 'Raíz'.
SELECT
     child.name                        AS item,
     COALESCE(parent.name, 'Raíz')     AS parent_item
FROM categories child
LEFT JOIN categories parent ON child.parent_id = parent.id
ORDER BY parent_item, item;


-- CONSULTA 3: Contar hijos por padre
-- Muestra cuántos elementos o productos dependen directamente de cada categoría.
SELECT
     parent.name   AS parent_item,
     COUNT(child.id) AS total_children
FROM categories parent
LEFT JOIN categories child ON child.parent_id = parent.id
GROUP BY parent.id, parent.name
HAVING COUNT(child.id) > 0
ORDER BY total_children DESC;


-- CONSULTA 4: Dos niveles jerárquicos
-- Reconstruye la cadena completa de distribución: Producto -> Subcategoría -> Línea Base.
SELECT
     child.name       AS item,
     parent.name      AS parent_item,
     grandparent.name AS grandparent_item
FROM categories child
LEFT JOIN categories parent      ON child.parent_id  = parent.id
LEFT JOIN categories grandparent ON parent.parent_id = grandparent.id
ORDER BY grandparent_item, parent_item, item;