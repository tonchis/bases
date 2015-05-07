-- Oriundo de pais - Raise Exception: Solo puede ser oriundo de una ciudad
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Juan','Fuentes','14/08/1964',1);

-- Oriundo de provincia - Raise Exception: Solo puede ser oriundo de una ciudad
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Juan','Fuentes','14/08/1964',4);

-- CheckViveEn se muda antes de haber nacido - Raise Exception: No se puede ir a vivir a un lugar antes de haber nacido o despues de haber muerto
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (1,9,'31/01/1960');

-- CheckViveEn se muda antes despues de haber muerto - Raise Exception: No se puede ir a vivir a un lugar antes de haber nacido o despues de haber muerto
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (101,9,'31/01/1981');

-- checkMayor16VotaEn menor trata de votar - Raise Exception: Solo los mayores de 16 años pueden votar. No insista
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,hora) VALUES (102,1,'2015-04-26 00:00:00');