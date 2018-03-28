--Oracle 11g Express Edition
-- Put your Oracle SQL statement here and execute it


/* ELIMINAR TABLAS SI EXISTIAN */

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Cliente FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE CuentaCorriente FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE CuentaAhorro FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Cuenta FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Oficina FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Ingreso FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Retirada FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Transferencia FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Operacion FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

/* ELIMINACION DE TIPOS SI EXISTIAN */

BEGIN
    EXECUTE IMMEDIATE 'DROP TYPE array_cuentas FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/


BEGIN
    EXECUTE IMMEDIATE 'DROP TYPE array_clientes FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/


BEGIN
    EXECUTE IMMEDIATE 'DROP TYPE TransferenciaUdt FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TYPE IngresoUdt FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TYPE RetiradaUdt FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TYPE OperacionUdt FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TYPE CuentaCorrienteUdt FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TYPE CuentaAhorroUdt FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TYPE OficinaUdt FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/


BEGIN
    EXECUTE IMMEDIATE 'DROP TYPE ClienteUdt FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/


BEGIN
    EXECUTE IMMEDIATE 'DROP TYPE CuentaUdt FORCE';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/



/* BLOQUE DECLARACION TIPOS Y ARRAYS */

SET SERVEROUTPUT ON;


/* De Cliente <-> Cuenta */
CREATE TYPE ClienteUdt;
/
CREATE TYPE CuentaUdt;
/

/* VARRAYS QUE SE NECESITAN */
CREATE TYPE array_cuentas AS VARRAY(50) of REF CuentaUdt;
/

CREATE TYPE array_clientes AS VARRAY(20) of REF ClienteUdt;
/

/* De cuentaCorriente <-> Banco*/
CREATE TYPE CuentaCorrienteUdt;
/


CREATE TYPE CuentaAhorroUdt;
/

/* De Cuenta <-> Operacion */
CREATE TYPE OperacionUdt;
/

/* De Cuenta <-> Transferencia */

CREATE TYPE TransferenciaUdt;
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


CREATE TYPE CuentaUdt AS OBJECT(
	IBAN VARCHAR(150),
	numero INTEGER,
	saldo DECIMAL(10,2),
	fechaCreacion DATE,
	clientes array_clientes
)
NOT FINAL;
/

CREATE TYPE OficinaUdt AS OBJECT(
  codigo VARCHAR(10),
  direccion VARCHAR(50),
  telefono VARCHAR(10)
)
NOT FINAL;
/



CREATE OR REPLACE TYPE CuentaCorrienteUdt UNDER CuentaUdt(
  oficina ref OficinaUdt
)
NOT FINAL;
/
  
CREATE OR REPLACE TYPE CuentaAhorroUdt UNDER CuentaUdt(
   interes DECIMAL(3,2)
)
NOT FINAL;
/


CREATE TYPE OperacionUdt AS OBJECT(
  	codigo VARCHAR(150),
	fecha DATE,
	hora VARCHAR(8),
	cantidad DECIMAL(10,2),
	descripcion VARCHAR(400),
	IBANOrigen ref CuentaUdt
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
) object id system generated;


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
) object id system generated;

CREATE TABLE CuentaCorriente OF CuentaCorrienteUdt(
	oficina NOT NULL
) object id system generated;


CREATE TABLE CuentaAhorro OF CuentaAhorroUdt(
	interes NOT NULL
) object id system generated;
