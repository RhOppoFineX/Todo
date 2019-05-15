CREATE DATABASE platzi_operation;

use platzi_operation;

CREATE TABLE IF NOT EXISTS authors(
 	Id_author Integer Unsigned PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `Name` VARCHAR(100) NOT NULL,
    Natonality VARCHAR(3) NOT NULL COMMENT 'abrerviatura de paises de hasta tres letras'
);

create table IF NOT EXISTS books(
                   
    Id_book INTEGER Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Id_author INTEGER Unsigned NOT NULL,
    Title VARCHAR(100) NOT NULL,
    `Year` INTEGER Unsigned NOT NULL DEFAULT 2000,
    `Languague` VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ponemos varchar 2 porque la regla ISO 639-1 Languague específica que los lenagujes se abrevian con solo dos letras',
    Cover_url VARCHAR(500),
    Price Double(6,2) NOT NULL DEFAULT 10.0,
    Sellable TINYINT(1) NOT NULL DEFAULT 1 COMMENT 'Es una bandera 0 falso 1 verdadero (funciona como boolean)',
    Copies INTEGER NOT NULL DEFAULT 1,
    Descripcion Text COMMENT 'Gran cantidad de Texto'
);

CREATE TABLE Clients(
    Id_client INTEGER Unsigned PRIMARY key NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Campo unico no se pueden haber dos correos iguales',
    Birthday DATETIME NOT NULL COMMENT 'yyyy-mm-dd  hh:mm:ss',
    Gender ENUM('M', 'F') NOT NULL,
    Active TINYINT(1) NOT NULL DEFAULT 1 COMMENT 'Estado activo o inactivo de este cliente',
    Create_at TIMESTAMP NOT NULL COMMENT 'mismo formato que date pero este es el tiempo que ha transcurrido en (segundos) desde el 1/01/1970 ("año de las computadoras")'
    DEFAULT CURRENT_TIMESTAMP,
    Update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Cada vez que se actualiza esta columna agarra la fecha del ultimo update'    

);

CREATE TABLE `Type`(
    Id_type INTEGER Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Type` VARCHAR(25) NOT NULL
);

CREATE TABLE IF NOT EXISTS operations(
    Id_operation INTEGER Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Id_book INTEGER Unsigned NOT NULL,
    Id_client INTEGER Unsigned NOT NULL,
    `Type` ENUM('Sell', 'Lend', 'Return') NOT NULL,
    Creat_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Finished TINYINT(1) NOT NULL
);


--Default: si no mandamos nada para ese campo entonces se le dara el valor por defecto que hemos asignado--
--unisegned no permite signos - o +- 
--Double (6,2)---
--6-2 = 4 numeros enteros--
---2 números después del punto decimal--
--show full columns from books; descripcion de todas las columnas de una tabla--
--El comando describe es para una descripción más breve de las columnas de una tabla--
--Las comillas invertidas son para poder ocupar una palabra reservada por el lenguaje como atributo--
--CURRENT_TIMESTAMP Fecha actual de la computadora cuando se ingresa un dato--
--Create_at solo al insertar el dato por primera vez--
--Update_at si se actuliza este dato también la vez en que fue modificado por ultima vez--
--select * from clients where Id_client = 1\G  (Para que la información se muestra más ordenada en la consola)--


--Hay diferentes formas de hacer un insert para mi está de abajo es la más correcta debido a que no tira ninguna advertencia--
INSERT INTO authors (Name, Natonality) VALUES ('Gabriel García Márquez', 'COL');

INSERT INTO authors VALUES ('', 'Juan Gabriel Vasquez', 'COL');

INSERT INTO authors (Id_author, Name, Natonality) VALUES ('', 'Juan Rufalo', 'MEX');

--Varios inserts a la vez--
INSERT INTO authors (Name, Natonality) 
VALUES ('Alfredo Espino', 'ESA'),
('Roque Dalton', 'ESA'),
('Julio Cortazar', 'ARG'),
('Isabel Allende', 'CHI');   --Finaliza con punto y coma--


INSERT INTO clients (Id_client, Name, Email, Birthday, Gender, Active) VALUES
	(1,'Maria Dolores Gomez','Maria Dolores.95983222J@random.names','1971-06-06','F',1),
	(2,'Adrian Fernandez','Adrian.55818851J@random.names','1970-04-09','M',1),
	(3,'Maria Luisa Marin','Maria Luisa.83726282A@random.names','1957-07-30','F',1),
	(4,'Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',1);


--Comando on duplicate key--
INSERT INTO Clients (Name, Email, Birthday, Gender, Active) VALUES ('Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',0)
ON DUPLICATE KEY UPDATE Active = VALUES(Active); 
--Si está duplicado cambia el atributo que le indiquemos y toma en este caso el valor de 0 porque ese valor esta en el "values"--



--ON DUPLICATE KEY IGNORE ALL esto nunca se debe hacerse ya que no tira ningun error--


--Tabla Books  Querys anidados: desventajas tarda más el tiempo de ejecución--

--Sí hay más datos que concuerden con la condición solo se traerá uno (el primero) para esp sirve el LIMIT--

INSERT INTO books (Id_author, Title, `Year`) VALUES (
(select Id_author from authors where `Name` = 'Alfredo Espino' LIMIT 1),  
'Jícaras tristes', 1925
);

--FUNCION Now() fecha y hora actuales
SELECT NOW();

SELECT Year(c.Birthday) from clients c; --función Year trae solo el año

SELECT Name, Year(Now()) - Year(Birthday) from clients LIMIT 10; --trae como máximo de 10 registros
       --El año actual y el año en que nació el cliente
       --para calcular la edad del cliente 

--Nota Personal puedo jugar con la teoria de conjuntos con esta tabla clients aplicando las consultas like

SELECT * FROM clients where Name like '%a%'; --Todas las personas que en su nombre tengan una 'a'

SELECT * FROM clients where Name like '%a'; --Todas las personas que en su nombre tengan una 'a' al principio

SELECT * FROM clients where Name like 'a%'; --Todas las personas que en su nombre tengan una 'a' al final

SELECT Name, Email, Year(Now()) - Year(Birthday) AS edad, Gender FROM Clients WHERE Gender = 'F' AND Name like '%Lop%'; 
                                                -- Alias  en la parte del SELECT sirve para cambiar el nombre de la columna al momento de mostrar los resultados
SELECT count(*) FROM books;--Cuantas Filas o tuplas "trae" la conuslta
SELECT * FROM authors WHERE Id_author <= 5;
SELECT Id_book, Id_author, Title FROM Books WHERE Id_author BETWEEN 1 AND 5; --Between es Entre estos datos 

--Joins ahora INNER JOINS
SELECT b.Id_book, a.Name, a.Id_author ,b.Title FROM books as b INNER JOIN authors as a ON a.Id_author = b.Id_author WHERE a.Id_author <=5;

SELECT c.Name, b.Title, a.Name, o.Type FROM operations as o INNER JOIN books as b ON b.Id_book = o.Id_book INNER JOIN Clients as c ON c.Id_client = o.Id_client
INNER JOIN authors as a ON a.Id_author = b.Id_author  
WHERE c.Gender = 'F' and o.Type = 'Sell';

SELECT c.Name, b.Title, a.Name, o.Type FROM operations as o INNER JOIN books as b ON b.Id_book = o.Id_book INNER JOIN Clients as c ON c.Id_client = o.Id_client
INNER JOIN authors as a ON a.Id_author = b.Id_author  
WHERE c.Gender = 'M' and o.Type IN ('Sell', 'Lend');

SELECT a.Id_author, a.Name, a.Natonality, b.Title FROM authors as a 
INNER JOIN books as b ON b.Id_author = a.Id_author
WHERE a.Id_author BETWEEN 1 and 5 order by a.Name desc; --descendente

SELECT a.Id_author, a.Name, a.Natonality, b.Title FROM authors as a 
INNER JOIN books as b ON b.Id_author = a.Id_author
WHERE a.Id_author BETWEEN 1 and 5 order by a.Name asc; --Ascendete valor por defecto

--LEFT JOIN
SELECT a.Id_author, a.Name, a.Natonality, b.Title FROM authors as a 
LEFT JOIN books as b ON b.Id_author = a.Id_author
WHERE a.Id_author BETWEEN 1 and 5 order by a.Name asc;
--EN esta consulta un dato de una columna es null debido a que ese autor no tiene libros registrados

--Nombre de autores y cuantos libros tiene cada uno

SELECT a.Id_author, a.Name, a.Natonality, count(b.Id_book) FROM authors as a 
LEFT JOIN books as b ON b.Id_author = a.Id_author
WHERE a.Id_author BETWEEN 1 and 5
Group By a.Id_author
Order By a.Name asc;

-- Group By: Dato unico que no se va a repetir
-- es como decir "estos registros se agruparan por nacionalidad en este ejemplo"
--Cada vez que encuentre un registro (author) con la misma nacionalidad lo contara o agrupara para dicha nacionalidad.
-- Y cada ves que lo encuentre sumara uno, lo contará en la columna count
SELECT a.Natonality, count(Id_author) FROM authors as a
Group by a.Natonality

--CINCO CASOS DE NEGOCIO

--1 ¿Que nacionalidades hay? 

Select DISTINCT Natonality FROM authors Order By Natonality;
--Al utilzar el distinct nos trae las diferentes nacionalidades

--2 ¿ Cuántos escritores hay de cada nacionalidad ?

SELECT Natonality, count(Id_author) as escritores FROM authors WHERE Natonality IS NOT NULL and Natonality NOT IN ('RUS', 'AUT')
Group By Natonality Order By escritores desc, Natonality asc;
--El Count es una de las funciones que necesita agruparse
--Order by en este caso por la cantidad de autores del mismo país
-- En este caso en el order by ponemos dos condiciones de ordenamiento 
--Primero Ordenara por cantidad de autores y luego por orden alfabetico a las nacionalidades que presenten el mismo número de autores 

show tables like '%colores%';

--Que es le willcard---


-- tablas MYSIAM 

-- TO_DAYS(fecha) 
























