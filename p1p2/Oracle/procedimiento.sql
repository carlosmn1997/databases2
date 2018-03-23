DELETE FROM Cliente C WHERE C.DNI='34-3480976';
/*
DELETE FROM Cuenta C WHERE C.IBAN='MD72 OY6E HSY7 0HZK AM0D PAB0';
*/
insert into Cliente (DNI, nombre, apellido, edad, direccion, email, telefono, cuentas) values ('34-3480976', 'Conant', 'Lidgard', 24, '34 Lakewood Point', 'clidgard0@ox.ac.uk', '4786467588', cuentasDeClientes());

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE relacionClienteCuenta(dniAsociar VARCHAR, ibanAsociar VARCHAR)
IS

	cuentas_nuevas cuentasDeClientes;
	cuentas_aux cuentasDeClientes;
	cuenta_ref REF CuentaUdt;
	V_COUNT INTEGER;
	i integer := 0;
BEGIN

	SELECT C.cuentas into cuentas_aux FROM Cliente C WHERE C.DNI=dniAsociar;

	V_COUNT := cuentas_aux.COUNT;
	dbms_output.put_line(V_COUNT);
	cuentas_nuevas := cuentasDeClientes();
	cuentas_nuevas.extend(V_COUNT+1);

	FOR i IN 1..V_COUNT LOOP
		dbms_output.put_line('DENTRO BUCLE');
		cuentas_nuevas(i) := cuentas_aux(i);
	END LOOP;

	SELECT ref(C) into cuenta_ref FROM Cuenta C WHERE C.IBAN=ibanAsociar;
	cuentas_nuevas(V_COUNT+1) := cuenta_ref;

	UPDATE Cliente
	SET cuentas = cuentas_nuevas
	WHERE DNI=dniAsociar;


END;
/

SHOW ERRORS;

EXEC relacionClienteCuenta('34-3480976', 'MD72 OY6E HSY7 0HZK AM0D PAB0');

SELECT C.cuentas
FROM Cliente C
WHERE DNI = '34-3480976';


SELECT C.clientes
FROM Cuenta C
WHERE IBAN = 'MD72 OY6E HSY7 0HZK AM0D PAB0';


