CREATE DATABASE superheroes;

USE superheroes;

CREATE TABLE creador (
	id_creador INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL
);

CREATE TABLE personajes (
	id_personaje INT NOT NULL PRIMARY KEY,
    nombre_real VARCHAR(20) NOT NULL,
    personaje VARCHAR(20) NOT NULL,
    inteligencia INT  NOT NULL,
    fuerza VARCHAR(10) NOT NULL,
    velocidad INT NOT NULL,
    poder INT NOT NULL,
    aparicion INT NOT NULL,
    ocupacion VARCHAR(30),
    id_creador INT NOT NULL,
    FOREIGN KEY (id_creador) REFERENCES creador(id_creador)
);

########################## APENDICE A ###########################

INSERT INTO creador VALUES (1, "MARVEL");
INSERT INTO creador VALUES (2, "DC Comics");
SELECT * FROM creador;

INSERT INTO personajes VALUES (1,"Bruce Banner", "Hulk", 160, "600 mill", 75, 98, 1962, "Fisico Nuclear", 1);
INSERT INTO personajes VALUES (2,"Tony Stark", "Iron Man", 170, "200 mill", 70, 123, 1963, "Inventor Industrial", 1);
INSERT INTO personajes VALUES (3,"Thor Odinson", "Thor", 145, "infinita", 100, 235, 1962, "Rey de Asgard", 1);
INSERT INTO personajes VALUES (4,"Wanda Maximoff", "Bruja Escarlata", 170, "100 mill", 90, 345, 1964, "Bruja", 1);
INSERT INTO personajes VALUES (5,"Carol Denvers", "Capitana Marvel", 157, "250 mill", 85, 128, 1968, "Oficial de inteligencia", 1);
INSERT INTO personajes VALUES (6,"Thanos", "Thanos", 160, "infinita", 40, 306, 1973, "Adorador de la muerte", 1);
INSERT INTO personajes VALUES (7,"Peter Parker", "Spirderman", 165, "25 mill", 80, 74, 1962, "Fotografo", 1);
INSERT INTO personajes VALUES (8,"Steve Rogers", "Capitan America", 145, "600", 45, 60, 1941, "Oficial Federal", 1);
INSERT INTO personajes VALUES (9,"Bobby Drake", "Ice Man", 140, "2 mill", 64, 122, 1963, "Contador", 1);
INSERT INTO personajes VALUES (10,"Barry Allen", "Flash", 160, "10 mill", 120, 168, 1956, "Cientifico forense", 2);
INSERT INTO personajes VALUES (11,"Bruce Wayne", "Batman", 170, "500", 32, 47, 1939, "Hombre de negocios", 2);
INSERT INTO personajes VALUES (12,"Clarck Kent", "Superman", 165, "infinita", 120, 182, 1948, "Reportero", 2);
INSERT INTO personajes VALUES (13,"Diana Price", "Mujer Maravilla", 160, "infinita", 95, 127, 1949, "Princesa guerrera", 2);
SELECT * FROM personajes;

########################## APENDICE B ###########################

SET SQL_SAFE_UPDATES = 0;
UPDATE personajes SET aparicion = 1938 WHERE personaje LIKE "superman";
SELECT * FROM personajes;
SET SQL_SAFE_UPDATES = 1;

########################## APENDICE C ###########################

SET SQL_SAFE_UPDATES = 0;
DELETE FROM personajes WHERE personaje = "Flash";
SELECT * FROM personajes;
SET SQL_SAFE_UPDATES = 1;

########################## APENDICE D ###########################

DROP DATABASE superheroes;

#SELECT p.personaje, c.nombre FROM personaje p
#INNER JOIN creador c ON p.id_creador=c.id_creador
#WHERTE c.nombre="DC Comics";

















