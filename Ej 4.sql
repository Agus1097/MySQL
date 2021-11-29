DROP DATABASE tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


# Lista el nombre de todos los productos que hay en la tabla producto
SELECT nombre FROM producto;

#Lista los nombres y los precios de todos los productos de la tabla producto
SELECT nombre, precio FROM producto;

# Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

# Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio AS 'DOLARES', round (precio*0.83) AS 'EUROS' FROM producto;

# Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SET sql_safe_UPDATES = 0;
UPDATE producto SET nombre = upper(nombre);

# Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante
SELECT nombre, upper(substring(nombre,1,2)) as 'dos letras' FROM fabricante;

# Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, round(precio) FROM producto;

#  Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, truncate(precio,0) FROM producto;

# Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT f.nombre, e.codigo_fabricante, e.nombre FROM producto e, fabricante f WHERE e.codigo_fabricante = f.codigo;

# Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrar los repetidos.
SELECT f.nombre, p.codigo_fabricante FROM producto p, fabricante f WHERE p.codigo_fabricante=f.codigo GROUP BY f.nombre;

# Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante WHERE nombre ORDER BY nombre;

#  Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto ORDER BY nombre asc, precio desc;

# Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;

#  Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio asc LIMIT 1;

#  Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio desc LIMIT 1;

#  Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT p.nombre, f.codigo FROM fabricante f, producto p WHERE p.codigo_fabricante = f.codigo and f.codigo =2;

#  Lista el nombre de los productos que tienen un precio menor o igual a $120.
SELECT nombre, precio FROM producto WHERE precio <= 120;

#  Lista todos los productos que tengan un precio entre $80 y $300. Sin utilizar el operador BETWEEN.
SELECT nombre FROM producto WHERE (precio > 80 and precio <300);

#ista todos los productos que tengan un precio entre $60 y $200. Utilizando el operador BETWEEN.
SELECT nombre, precio FROM producto WHERE precio BETWEEN 60 and 200;

#  Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT f.codigo, p.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND (p.codigo_fabricante = 1 or p.codigo_fabricante = 3 or p.codigo_fabricante=5);
SELECT * FROM producto WHERE codigo_fabricante = 1 or codigo_fabricante = 3 or codigo_fabricante = 5;

#  Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT codigo_fabricante, nombre FROM producto WHERE codigo_fabricante IN (1,3,5);

#  Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). 
SELECT nombre, precio, (precio*100) AS 'CENTIMOS' FROM producto;

#  Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante WHERE nombre LIKE '____';

#  Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre. 
SELECT nombre FROM producto WHERE nombre LIKE '%PORTÁTIL%';
SELECT nombre FROM fabricante WHERE length(nombre) = 4;

# Devuelve una lista con el nombre del producto, precio y nombre de fabricante de 
#todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo ORDER BY f.nombre asc;

#Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, 
#de todos los productos de la base de datos.
SELECT p.codigo AS 'CODIGO PRODUCTO', p.nombre AS 'NOMBRE PRODUCTO', f.codigo AS 'CODIGO FABRICANTE', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p, fabricante f 
WHERE p.codigo_fabricante=f.codigo;

# Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f  
WHERE p.codigo_fabricante=f.codigo ORDER BY p.precio ASC LIMIT 1;

# Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT p.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo and f.nombre LIKE 'LENOVO';

# Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que $200.
SELECT * FROM producto p, fabricante f where p.codigo_fabricante = f.codigo and f.nombre = "CRUCIAL" AND p.precio>200 ;

# Devuelve un listado con todos los productos de los fabricantes Asus, HewlettPackardy Seagate. Sin utilizar el operador IN
SELECT f.nombre, p.nombre FROM fabricante f, producto p WHERE p.codigo_fabricante= f.codigo and (f.nombre ='ASUS' or f.nombre ='HEWLETT-PACKARD' or f.nombre= 'SEAGATE');

#Devuelve un listado con todos los productos de los fabricantes Asus, HewlettPackardy Seagate. Utilizando el operador IN
SELECT p.nombre FROM fabricante f, producto p WHERE p.codigo_fabricante= f.codigo and f.nombre IN('ASUS','HEWLETT-PACKARD','SEAGATE');

#Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de
#todos los productos que tengan un precio mayor o igual a $180. Ordene el resultado
#en primer lugar por el precio (en orden descendente) y en segundo lugar por el
#nombre (en orden ascendente)
SELECT p.nombre, p.precio, f.nombre FROM fabricante f, producto p 
WHERE  p.codigo_fabricante= f.codigo and p.precio>=180 ORDER BY p.precio desc, p.nombre asc;

#Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN
# Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también
# aquellos fabricantes que no tienen productos asociados.
SELECT * FROM fabricante f LEFT JOIN producto p on p.codigo_fabricante= f.codigo;

# Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT * FROM fabricante f LEFT JOIN producto p on p.codigo_fabricante= f.codigo WHERE p.nombre is null;

#Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT f.nombre, p.* FROM producto p, fabricante f WHERE p.codigo_fabricante=f.codigo AND f.nombre like 'lenovo';

# Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto WHERE precio = (SELECT MAX(p.precio) FROM producto p, fabricante f WHERE p.codigo_fabricante=f.codigo AND f.nombre = 'Lenovo') AND codigo_fabricante !=2;

# Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre, MAX(p.precio), f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante=f.codigo AND f.nombre = 'Lenovo';

# Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT p.*, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo 
AND p.precio > (SELECT AVG(precio) FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre like 'Asus');

#Subconsultas con ALL y ANY
# Devuelve el producto más caro que existe en la tabla producto sin hacer uso de
#MAX, ORDER BY ni LIMIT.+
SELECT * FROM producto a WHERE a.precio >= ALL(SELECT b.precio FROM producto b);

# Devuelve el producto más barato que existe en la tabla producto sin hacer uso de
# MIN, ORDER BY ni LIMIT.
SELECT * FROM producto a WHERE a.precio <= ALL(SELECT b.precio FROM producto b);

# Devuelve los nombres de los fabricantes que tienen productos asociados.
#(Utilizando ALL o ANY).
SELECT nombre FROM fabricante WHERE codigo = ANY (SELECT codigo_fabricante FROM producto);

# Devuelve los nombres de los fabricantes que no tienen productos asociados.
#(Utilizando ALL o ANY).
SELECT nombre FROM fabricante WHERE codigo <> ALL (SELECT codigo_fabricante FROM producto);

#Subconsultas con IN y NOT IN
# Devuelve los nombres de los fabricantes que tienen productos asociados.
#(Utilizando IN o NOT IN).
SELECT nombre FROM fabricante WHERE codigo IN (SELECT codigo_fabricante FROM producto);

# Devuelve los nombres de los fabricantes que no tienen productos asociados.
#(Utilizando IN o NOT IN).
SELECT nombre FROM fabricante WHERE codigo NOT IN (SELECT codigo_fabricante FROM producto);

#Subconsultas con EXISTS y NOT EXISTS
# Devuelve los nombres de los fabricantes que tienen productos asociados.
#(Utilizando EXISTS o NOT EXISTS).
SELECT nombre FROM fabricante f 
WHERE EXISTS (SELECT codigo_fabricante FROM producto p WHERE p.codigo_fabricante=f.codigo);


#Devuelve los nombres de los fabricantes que no tienen productos asociados.
#(Utilizando EXISTS o NOT EXISTS).
SELECT nombre FROM fabricante f 
WHERE NOT EXISTS (SELECT codigo_fabricante FROM producto p WHERE p.codigo_fabricante=f.codigo);

#Subconsultas (En la cláusula HAVING) 
#Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo
#número de productos que el fabricante Lenovo.
SELECT f.nombre,count(p.nombre)  
FROM fabricante f ,producto p 
WHERE f.codigo = p.codigo_fabricante 
GROUP BY f.nombre
HAVING COUNT(p.nombre)=(SELECT COUNT(nombre) FROM producto WHERE codigo_fabricante=2);
