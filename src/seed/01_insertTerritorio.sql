-- Paises
INSERT INTO Territorio (nombre, idTipoTerritorio) VALUES ('Argentina', 1),('Uruguay', 1),('Brasil', 1);

-- Proivincias
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Buernos Aires', 2, 1);
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Santa Fe', 2, 1);
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Cordoba', 2, 1);
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Tierra del Fuego', 2, 1);

-- Ciudades
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('CABA', 3, 4);
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('La Plata', 3, 4);
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Mar del Plata', 3, 4);
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Villa Gessell', 3, 4);
INSERT INTO Territorio (nombre, idTipoTerritorio, idTerritorioPadre) VALUES ('Rosario', 3, 5);
