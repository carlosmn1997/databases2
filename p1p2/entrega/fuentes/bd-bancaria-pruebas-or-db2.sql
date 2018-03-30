-- INSERCION CLIENTES

insert into Cliente (oid, nombre, apellido, DNI, edad, direccion, telefono) VALUES (ClienteUdt('1'), 'Conant', 'Lidgard', '34-3480976',  24, '34 Lakewood Point', '4786467588');

insert into Cliente (oid, DNI, nombre, apellido, edad, direccion, email, telefono) values (ClienteUdt('2'), '67-9251171', 'Wendye', 'Stuckey', 85, '464 Buhler Lane', 'wstuckey1@slate.com', '9373548143');

insert into Cliente (oid, DNI, nombre, apellido, edad, direccion, email, telefono) values (ClienteUdt('3'),'78-7995931', 'Annalise', 'Willcott', 53, '4 Ronald Regan Park', null, '1984656758');

insert into Cliente (oid, DNI, nombre, apellido, edad, direccion, email, telefono) values (ClienteUdt('4'),'92-5943193', 'Sanford', 'Leahey', 76, '94 La Follette Terrace', 'sleaheynv@phoca.cz', '1407316768');

-- INSERCION DE OFICINA

insert into Oficina (oid, codigo, direccion, telefono) values (OficinaUdt('1'), 795, '54916 Mayfield Drive', '4655607686');

-- INSERCION CUENTA AHORRO

insert into CuentaAhorro (oid, IBAN, numero, saldo, fechaCreacion, interes) values (CuentaAhorroUdt('1'),'MD72 OY6E HSY7 0HZK AM0D PAB0', 572, 1590, '1974-02-28', 3.23);

insert into CuentaAhorro (oid, IBAN, numero, saldo, fechaCreacion, interes) values (CuentaAhorroUdt('2'),'BR69 5012 8504 4863 3270 2788 435D T', 167, 9490, '1991-09-25', 2.1);

-- INSERCION CUENTA CORRIENTE

insert into CuentaCorriente (oid, IBAN, numero, saldo, fechaCreacion, oficina) values (CuentaCorrienteUdt('3'),'DE33 7520 1499 2492 9685 27', 1060, 15392, '1996-01-25', (select oid FROM Oficina WHERE codigo=795));

insert into CuentaCorriente (oid, IBAN, numero, saldo, fechaCreacion, oficina) values (CuentaCorrienteUdt('4'),'FR77 2620 0309 16V3 KGNX B3PC N29', 1534, 8218, '2006-06-02', (select oid FROM Oficina WHERE codigo=795));

-- INSERCION DE OPERACIONES

-- INGRESO

insert into Ingreso (oid, codigo, ibanOrigen, fecha, hora, cantidad, descripcion, oficina) VALUES (IngresoUdt('1'), 1, 'DE33 7520 1499 2492 9685 27', '2014-05-06', '2:24 PM', 2209.89, 'Activity, cheerleading', (select oid FROM Oficina WHERE codigo=795));

insert into Ingreso (oid, codigo, ibanOrigen, fecha, hora, cantidad, descripcion, oficina) VALUES (IngresoUdt('2'), 2, 'BR69 5012 8504 4863 3270 2788 435D T', '2014-05-03', '1:24 PM', 302.89, 'Dinero para los estudios', (select oid FROM Oficina WHERE codigo=795));

-- RETIRADA

insert into Retirada (oid, codigo, ibanOrigen, fecha, hora, cantidad, descripcion, oficina) VALUES (RetiradaUdt('3'), 3, 'DE33 7520 1499 2492 9685 27', '2003-05-06', '6:40 PM', 100.99, 'Para un capricho', (select oid FROM Oficina WHERE codigo=795));

insert into Retirada (oid, codigo, ibanOrigen, fecha, hora, cantidad,  oficina) VALUES (RetiradaUdt('4'), 4, 'FR77 2620 0309 16V3 KGNX B3PC N29', '2001-01-01', '8:30 PM', 250.49, (select oid FROM Oficina WHERE codigo=795));

-- TRANSFERENCIA

insert into Transferencia (oid, codigo, ibanOrigen, fecha, hora, cantidad,  cuentaDestino) VALUES (TransferenciaUdt('5'), 5, 'FR77 2620 0309 16V3 KGNX B3PC N29', '2001-02-02', '9:30 PM', 550.49, (select oid FROM Cuenta WHERE IBAN='DE33 7520 1499 2492 9685 27'));

insert into Transferencia (oid, codigo, ibanOrigen, fecha, hora, cantidad,  cuentaDestino) VALUES (TransferenciaUdt('6'), 6, 'FR77 2620 0309 16V3 KGNX B3PC N29', '2002-03-03', '10:30 PM', 5500.49, (select oid FROM Cuenta WHERE IBAN='MD72 OY6E HSY7 0HZK AM0D PAB0'));


-- POSEE

insert into Posee (oid, cliente, cuenta) VALUES (PoseeUdt('1'), (select oid FROM Cliente WHERE DNI='34-3480976'), (select oid FROM Cuenta WHERE IBAN='MD72 OY6E HSY7 0HZK AM0D PAB0'));

insert into Posee (oid, cliente, cuenta) VALUES (PoseeUdt('2'), (select oid FROM Cliente WHERE DNI='34-3480976'), (select oid FROM Cuenta WHERE IBAN='BR69 5012 8504 4863 3270 2788 435D T'));

insert into Posee (oid, cliente, cuenta) VALUES (PoseeUdt('3'), (select oid FROM Cliente WHERE DNI='34-3480976'), (select oid FROM Cuenta WHERE IBAN='FR77 2620 0309 16V3 KGNX B3PC N29'));

------ PRUEBAS -------


SELECT DISTINCT T.codigo, T.ibanOrigen, T.cuentaDestino->saldo FROM Transferencia T, Cuenta C WHERE T.cuentaDestino->fechaCreacion > '1991-09-25';

-- No puedes acceder a los campos de los subtipos a traves del padre
SELECT DISTINCT C.oficina->codigo FROM Posee P, CuentaCorriente C WHERE P.cuenta->saldo>8000 AND C.IBAN = P.cuenta->IBAN;
