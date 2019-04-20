
Create Database RecursosHumanos;

use RecursosHumanos

create table Tipo_usuario(
    Id_tipo_usuario Integer Unsigned PRIMARY KEY NOT NULL,
    Tipo_usuario varchar(20) NOT NULL
);

Create Table Usuario(
    Id_usuario Integer Unsigned PRIMARY KEY NOT NULL,
    Nombres varchar(40) NOT NULL,
    Apellidos varchar(40) NOT NULL
);

Create Table Area(
    Id_area Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Area varchar(25) NOT NULL
);

Create Table Puesto(
    Id_puesto Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Puesto varchar(25) NOT NULL
);

create table Identidad(
    Id_identidad integer Unsigned PRIMARY KEY NOT NULL,
    Documento varchar(20) NOT NULL
);

Create Table Nacionalidad (
    Id_nacionalidad Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nacionalidad varchar (25) NOT NULL
);

Create Table Nivel_idioma(
    Id_nivel_idioma Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nivel varchar (15) NOT NULL
);

Create Table Idioma(
    Id_idioma Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Idioma varchar(15) NOT NULL,
    Id_nivel_idioma Integer Unsigned NOT NULL,
    FOREIGN KEY (Id_nivel_idioma) REFERENCES Nivel_idioma(Id_nivel_idioma) 
);

Create Table Tipo_equipo (
    Id_tipo_equipo Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Tipo_equipo varchar(50) NOT NULL
);

Create Table Equipo (
    Id_equipo Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nombre_equipo varchar(50) NOT NULL,
    Id_tipo_equipo Integer Unsigned NOT NULL,
    FOREIGN KEY (Id_tipo_equipo) REFERENCES Tipo_equipo(Id_tipo_equipo)
); 

create table Departamento(
    Id_departamento Integer Unsigned PRIMARY KEY NOT NULL,
    Departamento varchar(30) NOT NULL,
    Id_nacionalidad Integer Unsigned NOT NULL,
    FOREIGN KEY (Id_nacionalidad) REFERENCES Nacionalidad(Id_nacionalidad)
);

create table Municipio(
    Id_municipio Integer Unsigned PRIMARY KEY NOT NULL,
    Municipio varchar(30) NOT NULL,
    Id_departamento Integer Unsigned NOT NULL,
    FOREIGN KEY (Id_departamento) REFERENCES Departamento(Id_departamento)
);

Create Table Estado_civil(
    Id_estado_civil Integer Unsigned PRIMARY KEY NOT NULL,
    Estado_civil Integer Unsigned NOT NULL
);

Create Table Religion (
    Id_religion Integer Unsigned PRIMARY KEY NOT NULL,
    Religion varchar(25) NOT NULL
);

Create Table Categoria (
    Id_categoria Integer Unsigned PRIMARY KEY NOT NULL,
    Categoria varchar(25) NOT NULL
);

Create Table Parentesco(
    Id_parentesco Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Parentesco varchar(50) NOT NULL
);

create table Datos_identificacion(
    Id_datos integer Unsigned PRIMARY KEY NOT NULL,    
    Num_documento varchar(10) NOT NULL,
    Residencia varchar(30) NOT NULL,
    Lugar_expedicion varchar(30) NOT NULL,
    Fecha_expedicion date NOT NULL,
    Profesion_oficio varchar(30) NOT NULL,
    Id_estado_civil Integer Unsigned NOT NULL,
    Id_identidad Integer Unsigned NOT NULL,
    Fecha_expiracion date NOT NULL,
    Num_ISSS varchar(20) NOT NULL,
    AFP varchar(20) NOT NULL,
    NUP varchar(20) NOT NULL,
    FOREIGN KEY (Id_identidad) REFERENCES Identidad (Id_identidad),
    FOREIGN KEY (Id_estado_civil) REFERENCES Estado_civil (Id_estado_civil)
);

--Colaborador
Create Table Colaborador(
    Id_Colaborador Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Primer_nombre varchar(50) NOT NULL,
    Segundo_Nombre varchar(50) NOT NULL,
    Genero ENUM('M', 'F') NOT NULL,
    Fecha_nacimiento date NOT NULL,
    Edad Integer Unsigned NOT NULL,    
    Id_datos Integer Unsigned NOT NULL,
    Id_religion Integer Unsigned NOT NULL,
    Id_municipio Integer Unsigned NOT NULL,
    Telefono_casa varchar(9) NOT NULL,
    Telefono_celular varchar(9) NOT NULL,
    Correo_insitucional varchar(50) NOT NULL,
    Direccion_residencial Text NOT NULL,
    NIP varchar(15) NULL,
    Nivel varchar(15) NULL,
    Estudiando TINYINT(1) NULL,    
    FOREIGN KEY (Id_religion) REFERENCES Religion(Id_religion),
    FOREIGN KEY (Id_datos) REFERENCES Datos_identificacion(Id_datos),
    FOREIGN KEY (Id_municipio) REFERENCES Municipio(Id_municipio)      
); --Nip y Nivel es para Escalafon.

Create Table Detalle_idioma (
    Id_detalle_idioma Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Id_idioma Integer Unsigned NOT NULL,
    Id_Colaborador Integer Unsigned NOT NULL,
    FOREIGN KEY (Id_idioma) REFERENCES Idioma(Id_idioma),
    FOREIGN KEY (Id_Colaborador) REFERENCES Colaborador(Id_Colaborador) 
);

--Educación
Create Table Educacion (
    Id_educacion Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Id_categoria Integer Unsigned NOT NULL,
    Especialidad varchar (40) NOT NULL,
    Descripcion Text NULL,        
    FOREIGN KEY (Id_categoria) REFERENCES Categoria (Id_categoria),
    Id_Colaborador Integer Unsigned NOT NULL,
    FOREIGN KEY (Id_Colaborador) REFERENCES Colaborador (Id_Colaborador)      
);

Create Table datosFamiliares(
    Id_datos_familiares Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nombres varchar(50) NOT NULL,
    Apellidos varchar(50) NOT NULL,
    Fecha_nacimiento date NOT NULL,
    Dependiente TINYINT (1) NOT NULL,
    Id_parentesco Integer Unsigned NOT NULL,
    Id_Colaborador Integer Unsigned NOT NULL,
    FOREIGN KEY (Id_parentesco) REFERENCES Parentesco (Id_parentesco),
    FOREIGN KEY (Id_Colaborador) REFERENCES Colaborador(Id_Colaborador)
);

--Equipo que el colaborador sabe usar
Create Table equipoTotal(
    Id_equipo_total Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Id_equipo Integer Unsigned NOT NULL,
    Id_Colaborador Integer Unsigned NOT NULL,
    FOREIGN KEY (Id_equipo) REFERENCES Equipo(Id_equipo),
    FOREIGN KEY (Id_Colaborador) REFERENCES Colaborador(Id_Colaborador)       
);

Create table Experiencia_laboral(
    Id_experiencia_laboral Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Empresa varchar(25) NOT NULL,
    Fecha_ingreso date NOT NULL,
    Fecha_retiro date NOT NULL,
    Puesto varchar(25) NOT NULL,
    Id_Colaborador Integer Unsigned NOT NULL,
    FOREIGN KEY (Id_Colaborador) REFERENCES Colaborador(Id_Colaborador)    
);

--Salud del colaborador
Create Table Salud(
    Id_Salud Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Enfermedades_Tratamiento TINYINT(1) NOT NULL,
    Descripcion_enfermedades Text NULL,
    Medicamentos TINYINT(1) NOT NULL,
    Descripcion_medicamentos Text NULL,
    Alergias TINYINT(1) NOT NULL,
    Descripcion_alergias Text NULL,
    Alergias_medicamentos TINYINT(1) NOT NULL,
    Descripcion_alergias_medicamentos Text NOT NULL,
    Notificacion_emergencia Integer Unsigned NOT NULL,
    FOREIGN KEY (Notificacion_emergencia) REFERENCES datosFamiliares(Id_datos_familiares)
);

Create Table Area_laboral(
    Id_laboral Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Id_area Integer Unsigned NOT NULL,
    Id_puesto Integer Unsigned,
    Sueldo_plaza Double(6,2) NOT NULL,
    Fecha_ingreso date NOT NULL,
    Inicio_contrato date NOT NULL,
    Fin_contrato date NOT NULL,
    Horas_al_dia varchar(6) NOT NULL,
    FOREIGN KEY (Id_area) REFERENCES Area(Id_area),
    FOREIGN KEY (Id_puesto) REFERENCES Puesto(Id_puesto)
);

Create table Area_detalle(
    Id_area_detalle Integer Unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Id_laboral Integer Unsigned NOT NULL,
    Id_Colaborador Integer Unsigned NOT NULL,    
    FOREIGN KEY (Id_laboral) REFERENCES Area_laboral(Id_laboral),
    FOREIGN KEY (Id_Colaborador) REFERENCES Colaborador(Id_Colaborador)
);


























