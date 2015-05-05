
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
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES
('Kiara','Hunter','2004-11-10T00:31:14-08:00',8),
('Kaitlin','Gentry','1953-08-15T12:12:53-07:00',8),
('Rhoda','Velasquez','1990-02-23T10:33:00-08:00',8),
('Stephanie','Gay','2005-02-21T20:12:07-08:00',8),
('Dillon','Gilliam','1985-12-25T23:48:51-08:00',8),
('Amal','Snider','1990-08-17T02:05:57-07:00',8),
('Lance','Kim','1993-11-02T00:46:17-08:00',8),
('Haley','Munoz','1953-12-11T13:36:11-08:00',8),
('Lila','Reilly','2012-08-25T12:23:19-07:00',8),
('Denise','Leon','1976-06-28T01:47:19-07:00',8),

('Stacey','Mendez','2000-04-23T04:02:23-07:00',8),
('Jermaine','Mccoy','2006-10-15T16:46:35-07:00',8),
('Eden','Oconnor','2009-11-03T00:59:09-08:00',8),
('Hyacinth','Parks','1974-05-25T10:26:33-07:00',8),
('Adria','Norman','1953-04-30T18:08:21-07:00',8),
('Candice','Holcomb','2014-02-18T05:03:11-08:00',8),
('Ulric','Spencer','1960-08-09T09:56:37-07:00',8),
('Irene','Sargent','1950-08-27T17:08:47-07:00',8),
('Alma','Fletcher','1983-10-30T22:23:19-08:00',8),
('Cain','Cabrera','1999-12-10T06:13:57-08:00',8),

('Wylie','Morrison','2005-08-08T17:03:00-07:00',8),
('Jonah','Burt','1968-08-03T23:54:19-07:00',8),
('Gwendolyn','Hendricks','2002-07-02T19:00:28-07:00',8),
('Ivana','Herrera','1997-06-24T06:34:23-07:00',8),
('Lysandra','Contreras','2003-09-04T17:51:47-07:00',8),
('Ariana','Reeves','1992-11-01T05:58:04-08:00',8),
('Maile','Irwin','1966-03-12T18:14:07-08:00',8),
('Wilma','Eaton','1963-05-29T10:47:12-07:00',8),
('Halee','Mcintosh','1983-10-06T20:21:13-07:00',8),
('Geoffrey','Case','2000-11-14T09:41:56-08:00',8),

('Zenia','Lindsay','2005-11-10T01:44:27-08:00',8),
('Arden','Rowland','1978-05-06T10:41:06-07:00',8),
('Tamara','Kemp','2009-07-30T01:29:16-07:00',8),
('Yeo','Doyle','1964-05-27T14:05:28-07:00',8),
('Thane','Glenn','2006-06-04T03:15:39-07:00',8),
('Ira','Herman','1996-09-10T19:32:49-07:00',8),
('Dane','Doyle','2002-03-16T11:09:12-08:00',8),
('Hop','Schultz','1996-12-13T17:20:26-08:00',8),
('Xandra','Case','1959-03-29T19:54:42-08:00',8),
('Abel','Perkins','2007-11-05T08:17:04-08:00',8),

('Ava','Wells','1995-10-03T05:21:27-07:00',8),
('Kim','Rodriquez','1974-06-02T21:57:36-07:00',8),
('Olympia','Gay','1964-07-18T09:21:24-07:00',8),
('Clayton','Ayala','1975-04-17T20:09:05-07:00',8),
('Lacy','Meadows','1983-02-02T05:28:06-08:00',8),
('Genevieve','Woodward','1975-02-13T12:10:25-08:00',8),
('Christopher','Castro','1994-10-24T19:41:15-07:00',8),
('Casey','Justice','1992-04-06T14:57:21-07:00',8),
('Alana','Rasmussen','1980-11-13T06:38:49-08:00',8),
('Pamela','Sims','1975-08-16T15:27:40-07:00',8),

('Kaden','Vasquez','1950-10-10T11:48:05-08:00',8),
('Mari','Frazier','2002-07-12T23:54:35-07:00',8),
('Brian','Hinton','1971-04-22T09:39:08-08:00',8),
('Colt','Calderon','2005-01-28T17:25:29-08:00',8),
('Erin','Pacheco','1960-07-16T22:20:27-07:00',8),
('Samson','Ray','1982-04-07T08:06:40-08:00',8),
('Xantha','Kim','1972-02-17T18:44:37-08:00',8),
('Willa','Craig','1972-07-02T16:12:47-07:00',8),
('Hannah','Bennett','2006-01-12T03:41:47-08:00',8),
('Jillian','Mason','2007-10-04T07:06:08-07:00',8);

-- ViveEn (Las 60 personas viven en CABA) desde 1 mayo 2012 hasta 1 mayo 2015

INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (1,8,'31/01/2014'),(2,8,'25/10/2014'),(3,8,'26/07/2013'),(4,8,'17/11/2012'),(5,8,'05/02/2013'),(6,8,'09/07/2013'),(7,8,'11/01/2012'),(8,8,'15/01/2014'),(9,8,'19/09/2012'),(10,8,'03/06/2013');
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (11,8,'26/05/2013'),(12,8,'15/08/2014'),(13,8,'25/05/2015'),(14,8,'16/06/2012'),(15,8,'28/02/2013'),(16,8,'08/08/2014'),(17,8,'27/12/2012'),(18,8,'12/05/2013'),(19,8,'20/08/2014'),(20,8,'26/01/2013');
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (21,8,'11/11/2013'),(22,8,'17/01/2015'),(23,8,'06/11/2014'),(24,8,'07/07/2014'),(25,8,'10/09/2012'),(26,8,'22/02/2015'),(27,8,'17/02/2013'),(28,8,'02/02/2014'),(29,8,'12/08/2013'),(30,8,'28/02/2015');
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (31,8,'29/08/2012'),(32,8,'23/03/2013'),(33,8,'31/05/2014'),(34,8,'07/03/2012'),(35,8,'24/06/2014'),(36,8,'20/04/2015'),(37,8,'12/02/2012'),(38,8,'17/04/2013'),(39,8,'12/03/2014'),(40,8,'29/08/2014');
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (41,8,'04/10/2012'),(42,8,'01/09/2012'),(43,8,'02/11/2014'),(44,8,'05/12/2013'),(45,8,'08/01/2013'),(46,8,'04/05/2013'),(47,8,'04/06/2015'),(48,8,'18/12/2013'),(49,8,'12/11/2014'),(50,8,'09/02/2012');
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (51,8,'15/11/2012'),(52,8,'12/10/2013'),(53,8,'16/04/2014'),(54,8,'01/11/2013'),(55,8,'11/11/2013'),(56,8,'25/11/2012'),(57,8,'10/03/2012'),(58,8,'21/10/2014'),(59,8,'02/09/2015'),(60,8,'04/10/2013');

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
INSERT INTO Camioneta (idPersona) VALUES (1), (2), (3);

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
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,fecha,hora) VALUES (1,1,'26/04/2015','2015-04-26 00:00:00'),(2,1,'26/04/2015','2015-04-26 00:00:00'),(3,1,'26/04/2015','2015-04-26 00:00:00'),(4,1,'26/04/2015','2015-04-26 00:00:00'),(5,1,'26/04/2015','2015-04-26 00:00:00'),(6,1,'26/04/2015','2015-04-26 00:00:00'),(7,1,'26/04/2015','2015-04-26 00:00:00'),(8,1,'26/04/2015','2015-04-26 00:00:00'),(9,1,'26/04/2015','2015-04-26 00:00:00');
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,fecha,hora) VALUES (11,1,'26/04/2015','2015-04-26 00:00:00'),(12,1,'26/04/2015','2015-04-26 00:00:00'),(13,1,'26/04/2015','2015-04-26 00:00:00'),(14,1,'26/04/2015','2015-04-26 00:00:00'),(15,1,'26/04/2015','2015-04-26 00:00:00'),(16,1,'26/04/2015','2015-04-26 00:00:00'),(17,1,'26/04/2015','2015-04-26 00:00:00'),(18,1,'26/04/2015','2015-04-26 00:00:00'),(19,1,'26/04/2015','2015-04-26 00:00:00'),(10,1,'26/04/2015','2015-04-26 00:00:00');
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,fecha,hora) VALUES (21,2,'26/04/2015','2015-04-26 00:00:00'),(22,2,'26/04/2015','2015-04-26 00:00:00'),(23,2,'26/04/2015','2015-04-26 00:00:00'),(24,2,'26/04/2015','2015-04-26 00:00:00'),(25,2,'26/04/2015','2015-04-26 00:00:00'),(26,2,'26/04/2015','2015-04-26 00:00:00'),(27,2,'26/04/2015','2015-04-26 00:00:00'),(28,2,'26/04/2015','2015-04-26 00:00:00'),(29,2,'26/04/2015','2015-04-26 00:00:00'),(20,2,'26/04/2015','2015-04-26 00:00:00');
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,fecha,hora) VALUES (31,3,'26/04/2015','2015-04-26 00:00:00'),(32,3,'26/04/2015','2015-04-26 00:00:00'),(33,3,'26/04/2015','2015-04-26 00:00:00'),(34,3,'26/04/2015','2015-04-26 00:00:00'),(35,3,'26/04/2015','2015-04-26 00:00:00'),(36,3,'26/04/2015','2015-04-26 00:00:00'),(37,3,'26/04/2015','2015-04-26 00:00:00'),(38,3,'26/04/2015','2015-04-26 00:00:00'),(39,3,'26/04/2015','2015-04-26 00:00:00'),(30,3,'26/04/2015','2015-04-26 00:00:00');
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,fecha,hora) VALUES (41,4,'26/04/2015','2015-04-26 00:00:00'),(42,4,'26/04/2015','2015-04-26 00:00:00'),(43,4,'26/04/2015','2015-04-26 00:00:00'),(44,4,'26/04/2015','2015-04-26 00:00:00'),(45,4,'26/04/2015','2015-04-26 00:00:00'),(46,4,'26/04/2015','2015-04-26 00:00:00'),(47,4,'26/04/2015','2015-04-26 00:00:00'),(48,4,'26/04/2015','2015-04-26 00:00:00'),(49,4,'26/04/2015','2015-04-26 00:00:00'),(40,4,'26/04/2015','2015-04-26 00:00:00');
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,fecha,hora) VALUES (51,5,'26/04/2015','2015-04-26 00:00:00'),(52,5,'26/04/2015','2015-04-26 00:00:00'),(53,5,'26/04/2015','2015-04-26 00:00:00'),(54,5,'26/04/2015','2015-04-26 00:00:00'),(55,5,'26/04/2015','2015-04-26 00:00:00'),(56,5,'26/04/2015','2015-04-26 00:00:00'),(57,5,'26/04/2015','2015-04-26 00:00:00'),(58,5,'26/04/2015','2015-04-26 00:00:00'),(59,5,'26/04/2015','2015-04-26 00:00:00'),(50,5,'26/04/2015','2015-04-26 00:00:00');

-- VotosCandidato
INSERT INTO VotosCandidato (idMesaElectoral,idCandidato,cantidad) VALUES (1,10,5),(1,20,4),(1,30,1),(1,40,9),(1,50,0);
INSERT INTO VotosCandidato (idMesaElectoral,idCandidato,cantidad) VALUES (2,10,5),(2,20,0),(2,30,0),(2,40,0),(2,50,5);
INSERT INTO VotosCandidato (idMesaElectoral,idCandidato,cantidad) VALUES (3,10,1),(3,20,2),(3,30,3),(3,40,4),(3,50,0);
INSERT INTO VotosCandidato (idMesaElectoral,idCandidato,cantidad) VALUES (4,10,0),(4,20,0),(4,30,0),(4,40,0),(4,50,10);
INSERT INTO VotosCandidato (idMesaElectoral,idCandidato,cantidad) VALUES (5,10,0),(5,20,5),(5,30,4),(5,40,1),(5,50,0);

