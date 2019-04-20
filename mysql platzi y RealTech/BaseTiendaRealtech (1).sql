create database RealTech;
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
    Descripcion varchar(500) not null,
    Precio double(6,2) not null,
    Cantidad int not null,
    Id_garantia int unsigned not null,
    Id_estado int unsigned not null,
    Id_marca int unsigned not null,
    foreign key (Id_categoria) references Categoria(Id_categoria),
    foreign key (Id_garantia) references Garantia(Id_garantia),
    foreign key (Id_estado) references Estado(Id_estado),
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
    Nombres_Empleado varchar(50) not null,
    Apellidos_Empleado varchar(50) not null,
    Fecha datetime not null,
    Accion varchar(25) not  null
);

CREATE TRIGGER Bitacora_accion AFTER INSERT ON Producto
  FOR EACH ROW
  BEGIN
    INSERT INTO Bitacoras VALUES('Cristiano' 'Ronaldo');   
  END;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`Id_marca`, `Marca`) VALUES
(1, 'SAMSUNG');

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`Id_categoria`, `Nombre`) VALUES
(1, 'Gadgets'),
(2, 'Componentes');

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`Id_estado`, `Estado`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

--
-- Volcado de datos para la tabla `garantia`
--

INSERT INTO `garantia` (`Id_garantia`, `Meses`, `Condiciones`) VALUES
(1, 24, 'Contener el ticket de compra y caja del producto en buen estado.'),
(2, 2, 'Contener el ticket de compra.');

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`Id_departamento`, `Nombre_departamento`) VALUES
(1, 'San Salvador'),
(2, 'Usulutan');

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`Id_municipio`, `Nombre_municipio`, `Id_departamento`) VALUES
(1, 'Mejicanos', 1),
(2, 'Alegría', 2);


--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Id_cliente`, `Nombres`, `Apellidos`, `Usuario`, `Correo`, `Genero`, `pass`, `Dui`, `Fecha_nacimiento`, `Direcccion`, `Id_estado`, `Id_municipio`) VALUES
(1, 'Cristian', 'Ayala', 'Cris', 'cristian@gmail.com', 'Masculino', 'cris123', '7894561230', '1996-03-15', 'San Salvador', 1, 1),
(2, 'Diego', 'Arias', 'diego', 'diego@gmail.com', 'Masculino', 'diego123', '1245638990', '1998-05-25', 'Avenida Aguilares', 1, 1),
(3, 'Juan', 'Ramirez', 'juan', 'juan@gmail.com', 'Masculino', 'juan123', '8451307950', '1996-07-01', 'Calle Los Bambues 22-B, San Salvador', 1, 1),
(4, 'Gabriela', 'Hernandez', 'gaby', 'gaby@gmail.com', 'Femenino', 'gaby123', '3697100541', '1997-03-29', 'Final #664 Col., 79 Av Sur, San Salvador CP 1101', 1, 1),
(5, 'Alejandra', 'Avalos', 'ale', 'ale@gmail.com', 'Femenino', 'ale123', '4562018730', '1998-09-11', 'Prolongacion Alameda Juan Pablo II, Escalon Norte 300 Mts. al Pte. de 75 Av. Norte, Alameda Juan Pablo II, San Salvador', 1, 1),
(6, 'Juanito', 'Bosco', 'Juan el destructor Bosco', 'Juanator@gmail.com', 'Masculino', 'juan123', '20140201', '2019-02-12', 'Calle 13', 1, 2);


--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Id_empleado`, `Nombre`, `Apellidos`, `Usuario_empleado`, `Correo`, `Genero`, `Pass`, `Dui`, `Id_estado`) VALUES
(1, 'Javier', 'Zepeda', 'javi', 'javi@gmail.com', 'Masculino', 'javi123', '1847039801', 1),
(2, 'Claudia', 'Chicas', 'clau', 'clau@gmail.com', 'Femenino', 'clau123', '3584018302', 1),
(3, 'Fernando', 'Ayala', 'fer', 'fer@gmail.com', 'Masculino', 'fer123', '9874562013', 1),
(4, 'Iris', 'Linarez', 'iris', 'iris@gmail.com', 'Femenino', 'iris123', '3640987012', 1),
(5, 'Josué', 'Carrillo', 'josue', 'josue@gmail.com', 'Masculino', 'josue123', '9043201820', 1);

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Id_categoria`, `Descripcion`, `Precio`, `Cantidad`, `Id_garantia`, `Id_estado`, `Id_marca`) VALUES
(2, 'Procesador intel i5: 7600k 4.20Ghz.', 240.00, 10, 1, 1, 1),
(2, 'Tarjeta grafica GTX 750ti: 2GB GDDR5.', 160.00, 5, 1, 1, 1),
(2, 'Disco duro San Disk SSD PLUS: 1TB SATA III 6GB/s', 110.00, 12, 2, 1, 1),
(2, 'Fuente de poder EVGA 500 W1', 40.00, 5, 1, 1, 1),
(2, 'Memoria ram Kingston HyperX: 8GB 2666MHz DDR4.', 44.00, 10, 2, 1, 1),
(1, 'Teclado mecanico Redragon Kumara k552: Switches Outemu blue.', 40.00, 15, 2, 1, 1),
(1, 'Mouse Wireless Rechargeable: DPI ajustable para Windows y Mac.', 11.00, 20, 2, 1, 1),
(1, 'Bocinas para pc ARVICKA USB', 14.00, 20, 2, 1, 1),
(1, 'Mouse pad MROCO Ergonomico', 6.00, 20, 2, 1, 1),
(2, 'Placa madre Asus LGA1151: DDR4 HDMI, DVI Y VGA.', 70.00, 10, 1, 1, 1);

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`Id_pedido`, `Fecha`, `Id_cliente`, `Precio_total`) VALUES
(1, '2018-03-02', 1, 110),
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
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`Id_detalle`, `Id_producto`, `Id_pedido`, `Cantidad_pedido`) VALUES
(1, 3, 1, 2), --disco duro 110 * 3
(2, 1, 1, 1), --procesador 240
(3, 2, 1, 1), --Tarjeta grafica 160
(4, 5, 2, 2), --memoria ram 44 * 2
(5, 6, 2, 1), --teclado mecanico 40
(6, 8, 3, 1), --bocinas 14
(7, 1, 4, 1), --procesador 240
(8, 3, 5, 1), --disco duro 110
(9, 7, 6, 1), --mouse wireless 11
(10, 4, 7, 1), --fuente  40
(11, 9,  )

SELECT Cliente.Nombres, Cliente.Usuario, Municipio.Nombre_municipio
FROM Cliente
INNER JOIN Municipio ON Cliente.Id_municipio = Municipio.Id_municipio;



