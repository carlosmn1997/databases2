/*
Cliente que creo la primera cuenta y cuanto ha obtenido en ingresos en
metálico
*/

CREATE VIEW primeraCuenta AS
SELECT IBANOrigen FROM Operacion
WHERE fecha = (SELECT MIN(FECHA) FROM Operacion);

CREATE VIEW Clienteprim AS
SELECT Nombre, Apellido FROM Cliente
WHERE DNI IN (SELECT DNI FROM Posee WHERE IBAN IN (SELECT IBANORIGEN FROM primeraCuenta));

CREATE VIEW Ingre AS
SELECT SUM(cantidad) AS Ingresos FROM Operacion
WHERE IBANOrigen IN (SELECT IBANOrigen FROM primeraCuenta);

SELECT C.Nombre, C.Apellido, I.Ingresos FROM Clienteprim C, Ingre I;

DROP VIEW primeraCuenta;
DROP VIEW Clienteprim;
DROP VIEW Ingre;


SELECT cantidad,tipo FROM OPERACION WHERE IBANorigen = 'TR80 8894 8SRY 3VWO XU1H Q6FS 95';

SELECT * FROM Posee 
WHERE DNI IN (SELECT DNI FROM CLIENTE) AND IBAN IN (SELECT IBAN FROM Cuenta);
