CREATE DATABASE personal;

USE personal;

CREATE TABLE departamentos (
idDepto INT NOT NULL PRIMARY KEY, 
  nombreDpto VARCHAR(20) NOT NULL,
  ciudad VARCHAR(15) NULL,
  codDirector VARCHAR(12) NULL
);


CREATE TABLE empleados (
  idEmp INT NOT NULL PRIMARY KEY,
  nombre CHAR(30) NOT NULL,
  sexemp CHAR(1) NOT NULL,
  fecNac DATE NOT NULL,
  fecIncorporacion DATE NOT NULL,
  salEmp FLOAT NOT NULL,
  comisionE FLOAT NOT NULL,
  cargoE VARCHAR(15) NOT NULL,
  codJefe VARCHAR(12) NULL,  
  idDepto INT NOT NULL,
  FOREIGN KEY (idDepto) REFERENCES departamentos(idDepto)
  );


############### INSERTAR DATOS DEPARTAMENTOS ########################

INSERT INTO `departamentos` VALUES (1000,'GERENCIA','CIUDAD REAL','31.840.269');
INSERT INTO `departamentos` VALUES (1500,'PRODUCCIÓN','CIUDAD REAL','16.211.383');
INSERT INTO `departamentos` VALUES (2000,'VENTAS','CIUDAD REAL','31.178.144');
INSERT INTO `departamentos` VALUES (2100,'VENTAS','BARCELONA','16.211.383');
INSERT INTO `departamentos` VALUES (2200,'VENTAS','VALENCIA','16.211.383');
INSERT INTO `departamentos` VALUES (2300,'VENTAS','MADRID','16.759.060');
INSERT INTO `departamentos` VALUES (3000,'INVESTIGACIÓN','CIUDAD REAL','16.759.060');
INSERT INTO `departamentos` VALUES (3500,'MERCADEO','CIUDAD REAL','22.222.222');
INSERT INTO `departamentos` VALUES (4000,'MANTENIMIENTO','CIUDAD REAL','333.333.333');
INSERT INTO `departamentos` VALUES (4100,'MANTENIMIENTO','BARCELONA','16.759.060');
INSERT INTO `departamentos` VALUES (4200,'MANTENIMIENTO','VALENCIA','16.759.060');
INSERT INTO `departamentos` VALUES (4300,'MANTENIMIENTO','MADRID','16.759.060');

############### INSERTAR DATOS EMPLEADOS ########################

INSERT INTO `empleados` VALUES (222,'José Giraldo','M','1985-01-20','2000-11-01',1200000,400000,'Asesor','22.222.222',3500);
INSERT INTO `empleados` VALUES (333,'Pedro Blanco','M','1987-10-28','2000-10-01',800000,3000000,'Vendedor','31.178.144',2000);
INSERT INTO `empleados` VALUES (444,'Jesús Alfonso','M','1988-03-14','2000-10-01',800000,3500000,'Vendedor','31.178.144',2000);
INSERT INTO `empleados` VALUES (555,'Julián Mora','M','1989-07-03','2000-10-01',800000,3100000,'Vendedor','31.178.144',2200);
INSERT INTO `empleados` VALUES (666,'Manuel Millán','M','1990-12-08','2004-06-01',800000,3700000,'Vendedor','31.178.144',2300);
INSERT INTO `empleados` VALUES (777,'Marcos Cortez','M','1986-06-23','2000-04-16',2550000,500000,'Mecánico','333.333.333',4000);
INSERT INTO `empleados` VALUES (782,'Antonio Gil','M','1980-01-23','2010-04-16',850000,1500000,'Técnico','16.211.383',1500);
INSERT INTO `empleados` VALUES (219,'Melissa Roa','F','1960-06-19','2001-03-16',2250000,2500000,'Vendedor','31.178.144',2100);
INSERT INTO `empleados` VALUES (111,'Irene Díaz','F','1979-09-28','2004-06-01',1050000,200000,'Mecánico','333.333.333',4200);
INSERT INTO `empleados` VALUES (383,'Luis Pérez','M','1956-02-25','2000-01-01',5050000,0,'Director','31.840.269',1500);
INSERT INTO `empleados` VALUES (060,'Darío Casas','M','1960-04-05','1992-11-01',4500000,500000,'Investigador','31.840.269',3000);
INSERT INTO `empleados` VALUES (802,'William Daza','M','1982-10-09','1999-12-16',2250000,1000000,'Investigador','16.759.060',3000);
INSERT INTO `empleados` VALUES (221,'Carla López','F','1975-05-11','2005-07-16',4500000,500000,'Jefe Mercadeo','31.840.269',3500);
INSERT INTO `empleados` VALUES (331,'Carlos Rozo','M','1975-05-11','2001-09-16',750000,500000,'Vigilante','31.840.269',3500);
INSERT INTO `empleados` VALUES (099,'Diana Solarte','F','1957-11-19','1990-05-16',1250000,500000,'Secretaria','31.840.269',1000);
INSERT INTO `empleados` VALUES (144,'Rosa Angulo','F','1957-03-15','1998-08-16',3250000,3500000,'Jefe Ventas','31.840.269',2000);
INSERT INTO `empleados` VALUES (269,'María Rojas','F','1959-01-15','1990-05-16',6250000,1500000,'Gerente',NULL,1000);
INSERT INTO `empleados` VALUES (343,'Elisa Rojas','F','1979-09-28','2004-06-01',3000000,1000000,'Jefe Mecánicos','31.840.269',4000);
INSERT INTO `empleados` VALUES (334,'Marisol Pulido','F','1979-10-01','1990-05-16',3250000,1000000,'Investigador','16.759.060',3000);
INSERT INTO `empleados` VALUES (335,'Ana Moreno','F','1992-01-05','2004-06-01',1200000,400000,'Secretaria','16.759.060',3000);
INSERT INTO `empleados` VALUES (336,'Carolina Ríos','F','1992-02-15','2000-10-01',1250000,500000,'Secretaria','16.211.383',1500);
INSERT INTO `empleados` VALUES (337,'Edith Muñoz','F','1992-03-31','2000-10-01',800000,3600000,'Vendedor','31.178.144',2100);
INSERT INTO `empleados` VALUES (338,'Abel Gómez','M','1939-12-24','2000-10-01',1050000,200000,'Mecánico','333.333.333',4300);
INSERT INTO `empleados` VALUES (689,'Mario Llano','M','1945-08-30','1990-05-16',2250000,2500000,'Vendedor','31.178.144',2300);
INSERT INTO `empleados` VALUES (785,'Joaquín Rosas','M','1947-07-07','1990-05-16',2250000,2500000,'Vendedor','31.178.144',2200);
INSERT INTO `empleados` VALUES (898,'Iván Duarte','M','1955-08-12','1998-05-16',1050000,200000,'Mecánico','333.333.333',4100);

# OBTENER DATOS EMPLEADOS Y DEPARTAMENTOS
SELECT * FROM empleados;
SELECT * FROM departamentos;
# Obtener los datos de los empleados cuyo cargo sea ‘Secretaria'
SELECT * FROM empleados WHERE cargoE LIKE 'Secretaria';
# Obtener el nombre y salario de todos los empleados
SELECT nombre, salEmp FROM empleados;
# Obtener los datos de los empleados vendedores, ordenados por nombre alfabéticamente
SELECT * FROM empleados WHERE cargoE LIKE 'Vendedor' ORDER BY nombre ASC;
#Listar el nombre de los departamentos
SELECT nombreDpto FROM departamentos;
# Obtener el nombre y cargo de todos los empleados, ordenados por salario de menor a mayor.
SELECT nombre, cargoE, salEmp FROM empleados ORDER BY salEmp ASC;
# Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión de menor a mayor.
# Listar todas las comisiones.
# Obtener el valor total a pagar que resulta de sumar a los empleados del departamento 3000 una bonificación de 500, en orden alfabético del empleado.
# Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
# Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
# Elabore un listado donde para cada fila, figure ‘Nombre’ y ‘Cargo’ antes del valor respectivo para cada empleado. Nota: investigar el Alias
# Muestra los empleados cuyo nombre empiece entre las letras J y Z (rango). Liste estos empleados y su cargo por orden alfabético.
# Listar el salario, la comisión, el salario total (salario + comisión) y nombre, de aquellos empleados que tienen comisión superior a 1000.
# Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión
# Hallar los empleados cuyo nombre no contiene la cadena “MA”
# Obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” ni ‘Mantenimiento.
# Obtener el nombre y el departamento de los empleados con cargo ‘Secretaria’ o ‘Vendedor’, que no trabajan en el departamento de “PRODUCCION”, cuyo salario es superior a $1000, ordenados por fecha de incorporación.
SELECT e.nombre , e.cargoE, d.nombreDpto, e.salEmp, e.fecIncorporacion
FROM empleados e 
INNER JOIN departamentos d 
ON  e.idDepto = d.idDepto 
WHERE e.cargoE IN ( "secretaria" , "vendedor") 
AND NOT (d.nombreDpto = "produccion") 
AND e.salEmp >1000 
ORDER BY e.fecIncorporacion;  
# Obtener información de los empleados cuyo nombre tiene exactamente 11 caracteres

/*SELECT * FROM empleados WHERE nombre LIKE '___________';*/
/*SELECT * FROM empleados WHERE LENGTH (nombre)=11; no cuenta los espacios*/
SELECT * FROM empleados WHERE CHAR_LENGTH (nombre)=11;

# Obtener información de los empleados cuyo nombre tiene al menos 11 caracteres
SELECT * FROM empleados WHERE CHAR_LENGTH (nombre)<=11;
# Listar los datos de los empleados cuyo nombre inicia por la letra ‘M’, su salario es mayor a $800 o reciben comisión y trabajan para el departamento de ‘VENTAS’
SELECT * 
FROM empleados e 
LEFT OUTER JOIN departamentos d 
ON  e.idDepto = d.idDepto 
WHERE e.nombre LIKE 'M%'  
AND (e.salEmp > 800 OR comisionE != 0)
AND d.nombreDpto = 'ventas';
# Mostrar el salario más alto de la empresa.
SELECT * FROM empleados WHERE salEmp = (SELECT MAX(salEmp) FROM empleados);
# Mostrar el nombre del último empleado de la lista por orden alfabético.
SELECT * FROM empleados WHERE nombre = (SELECT MAX(nombre) FROM empleados);
# Hallar el salario más alto, el más bajo y la diferencia entre ellos.
SELECT MAX(salemp) AS 'Salario mayor', 
            MIN(salemp) AS 'Salario menor',  
            MAX(salemp) - MIN(salemp) AS 'Diferencia' 
FROM empleados;
# Mostrar el número de empleados de sexo femenino y de sexo masculino, por departamento.

#SELECT d.nombreDpto,
#count(CASE WHEN e.sexEmp = 'M' THEN 0 END) AS 'Hombres', 
#count(CASE WHEN e.sexEmp = 'F' THEN 0 END) AS 'Mujeres'
#FROM departamentos d INNER JOIN empleados e ON e.idDepto = d.idDepto
#GROUP BY d.nombreDpto;

SELECT d.nombreDpto, COUNT(IF(e.sexEmp = 'M', 1, NULL)) AS 'Hombres', COUNT(IF(e.sexEmp = 'F', 1, NULL)) AS 'Mujeres' 
FROM empleados e
INNER JOIN departamentos d
ON d.idDepto = e.idDepto
GROUP BY d.nombreDpto;

# Hallar el salario promedio por departamento.
SELECT d.nombreDpto, AVG(e.salEmp) AS 'Salario promedio por departamento'
FROM empleados e
INNER JOIN departamentos d
ON d.idDepto = e.idDepto
GROUP BY d.nombreDpto;
#DROP DATABASE personal;