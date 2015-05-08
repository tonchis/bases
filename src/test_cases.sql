
-- Eleccion: idTipoEleccion debe existir en TipoEleccion
INSERT INTO Eleccion (fecha,idTipoEleccion,idTerritorio) VALUES('11/05/2015',5,1);
--Resultado: Exception: insert or update on table "eleccion" violates foreign key constraint "eleccion_idtipoeleccion_fkey"
INSERT INTO Eleccion (fecha,idTipoEleccion,idTerritorio) VALUES('11/05/2015',1,1);
--Resultado: OK 

-- Eleccion: idTerritorio debe existir en Territorio
INSERT INTO Eleccion (fecha,idTipoEleccion,idTerritorio) VALUES('11/05/2015',1,15);
--Resultado: Exception :  insert or update on table "eleccion" violates foreign key constraint "eleccion_idterritorio_fkey"
INSERT INTO Eleccion (fecha,idTipoEleccion,idTerritorio) VALUES('12/05/2015',1,1);
--Resultado: OK 

--Eleccion: unicidad de tupla (fecha,idTipoEleccion)
INSERT INTO Eleccion (fecha,idTipoEleccion,idTerritorio) VALUES('12/05/2015',1,1);
--Resultado: Exception:  duplicate key value violates unique constraint "eleccion_fecha_idtipoeleccion_idterritorio_key"


--Persona: idTerritorio ( OriundaDe ) debe existir en Territorio
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES('Bob','Esponja','05/05/1960',15);
-- Resultado: ERROR:  Solo puede ser oriundo de una ciudad
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES('Bob','Esponja','05/05/1960',8);
-- Resultado: OK

-- Persona: idTerritorio(OriundaDe)  tiene que ser de TipoTerritorio ciudad
-- Oriundo de pais 
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Juan','Fuentes','14/08/1964',1);
-- Resultado: ERROR:  Solo puede ser oriundo de una ciudad
-- Oriundo de provincia 
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Juan','Fuentes','14/08/1964',4);
-- Resultado: ERROR:  Solo puede ser oriundo de una ciudad
INSERT INTO Persona (nombre,apellido,fechaNacimiento,idTerritorio) VALUES ('Juan','Fuentes','14/08/1964',8);
-- Resultado: OK

--Persona fechaNacimiento <= fechaDefuncion
-- fechaNacimiento > fechaDefuncion
INSERT INTO Persona (nombre,apellido,fechaNacimiento,fechaDefuncion,idTerritorio) VALUES ('Juan','Perez','14/08/1964','14/08/1924',8);
-- Resultado: ERROR:  new row for relation "persona" violates check constraint "persona_check"
-- fechaNacimiento =  fechaDefuncion
INSERT INTO Persona (nombre,apellido,fechaNacimiento,fechaDefuncion,idTerritorio) VALUES ('Juan','Perez','14/08/1964','14/08/1964',8);
-- Resultado: OK
INSERT INTO Persona (nombre,apellido,fechaNacimiento,fechaDefuncion,idTerritorio) VALUES ('Jose','Perez','14/08/1964','14/08/1999',8);
-- Resultado: OK



-- ViveEn 
--CheckViveEn se muda antes de haber nacido - Raise Exception: No se puede ir a vivir a un lugar antes de haber nacido o despues de haber muerto
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (1,9,'31/01/1960');
-- Resultado: ERROR:  No se puede ir a vivir a un lugar antes de haber nacido o despues de haber muerto
-- CheckViveEn se muda antes despues de haber muerto - Raise Exception: No se puede ir a vivir a un lugar antes de haber nacido o despues de haber muerto
INSERT INTO ViveEn (idPersona,idTerritorio,fechaDesde) VALUES (101,9,'31/01/1981');
-- Resultado: ERROR:  No se puede ir a vivir a un lugar antes de haber nacido o despues de haber muerto

-- checkMayor16VotaEn menor trata de votar - Raise Exception: Solo los mayores de 16 años pueden votar. No insista
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,hora) VALUES (102,1,'2015-04-26 00:00:00');
-- Resultado: ERROR:  Solo los mayores de 16 años pueden votar. No insista.

-- checkDefuncionVotaEn muerto trata de votar - Raise Exception: Los Muertos No Votan
INSERT INTO VotaEn (idCiudadano,idMesaElectoral,hora) VALUES (101,1,'2015-04-26 00:00:00');
-- Resultado: ERROR:  Los Muertos No Votan


-- CheckSePostula se postula para eleccion en CABA pero solo vive ahi desde hace un año - Raise Exception: No se puede postular a una eleccion si no hace al menos 2 años que vive en el territorio de la eleccion
INSERT INTO SePostula (idEleccion, idCandidato, idPartidoPolitico) VALUES (1,1,1);
-- Resultado: ERROR:  No se puede postular a una eleccion si no hace al menos 2 años que vive en el territorio de la eleccion


-- checkAutoridad La persona que se intenta ingresar como presidente (id 21) ya es vice presidente en otra mesa - Raise Exception: Alguna de las autoridades seleccionadas para esta mesa ya es Autoridad para otra mesa
INSERT INTO MesaElectoral (numero,idPresidente,idVicePresidente,idTecnico,idCentroVotacion,idEleccion) VALUES (5555,21,1,3,1,1);
-- Resultado: ERROR:  Alguna de las autoridades seleccionadas para esta mesa ya es Autoridad para otra mesa

-- Fiscaliza
-- El fiscal no puede tener asignado otro rol de autoridad de mesa
INSERt INTO Fiscaliza (idMesaElectoral,idFiscal,idPartidoPolitico) VALUES(1,21,1);
-- Resultado: ERROR:  El fiscal ya es autoridad de Mesa o la Mesa no existe

--MesaPlebiscito:
-- CheckMesaPlebiscito Se trata de asignar una mesa plebiscito a una eleccion de candidatos - Raise Exception: No se puede tener MesaPlebiscito para Elecciones que no sean del tipo Plebiscito
INSERT INTO MesaPlebiscito (idMesaElectoral) VALUES (1);
-- Resultado: ERROR:  No se puede tener MesaPlebiscito para Elecciones que no sean del tipo Plebiscito

-- CheckCentroVotacionEnCiudad centro de votacion en pais - Raise Exception: El centro de votacion solo puede pertenecer a ciudades
INSERT INTO CentroVotacion (direccion,idTerritorio,idCamioneta) VALUES ('Calle falsa 123',1,1);
-- Resultado: ERROR:  El centro de votacion solo puede pertenecer a ciudades

-- VotosCanidato
-- El voto del candidato para una mesa, no puede superar la cantidad de votos de la mesa
UPDATE VotosCandidato SET Cantidad = 2000 WHERE idCandidato = 10 and idMesaElectoral = 1
-- Resultado: ERROR:  (Candidatos) La suma de votos no puede ser mayor a la cantidad de gente que voto en la Mesa


