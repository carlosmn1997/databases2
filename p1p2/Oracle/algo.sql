CREATE TYPE ClienteUdt;
/
CREATE TYPE CuentaUdt;
/

CREATE TYPE CuentaCorrienteUdt;
/

CREATE TYPE cuentasDeClientes AS VARARRAY(20) of REF CuentaUdt;
/

CREATE TYPE clientesDeCuentas AS VARARRAY(20) of REF ClienteUdt;
/

CREATE TYPE cuentasDeOficina AS VARARRAY(20) of REF CuentaCorrienteUdt;
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

CREATE TYPE Oficina AS OBJECT(
  codigo VARCHAR(10),
  direccion VARCHAR(50),
  Telefono VARCHAR(10),
  cuentas cuentasDeOficina
)
NOT FINAL;
/

CREATE TYPE CuentaCorriente UNDER CuentaUdt(
  oficina ref OficinaUdt
  );