--Oracle 11g Express Edition
-- Put your Oracle SQL statement here and execute it

select banner as "oracle version" from v$version;


/* ELIMINAR TIPOS Y TABLAS SI EXISTIAN */
DROP TABLE Cliente FORCE;
DROP TABLE Cuenta FORCE;
DROP TABLE Oficina FORCE;
DROP TABLE Operacion FORCE;

DROP TYPE array_cuentas FORCE;
DROP TYPE array_clientes FORCE;
DROP TYPE array_operaciones FORCE;
DROP TYPE array_transferencias FORCE;
DROP TYPE array_cuentas_corrientes FORCE;

DROP TYPE RetiradaUdt FORCE;
DROP TYPE IngresoUdt FORCE;
DROP TYPE TransferenciaUdt FORCE;
DROP TYPE OperacionUdt FORCE;
DROP TYPE OficinaUdt FORCE;
DROP TYPE CuentaCorrienteUdt FORCE;
DROP TYPE CuentaAhorroUdt FORCE;
DROP TYPE CuentaCorrienteUdt FORCE;
DROP TYPE ClienteUdt FORCE;
DROP TYPE CuentaUdt FORCE;




/* BLOQUE DECLARACION TIPOS Y ARRAYS */
SET SERVEROUTPUT ON;

/* De Cliente <-> Cuenta */
CREATE TYPE ClienteUdt;
/
CREATE TYPE CuentaUdt;
/

/* De cuentaCorriente <-> Banco*/
CREATE TYPE CuentaCorrienteUdt;
/


/* De Cuenta <-> Operacion */
CREATE TYPE OperacionUdt;
/

/* De Cuenta <-> Transferencia */

CREATE TYPE TransferenciaUdt;
/


/* VARRAYS QUE SE NECESITAN */
CREATE TYPE array_cuentas AS VARRAY(50) of REF CuentaUdt;
/

CREATE TYPE array_clientes AS VARRAY(20) of REF ClienteUdt;
/

CREATE TYPE array_operaciones AS VARRAY(100) of REF OperacionUdt;
/

CREATE TYPE array_transferencias AS VARRAY(100) of REF TransferenciaUdt;
/

CREATE TYPE array_cuentas_corrientes AS VARRAY(100) of REF CuentaCorrienteUdt;
/


/*---------------- DEFINICION DE TIPOS -------------- */

CREATE TYPE ClienteUdt AS OBJECT (
	nombre	VARCHAR(100),
	apellido VARCHAR(100),
	DNI VARCHAR(10),
	edad INTEGER,
	direccion VARCHAR(100),
	email VARCHAR(100),
	telefono INTEGER,
	cuentas array_cuentas
)
NOT FINAL;
/


CREATE TYPE OficinaUdt AS OBJECT(
  codigo VARCHAR(10),
  direccion VARCHAR(50),
  telefono VARCHAR(10),
  cuentas array_cuentas_corrientes
)
NOT FINAL;
/

CREATE TYPE CuentaUdt AS OBJECT(
	IBAN VARCHAR(150),
	numero INTEGER,
	saldo DECIMAL(10,2),
	fechaCreacion DATE,
	clientes array_clientes,
	operaciones array_operaciones,
    	transferencias array_transferencias
)
NOT FINAL;
/

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
