CREATE VIEW EscuadrasMarina AS
  SELECT *
    FROM dblink('dbname=Marina',
                'select id, Nombre, caracteristica from Escuadra')
    AS t1(id integer, Nombre varchar(100), caracteristica varchar(100));

SELECT * FROM EscuadraMarina WHERE especialidad LIKE 'fusileros';

UPDATE Escuadra SET id='1000' WHERE caracteristica='fusileros';



CREATE VIEW Groups AS
SELECT *
    FROM dblink('dbname=Marina',
                'select id, Nombre, caracteristica from Escuadra')
    AS t1(id integer, Nombre varchar(100), caracteristica varchar(100))
UNION
SELECT *
    FROM dblink('dbname=Rangers',
                'select identificador, nombre, clase from Peloton')
    AS t2(identificador integer, nombre varchar(100), clase varchar(100));

SELECT V.id, V.armas, V.fechaCreacion, V.escuadra, T.traccion FROM Vehiculo V, VTierra T
WHERE T.id = V.id;

SELECT V.id, V.armas, V.fechaCreacion, V.escuadra, A.cargamax FROM Vehiculo V, VAgua A
WHERE V.id = A.id;


