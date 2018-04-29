
\CONNECT Marina

INSERT INTO Escuadra VALUES ('1','Aguila 1','Artificieros');
INSERT INTO Escuadra VALUES ('2','Aguila 2','Artilleros');
INSERT INTO Escuadra VALUES ('3','Aguila 3','Apoyo');
INSERT INTO Escuadra VALUES ('4','Aguila 4','Fusileros');

INSERT INTO Marine VALUES ('13452312','Francisco','Perez','Sargento','Tirador','2');
INSERT INTO Marine VALUES ('05910689','Javier','Lopez','Sargento Primero','Tirador','2');
INSERT INTO Marine VALUES ('16435957','Marcos','Garcia','Cabo','Granadero','2');
INSERT INTO Marine VALUES ('05976438','Juan','Gonzalez','Sargento','Tirador','2');
INSERT INTO Marine VALUES ('27653491','Esteban','Coesta cupado','Cabo','Conductor','2');

INSERT INTO Vehiculo VALUES ('14054','lanzagranadas','2007-2-18','2');
INSERT INTO Vehiculo VALUES ('14055','ametralladora','2007-2-18','2');
INSERT INTO Vehiculo VALUES ('14056','lanzagranadas','2007-2-18','2');
INSERT INTO Vehiculo VALUES ('14057','ametralladora','2007-2-18','2');

INSERT INTO VTierra VALUES ('14054','4 ruedas');
INSERT INTO VTierra VALUES ('14055','2 ruedas');

INSERT INTO VAgua VALUES ('14056','50000');
INSERT INTO VAgua VALUES ('14057','1000');

\CONNECT Ranger

INSERT INTO Peloton VALUES ('1004','Cowboy 1','Artificieros');
INSERT INTO Peloton VALUES ('1005','Cowboy 2','Artilleros');
INSERT INTO Peloton VALUES ('1006','Bravo 1','Tiradores');
INSERT INTO Peloton VALUES ('1007','Alpha 1','Tiradores');

INSERT INTO Ranger VALUES ('07956','Mario','San Francisco','Soldado raso','Ametralladora','1005');
INSERT INTO Ranger VALUES ('15467','Daniel','Ramos','Cabo','Granadero','1005');
INSERT INTO Ranger VALUES ('73594','Jose','Fernandez','Cabo','Tirador','1005');
INSERT INTO Ranger VALUES ('94653','Jesus','Nazaret','Sargento Primero','Tirador','1005');
INSERT INTO Ranger VALUES ('104575','Antonio','Ferrer','Sargento','Conductor','1005');


INSERT INTO Vehiculo VALUES ('1234','Ametralladora Superior','2010-03-01','Tierra','1005','4 Ruedas',null);
INSERT INTO Vehiculo VALUES ('1345','Lanzacohetes','2000-01-03','Tierra','1005','Delantera',null);
INSERT INTO Vehiculo VALUES ('6479','Ametralladora Superior','2013-12-01','Tierra','1006','4 Ruedas',null);
INSERT INTO Vehiculo VALUES ('1579','NO','2018-01-21','Agua','1005',null,'1000');
INSERT INTO Vehiculo VALUES ('6741','Ametralladora','2012-05-30','Agua','1005',null,'3000');

\CONNECT Schema2DB2

SELECT * FROM Soldado;

SELECT * FROM Grupo;

SELECT * FROM Vehiculo;

\connect Ranger

UPDATE Peloton SET Clase='Fusileros' WHERE identificador='1004';

UPDATE Ranger SET rango='cabo' WHERE identificador='7956';

UPDATE Vehiculo SET armamento='NO' WHERE Matricula='1345';

\CONNECT Marina

UPDATE Escuadra SET Nombre='Oso 3' WHERE id='1';

UPDATE Marine SET Nombre='Juan Jose' WHERE id='05910689';

UPDATE Vehiculo SET armas='NO' WHERE id='14057';

\CONNECT Schema2DB2

SELECT * FROM Soldado;

SELECT * FROM Grupo;

SELECT * FROM Vehiculo;