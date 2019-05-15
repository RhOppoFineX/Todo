CREATE DATABASE RealTech;
use RealTech

create table Categoria (
   Id_categoria int unsigned primary key not null Auto_Increment,
   Nombre varchar(40) not null
);

create table Estado(
   Id_estado int unsigned primary key not null,
   Estado varchar(20) not null
);

create table Garantia (
    Id_garantia int unsigned primary key not null Auto_Increment,
    Meses int not null,
    Condiciones varchar(500) not null
);


create table Marca (
  Id_marca int unsigned primary key not null,
  Marca varchar(30) not null
);

create table Departamento(
    Id_departamento int unsigned primary key not null Auto_Increment,
    Nombre_departamento varchar(30) not null
);

create table Municipio(
    Id_municipio int unsigned primary key not null Auto_Increment,
    Nombre_municipio varchar(30) not null,
    Id_departamento int unsigned not null,
    foreign key (id_departamento) references Departamento(id_departamento)
);


create table Cliente (
    Id_cliente int unsigned primary key not null Auto_Increment,
    Nombres varchar(25) not null,
    Apellidos varchar(25) not null,
    Usuario varchar(25) not null,
    Correo varchar(50) not null,
    Genero varchar(15) not null,
    pass varchar(150) not null,
    Dui varchar(11) not null,
    Fecha_nacimiento date not null,
    Direcccion varchar(150) not null,
    Id_estado int unsigned not null,
    Id_municipio  int unsigned not null,
    foreign key (Id_municipio) references Municipio(Id_municipio),
    foreign key (Id_estado) references Estado(Id_estado)
);

create table Empleado(
    Id_empleado int unsigned primary key not null Auto_Increment,
    Nombre varchar(25) not null,
    Apellidos varchar(25) not null,
    Usuario_empleado varchar(25) not null,
    Correo varchar(50) not null,
    Genero varchar(15) not null,
    Pass varchar(150) not null,
    Dui varchar(10) not null,
    Id_estado int unsigned not null,
    foreign key (Id_estado) references Estado(Id_estado)
);

create table Producto (
    Id_producto int unsigned primary key not null Auto_Increment,
    Id_categoria int unsigned not null,
    Nombre_producto VARCHAR(50) NOT NULL,
    Descripcion varchar(500) not null,
    Precio double(6,2) not null,
    Cantidad int not null,
    Id_garantia int unsigned not null,
    Estado_producto tinyint(1) unsigned not null DEFAULT 1,
    Imagen_producto VARCHAR(100) NULL,
    Id_marca int unsigned not null,
    foreign key (Id_categoria) references Categoria(Id_categoria),
    foreign key (Id_garantia) references Garantia(Id_garantia),    
    foreign key (Id_marca) references Marca(Id_marca)
);

create table Pedido(
    Id_pedido int unsigned primary key not null Auto_Increment,
    Fecha date not null,
    Id_cliente int unsigned not null,
    Precio_total double(6,2) not null,
    foreign key (Id_cliente) references Cliente(Id_cliente)    
);

create table Detalle_pedido(
    Id_detalle int unsigned primary key not null Auto_Increment,
    Id_producto int unsigned not null,
    Cantidad_pedido int not null,
    Id_pedido int unsigned not null,
    foreign key (Id_pedido) references Pedido(Id_pedido),
    foreign key (Id_producto) references Producto(Id_producto)    
);

create table Bitacoras(
    Id_Bitacora int unsigned primary key not null  Auto_Increment,    
    Usuario_empleado VARCHAR (50) NOT NULL,
    Fecha TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
    Accion varchar(25) not null
);

create Table Respaldo_producto(
    Id_producto int unsigned primary key not null Auto_Increment,
    Id_categoria int unsigned not null,
    Descripcion varchar(500) not null,
    Precio double(6,2) not null,
    Cantidad int not null,
    Id_garantia int unsigned not null,
    Id_estado int unsigned not null,
    Id_marca int unsigned not null
);

--Triggers bitacora--

CREATE TRIGGER Bitacora_Select AFTER INSERT ON Producto
  FOR EACH Statement
   INSERT INTO Bitacoras (Usuario_empleado, Accion) VALUES (CURRENT_USER(), 'Insert en productos');
  

  CREATE TRIGGER Bitacora_update AFTER UPDATE ON Producto
  FOR EACH ROW 
  INSERT INTO Bitacoras (Usuario_empleado, Accion)VALUES(CURRENT_USER(), 'Update en productos'); 
  

  CREATE TRIGGER Respaldo_producto_update Before UPDATE ON Producto
    FOR EACH ROW
    INSERT INTO Respaldo_producto VALUES(OLD.Id_producto, OLD.Id_categoria, OLD.Descripcion, OLD.Precio, OLD.Cantidad, OLD.Id_garantia, OLD.Id_estado, OLD.Id_marca)
    
               


    --Row para cada vez que se haga un registro se realiza el insert--
    --Statement si se realiza un insert multiple o masivo solo se hará un insert--

--
-- Volcado de datos para la tabla marca
--

INSERT INTO marca VALUES
(1, 'SAMSUNG');

--
-- Volcado de datos para la tabla categoria
--

INSERT INTO categoria VALUES
(1, 'Gadgets'),
(2, 'Componentes');

--
-- Volcado de datos para la tabla estado
--

INSERT INTO estado VALUES
(1, 'Activo'),
(2, 'Inactivo');

--
-- Volcado de datos para la tabla garantia
--

INSERT INTO garantia VALUES
(1, 24, 'Contener el ticket de compra y caja del producto en buen estado.'),
(2, 2, 'Contener el ticket de compra.');

--
-- Volcado de datos para la tabla departamento
--

INSERT INTO departamento VALUES
(1, 'San Salvador'),
(2, 'Usulutan');

--
-- Volcado de datos para la tabla municipio
--

INSERT INTO municipio VALUES
(1, 'Mejicanos', 1),
(2, 'Alegría', 2);


--
-- Volcado de datos para la tabla cliente
--

INSERT INTO cliente  VALUES
(1, 'Cristian', 'Ayala', 'Cris', 'cristian@gmail.com', 'Masculino', 'cris123', '7894561230', '1996-03-15', 'San Salvador', 1, 1),
(2, 'Diego', 'Arias', 'diego', 'diego@gmail.com', 'Masculino', 'diego123', '1245638990', '1998-05-25', 'Avenida Aguilares', 1, 1),
(3, 'Juan', 'Ramirez', 'juan', 'juan@gmail.com', 'Masculino', 'juan123', '8451307950', '1996-07-01', 'Calle Los Bambues 22-B, San Salvador', 1, 1),
(4, 'Gabriela', 'Hernandez', 'gaby', 'gaby@gmail.com', 'Femenino', 'gaby123', '3697100541', '1997-03-29', 'Final #664 Col., 79 Av Sur, San Salvador CP 1101', 1, 1),
(5, 'Alejandra', 'Avalos', 'ale', 'ale@gmail.com', 'Femenino', 'ale123', '4562018730', '1998-09-11', 'Prolongacion Alameda Juan Pablo II, Escalon Norte 300 Mts. al Pte. de 75 Av. Norte, Alameda Juan Pablo II, San Salvador', 1, 1),
(6, 'Juanito', 'Bosco', 'Juan el destructor Bosco', 'Juanator@gmail.com', 'Masculino', 'juan123', '20140201', '2019-02-12', 'Calle 13', 1, 2);


--
-- Volcado de datos para la tabla empleado
--

INSERT INTO empleado VALUES
(1, 'Javier', 'Zepeda', 'javi', 'javi@gmail.com', 'Masculino', 'javi123', '1847039801', 1),
(2, 'Claudia', 'Chicas', 'clau', 'clau@gmail.com', 'Femenino', 'clau123', '3584018302', 1),
(3, 'Fernando', 'Ayala', 'fer', 'fer@gmail.com', 'Masculino', 'fer123', '9874562013', 1),
(4, 'Iris', 'Linarez', 'iris', 'iris@gmail.com', 'Femenino', 'iris123', '3640987012', 1),
(5, 'Josué', 'Carrillo', 'josue', 'josue@gmail.com', 'Masculino', 'josue123', '9043201820', 1);

--
-- Volcado de datos para la tabla producto
--

INSERT INTO producto (Id_categoria, Descripcion, Precio, Cantidad, Id_garantia, Estado_producto, Id_marca, Nombre_producto) VALUES 
(2, 'Procesador intel i5: 7600k 4.20Ghz.', 240.00, 10, 1, 1, 1, 'Procesador'),
(2, 'Tarjeta grafica GTX 750ti: 2GB GDDR5.', 160.00, 5, 1, 1, 1, 'Tarjeta grafica'),
(2, 'Disco duro San Disk SSD PLUS: 1TB SATA III 6GB/s', 110.00, 12, 2, 1, 1, 'Disco duro'),
(2, 'Fuente de poder EVGA 500 W1', 40.00, 5, 1, 1, 1, 'Fuente de poder'),
(2, 'Memoria ram Kingston HyperX: 8GB 2666MHz DDR4.', 44.00, 10, 2, 1, 1, 'Memoria ram Kingston'),
(1, 'Teclado mecanico Redragon Kumara k552: Switches Outemu blue.', 40.00, 15, 2, 1, 1, 'Teclado mecanico Redragon'),
(1, 'Mouse Wireless Rechargeable: DPI ajustable para Windows y Mac.', 11.00, 20, 2, 1, 1, 'Mouse Wireless Rechargeable'),
(1, 'Bocinas para pc ARVICKA USB', 14.00, 20, 2, 1, 1, 'Bocinas para pc'),
(1, 'Mouse pad MROCO Ergonomico', 6.00, 20, 2, 1, 1, 'Mouse pad MROCO'),
(2, 'Placa madre Asus LGA1151: DDR4 HDMI, DVI Y VGA.', 70.00, 10, 1, 1, 1, 'Placa madre Asus');

--
-- Volcado de datos para la tabla pedido
--

INSERT INTO pedido VALUES
(1, '2018-03-02', 1, 330),
(2, '2018-04-12', 1, 240),
(3, '2018-04-23', 1, 160),
(4, '2018-05-09', 2, 88),
(5, '2018-05-14', 2, 40),
(6, '2018-05-24', 2, 14),
(7, '2018-08-06', 3, 240),
(8, '2018-08-19', 3, 110),
(9, '2018-08-27', 3, 11),
(10, '2018-09-15', 4, 40),
(11, '2018-09-24', 4, 58),
(12, '2018-09-30', 4, 98),
(13, '2018-10-05', 5, 69),
(14, '2018-10-22', 5, 79),
(15, '2018-10-31', 5, 27);

--
-- Volcado de datos para la tabla detalle_pedido
--

INSERT INTO detalle_pedido VALUES
(1, 3, 1, 2),
(2, 1, 1, 1),
(3, 2, 1, 1),
(4, 5, 2, 2),
(5, 6, 2, 1),
(6, 8, 2, 1),
(7, 1, 3, 1),
(8, 3, 3, 1),
(9, 7, 3, 1),
(10, 4, 4, 1),
(11, 9, 4, 1),
(12, 1, 4, 1),
(13, 7, 5, 2),
(14, 9, 5, 2),
(15, 8, 5, 1),
(16, 2, 5, 1),
(17, 5, 6, 2),
(18, 10, 6, 1),
(19, 6, 6, 1),
(20, 3, 7, 1),
(21, 2, 7, 1),
(22, 7, 7, 2),
(23, 9, 8, 2),
(24, 4, 8, 1),
(25, 5, 8, 2),
(26, 1, 9, 1),
(27, 8, 9, 1),
(28, 3, 9, 1),
(29, 2, 10, 1),
(30, 10, 10, 1),
(31, 6, 10, 1), 
(32, 5, 10, 1),
(33, 9, 10, 1), 
(34, 3, 11, 2),
(35, 1, 11, 1), 
(36, 10, 11, 1),
(37, 7, 12, 2), 
(38, 8, 13, 1), 
(39, 4, 14, 1), 
(40, 5, 15, 1);

-- consulta multitabla

SELECT d.Id_detalle, Descripcion, Cantidad_pedido
FROM Detalle_pedido d, Producto p
where d.Id_producto = p.Id_producto order by Id_detalle;

SELECT Cliente.Nombres, Cliente.Usuario, Municipio.Nombre_municipio
FROM Cliente
INNER JOIN Municipio ON Cliente.Id_municipio = Municipio.Id_municipio;

SELECT p.Id_producto ,p.Descripcion, c.Nombre
FROM producto p, categoria c
where c.Id_categoria = p.Id_categoria order by Id_producto;


--Procedimientos Almacenados--

CREATE PROCEDURE Muestra_clientes (Municipio_cliente varchar(30))
    Select c.Nombres, c.Apellidos from Cliente c, Municipio m where m.Nombre_municipio = Municipio_cliente and m.Id_municipio = c.Id_municipio;


CALL Muestra_clientes('Alegría'); --Llamar al procedimiento --


CREATE PROCEDURE Actulizar_precio_prodcuto (Codigo int, Precio_producto double(6,2))
    UPDATE Producto SET Precio = Precio_producto where Id_producto = Codigo;

Call Actulizar_precio_prodcuto(1, 95.22); ---Lamar al procedimientos---


--Cruds de cada Tabla--

--Selects--
select * from Bitacoras;
Select * from Categoria;
Select * from Departamento;
Select * from Detalle_pedido;
Select * from Empleadpo;
Select * from Estado;
Select * from Garantia;
Select * from Marca;
select * from Municipio;
Select * from Pedidio;
Select * from Producto;
Select * from Respaldo_producto;

---Updates---

UPDATE Categoria SET Nombre = 'Perifericos' WHERE Id_categoria = 1;
UPDATE Departamento SET Nombre_departamneto = 'Chalatenango' WHERE Id_departamento = 2;
UPDATE Estado SET Estado = 'Deshabilitado' WHERE Id_estado = 2;
UPDATE Garantia SET Meses = '18', Condiciones = 'Ninguna' WHERE Id_garantia = 2;
UPDATE Marca SET Marca = 'CR7' WHERE Id_marca = 1;
UPDATE Empleado SET Correo = 'CR7@gmail.com', Id_estado = 1 WHERE Id_empleado = 2;
UPDATE Municipio SET Nombre_municipio = 'Mejicanos' WHERE Id_municipio = 2;
UPDATE Cliente SET Id_estado = 1, Id_municipio = 2 WHERE Id_cliente = 1;
UPDATE Producto SET Precio = 22.00 WHERE Id_prodcuto = 1;
UPDATE Pedido set Precio_total = 100.00 WHERE Id_pedido = 1;   
UPDATE Detalle_pedido SET Cantidad_pedido = 2 WHERE Id_detalle = 1;

--Deletes--
INSERT INTO Categoria (Id_categoria, Nombre) VALUES (3, 'Perifericos');

Delete from Categoria where Nombre = 'Perifericos';

INSERT INTO estado (2, 'Frecuente');

Delete from estado where Estado = 'Frecuente';

INSERT INTO Garantia (Id_garantia, Meses, Condiciones) VALUES (3, 3, 'Ninguna condición maje');

Delete from Garantia where Id_garantia = 3;

INSERT INTO Marca (Marca) VALUES ('Sony');

Delete from Marca where Marca = 'Sony';

INSERT INTO Departamento VALUES (3, 'San Miguel');

Delete from Departamento where departamento = 'San Miguel';

INSERT INTO Municipio values (3, 'Cuscatancingo', 1);

INSERT INTO Cliente VALUES (7, 'Eduardo', 'Carrillo', 'Ed', 'eduardo@gmail.com', 'Masculino', 'eduardo123', 32146321451, '1989/01/24', 'San Salvador, Avenida Albert Einstein', 1);

Delete from Cliente where Nombres = 'Eduardo';

INSERT INTO Empleado VALUES (6, 'Esmeralda', 'Martinez', 'esme123', 'esmeraldaM@gmail.com', 'Femenino', 'martinez123', 1);

Delete from Empleado where Nombre = 'Esmeralda';

INSERT INTO Producto values (11, 1, 'Cargador para Samsung S8', 25.00, 30, 2, 1, 1);

Delete from Producto where Descripcion = 'Cargador para Samsung S8';

INSERT INTO Pedido values (16, '2019/01/21', 5, 30.00);

Delete from Pedido where Id_pedido = 1;

Insert into Detalle_pedido values (41, 10, 1, 2);

Delete from Detalle_pedido where Id_detalle = 41;















