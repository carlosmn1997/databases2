DROP DATABASE IF EXISTS marina;

CREATE DATABASE marina;

\connect marina

CREATE TABLE Escuadra(
	id INTEGER NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
	caracteristica VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE Marine(
	id VARCHAR(30) NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
	Aps VARCHAR(100) NOT NULL,
	posicion VARCHAR(50) NOT NULL,
	caracteristica VARCHAR(100) NOT NULL,
	escuadra INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(escuadra) REFERENCES Escuadra(id)
);

CREATE TABLE Vehiculo(
	id VARCHAR(30) NOT NULL,
	armas VARCHAR(100) NOT NULL,
	fechaCreacion DATE NOT NULL,
	escuadra INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (escuadra) REFERENCES Escuadra(id)
);

CREATE TABLE VTierra(
	id VARCHAR(30) NOT NULL,
	traccion VARCHAR(100) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES Vehiculo(id)
);

CREATE TABLE VAgua(
	id VARCHAR(30) NOT NULL,
	cargamax INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES Vehiculo(id)
);


INSERT INTO Escuadra VALUES ('1','Aguila 1','Artificieros');
INSERT INTO Escuadra VALUES ('2','Aguila 2','Artilleros');
INSERT INTO Escuadra VALUES ('3','Aguila 3','Apoyo');
INSERT INTO Escuadra VALUES ('4','Aguila 4','Fusileros');

INSERT INTO Marine VALUES ('13452312','Francisco','Perez','Sargento','Tirador','2');
INSERT INTO Marine VALUES ('05910689','Javier','Lopez','Sargento Primero','Tirador','2');
INSERT INTO Marine VALUES ('16435957','Marcos','Garcia','Cabo','Granadero','2');
INSERT INTO Marine VALUES ('05976438','Juan','Gonzalez','Sargento','Tirador','2');
INSERT INTO Marine VALUES ('27653491','Esteban','Coesta cupado','Cabo','Conductor','2');

INSERT INTO Vehiculo VALUES ('14054','lanzagranadas','2007-2-18','2');
INSERT INTO Vehiculo VALUES ('14055','ametralladora','2007-2-18','2');
INSERT INTO Vehiculo VALUES ('14056','lanzagranadas','2007-2-18','2');
INSERT INTO Vehiculo VALUES ('14057','ametralladora','2007-2-18','2');

INSERT INTO VTierra VALUES ('14054','4 ruedas');
INSERT INTO VTierra VALUES ('14055','2 ruedas');

INSERT INTO VAgua VALUES ('14056','50000');
INSERT INTO VAgua VALUES ('14057','1000');
