/*
Oficina de las 10 que menos cuentas tienen que registra más retiradas
*/

CREATE VIEW topOficinas AS
SELECT Oficina, COUNT(IBAN) AS numCuentas FROM Cuenta
WHERE tipo = 'corriente'
GROUP BY Oficina
ORDER BY numCuentas DESC
WHERE ROWNUM<=10;

CREATE VIEW topRetiradas AS
SELECT Oficina, COUNT(codigo) AS numRetiradas FROM Oficina
WHERE tipo = 'retirada'
GROUP BY Oficina;

SELECT codigo, direccion FROM Oficina
WHERE (codigo IN (SELECT codigo FROM topOficinas)) AND
(codigo IN (SELECT codigo FROM topRetiradas WHERE numRetiradas = (SELECT Max(numRetiradas) FROM topRetiradas)));

DROP VIEW topOficinas;
DROP VIEW topRetiradas;