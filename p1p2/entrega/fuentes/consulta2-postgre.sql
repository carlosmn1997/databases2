/*
Oficina de las 10 que menos cuentas tienen que registra más retiradas
*/

CREATE VIEW OficinaCuentas AS
SELECT Oficina, COUNT(IBAN) AS numCuentas FROM ONLY CuentaCorriente
GROUP BY Oficina;

CREATE VIEW topOficinas AS
SELECT Oficina, numCuentas FROM OficinaCuentas
ORDER BY numCuentas;

CREATE VIEW topDiezOficinas AS
SELECT Oficina, numCuentas FROM topOficinas
limit 10;

CREATE VIEW topRetiradas AS
SELECT oficina, COUNT(codigo) AS numRetiradas FROM ONLY Retirada
GROUP BY Oficina;

SELECT codigo, direccion FROM Oficina
WHERE (codigo IN (SELECT codigo FROM topOficinas)) AND
(codigo IN (SELECT codigo FROM topRetiradas WHERE numRetiradas = (SELECT Max(numRetiradas) FROM topRetiradas)))
limit 1;

DROP VIEW topRetiradas CASCADE;
DROP VIEW topDiezOficinas CASCADE;
DROP VIEW topOficinas CASCADE;
DROP VIEW OficinaCuentas CASCADE;





