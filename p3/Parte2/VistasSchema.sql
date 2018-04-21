CREATE VIEW Grupo AS
SELECT *
    FROM dblink('dbname=Marina',
                'select id, Nombre, caracteristica from Escuadra')
    AS t1(id integer, Nombre varchar(100), caracteristica varchar(100))
UNION
SELECT *
    FROM dblink('dbname=Rangers',
                'select identificador, nombre, clase from Peloton')
    AS t2(identificador integer, nombre varchar(100), clase varchar(100));

CREATE VIEW Persona AS
SELECT *
    FROM dblink('dbname=Rangers',
              'select identificador, nombre, apellidos, rango, especialidad, peloton from Ranger')
    AS t1(identificador integer, nombre varchar(100), apellidos varchar(100), rango varchar(50), especialidad varchar(100), peloton integer)
UNION
SELECT *
    FROM dblink('dbname=Marina',
                'select id, Nombre, Aps, posicion, caracteristica, escuadra from Marine')
    AS t2(id integer, Nombre varchar(100), Aps varchar(100), posicion varchar(50), caracteristica varchar(100), escuadra integer);

CREATE TABLE Vehiculo(
	id VARCHAR(30) NOT NULL,
	armas VARCHAR(100) NOT NULL,
	fechaCreacion DATE NOT NULL,
	escuadra INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (escuadra) REFERENCES Escuadra(id)
);

CREATE VIEW Vehiculo AS
SELECT *
    FROM dblink('dbname=Rangers',
              'select Matricula, armamento, fechaFabricacion, peloton from Vehiculo')
    AS t1(Matricula integer, armamento varchar(100), fechaFabricacion date, peloton integer)
UNION
SELECT *
    FROM dblink('dbname=Marina',
                'select id, armas, fechaCreacion, escuadra from Vehiculo')
    AS t2(id integer, armas varchar(100), fechaCreacion date, escuadra integer);

	armamento VARCHAR(100) NOT NULL,
	fechaFabricacion DATE NOT NULL,
	numPersonas INTEGER NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    peloton INTEGER NOT NULL,
    traccion VARCHAR(100),
    capacidad INTEGER,
	PRIMARY KEY (Matricula),
    FOREIGN KEY (peloton) REFERENCES PELOTON(identificador)

CREATE VIEW Terrestre AS
SELECT *
    FROM dblink('dbname=Rangers',
              'select Matricula, traccion from Vehiculo where tipo=''Tierra''')
    AS t1(Matricula integer, traccion varchar(100))
UNION
SELECT *
    FROM dblink('dbname=Marina',
                'select id, traccion from VTierra')
    AS t2(id integer, traccion varchar(100));

CREATE VIEW Acuatico AS
SELECT *
    FROM dblink('dbname=Rangers',
              'select Matricula, capacidad from Vehiculo where tipo=''Agua''')
    AS t1(Matricula integer, cargmax varchar(100))
UNION
SELECT *
    FROM dblink('dbname=Marina',
                'select id, cargamax from VAgua')
    AS t2(id integer, cargmax varchar(100));


