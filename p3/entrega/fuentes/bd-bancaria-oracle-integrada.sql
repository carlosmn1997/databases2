BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW OpTransferenciaGlobal';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW OpEfectivoGlobal';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW OperacionGlobal';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/


BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW ClienteGlobal';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/


BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW CuentaCorrienteGlobal';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW CuentaAhorroGlobal';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW CuentaGlobal';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/


BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW PoseeGlobal';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/


BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW SucursalGlobal';
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
/



CREATE VIEW ClienteGlobal AS
SELECT T.dni, T.nombre, T.apellido1 || ' ' || T.apellido2 as apellidos,
D.calle || ' ' || D.numero || ' ' || D.piso || ' ' || D.ciudad as direccion, T.telefono, (months_between(TRUNC(sysdate), to_date(T.fecha_nacimiento,'DD-MON-YYYY'))/12 - 1900) as edad, NULL as email
FROM titular@schema2bd2 T, direccion@schema2bd2 D
WHERE T.direccion = D.id_direccion
UNION
SELECT dni, nombre, apellido as apellidos, direccion, telefono, edad, email
FROM Cliente;


CREATE VIEW CuentaGlobal AS
SELECT C.ccc as id, C.fechacreacion, C.saldo
FROM cuenta@schema2bd2 C
UNION
SELECT iban as id, fechacreacion, saldo
FROM cuenta;


CREATE VIEW PoseeGlobal AS
SELECT ccc as id, titular as dni
FROM cuenta@schema2bd2
UNION
SELECT iban as id, dni
FROM Posee;


CREATE VIEW CuentaCorrienteGlobal AS
SELECT C.ccc as id, cast(C.sucursal_codoficina as varchar(15)) as sucursal_codoficina
FROM cuentacorriente@schema2bd2 C
UNION
SELECT iban as id, oficina as sucursal_codoficina
FROM cuenta
WHERE tipo = 'corriente';


CREATE VIEW CuentaAhorroGlobal AS
SELECT C.ccc as id, C.tipointeres
FROM cuentaahorro@schema2bd2 C
UNION
SELECT iban as id, interes as tipointeres
FROM cuenta
WHERE tipo = 'ahorro';


CREATE VIEW SucursalGlobal AS
SELECT cast(S.codoficina as varchar(15)) as codoficina, S.dir, cast(S.tfno as varchar(15)) as tfno
FROM sucursal@schema2bd2 S
UNION
SELECT codigo as codoficina, direccion as dir, telefono as tfno
FROM oficina;


CREATE VIEW OperacionGlobal AS
SELECT cast(numop as varchar(100)) as numop, descripcionop, fechaop, horaop, cantidadop, ccc as id
FROM operacion@schema2bd2
UNION
SELECT codigo as numop, descripcion as descripcionop, fecha as fechaop, hora as horaop, cantidad as cantidadop, IBANOrigen as id
FROM Operacion;



CREATE VIEW OpTransferenciaGlobal AS
SELECT cast(numop as varchar(100)) as numop, cuentadestino, ccc as id
FROM optransferencia@schema2bd2
UNION
SELECT codigo as numop, IBANDestino as cuentadestino, IBANOrigen as id
FROM Operacion;



CREATE VIEW OpEfectivoGlobal AS
SELECT cast(numop as varchar(100)) as numop, tipoopefectivo, cast(sucursal_codoficina as varchar(10)) as sucursal_codoficina, ccc as id
FROM opefectivo@schema2bd2
UNION
SELECT codigo as numop, tipo as tipoefectivo, oficina as sucursal_codoficina, IBANOrigen as id
FROM Operacion
WHERE tipo = 'ingreso' or tipo = 'retirada';


