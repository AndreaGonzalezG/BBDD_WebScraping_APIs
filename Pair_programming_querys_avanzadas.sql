USE northwind;
-- 1 Piden conocer el precio de los productos que tienen el precio más alto y más bajo. 
-- Dales el alias lowestPrice y highestPrice.

SELECT MIN(unit_price) AS lowestPrice, MAX(unit_price) AS highestPrice
FROM order_details;

-- 2 . Conociendo el numero de productos y su precio medio: diseñemos otra consulta para conocer :
-- el número de productos y el precio medio de todos ellos (en general, no por cada producto).

SELECT COUNT(product_id), AVG (unit_price) 
FROM order_details;

-- 3 Sacad la máxima y mínima carga de los pedidos de UK: consulta que devuelva la máxima y mínima cantidad de carga para un pedido (freight) enviado a Reino Unido (United Kingdom).

SELECT MAX(freight) AS MaximaCarga_UK, MIN(freight) AS MinimaCarga_UK
FROM orders
WHERE ship_country = 'UK';


-- 4 Qué productos se venden por encima del precio medio:
--  desde el departamento de Ventas quieren conocer qué productos en concreto se venden por encima del precio medio para todos los productos de la empresa
--  También quieren que ordenemos los resultados por su precio de mayor a menor.
-- OPCION 1
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products)
ORDER BY unit_price DESC;

-- OPCION 2
SELECT product_id, AVG(unit_price) AS precio_medio_de_productos
FROM products
GROUP BY product_id
HAVING AVG(unit_price) > (SELECT AVG(unit_price) FROM products);


-- Qué productos se han descontinuado: 
-- Consulta para conocer el número de productos que se han descontinuado. 
-- El atributo Discontinued es un booleano: si es igual a 1 el producto ha sido descontinuado.

SELECT discontinued AS productos_discontinued
FROM products
WHERE discontinued = 1;

-- 6. Adicionalmente nos piden detalles de aquellos productos no descontinuados,
-- sobre todo el ProductID y ProductName. 
-- Como puede que salgan demasiados resultados, nos piden que los limitemos a los 10 con ID más elevado, que serán los más recientes. 
-- No nos pueden decir del departamento si habrá pocos o muchos resultados, pero lo limitamos por si acaso.

SELECT product_id, product_name, discontinued
FROM products 
ORDER BY product_id DESC 
LIMIT 10;

-- 7 . SACA número de pedidos y la máxima cantidad de carga de entre los mismos (freight) que han sido enviados por cada empleado 
-- (mostrando el ID de empleado en cada caso).


SELECT employee_id,                  -- ID del empleado que realizó los envíos
       COUNT(order_id) AS num_pedidos,  -- Número de pedidos enviados por el empleado
       MAX(freight) AS max_freight     -- Máxima cantidad de carga de entre esos pedidos
FROM orders
GROUP BY employee_id;                 -- Agrupa por ID de empleado




