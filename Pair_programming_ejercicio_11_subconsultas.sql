USE tienda;

/*EJERCICIO 1:
Calcula el numero de clientes por cada ciudad.*/

SELECT city, COUNT(customer_number)
FROM customers
GROUP BY city;



/*EJERCICIO 2:
Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes.*/

SELECT city, MAX(customer_number)
FROM customers
GROUP BY city 






/*EJERCICIO 3:
Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las clientas asignadas a la ciudad con mayor numero de clientas.*/

/*EJERCICIO 4:
Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'*/

/*EJERCICIO 5:
Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no también una oficina de nuestra empresa para ello: Selecciona aquellas ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, sin repeticiones, que no tengan una oficina en dicha ciudad de la tabla offices.*/