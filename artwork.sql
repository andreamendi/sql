CREATE DATABASE artwork;
USE artwork;

CREATE TABLE galeria(
	id int AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL unique,
    PRIMARY KEY (id)
);

CREATE TABLE artistas(
	id int AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    born_site VARCHAR(45),
    age int,
    art_style VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE galerias_artistas(
	id_galeria INT NOT NULL,
    id_artista INT NOT NULL,
    numero_obras int,
    PRIMARY KEY(id_galeria,id_artista),
    constraint fk_galerias_artistas_galeria foreign key(id_galeria) references Galeria(id),
    constraint fk_galerias_artistas__artista foreign key(id_artista) references Artistas(id)
);


CREATE TABLE obras(
	id int AUTO_INCREMENT,
    title VARCHAR(45)NOT NULL unique,
    made_year INT DEFAULT 0000,
    arte_type VARCHAR (45) NOT NULL,
    price float (6,2),
    PRIMARY KEY (id),
    id_artistas int,
    id_galeria int,
    CONSTRAINT FK_ObrasArtistas FOREIGN KEY (id_artistas)
    	REFERENCES artistas(id),
	CONSTRAINT FK_ObrasGalerias FOREIGN KEY (id_galeria)
    	REFERENCES galermade_yearia(id)
);

CREATE TABLE clientes(
	id int AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    direccion INT,
    dinero_gastado float (6,2) DEFAULT 0,
    PRIMARY KEY (id)
);

CREATE TABLE tipos_obra(
	id int AUTO_INCREMENT,
    name VARCHAR(45),
    PRIMARY KEY (id)
);


ALTER TABLE obras MODIFY COLUMN made_year YEAR(4);