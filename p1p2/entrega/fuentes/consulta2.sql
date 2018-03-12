/*
Oficina de las 10 que menos cuentas tienen que registra más retiradas
*/

CREATE VIEW OficinaCuentas AS
SELECT Oficina, COUNT(IBAN) AS numCuentas FROM Cuenta
WHERE tipo = 'corriente'
GROUP BY Oficina;

CREATE VIEW topOficinas AS
SELECT Oficina, numCuentas FROM OficinaCuentas
ORDER BY numCuentas;

CREATE VIEW topDiezOficinas AS
SELECT Oficina, numCuentas FROM topOficinas
WHERE ROWNUM <=10;

CREATE VIEW topRetiradas AS
SELECT oficina, COUNT(codigo) AS numRetiradas FROM Operacion
WHERE tipo = 'retirada'
GROUP BY Oficina;

SELECT codigo, direccion FROM Oficina
WHERE (codigo IN (SELECT codigo FROM topOficinas)) AND
(codigo IN (SELECT codigo FROM topRetiradas WHERE numRetiradas = (SELECT Max(numRetiradas) FROM topRetiradas))) AND ROWNUM <= 1;

DROP VIEW OficinaCuentas;
DROP VIEW topOficinas;
DROP VIEW topDiezOficinas;
DROP VIEW topRetiradas;
