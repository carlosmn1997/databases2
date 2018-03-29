/* INSERCION DE CLIENTES */

insert into Cliente (DNI, nombre, apellido, edad, direccion, email, telefono) values ('34-3480976', 'Conant', 'Lidgard', 24, '34 Lakewood Point', 'clidgard0@ox.ac.uk', '4786467588');

insert into Cliente (DNI, nombre, apellido, edad, direccion, email, telefono, cuentas) values ('67-9251171', 'Wendye', 'Stuckey', 85, '464 Buhler Lane', 'wstuckey1@slate.com', '9373548143', array_cuentas());

insert into Cliente (DNI, nombre, apellido, edad, direccion, email, telefono, cuentas) values ('78-7995931', 'Annalise', 'Willcott', 53, '4 Ronald Regan Park', null, '1984656758', array_cuentas());

insert into Cliente (DNI, nombre, apellido, edad, direccion, email, telefono, cuentas) values ('92-5943193', 'Sanford', 'Leahey', 76, '94 La Follette Terrace', 'sleaheynv@phoca.cz', '1407316768', array_cuentas());


/* INSERCION DE OFICINA */

insert into Oficina (codigo, direccion, telefono) values (795, '54916 Mayfield Drive', '4655607686');

/* INSERCION DE CUENTA */

-- CORRIENTE


insert into Cuenta VALUES (CuentaCorrienteUdt('DE33 7520 1499 2492 9685 27', 1060, 15392, TO_DATE( '1996-01-25' , 'YYYY-MM-DD'), array_clientes(), (select ref(ofi) FROM Oficina ofi WHERE ofi.codigo=795)));

insert into Cuenta VALUES (CuentaCorrienteUdt('DE33 7520 1499 2492 9685 27', 1060, 15392, TO_DATE( '1996-01-25' , 'YYYY-MM-DD'), array_clientes(), (select ref(ofi) FROM Oficina ofi WHERE ofi.codigo=795)));

insert into Cuenta VALUES (CuentaCorrienteUdt('FR77 2620 0309 16V3 KGNX B3PC N29', 1534, 8218, TO_DATE( '2006-06-02' , 'YYYY-MM-DD'), array_clientes(), (select ref(ofi) FROM Oficina ofi WHERE ofi.codigo=795)));

-- AHORRO

insert into CuentaAhorro (IBAN, numero, saldo, fechaCreacion, interes) VALUES ('MD72 OY6E HSY7 0HZK AM0D PAB1', 572, 1590, TO_DATE( '1974-02-28' , 'YYYY-MM-DD'), 3.23);


insert into Cuenta VALUES (CuentaAhorroUdt('MD72 OY6E HSY7 0HZK AM0D PAB0', 572, 1590, TO_DATE( '1974-02-28' , 'YYYY-MM-DD'), array_clientes(), 3.23));

insert into Cuenta VALUES (CuentaAhorroUdt('BR69 5012 8504 4863 3270 2788 435D T', 167, 9490, TO_DATE( '1991-09-25' , 'YYYY-MM-DD'), array_clientes(), 2.1));

/* INSERCION DE OPERACIONES */

-- INGRESO

insert into Operacion VALUES (IngresoUdt(1, TO_DATE( '2014-05-06' , 'YYYY-MM-DD'), '2:24 PM', 2209.89, 'Activity, cheerleading', (select ref(cu) FROM Cuenta cu WHERE cu.IBAN='DE33 7520 1499 2492 9685 27'), (select ref(ofi) FROM Oficina ofi WHERE ofi.codigo=795)));


insert into Operacion VALUES (IngresoUdt(2, TO_DATE( '2014-05-03' , 'YYYY-MM-DD'), '1:24 PM', 302.89, 'Dinero para los estudios', (select ref(cu) FROM Cuenta cu WHERE cu.IBAN='BR69 5012 8504 4863 3270 2788 435D T'), (select ref(ofi) FROM Oficina ofi WHERE ofi.codigo=795)));


-- RETIRADA

insert into Operacion VALUES (RetiradaUdt(3, TO_DATE( '2003-05-06' , 'YYYY-MM-DD'), '6:40 PM', 100.99, 'Para un capricho', (select ref(cu) FROM Cuenta cu WHERE cu.IBAN='DE33 7520 1499 2492 9685 27'), (select ref(ofi) FROM Oficina ofi WHERE ofi.codigo=795)));


insert into Operacion VALUES (RetiradaUdt(4, TO_DATE( '2005-06-08' , 'YYYY-MM-DD'), '8:30 PM', 250.49, null, (select ref(cu) FROM Cuenta cu WHERE cu.IBAN='FR77 2620 0309 16V3 KGNX B3PC N29'), (select ref(ofi) FROM Oficina ofi WHERE ofi.codigo=795)));

-- TRANSFERENCIA

insert into Operacion VALUES (TransferenciaUdt(5, TO_DATE( '2001-01-01' , 'YYYY-MM-DD'), '5:30 PM', 500.00, null, (select ref(cu) FROM Cuenta cu WHERE cu.IBAN='FR77 2620 0309 16V3 KGNX B3PC N29'), (select ref(cu) FROM Cuenta cu WHERE cu.IBAN='DE33 7520 1499 2492 9685 27')));


insert into Operacion VALUES (TransferenciaUdt(6, TO_DATE( '2001-01-02' , 'YYYY-MM-DD'), '4:30 PM', 550.00, null, (select ref(cu) FROM Cuenta cu WHERE cu.IBAN='FR77 2620 0309 16V3 KGNX B3PC N29'), (select ref(cu) FROM Cuenta cu WHERE cu.IBAN='MD72 OY6E HSY7 0HZK AM0D PAB0')));

/* RELACIONES CLIENTE CUENTA PARA PROBAR EL PROCEDIMIENTO */

CALL relacionClienteCuenta('34-3480976', 'DE33 7520 1499 2492 9685 27');

CALL relacionClienteCuenta('34-3480976', 'MD72 OY6E HSY7 0HZK AM0D PAB0');

/* PRUEBAS */

-- Habilitamos la salida estandar
SET SERVEROUTPUT ON;


-- Mostramos el IBAN de las cuentas asociadas a 34-3480976

DECLARE
	iban_cuenta VARCHAR(150);
	cuenta_ref_var REF CuentaUdt;
	cuentas_ref_var array_cuentas;
BEGIN
	SELECT c.cuentas INTO cuentas_ref_var FROM Cliente c WHERE DNI = '34-3480976';

	FOR i IN cuentas_ref_var.FIRST .. cuentas_ref_var.LAST LOOP
		cuenta_ref_var := cuentas_ref_var(i);
		SELECT IBAN INTO iban_cuenta FROM Cuenta c WHERE ref(c) = cuenta_ref_var;
	DBMS_OUTPUT.PUT_LINE('IBAN: ' || iban_cuenta);
	END LOOP;
END;
/

-- Miramos si estan los de tipo operacion

SELECT TREAT(VALUE(o) AS RetiradaUdt)
  FROM Operacion o;

