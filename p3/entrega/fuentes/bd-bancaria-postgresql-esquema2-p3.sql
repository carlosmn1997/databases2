DROP DATABASE IF EXISTS rangers;

CREATE DATABASE rangers;

\connect rangers

CREATE TABLE Peloton(
	Identificador INTEGER NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	clase VARCHAR(100) NOT NULL,
	PRIMARY KEY (Identificador)
);

CREATE TABLE Ranger(
	Identificador INTEGER NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	apellidos VARCHAR(100) NOT NULL,
	rango VARCHAR(50) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    peloton INTEGER NOT NULL,
	PRIMARY KEY (Identificador),
    FOREIGN KEY (peloton) REFERENCES PELOTON(identificador)
);

CREATE TABLE Vehiculo(
	Matricula INTEGER NOT NULL,
	armamento VARCHAR(100) NOT NULL,
	fechaFabricacion DATE NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    peloton INTEGER NOT NULL,
    traccion VARCHAR(100),
    capacidad INTEGER,
	PRIMARY KEY (Matricula),
    FOREIGN KEY (peloton) REFERENCES PELOTON(identificador)
);

INSERT INTO Peloton VALUES ('1004','Cowboy 1','Artificieros');
INSERT INTO Peloton VALUES ('1005','Cowboy 2','Artilleros');
INSERT INTO Peloton VALUES ('1006','Bravo 1','Tiradores');
INSERT INTO Peloton VALUES ('1007','Alpha 1','Tiradores');

INSERT INTO Ranger VALUES ('07956','Mario','San Francisco','Soldado raso','Ametralladora','1005');
INSERT INTO Ranger VALUES ('15467','Daniel','Ramos','Cabo','Granadero','1005');
INSERT INTO Ranger VALUES ('73594','Jose','Fernandez','Cabo','Tirador','1005');
INSERT INTO Ranger VALUES ('94653','Jesus','Nazaret','Sargento Primero','Tirador','1005');
INSERT INTO Ranger VALUES ('104575','Antonio','Ferrer','Sargento','Conductor','1005');


INSERT INTO Vehiculo VALUES ('1234','Ametralladora Superior','2010-03-01','Tierra','1005','4 Ruedas',null);
INSERT INTO Vehiculo VALUES ('1345','Lanzacohetes','2000-01-03','Tierra','1005','Delantera',null);
INSERT INTO Vehiculo VALUES ('6479','Ametralladora Superior','2013-12-01','Tierra','1006','4 Ruedas',null);
INSERT INTO Vehiculo VALUES ('1579','NO','2018-01-21','Agua','1005',null,'1000');
INSERT INTO Vehiculo VALUES ('6741','Ametralladora','2012-05-30','Agua','1005',null,'3000');
