 CREATE SCHEMA `tienda_zapatillas`;
USE `tienda_zapatillas`;


-- Creacion tabla empleados

CREATE TABLE empleados( 
	id_empleado  INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	nombre VARCHAR(45) NOT NULL,
	tienda VARCHAR(45) NOT NULL, 
	salario INT, 
	fecha_incorporacion DATE NOT NULL
);

-- Creacion tabla clientes

CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	nombre VARCHAR(45) NOT NULL,
	numero_telefono INT NOT NULL,
	email VARCHAR(45) NOT NULL,
	direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45), 
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL
);

-- Creacion tabla zapatilla
CREATE TABLE zapatillas (
id_zapatilla INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
modelo VARCHAR(45) NOT NULL,
color VARCHAR(45) NOT NULL
);



-- Facturas relación con clientes, empleados y zapatillas 
CREATE TABLE facturas (
    id_factura INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
	id_zapatilla INT NOT NULL,
	id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_factura_zapatilla FOREIGN KEY(id_zapatilla)
        REFERENCES zapatillas (id_zapatilla)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_factura_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleados (id_empleado)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_factura_cliente FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- Correción errores tabla zapatillas
ALTER TABLE zapatillas
ADD COLUMN marca VARCHAR (45) NOT NULL,
ADD COLUMN talla INT NOT NULL;

-- Correción errores tabla empleados
ALTER TABLE empleados
MODIFY COLUMN salario FLOAT NOT NULL DEFAULT 0;

-- Correción errores tabla clientes
ALTER TABLE clientes
DROP COLUMN pais;

-- Correción errores tabla facturas
ALTER TABLE facturas
ADD COLUMN total FLOAT;

-- 2. INSRETAR DATOS EN TABLAS
-- Tabla zapatillas
INSERT INTO zapatillas (id_zapatilla, modelo, color, marca, talla)
VALUES (1, 'XQYUN', 'Negro', 'Nike', 42), 
		(2, 'UOPMN', 'Rosas', 'Nike', 39), 
		(3, 'OPNYT', 'Verdes', 'Adidas', 35);

-- Tabla empleados
INSERT INTO empleados (id_empleado, nombre, tienda, salario, fecha_incorporacion)
VALUES (1, 'Laura', 'Alcobendas', 25987, '2010-09-03'), 
		(2, 'María', 'Sevilla', DEFAULT,'2001-04-11'), 
        (3, 'Ester', 'Oviedo', 30165.98, '2000-11-29');
        
DELETE FROM empleados
WHERE salario IS NULL;


-- Tabla clientes
INSERT INTO clientes (id_cliente, nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
VALUES (1, 'Monica', '1234567289', 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', '28176'), 
		(2, 'Lorena', '289345678', 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', '12346'), 
        (3, 'Carmen', '298463759', 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', '23456');

-- Tabla facturas
INSERT INTO facturas (id_factura, numero_factura, fecha, id_zapatilla, id_empleado, id_cliente, total)
VALUES (1, '123', '2001-12-11', 1, 2, 1, 54.98), 
		(2, '1234', '2005-05-23', 1, 1, 3, 89.91), 
        (3, '12345', '2015-09-18', 2, 3, 3, 76.23);

-- 3. ACTUALIZACIÓN DE ERRORES
-- Tabla zapatillas
UPDATE zapatillas 
SET color = 'amarillo'
WHERE id_zapatilla = 2; 

-- Tabla empleados
UPDATE empleados 
SET tienda = 'A Coruña'
WHERE id_empleado = 1;

-- Tabla clientes
UPDATE clientes 
SET numero_telefono = '123456728'
WHERE id_cliente = 1;

-- Tabla facturas
UPDATE facturas 
SET total = 89.91
WHERE id_factura = 2;
	



	