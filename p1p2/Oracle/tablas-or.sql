/* BLOQUE DECLARACION TIPOS Y ARRAYS */

/* De Cliente <-> Cuenta */
CREATE TYPE ClienteUdt;
/
CREATE TYPE CuentaUdt;
/

CREATE TYPE cuentasDeClientes AS VARARRAY(20) of REF CuentaUdt;
/

CREATE TYPE clientesDeCuentas AS VARARRAY(20) of REF ClienteUdt;
/

/* De cuentaCorriente <-> Banco*/
CREATE TYPE CuentaCorrienteUdt;
/

CREATE TYPE cuentasDeOficina AS VARARRAY(20) of REF CuentaCorrienteUdt;
/

/* De Cuenta <-> Operacion */
CREATE TYPE OperacionUdt;
/

CREATE TYPE operacionesDeCuenta AS VARARRAY(100) of REF OperacionUdt;
/

/* De Cuenta <-> Transferencia */

CREATE TYPE TransferenciaUdt;

CREATE TYPE transferenciasACuenta AS VARARRAY(100) of REF TransferenciaUdt;

/* De Oficina <-> IngresoRetirada */

CREATE TYPE IngresoRetiradaUdt;

CREATE TYPE ingresosRetiradasOficina AS VARARRAY(100) of ref IngresoRetiradaUdt;

/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/

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
	clientes clientesDeCuentas,
    operaciones operacionesDeCuenta,
    transferencias transferenciasACuenta
)
NOT FINAL;
/

CREATE TYPE CuentaCorrienteUdt UNDER CuentaUdt(
  oficina ref OficinaUdt
);
/
  
CREATE TYPE CuentaAhorroUdt UNDER CuentaUdt(
   interes DECIMAL(3,2)
);

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

CREATE TYPE IngresoRetiradaUdt UNDER OperacionUdt(
  oficina ref OficinaUdt
)
NOT FINAL;
/

CREATE TYPE IngresoUdt UNDER IngresoRetiradaUdt(
)
NOT FINAL;
/

CREATE TYPE RetiradaUdt UNDER IngresoRetiradaUdt(
)
NOT FINAL;
/

CREATE TYPE Oficina AS OBJECT(
  codigo VARCHAR(10),
  direccion VARCHAR(50),
  Telefono VARCHAR(10),
  cuentas cuentasDeOficina,
  ingresosRetiradas ingresosRetiradasOficina
)
NOT FINAL;
/