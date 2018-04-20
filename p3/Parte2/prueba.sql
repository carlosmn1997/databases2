CREATE VIEW EscuadrasMarina AS
  SELECT *
    FROM dblink('dbname=Marina',
                'select id, Nombre, caracteristica from Escuadra')
    AS t1(id integer, Nombre varchar(100), caracteristica varchar(100));

SELECT * FROM EscuadraMarina WHERE especialidad LIKE 'fusileros';

UPDATE Escuadra SET id='1000' WHERE caracteristica='fusileros';
