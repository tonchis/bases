-- Enums

INSERT INTO TipoTerritorio (nombre) VALUES ('Pais'); -- 1
INSERT INTO TipoTerritorio (nombre) VALUES ('Provincia'); -- 2
INSERT INTO TipoTerritorio (nombre) VALUES ('Ciudad'); --3

INSERT INTO TipoEleccion (nombre) VALUES ('Presidente'); -- 1
INSERT INTO TipoEleccion (nombre) VALUES ('Gobernador'); -- 2
INSERT INTO TipoEleccion (nombre) VALUES ('Intendente'); -- 3
INSERT INTO TipoEleccion (nombre) VALUES ('Plebiscito'); -- 4

-- Paises
INSERT INTO Territorio (nombre, idTipoTerritorio) VALUES ('Argentina', 1); -- 1
INSERT INTO Territorio (nombre, idTipoTerritorio) VALUES ('Uruguay', 1); --2
INSERT INTO Territorio (nombre, idTipoTerritorio) VALUES ('Brasil', 1); -- 3

-- Proivincias
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Buernos Aires', 2, 1); -- 4
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Santa Fe', 2, 1); -- 5
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Cordoba', 2, 1); -- 6
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Tierra del Fuego', 2, 1); -- 7

-- Ciudades
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('CABA', 3, 4); -- 8
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('La Plata', 3, 4); -- 9
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Mar del Plata', 3, 4); -- 10
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Villa Gessell', 3, 4); -- 11
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Rosario', 3, 5); -- 12

-- Personas
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Hyatt','Fuentes','14/08/1964',8),('Uriah','Orr','01/08/1854',8),('Daryl','Patton','01/11/1915',8),('Lunea','Fischer','01/04/1971',8),('Knox','Hicks','15/02/1929',8),('Fitzgerald','Richard','23/03/1998',8),('Troy','Clark','02/12/1884',8),('Brynn','Golden','24/06/1861',8),('Deacon','Hooper','18/02/1874',8),('Randall','Witt','01/09/1851',8);
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Maisie','Byrd','05/05/1944',8),('Shaine','Duncan','20/01/1938',8),('Kyra','Vazquez','04/08/1870',8),('Gemma','Ryan','25/11/1965',8),('Clio','Reed','10/05/1957',8),('Reed','Gilliam','12/09/1850',8),('Cyrus','Woodward','25/10/1972',8),('Yoshi','Cleveland','09/06/1941',8),('Tobias','Cummings','14/05/1926',8),('Flavia','Mays','25/11/1879',8);
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Preston','Hebert','18/09/1852',8),('Zachery','Velez','09/05/1904',8),('Amelia','Michael','06/02/1946',8),('Ian','Hamilton','16/02/1963',8),('Velma','Ware','07/09/1860',8),('Cheryl','Tran','03/05/1918',8),('Todd','Mcmillan','25/11/1890',8),('Ingrid','Vaughn','19/09/1935',8),('Quentin','Preston','27/07/1881',8),('Orli','Hardy','19/06/1977',8);
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Randall','Morgan','07/05/1904',8),('Lilah','Barr','19/05/1869',8),('Courtney','Clay','17/08/1963',8),('Kiara','Olson','12/12/1854',8),('Giacomo','Walker','02/06/1865',8),('Adam','Kline','17/03/1984',8),('Vance','Sosa','16/03/1995',8),('Camilla','Maddox','19/10/1993',8),('Jillian','Bowers','21/10/1857',8),('Stuart','Dillard','25/05/1875',8);
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Armando','Morrow','25/12/1867',8),('Vladimir','Walter','19/12/1893',8),('Sylvia','Kirkland','09/11/1856',8),('Gary','Conway','06/03/1993',8),('Katelyn','Hess','11/08/1864',8),('Rowan','Jacobson','26/02/1965',8),('Marny','Rose','07/05/1958',8),('Maile','Valencia','02/12/1862',8),('Orson','Grant','26/07/1853',8),('Imani','Mccoy','25/08/1893',8);
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Cally','Goodwin','29/11/1982',8),('Jenna','Collier','11/10/1885',8),('Fritz','Holland','14/12/1981',8),('Alfreda','Hickman','29/06/1876',8),('Josephine','Kemp','09/02/1976',8),('Kibo','Hess','13/12/1885',8),('Emi','Kidd','29/10/1965',8),('Nola','Oneal','14/05/1875',8),('Tatyana','Wong','07/12/1918',8),('Carlos','Hughes','11/07/1976',8);
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Jaime','Lewis','17/01/1859',8),('Lucas','Richmond','27/10/1911',8),('Priscilla','Kirk','23/01/1943',8),('Orlando','Booth','11/02/1934',8),('Charity','Bright','14/09/1990',8),('Rooney','Waters','26/10/1967',8),('Patience','Arnold','14/02/1943',8),('Myles','Acosta','19/07/1924',8),('Ashely','Tate','02/04/1956',8),('Whitney','Black','02/04/1891',8);
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Quon','Garcia','05/08/1964',8),('Gareth','Bridges','11/11/1878',8),('Jonah','Glenn','15/03/1916',8),('Otto','Boyle','13/02/1956',8),('May','Mathews','04/03/1982',8),('Uma','Simon','17/02/1934',8),('Kasper','Best','02/06/1895',8),('Hanae','Gamble','01/09/1965',8),('Dylan','Barrera','16/05/1871',8),('Preston','Odom','29/01/1868',8);
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Cairo','Clayton','30/07/1891',8),('Irene','Ingram','04/08/1916',8),('Azalia','Cain','11/03/1905',8),('Kylee','Gallegos','09/09/1934',8),('Grant','Bartlett','29/01/1947',8),('Xander','Hale','13/02/1985',8),('Hilda','Ortiz','23/01/1995',8),('Nissim','Benjamin','19/01/1967',8),('Winifred','Knox','20/12/1887',8),('Ivory','Booth','14/11/1889',8);
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Louis','Brewer','14/11/1913',8),('Angelica','Atkins','02/09/1975',8),('Fiona','Stark','17/03/1890',8),('Noelani','Padilla','18/11/1983',8),('Shelley','Forbes','17/10/1910',8),('Dakota','Burke','09/04/1975',8),('Irene','Potts','07/05/1992',8),('Jason','Porter','04/03/1879',8),('Jamalia','Jones','13/10/1934',8),('Lynn','Spears','12/04/1852',8);

-- Muerto
INSERT INTO Persona (nombre,apellido,fechaNacimiento,fechaDefuncion,idTerritorio) VALUES ('Mike','Brewer','14/11/1900','14/11/1980',8); --101
-- Menor 16
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Charles','Brewer','14/11/2010',8); --102

-- ViveEn (Las 60 personas viven en CABA) desde 1 mayo 2012 hasta 1 mayo 2015

INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (1,8,'31/01/2014'),(2,8,'25/10/2014'),(3,8,'26/07/2013'),(4,8,'17/11/2012'),(5,8,'05/02/2013'),(6,8,'09/07/2013'),(7,8,'11/01/2012'),(8,8,'15/01/2014'),(9,8,'19/09/2012'),(10,8,'03/06/2000');
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (11,8,'26/05/2013'),(12,8,'15/08/2014'),(13,8,'25/05/2013'),(14,8,'16/06/2012'),(15,8,'28/02/2013'),(16,8,'08/08/2014'),(17,8,'27/12/2012'),(18,8,'12/05/2013'),(19,8,'20/08/2014'),(20,8,'26/01/2000');
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (21,8,'11/11/2013'),(22,8,'17/01/2013'),(23,8,'06/11/2014'),(24,8,'07/07/2014'),(25,8,'10/09/2012'),(26,8,'22/02/2013'),(27,8,'17/02/2013'),(28,8,'02/02/2014'),(29,8,'12/08/2013'),(30,8,'28/02/2000');
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (31,8,'29/08/2012'),(32,8,'23/03/2013'),(33,8,'31/05/2014'),(34,8,'07/03/2012'),(35,8,'24/06/2014'),(36,8,'20/04/2013'),(37,8,'12/02/2012'),(38,8,'17/04/2013'),(39,8,'12/03/2014'),(40,8,'29/08/2000');
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (41,8,'04/10/2012'),(42,8,'01/09/2012'),(43,8,'02/11/2014'),(44,8,'05/12/2013'),(45,8,'08/01/2013'),(46,8,'04/05/2013'),(47,8,'04/06/2013'),(48,8,'18/12/2013'),(49,8,'12/11/2014'),(50,8,'09/02/2000');
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (51,8,'15/11/2012'),(52,8,'12/10/2013'),(53,8,'16/04/2014'),(54,8,'01/11/2013'),(55,8,'11/11/2013'),(56,8,'25/11/2012'),(57,8,'10/03/2012'),(58,8,'21/10/2014'),(59,8,'02/09/2013'),(60,8,'04/10/2000');

-- Las 60 personas son ciudadanos

INSERT INTO Ciudadano (idPersona) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
INSERT INTO Ciudadano (idPersona) VALUES (11),(12),(13),(14),(15),(16),(17),(18),(19),(20);
INSERT INTO Ciudadano (idPersona) VALUES (21),(22),(23),(24),(25),(26),(27),(28),(29),(30);
INSERT INTO Ciudadano (idPersona) VALUES (31),(32),(33),(34),(35),(36),(37),(38),(39),(40);
INSERT INTO Ciudadano (idPersona) VALUES (41),(42),(43),(44),(45),(46),(47),(48),(49),(50);
INSERT INTO Ciudadano (idPersona) VALUES (51),(52),(53),(54),(55),(56),(57),(58),(59),(60);

INSERT INTO Documento (tipo, numero, idPersona)
VALUES ('DNI', 1, 1), ('DNI', 2, 2), ('DNI', 3, 3), ('DNI', 4, 4), ('DNI', 5, 5), ('DNI', 6, 6), ('DNI', 7, 7), ('DNI', 8, 8), ('DNI', 9, 9), ('DNI', 10,10), ('DNI', 11,11), ('DNI', 12,12), ('DNI', 13,13), ('DNI', 14,14), ('DNI', 15,15), ('DNI', 16,16), ('DNI', 17,17), ('DNI', 18,18), ('DNI', 19,19), ('DNI', 20,20), ('DNI', 21,21), ('DNI', 22,22), ('DNI', 23,23), ('DNI', 24,24), ('DNI', 25,25), ('DNI', 26,26), ('DNI', 27,27), ('DNI', 28,28), ('DNI', 29,29), ('DNI', 30,30), ('DNI', 31,31), ('DNI', 32,32), ('DNI', 33,33), ('DNI', 34,34), ('DNI', 35,35), ('DNI', 36,36), ('DNI', 37,37), ('DNI', 38,38), ('DNI', 39,39), ('DNI', 40,40), ('DNI', 41,41), ('DNI', 42,42), ('DNI', 43,43), ('DNI', 44,44), ('DNI', 45,45), ('DNI', 46,46), ('DNI', 47,47), ('DNI', 48,48), ('DNI', 49,49), ('DNI', 50,50), ('DNI', 51,51), ('DNI', 52,52), ('DNI', 53,53), ('DNI', 54,54), ('DNI', 55,55), ('DNI', 56,56), ('DNI', 57,57), ('DNI', 58,58), ('DNI', 59,59), ('DNI', 60,60);


-- Partido Politico
INSERT INTO PartidoPolitico (nombre) VALUES ('azul'); -- 1
INSERT INTO PartidoPolitico (nombre) VALUES ('rojo'); -- 2
INSERT INTO PartidoPolitico (nombre) VALUES ('verde'); -- 3
INSERT INTO PartidoPolitico (nombre) VALUES ('cyan'); -- 4
INSERT INTO PartidoPolitico (nombre) VALUES ('magenta'); -- 5
INSERT INTO PartidoPolitico (nombre) VALUES ('amarillo'); -- 6
INSERT INTO PartidoPolitico (nombre) VALUES ('blanco'); -- 7
INSERT INTO PartidoPolitico (nombre) VALUES ('negro'); -- 8
INSERT INTO PartidoPolitico (nombre) VALUES ('gris'); -- 9

-- Camionetas
INSERT INTO Camioneta (idPersona,patente) VALUES (1,'AAA001'), (2,'AAA002'), (3,'AAA003');

-- Centro Votacion
INSERT INTO CentroVotacion (direccion,idTerritorio,idCamioneta) VALUES ('Esmeralda 700',8,1); -- 1
INSERT INTO CentroVotacion (direccion,idTerritorio,idCamioneta) VALUES ('Corrientes 800',8,2); -- 2
INSERT INTO CentroVotacion (direccion,idTerritorio,idCamioneta) VALUES ('Maipu 900',8,3); -- 3

-- Eleccion
INSERT INTO Eleccion (fecha, idTipoEleccion, idTerritorio) VALUES ('26/04/2015', 3, 8); -- 1 CABA Intendente
INSERT INTO Eleccion (fecha, idTipoEleccion, idTerritorio) VALUES ('08/06/2015', 1, 1); -- 2 Arg Presidente
INSERT INTO Eleccion (fecha, idTipoEleccion, idTerritorio) VALUES ('15/09/2011', 1, 1); -- 3 Arg Presidente

-- Autoridades De Mesa
INSERT INTO AutoridadDeMesa (idPersona) VALUES (11),(12),(13);
INSERT INTO AutoridadDeMesa (idPersona) VALUES (21),(22),(23);
INSERT INTO AutoridadDeMesa (idPersona) VALUES (31),(32),(33);
INSERT INTO AutoridadDeMesa (idPersona) VALUES (41),(42),(43);
INSERT INTO AutoridadDeMesa (idPersona) VALUES (51),(52),(53);

INSERT INTO Presidente (idPersona) VALUES (11),(21),(31),(41),(51);

INSERT INTO VicePresidente (idPersona) VALUES (12),(22),(32),(42),(52);

INSERT INTO Fiscal (idPersona) VALUES (15),(25),(35),(45),(55);
INSERT INTO Fiscal (idPersona) VALUES (16),(26),(36),(46),(56);
INSERT INTO Fiscal (idPersona) VALUES (17),(27),(37),(47),(57);

-- Tecnico
INSERT INTO Tecnico (idPersona) VALUES (13),(23),(33),(43),(53);

-- Mesa Electoral

INSERT INTO MesaElectoral (numero,idPresidente,idVicePresidente,idTecnico,idCentroVotacion,idEleccion) VALUES (1000,11,12,13,1,1); -- 1
INSERT INTO MesaElectoral (numero,idPresidente,idVicePresidente,idTecnico,idCentroVotacion,idEleccion) VALUES (2000,21,22,23,2,1); -- 2
INSERT INTO MesaElectoral (numero,idPresidente,idVicePresidente,idTecnico,idCentroVotacion,idEleccion) VALUES (3000,31,32,33,2,1); -- 3
INSERT INTO MesaElectoral (numero,idPresidente,idVicePresidente,idTecnico,idCentroVotacion,idEleccion) VALUES (4000,41,42,43,3,1); -- 4
INSERT INTO MesaElectoral (numero,idPresidente,idVicePresidente,idTecnico,idCentroVotacion,idEleccion) VALUES (5000,51,52,53,3,1); -- 5

INSERT INTO MesaCandidato (idMesaElectoral) VALUES (1),(2),(3),(4),(5);

-- Candidatos
INSERT INTO Candidato (idPersona) VALUES (10),(20),(30),(40),(50);

-- Se Postulan
INSERT INTO SePostula (idEleccion, idCandidato, idPartidoPolitico) VALUES (1,10,1),(1,20,2),(1,30,3),(1,40,4),(1,50,5);

-- Fiscales

INSERT INTO Fiscaliza (idMesaElectoral, idFiscal, idPartidoPolitico) VALUES (1,15,1), (1,16,2), (1,17,3);
INSERT INTO Fiscaliza (idMesaElectoral, idFiscal, idPartidoPolitico) VALUES (1,25,1), (1,26,3), (1,27,4);
INSERT INTO Fiscaliza (idMesaElectoral, idFiscal, idPartidoPolitico) VALUES (1,35,1), (1,36,5), (1,37,3);
INSERT INTO Fiscaliza (idMesaElectoral, idFiscal, idPartidoPolitico) VALUES (1,45,1), (1,46,2), (1,47,4);
INSERT INTO Fiscaliza (idMesaElectoral, idFiscal, idPartidoPolitico) VALUES (1,55,1), (1,56,4), (1,57,5);

-- VotaEn
-- Mesa 1: 10 - 19 y 1 - 9 
-- Mesa 2: 20 - 29
-- Mesa 3: 30 - 39
-- Mesa 4: 40 - 49
-- Mesa 5: 50 - 59
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,hora) VALUES (1,1,'2015-04-26 00:00:00'),(2,1,'2015-04-26 00:00:00'),(3,1,'2015-04-26 00:00:00'),(4,1,'2015-04-26 00:00:00'),(5,1,'2015-04-26 00:00:00'),(6,1,'2015-04-26 00:00:00'),(7,1,'2015-04-26 00:00:00'),(8,1,'2015-04-26 00:00:00'),(9,1,'2015-04-26 00:00:00');
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,hora) VALUES (11,1,'2015-04-26 00:00:00'),(12,1,'2015-04-26 00:00:00'),(13,1,'2015-04-26 00:00:00'),(14,1,'2015-04-26 00:00:00'),(15,1,'2015-04-26 00:00:00'),(16,1,'2015-04-26 00:00:00'),(17,1,'2015-04-26 00:00:00'),(18,1,'2015-04-26 00:00:00'),(19,1,'2015-04-26 00:00:00'),(10,1,'2015-04-26 00:00:00');
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,hora) VALUES (21,2,'2015-04-26 00:00:00'),(22,2,'2015-04-26 00:00:00'),(23,2,'2015-04-26 00:00:00'),(24,2,'2015-04-26 00:00:00'),(25,2,'2015-04-26 00:00:00'),(26,2,'2015-04-26 00:00:00'),(27,2,'2015-04-26 00:00:00'),(28,2,'2015-04-26 00:00:00'),(29,2,'2015-04-26 00:00:00'),(20,2,'2015-04-26 00:00:00');
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,hora) VALUES (31,3,'2015-04-26 00:00:00'),(32,3,'2015-04-26 00:00:00'),(33,3,'2015-04-26 00:00:00'),(34,3,'2015-04-26 00:00:00'),(35,3,'2015-04-26 00:00:00'),(36,3,'2015-04-26 00:00:00'),(37,3,'2015-04-26 00:00:00'),(38,3,'2015-04-26 00:00:00'),(39,3,'2015-04-26 00:00:00'),(30,3,'2015-04-26 00:00:00');
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,hora) VALUES (41,4,'2015-04-26 00:00:00'),(42,4,'2015-04-26 00:00:00'),(43,4,'2015-04-26 00:00:00'),(44,4,'2015-04-26 00:00:00'),(45,4,'2015-04-26 00:00:00'),(46,4,'2015-04-26 00:00:00'),(47,4,'2015-04-26 00:00:00'),(48,4,'2015-04-26 00:00:00'),(49,4,'2015-04-26 00:00:00'),(40,4,'2015-04-26 00:00:00');
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,hora) VALUES (51,5,'2015-04-26 00:00:00'),(52,5,'2015-04-26 00:00:00'),(53,5,'2015-04-26 00:00:00'),(54,5,'2015-04-26 00:00:00'),(55,5,'2015-04-26 00:00:00'),(56,5,'2015-04-26 00:00:00'),(57,5,'2015-04-26 00:00:00'),(58,5,'2015-04-26 00:00:00'),(59,5,'2015-04-26 00:00:00'),(50,5,'2015-04-26 00:00:00');

-- VotosCandidato
INSERT INTO VotosCandidato (idMesaElectoral,idCandidato,cantidad) VALUES (1,10,5),(1,20,4),(1,30,1),(1,40,9),(1,50,0);
INSERT INTO VotosCandidato (idMesaElectoral,idCandidato,cantidad) VALUES (2,10,5),(2,20,0),(2,30,0),(2,40,0),(2,50,5);
INSERT INTO VotosCandidato (idMesaElectoral,idCandidato,cantidad) VALUES (3,10,1),(3,20,2),(3,30,3),(3,40,4),(3,50,0);
INSERT INTO VotosCandidato (idMesaElectoral,idCandidato,cantidad) VALUES (4,10,0),(4,20,0),(4,30,0),(4,40,0),(4,50,10);
INSERT INTO VotosCandidato (idMesaElectoral,idCandidato,cantidad) VALUES (5,10,0),(5,20,5),(5,30,4),(5,40,1),(5,50,0);
