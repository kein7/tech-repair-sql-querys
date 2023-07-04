use master
go

create database tech_repair

use tech_repair

CREATE TABLE direcciones (
	direccion_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombre_calle varchar(50) NOT NULL,
	numero_calle int NOT NULL,
	depto_oficina int,
	comuna varchar(25) NOT NULL
) 

CREATE TABLE clientes (
	cliente_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	direccion_id int FOREIGN KEY REFERENCES direcciones (direccion_id) NOT NULL,
	nombres varchar(50) NOT NULL,
	apellido_paterno varchar(50) NOT NULL,
	apellido_materno varchar(50),
	rut_cliente int UNIQUE NOT NULL,
	dv_cliente char(1) NOT NULL,
	email varchar(50) UNIQUE NOT NULL,
	telefono_contacto int NOT NULL,
)

CREATE TABLE terceros (
	tercero_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	codigo_tercero char(15) UNIQUE NOT NULL,
	nombres varchar(50) NOT NULL,
	apellido_paterno varchar(50) NOT NULL,
	apellido_materno varchar(50),
	rut int NOT NULL,
	dv_tercero char(1) NOT NULL
)

CREATE TABLE estados (
	estado_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	estado_telefono varchar(50) UNIQUE NOT NULL,
)

CREATE TABLE planes (
	plan_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	plan_reparacion varchar(50) UNIQUE NOT NULL,
	valor_plan int NOT NULL,
	estado_plan varchar(8) NOT NULL,
	plazo_entrega varchar(20) NOT NULL,
)

CREATE TABLE tecnicos (
	tecnico_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombres varchar(50) NOT NULL,
	apellido_paterno varchar(50) NOT NULL,
	apellido_materno varchar(50),
	rut_tecnico int UNIQUE NOT NULL,
	dv_tecnico char(1) NOT NULL,
	email varchar(50) UNIQUE NOT NULL,
	telefono_contacto int NOT NULL,
)

CREATE TABLE gamas (
	gama_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	tipo_gama varchar(10) UNIQUE NOT NULL,
)

CREATE TABLE marcas (
	marca_id int NOT NULL IDENTITY (1,1) PRIMARY KEY,
	marca_telefono varchar(15) NOT NULL UNIQUE,	
)

CREATE TABLE telefonos (
	telefono_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	gama_id int NOT NULL FOREIGN KEY REFERENCES gamas (gama_id),
	marca_id int NOT NULL FOREIGN KEY REFERENCES marcas (marca_id),
	numero_serie char(10) UNIQUE NOT NULL,
	modelo varchar(100) NOT NULL,
	color varchar(15) NOT NULL,
)

CREATE TABLE ordenes (
	orden_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	tecnico_id int NOT NULL FOREIGN KEY REFERENCES tecnicos (tecnico_id),
	estado_id int NOT NULL FOREIGN KEY REFERENCES estados (estado_id),
	telefono_id int NOT NULL FOREIGN KEY REFERENCES telefonos (telefono_id),
	cliente_id int NOT NULL FOREIGN KEY REFERENCES clientes (cliente_id),
	plan_id int NOT NULL FOREIGN KEY REFERENCES planes (plan_id),
	tercero_id int NOT NULL FOREIGN KEY REFERENCES terceros (tercero_id),
	fecha_orden timestamp NOT NULL
)


