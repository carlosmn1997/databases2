/*
Cliente que creo la primera cuenta y cuanto ha obtenido en ingresos en
metálico
*/

CREATE VIEW primeraCuenta AS
SELECT IBAN FROM Cuenta
WHERE numero = (SELECT MIN(numero) FROM Cuenta);

CREATE VIEW Clienteprim AS
SELECT Nombre, Apellidos FROM Cliente
WHERE DNI IN (SELECT DNI FROM Posee WHERE IBAN IN (SELECT IBAN FROM primeraCuenta));

SELECT C.Nombre, C.Apellidos, SUM(O.cantidad) AS Ingresos FROM Clienteprim C, Operaciones O
WHERE O.IBANOrigen IN (SELECT IBAN FROM primeraCuenta);

DROP VIEW primeraCuenta;
DROP VIEW Clienteprim;