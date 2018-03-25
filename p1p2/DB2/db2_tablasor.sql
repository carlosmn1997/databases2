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
	IBANOrigen VARCHAR(150),
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
