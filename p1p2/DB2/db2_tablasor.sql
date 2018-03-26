-- DROP DE TABLES



-- DROP TYPES

DROP TYPE OperacionUdt;
DROP TYPE RetiradaUdt;
DROP TYPE IngresoUdt;
DROP TYPE TransferenciaUdt;
DROP TYPE CuentaCorrienteUdt;
DROP TYPE CuentaAhorroUdt;
DROP TYPE OficinaUdt;
DROP TYPE CuentaUdt;
DROP TYPE ClienteUdt;
DROP TYPE OperacionUdt;

CREATE TYPE ClienteUdt AS(
	nombre	VARCHAR(100),
	apellido VARCHAR(100),
	DNI VARCHAR(10),
	edad INTEGER,
	direccion VARCHAR(100),
	email VARCHAR(100),
	telefono INTEGER
) MODE DB2SQL;

CREATE TYPE CuentaUdt AS(
	IBAN VARCHAR(150),
	numero INTEGER,
	saldo DECIMAL(10,2),
	fechaCreacion DATE
) MODE DB2SQL;


CREATE TYPE OperacionUdt(
  	codigo VARCHAR(150),
	IBANOrigen ref(CuentaUdt),
	fecha DATE,
	hora VARCHAR(8),
	cantidad DECIMAL(10,2),
	descripcion VARCHAR(400)
) MODE DB2SQL;


CREATE TYPE OficinaUdt AS(
  codigo VARCHAR(10),
  direccion VARCHAR(50),
  telefono VARCHAR(10)
) MODE DB2SQL;

CREATE TYPE CuentaCorrienteUdt UNDER CuentaUdt AS(
  oficina ref(OficinaUdt)
) MODE DB2SQL;

CREATE TYPE CuentaAhorroUdt UNDER CuentaUdt AS(
  interes DECIMAL(3,2)
) MODE DB2SQL;


CREATE TYPE OperacionUdt AS(
  	codigo VARCHAR(150),
	fecha DATE,
	hora VARCHAR(8),
	cantidad DECIMAL(10,2),
	descripcion VARCHAR(400),
	cuentaOrigen ref(CuentaUdt)
) MODE DB2SQL;


CREATE TYPE TransferenciaUdt UNDER OperacionUdt AS(
    IBANDestino ref(CuentaUdt)
) MODE DB2SQL;

CREATE TYPE IngresoUdt UNDER OperacionUdt AS(
	oficina ref(OficinaUdt)
) MODE DB2SQL;

CREATE TYPE RetiradaUdt UNDER OperacionUdt AS(
	oficina ref(OficinaUdt)
) MODE DB2SQL;

-- Creacion de tablas

CREATE TABLE Cliente OF ClienteUdt(
	REF IS oid USER GENERATED,
	nombre WITH OPTIONS NOT NULL,
	apellido WITH OPTIONS NOT NULL,
	DNI WITH OPTIONS NOT NULL,
	edad WITH OPTIONS NOT NULL,
	direccion WITH OPTIONS NOT NULL,
	telefono WITH OPTIONS NOT NULL
);


CREATE TABLE Cuenta OF CuentaUdt(
	REF IS oid USER GENERATED,
	IBAN WITH OPTIONS NOT NULL,
	numero WITH OPTIONS NOT NULL,
	saldo WITH OPTIONS NOT NULL,
	fechaCreacion WITH OPTIONS NOT NULL
);


CREATE TABLE Oficina OF OficinaUdt(
  REF IS oid USER GENERATED,
  codigo WITH OPTIONS NOT NULL,
  direccion WITH OPTIONS NOT NULL,
  telefono WITH OPTIONS NOT NULL
);


CREATE TABLE Operacion OF OperacionUdt(
	REF IS oid USER GENERATED,
  	codigo WITH OPTIONS NOT NULL,
	cuentaOrigen WITH OPTIONS NOT NULL,
	fecha WITH OPTIONS NOT NULL,
	hora WITH OPTIONS NOT NULL,
	cantidad WITH OPTIONS NOT NULL,
	descripcion WITH OPTIONS NOT NULL
);

CREATE TABLE CuentaCorriente OF CuentaCorrienteUdt UNDER Cuenta INHERIT SELECT PRIVILEGES(
  oficina WITH OPTIONS SCOPE Oficina
);

CREATE TABLE CuentaAhorro OF CuentaAhorroUdt UNDER Cuenta INHERIT SELECT PRIVILEGES(
  interes WITH OPTIONS NOT NULL
);


CREATE TABLE Transferencia OF TransferenciaUdt UNDER Operacion INHERIT SELECT PRIVILEGES(
	IBANDestino WITH OPTIONS SCOPE Cuenta
);


CREATE TABLE Ingreso OF IngresoUdt UNDER Operacion INHERIT SELECT PRIVILEGES(
	oficina WITH OPTIONS SCOPE Oficina
);


CREATE TABLE Retirada OF RetiradaUdt UNDER Operacion INHERIT SELECT PRIVILEGES(
	oficina WITH OPTIONS SCOPE Oficina
);
