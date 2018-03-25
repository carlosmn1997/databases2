

DROP TABLE Cliente;
DROP TABLE Cuenta;
DROP TABLE Oficina;
DROP TABLE CuentaCorriente;
DROP TABLE CuentaAhorro;

DROP TYPE ClienteUdt;
DROP TYPE CuentaUdt;
DROP TYPE OficinaUdt;

CREATE TYPE ClienteUdt AS (
	nombre	VARCHAR(100),
	apellido VARCHAR(100),
	DNI VARCHAR(10),
	edad INTEGER,
	direccion VARCHAR(100),
	email VARCHAR(100),
	telefono INTEGER
);

CREATE TYPE CuentaUdt AS (
	IBAN VARCHAR(150),
	numero INTEGER,
	saldo DECIMAL(10,2),
	fechaCreacion DATE
);

CREATE TYPE OficinaUdt AS (
  codigo VARCHAR(10),
  direccion VARCHAR(50),
  telefono VARCHAR(10)
);


CREATE TABLE Cliente of ClienteUdt;

CREATE TABLE Cuenta of CuentaUdt;

CREATE TABLE Oficina of OficinaUdt;

CREATE TABLE CuentaCorriente(
	oficina OficinaUdt REFERENCES Oficina(codigo)
) INHERITS (Cuenta);






CREATE OR REPLACE TYPE CuentaCorrienteUdt UNDER CuentaUdt(
  oficina ref OficinaUdt
);
/

CREATE OR REPLACE TYPE CuentaAhorroUdt UNDER CuentaUdt(
   interes DECIMAL(3,2)
);
/


CREATE TYPE OperacionUdt AS OBJECT(
  	codigo VARCHAR(150),
	IBANOrigen VARCHAR(150),
	fecha DATE,
	hora VARCHAR(8),
	cantidad DECIMAL(10,2),
	descripcion VARCHAR(400)
)
NOT FINAL;
/


CREATE TYPE TransferenciaUdt UNDER OperacionUdt(
    IBANDestino ref CuentaUdt
)
NOT FINAL;
/

CREATE TYPE IngresoUdt UNDER OperacionUdt(
	oficina ref OficinaUdt
)
NOT FINAL;
/

CREATE TYPE RetiradaUdt UNDER OperacionUdt(
	oficina ref OficinaUdt
)
NOT FINAL;
/


/* CREACION DE TABLAS */

CREATE TABLE Cliente OF ClienteUdt(
	nombre	NOT NULL,
	apellido NOT NULL,
	dni PRIMARY KEY,
	edad NOT NULL,
	telefono NOT NULL,
	direccion NOT NULL,
	cuentas NOT NULL
);


CREATE TABLE Cuenta OF CuentaUdt(
	IBAN PRIMARY KEY,
	numero NOT NULL,
	saldo NOT NULL,
	fechaCreacion NOT NULL,
	clientes NOT NULL
) object id system generated;


CREATE TABLE Oficina OF OficinaUdt(
	codigo PRIMARY KEY,
  	direccion NOT NULL,
  	telefono NOT NULL
);


CREATE TABLE Operacion OF OperacionUdt(
	PRIMARY KEY(codigo, IBANOrigen),
	FOREIGN KEY(IBANOrigen) REFERENCES Cuenta(IBAN)
);
