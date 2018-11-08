CREATE DATABASE agencia;
USE agencia;

CREATE TABLE clientes (
	id int AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    snn int NOT NULL unique,
    id_clientes int NOT NULL,
    budget float(9,2) NOT NULL,
    direction varchar(45) Not Null,
    credit float(9,2) NOT NULL,
    CONSTRAINT FK_CarrosClientes FOREIGN KEY (id_clientes)
    	REFERENCES clientes(id),
    PRIMARY KEY (id)
);


CREATE TABLE carros (
	id int AUTO_INCREMENT,
    name_car VARCHAR(45) NOT NULL,
    n_serie int NOT NULL unique,
    id_clientes int NOT NULL,
    price float(9,2) NOT NULL,
    mark varchar(45) Not Null,
    rfc varchar(45),
    CONSTRAINT FK_CarrosClientes FOREIGN KEY (id_clientes)
    	REFERENCES clientes(id),
    PRIMARY KEY (id)
);

CREATE TABLE facturas (
	id int AUTO_INCREMENT,
    name_car VARCHAR(45) NOT NULL,
    n_serie int NOT NULL unique,
    id_clientes int NOT NULL,
    price float(9,2) NOT NULL,
    mark varchar(45) Not Null,
    id_carros int NOT,
   CONSTRAINT FK_FacturasCarros FOREIGN KEY (id_clientes)
    	REFERENCES clientes(id),
    PRIMARY KEY (id)
);