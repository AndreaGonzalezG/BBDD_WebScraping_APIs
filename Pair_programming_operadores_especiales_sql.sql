USE northwind;


SELECT  'Hola!'  AS tipo_nombre
FROM customers;




/*1. Ciudades que empiezan con "A" o "B".
Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias que están afincadas en ciudades 
que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañia y el nombre de contacto. */


SELECT city, company_name, contact_name
FROM  customers
WHERE city LIKE 'A%' OR  city lIKE 'B%';


/* 2.  Número de pedidos que han hecho en las ciudades que empiezan con L.
En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos que han hecho todas las ciudades que empiezan por "L".
 */
 
 SELECT c.city, c.company_name, c.contact_name,
		(SELECT COUNT(o.order_id) 
        FROM orders AS o 
        WHERE o.customer_id = c.customer_id) AS total_orders
FROM customers AS c
WHERE c.city LIKE 'L%' 
GROUP BY c.city, c.company_name, c.contact_name, total_orders;

/* 3. Todos los clientes cuyo "country" no incluya "USA".
Nuestro objetivo es extraer los clientes que no sean de USA. Extraer el nombre de contacto, su pais y el nombre de la compañia. */

SELECT country, company_name, contact_name
FROM customers
WHERE country NOT IN ('USA');


/* 4. Todos los clientes que no tengan una "A" en segunda posición en su nombre.
Devolved unicamente el nombre de contacto. */


SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE '_A%';



