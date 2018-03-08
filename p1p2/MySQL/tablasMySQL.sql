DROP TABLE IF EXISTS Operacion;
DROP TABLE IF EXISTS Posee;
DROP TABLE IF EXISTS Cuenta;
DROP TABLE IF EXISTS Oficina;
DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente(
	DNI VARCHAR(10) NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	edad INTEGER NOT NULL,
	Direccion VARCHAR(100) NOT NULL,
	email VARCHAR(100),
	Telefono VARCHAR(15) NOT NULL,	
	PRIMARY KEY (DNI)
);

CREATE TABLE Oficina(
	codigo VARCHAR(15) NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	telefono VARCHAR(15) NOT NULL, /* mejor varchar para especificar formato */
	PRIMARY KEY (codigo)
);

CREATE TABLE Cuenta(
	IBAN VARCHAR(150) NOT NULL,
	numero INTEGER NOT NULL,
	saldo DECIMAL(10,2) NOT NULL,
	fechaCreacion DATE NOT NULL,
	tipo VARCHAR(9) NOT NULL,
	interes DECIMAL(3,2),
	oficina VARCHAR(15),
	PRIMARY KEY(IBAN),
	FOREIGN KEY(oficina) REFERENCES Oficina(codigo)
);

CREATE TABLE Posee(
	DNI VARCHAR(10) NOT NULL,
	IBAN VARCHAR(150) NOT NULL,
	PRIMARY KEY (DNI,IBAN),
	FOREIGN KEY (DNI) REFERENCES Cliente(DNI),
	FOREIGN KEY (IBAN)	REFERENCES Cuenta(IBAN)
);

CREATE TABLE Operacion(
	codigo VARCHAR(150) NOT NULL,
	tipo VARCHAR(20) NOT NULL,
	fecha DATE NOT NULL,
	hora VARCHAR(8) NOT NULL,
	cantidad DECIMAL(10,2) NOT NULL,
	descripcion VARCHAR(400),
    IBANOrigen VARCHAR(150) NOT NULL,
	IBANDestino VARCHAR(150),
	oficina VARCHAR(15),
	PRIMARY KEY (codigo, IBANOrigen),
	FOREIGN KEY (IBANOrigen) REFERENCES Cuenta(IBAN),
	FOREIGN KEY (IBANDestino) REFERENCES Cuenta(IBAN),
	FOREIGN KEY (oficina) REFERENCES Oficina(codigo)
);
