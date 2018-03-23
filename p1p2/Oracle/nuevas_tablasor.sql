--Oracle 11g Express Edition
-- Put your Oracle SQL statement here and execute it

select banner as "oracle version" from v$version;


/* ELIMINAR TIPOS Y TABLAS SI EXISTIAN */
DROP TABLE Cliente FORCE;
DROP TYPE ClienteUdt FORCE;
DROP TYPE CuentaUdt FORCE;
DROP TYPE cuentasDeClientes FORCE;
DROP TYPE clientesDeCuentas FORCE;


/* BLOQUE DECLARACION TIPOS Y ARRAYS */
SET SERVEROUTPUT ON;
/* De Cliente <-> Cuenta */
CREATE TYPE ClienteUdt;
/
CREATE TYPE CuentaUdt;
/

CREATE TYPE cuentasDeClientes AS VARRAY(20) of REF CuentaUdt;
/

CREATE TYPE clientesDeCuentas AS VARRAY(20) of REF ClienteUdt;
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

DBMS_OUTPUT.PUT_LINE('Creo tipo cuenta');

CREATE TYPE CuentaUdt AS OBJECT(
	IBAN VARCHAR(150),
	numero INTEGER,
	saldo DECIMAL(10,2),
	fechaCreacion DATE,
	clientes clientesDeCuentas
)
NOT FINAL;
/

DBMS_OUTPUT.PUT_LINE('Creo tipo cuenta');


/* CREACION DE TABLAS */

CREATE TABLE Cliente OF ClienteUdt(
	Nombre	NOT NULL,
	Apellido NOT NULL,
	DNI PRIMARY KEY,
	Edad NOT NULL,
	cuentas NOT NULL
);

CREATE OR REPLACE PROCEDURE kk(numer number)
IS
BEGIN
END;
/

SHOW ERRORS;

