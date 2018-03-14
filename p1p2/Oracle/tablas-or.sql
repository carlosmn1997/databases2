CREATE TYPE ClienteUdt;
/
CREATE TYPE CuentaUdt;
/

CREATE TYPE cuentasDeClientes AS VARARRAY(20) of REF CuentaUdt;
/

CREATE TYPE clientesDeCuentas AS VARARRAY(20) of REF ClienteUdt;
/

CREATE TYPE ClienteUdt AS OBJECT (
	Nombre	VARCHAR(100),
	Apellido VARCHAR(100),
	DNI VARCHAR(10),
	Edad INTEGER,
	Direccion VARCHAR(100),
	Email VARCHAR(100),
	Telefono INTEGER,
	cuentas cuentasDeClientes
)
NOT FINAL;
/

CREATE TYPE CuentaUdt AS OBJECT(
	IBAN VARCHAR(150),
	numero INTEGER,
	saldo DECIMAL(10,2),
	fechaCreacion DATE,
	tipo VARCHAR(9),
	interes DECIMAL(3,2),
	oficina VARCHAR(15),
	clientes clientesDeCuentas
);
/

CREATE TABLE Cliente OF ClienteUdt(
  Nombre primary key
);


CREATE TYPE ClienteUdt AS OBJECT (
	Nombre	VARCHAR(100),
	Apellido VARCHAR(100),
	DNI VARCHAR(10),
	Edad INTEGER,
	Direccion VARCHAR(100),
	Email VARCHAR(100),
	Telefono INTEGER,
	cuentas ref(cuentaUdt) array[10]
);

CREATE TYPE CuentaUdt AS OBJECT(
	IBAN VARCHAR(150),
	numero INTEGER,
	saldo DECIMAL(10,2),
	fechaCreacion DATE,
	tipo VARCHAR(9),
	interes DECIMAL(3,2),
	oficina VARCHAR(15),
	clientes ref(CuentaUdt) array[10]
);

CREATE TYPE OficinaUdt AS OBJECT (
	codigo VARCHAR(15),
	direccion VARCHAR(100),
	telefono INTEGER
);

CREATE TYPE OperacionUdt AS OBJECT (
	codigo VARCHAR(150),
	fecha DATE,
	hora VARCHAR(8),
	cantidad DECIMAL(10,2),
	descripcion VARCHAR(400),
    IBANOrigen VARCHAR(150),
	IBANDestino VARCHAR(150),
	oficina VARCHAR(15)
);

CREATE TABLE Cliente OF ClienteUdt
( primary key (DNI),
);
CREATE TABLE Cuenta OF CuentaUdt
( primary key (IBAN)
);
CREATE TABLE Oficina OF OficinaUdt;
CREATE TABLE Operacion OF OperacionUdt;