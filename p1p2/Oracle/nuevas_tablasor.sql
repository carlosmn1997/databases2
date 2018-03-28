/* ELIMINAR TABLAS SI EXISTIAN */

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Cliente FORCE';
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
	clientes array_clientes,
	MAP MEMBER FUNCTION get_IBAN RETURN VARCHAR2,
	MEMBER FUNCTION show RETURN VARCHAR2
)
NOT FINAL;
/


CREATE OR REPLACE TYPE BODY CuentaUdt AS
 MAP MEMBER FUNCTION get_IBAN RETURN VARCHAR2 IS
 BEGIN
   RETURN IBAN;
 END;
-- function that can be overriden by subtypes
 MEMBER FUNCTION show RETURN VARCHAR2 IS
 BEGIN
   RETURN 'IBAN: ' || IBAN || ', Numero: ' || TO_CHAR(numero);
 END;
 
END;
/


CREATE TYPE OficinaUdt AS OBJECT(
  codigo VARCHAR(10),
  direccion VARCHAR(50),
  telefono VARCHAR(10)
)
NOT FINAL;
/



CREATE TYPE CuentaCorrienteUdt UNDER CuentaUdt(
  oficina ref OficinaUdt,
  OVERRIDING MEMBER FUNCTION show RETURN VARCHAR2
)
NOT FINAL;
/

CREATE OR REPLACE TYPE BODY CuentaCorrienteUdt AS
 OVERRIDING MEMBER FUNCTION show RETURN VARCHAR2 IS
 BEGIN
    RETURN show || ' -- Oficina: ';
 END;
 
END;
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
	cuentaOrigen ref CuentaUdt
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
	saldo DEFAULT 0,
	fechaCreacion NOT NULL,
	clientes NOT NULL
) object id system generated;


CREATE TABLE Oficina OF OficinaUdt(
	codigo PRIMARY KEY,
  	direccion NOT NULL,
  	telefono NOT NULL
) object id system generated;


CREATE TABLE Operacion OF OperacionUdt(
  	codigo PRIMARY KEY,
	fecha NOT NULL,
	hora NOT NULL,
	cantidad NOT NULL,
	cuentaOrigen NOT NULL
) object id system generated;


/* Procedimiento para la relacion cliente-cuenta */

CREATE OR REPLACE PROCEDURE relacionClienteCuenta(dniAsociar VARCHAR, ibanAsociar VARCHAR)
IS
	cuentas_aux array_cuentas := array_cuentas();
	clientes_aux array_clientes := array_clientes();
	cuenta_ref REF CuentaUdt;
	cliente_ref REF ClienteUdt;
BEGIN
-- Se hace primero con la tabla Cliente
EXECUTE IMMEDIATE
	'SELECT cuentas FROM Cliente WHERE DNI = :1 FOR UPDATE OF cuentas' INTO cuentas_aux USING dniAsociar;

	SELECT ref(C) into cuenta_ref FROM Cuenta C WHERE C.IBAN=ibanAsociar;

	cuentas_aux.EXTEND(1);
	cuentas_aux(cuentas_aux.LAST) := cuenta_ref;

EXECUTE IMMEDIATE
	'UPDATE Cliente SET cuentas = :1 WHERE DNI = :2'
	USING cuentas_aux, dniAsociar;

-- Ahora con la tabla Cuenta

EXECUTE IMMEDIATE
	'SELECT clientes FROM Cuenta WHERE IBAN = :1 FOR UPDATE OF clientes' INTO clientes_aux USING ibanAsociar;

	SELECT ref(C) into cliente_ref FROM Cliente C WHERE C.DNI=dniAsociar;

	clientes_aux.EXTEND(1);
	clientes_aux(clientes_aux.LAST) := cliente_ref;

EXECUTE IMMEDIATE
	'UPDATE Cuenta SET clientes = :1 WHERE IBAN = :2'
	USING clientes_aux, ibanAsociar;


END relacionClienteCuenta;
/


