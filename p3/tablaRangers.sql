CREATE TABLE Peloton(
	Identificador INTEGER NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	clase VARCHAR(100) NOT NULL,
	PRIMARY KEY (Identificador),
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
	numPersonas INTEGER NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    peloton INTEGER NOT NULL,
    traccion VARCHAR(100),
    capacidad INTEGER,
	PRIMARY KEY (Matricula),
    FOREIGN KEY (peloton) REFERENCES PELOTON(identificador)
);