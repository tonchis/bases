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

-- checkDefuncionVotaEn muerto trata de votar - Raise Exception: Los Muertos No Votan
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,hora) VALUES (101,1,'2015-04-26 00:00:00');

-- CheckMesaPlebiscito Se trata de asignar una mesa plebiscito a una eleccion de candidatos - Raise Exception: No se puede tener MesaPlebiscito para Elecciones que no sean del tipo Plebiscito
INSERT INTO MesaPlebiscito (idMesaElectoral) VALUES (1);

-- CheckCentroVotacionEnCiudad centro de votacion en pais - Raise Exception: El centro de votacion solo puede pertenecer a ciudades
INSERT INTO CentroVotacion (direccion,idTerritorio,idCamioneta) VALUES ('Calle falsa 123',1,1);

-- CheckSePostula se postula para eleccion en CABA pero solo vive ahi desde hace un año - Raise Exception: No se puede postular a una eleccion si no hace al menos 2 años que vive en el territorio de la eleccion
INSERT INTO SePostula (idEleccion, idCandidato, idPartidoPolitico) VALUES (1,1,1);

-- checkAutoridad La persona que se intenta ingresar como presidente (id 21) ya es vice presidente en otra mesa - Raise Exception: Alguna de las autoridades seleccionadas para esta mesa ya es Autoridad para otra mesa
INSERT INTO MesaElectoral (numero,idPresidente,idVicePresidente,idTecnico,idCentroVotacion,idEleccion) VALUES (5555,21,1,3,1,1);