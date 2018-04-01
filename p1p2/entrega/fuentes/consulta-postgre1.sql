/*
Cantidad salida por transferencia de la primera cuenta que realizó una operación y tiene cliente asociado.
*/

CREATE VIEW primeraCuenta AS
SELECT IBANOrigen FROM Operacion
WHERE fecha = (SELECT MIN(FECHA) FROM Operacion WHERE IBANORIGEN in (select iban from Posee));

CREATE VIEW Clienteprim AS
SELECT Nombre, Apellido FROM Cliente
WHERE DNI IN (SELECT DNI FROM Posee WHERE IBAN IN (SELECT IBANORIGEN FROM primeraCuenta));

CREATE VIEW Ingre AS
SELECT SUM(cantidad) AS Ingresos FROM ONLY Transferencia
WHERE IBANOrigen IN (SELECT IBANOrigen FROM primeraCuenta);

SELECT C.Nombre, C.Apellido, I.Ingresos FROM Clienteprim C, Ingre I;

DROP VIEW primeraCuenta;
DROP VIEW Clienteprim;
DROP VIEW Ingre;
