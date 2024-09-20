USE northwind;

/* 1.Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base 
de datos con la que podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. 
Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.*/

SELECT c.company_name, c.customer_id, COUNT(o.order_id) 
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE c.country = "UK"
GROUP BY c.customer_id, c.company_name;  -- es necesario agruparlo por que sino da error y nos avisa que hay que agrupar

/* 2. Desde Reino Unido han decidido pedirnos
 La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. 
 Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. 
 Para ello hará falta hacer 2 joins.*/


SELECT c.company_name,YEAR(o.order_date), SUM(od.quantity)
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
LEFT JOIN order_details AS od
ON o.order_id = od.order_id
WHERE c.country = "UK"
GROUP BY c.company_name, YEAR(o.order_date);



/* 3. Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido,
 desde la central nos han pedido una consulta que indique el nombre de cada compañia cliente junto con 
 cada pedido que han realizado y su fecha.*/
 
SELECT o.order_id, c.company_name, o.order_date
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;

/* 4.  Tipos de producto vendidos: Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías,
 nombre de la categoría y el nombre del producto, y el total de dinero por el que se ha vendido cada tipo de producto
 (teniendo en cuenta los descuentos). */

SELECT p.category_id, c.category_name, p.product_name,SUM(od.quantity * od.unit_price * (1 - od.Discount)) AS TotalMoney
FROM products AS p
LEFT JOIN categories AS c
ON  p.category_id = c.category_id
LEFT JOIN order_details AS od
ON p.product_id= od.product_id
GROUP BY  p.category_id, c.category_name, p.product_name ;

/*
Qué empresas tenemos en la BBDD Northwind:
Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva el nombre de todas las empresas cliente, los ID de sus pedidos y las fechas.
*/






