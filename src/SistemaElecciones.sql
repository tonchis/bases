DROP TABLE IF EXISTS  VotaEn CASCADE;
DROP TABLE IF EXISTS  Fiscaliza CASCADE;
DROP TABLE IF EXISTS  SePostula CASCADE;
DROP TABLE IF EXISTS  VotosCandidato CASCADE;
DROP TABLE IF EXISTS  PartidoPolitico CASCADE;
DROP TABLE IF EXISTS  VotosPlebiscito CASCADE;
DROP TABLE IF EXISTS  Plebiscito CASCADE;
DROP TABLE IF EXISTS  MesaCandidato CASCADE;
DROP TABLE IF EXISTS  MesaPlebiscito CASCADE;
DROP TABLE IF EXISTS  MesaElectoral CASCADE;
DROP TABLE IF EXISTS  CentroVotacion CASCADE;
DROP TABLE IF EXISTS  Camioneta CASCADE;
DROP TABLE IF EXISTS  Eleccion CASCADE;
DROP TABLE IF EXISTS  TipoEleccion CASCADE;
DROP TABLE IF EXISTS  Fiscal CASCADE;
DROP TABLE IF EXISTS  VicePresidente CASCADE;
DROP TABLE IF EXISTS  Presidente CASCADE;
DROP TABLE IF EXISTS  AutoridadDeMesa CASCADE;
DROP TABLE IF EXISTS  Candidato CASCADE;
DROP TABLE IF EXISTS  Ciudadano CASCADE;
DROP TABLE IF EXISTS  Tecnico CASCADE;
DROP TABLE IF EXISTS  ViveEn CASCADE;
DROP TABLE IF EXISTS  Documento CASCADE;
DROP TABLE IF EXISTS  Persona CASCADE;
DROP TABLE IF EXISTS  Territorio CASCADE;
DROP TABLE IF EXISTS  TipoTerritorio CASCADE;

CREATE TABLE TipoTerritorio(
	idTipoTerritorio SERIAL PRIMARY KEY,
	nombre VARCHAR(255)
);


CREATE TABLE Territorio(
	idTerritorio SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	idTipoTerritorio INT NOT NULL REFERENCES TipoTerritorio,
	idTerritorioPadre INT REFERENCES Territorio
	);


CREATE TABLE Persona(
	idPersona SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	apellido VARCHAR(255) NOT NULL,
	fechaNacimiento	DATE NOT NULL,
	fechaDefuncion DATE CHECK( fechaDefuncion >= fechaNacimiento ),
	idTerritorio INT NOT NULL REFERENCES Territorio
	);


CREATE TABLE Documento(
	tipo VARCHAR(255) NOT NULL,
	numero INT NOT NULL CHECK(numero > 0),
	idPersona INT  NOT NULL REFERENCES Persona,
	PRIMARY KEY (tipo,numero)
	);


CREATE TABLE ViveEn(
	idPersona INT NOT NULL REFERENCES Persona,
	idTerritorio INT NOT NULL REFERENCES Territorio,
	fechaDesde DATE NOT NULL,
	PRIMARY KEY(idPersona,idTerritorio,fechaDesde)
	);


CREATE TABLE Tecnico(
	idPersona INT NOT NULL REFERENCES Persona,
	PRIMARY KEY(idPersona)
	);


CREATE TABLE Ciudadano(
	idPersona INT NOT NULL REFERENCES Persona,
	PRIMARY KEY(idPersona)
	);


CREATE TABLE Candidato(
	idPersona INT NOT NULL REFERENCES Persona,
	PRIMARY KEY(idPersona)
	);


CREATE TABLE AutoridadDeMesa(
	idPersona INT NOT NULL REFERENCES Persona,
	PRIMARY KEY(idPersona)
	);


CREATE TABLE Presidente(
	idPersona INT NOT NULL REFERENCES Persona,
	PRIMARY KEY(idPersona)
	);


CREATE TABLE VicePresidente(
	idPersona INT NOT NULL REFERENCES Persona,
	PRIMARY KEY(idPersona)
	);


CREATE TABLE Fiscal(
	idPersona INT NOT NULL REFERENCES Persona,
	PRIMARY KEY(idPersona)
	);


CREATE TABLE TipoEleccion(
	idTipoEleccion SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL
	);


CREATE TABLE Eleccion(
	idEleccion SERIAL PRIMARY KEY,
	fecha DATE NOT NULL,
	idTipoEleccion INT NOT NULL REFERENCES TipoEleccion,
	idTerritorio INT NOT NULL REFERENCES Territorio,
	UNIQUE(fecha,idTipoEleccion,idTerritorio)
	
	);


CREATE TABLE Camioneta(
	idCamioneta SERIAL PRIMARY KEY,
	idPersona INT NOT NULL REFERENCES Persona
	);


CREATE TABLE CentroVotacion(
	idCentroVotacion SERIAL PRIMARY KEY,
	direccion VARCHAR(255) NOT NULL,
	idTerritorio INT NOT NULL REFERENCES Territorio,
	idCamioneta INT NOT NULL REFERENCES Camioneta
	);


CREATE TABLE MesaElectoral(
	idMesaElectoral SERIAL PRIMARY KEY,
	numero INT NOT NULL check( numero > 0),
	idPresidente INT not  null REFERENCES Presidente,
	idVicePresidente INT NOT NULL REFERENCES VicePresidente,
	idTecnico INT NOT NULL REFERENCES Tecnico,
	idCentroVotacion INT NOT NULL REFERENCES CentroVotacion,
	idEleccion INT NOT NULL REFERENCES Eleccion,
	UNIQUE(numero,idEleccion),
	CHECK(idPresidente <> idVicePresidente AND idVicePresidente <> idTecnico AND idPresidente <> idTecnico)
	
	);


CREATE TABLE MesaPlebiscito(
	idMesaElectoral INT NOT NULL REFERENCES MesaElectoral PRIMARY KEY
	);


CREATE TABLE MesaCandidato(
	idMesaElectoral INT NOT NULL REFERENCES MesaElectoral PRIMARY KEY
	);


CREATE TABLE Plebiscito(
	idPlebiscito SERIAL PRIMARY KEY,
	consulta VARCHAR(255)
	);


CREATE TABLE VotosPlebiscito(
	idPlebiscito INT NOT NULL REFERENCES Plebiscito,
	idMesaElectoral INT NOT NULL REFERENCES MesaPlebiscito,
	aFavor INT NOT NULL DEFAULT 0 check(aFavor >= 0 ),
	enContra INT NOT NULL DEFAULT 0 check(enContra >= 0 ),
	PRIMARY KEY(idPlebiscito,idMesaElectoral)
	);


CREATE TABLE PartidoPolitico(
	idPartidoPolitico SERIAL PRIMARY KEY,
	nombre VARCHAR(255)
	);


CREATE TABLE VotosCandidato(
	idMesaElectoral INT NOT NULL REFERENCES MesaCandidato,
	idCandidato INT NOT NULL REFERENCES Candidato,
	cantidad INT NOT NULL DEFAULT 0 CHECK( cantidad >= 0 ),
	PRIMARY KEY(idMesaElectoral,idCandidato)
	);


CREATE TABLE SePostula(
	idEleccion INT NOT NULL REFERENCES Eleccion,
	idCandidato INT NOT NULL REFERENCES Candidato,
	idPartidoPolitico INT NOT NULL REFERENCES PartidoPolitico,
	PRIMARY KEY(idEleccion,idCandidato)
	);


CREATE TABLE Fiscaliza(
	idMesaElectoral INT NOT NULL REFERENCES MesaElectoral,
	idFiscal INT NOT NULL REFERENCES Fiscal,
	idPartidoPolitico INT NOT NULL REFERENCES PartidoPolitico,
	PRIMARY KEY(idMesaElectoral,idFiscal)
	);



CREATE TABLE VotaEn(
	idCiudadano INT NOT NULL REFERENCES Ciudadano,
	idMesaElectoral INT NOT NULL REFERENCES MesaElectoral,
	fecha DATE,
	hora TIME,
	PRIMARY KEY(idCiudadano,idMesaElectoral)
	);


CREATE OR REPLACE FUNCTION OriundaDeCiudad() RETURNS TRIGGER AS $$
	BEGIN
	IF (SELECT count(*) FROM Territorio WHERE idTerritorio=NEW.idTerritorio AND idTipoTerritorio=3) = 0 THEN
		RAISE EXCEPTION 'Solo puede ser oriundo de una ciudad';              
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER CheckInsertPersona
	BEFORE INSERT ON Persona
	FOR EACH ROW EXECUTE PROCEDURE OriundaDeCiudad();


CREATE OR REPLACE FUNCTION checkVotosCandidato() RETURNS TRIGGER AS $$
	BEGIN
	IF (SELECT count(*) FROM MesaElectoral M INNER JOIN Eleccion E ON M.idEleccion = E.idEleccion
		INNER JOIN SePostula S on E.idEleccion =  S.idEleccion
		WHERE S.idCandidato = NEW.idCandidato AND M.idMesaElectoral = NEW.idMesaElectoral ) = 0 THEN
		RAISE EXCEPTION 'El candidato se ha postulado para la eleccion de la Mesa';              
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER CheckInsertVotosCandidato
	BEFORE INSERT ON VotosCandidato
	FOR EACH ROW EXECUTE PROCEDURE checkVotosCandidato();


CREATE TRIGGER CheckUpdateVotosCandidato
	BEFORE UPDATE ON VotosCandidato
	FOR EACH ROW EXECUTE PROCEDURE checkVotosCandidato();


CREATE OR REPLACE FUNCTION  AutoridadesEleccion(idE int) RETURNS TABLE (idPersona int) AS $$
BEGIN
	RETURN query SELECT idPresidente from MesaElectoral Where idEleccion = idE;
	RETURN query SELECT idVicePresidente from MesaElectoral Where idEleccion = idE;
	RETURN query SELECT idTecnico from MesaElectoral Where idEleccion = idE;
	RETURN query SELECT idFiscal from Fiscaliza F INNER JOIN MesaElectoral M ON F.idMesaElectoral = M.idMesaElectoral WHERE M.idEleccion = idE;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION checkAutoridad() RETURNS TRIGGER AS $$
	BEGIN
	IF ( NEW.idPresidente IN ( SELECT AutoridadesEleccion(NEW.idEleccion) ) OR
	NEW.idVicePresidente IN ( SELECT AutoridadesEleccion(NEW.idEleccion) ) OR
	NEW.idTecnico IN ( SELECT AutoridadesEleccion(NEW.idEleccion) ) ) THEN
		RAISE EXCEPTION 'Alguna de las autoridades seleccionadas para esta mesa ya es Autoridad para otra mesa';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckInsertMesaElectoral
	BEFORE INSERT ON MesaElectoral
	FOR EACH ROW EXECUTE PROCEDURE checkAutoridad();

CREATE TRIGGER CheckUpdateMesaElectoral
	BEFORE UPDATE ON MesaElectoral
	FOR EACH ROW EXECUTE PROCEDURE checkAutoridad();

CREATE OR REPLACE FUNCTION checkFiscal() RETURNS TRIGGER AS $$
	DECLARE
	idE	INT;
	BEGIN
	IF (SELECT count(*) FROM MesaElectoral M INNER JOIN Eleccion E ON M.idEleccion = E.idEleccion
		INNER JOIN SePostula S on E.idEleccion =  S.idEleccion
		WHERE M.idMesaElectoral = NEW.idMesaElectoral AND S.idPartidoPolitico = NEW.idPartidoPolitico) = 0 THEN
		RAISE EXCEPTION 'El partido a fiscalizar no esta postulado o la Mesa no existe';              
	ELSE
		SELECT idEleccion INTO idE FROM MesaElectoral WHERE idMesaElectoral = NEW.idMesaElectoral;
		IF NEW.idFiscal IN  (SELECT AutoridadesEleccion(idE)) THEN
			RAISE EXCEPTION 'El fiscal ya es autoridad de Mesa o la Mesa no existe';
		ELSE
			RETURN NEW;
		END IF;
	END IF;
	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;




CREATE TRIGGER CheckInsertFiscaliza
	BEFORE INSERT ON Fiscaliza 
	FOR EACH ROW EXECUTE PROCEDURE checkFiscal();


CREATE TRIGGER CheckUpdateFiscaliza
	BEFORE UPDATE ON Fiscaliza 
	FOR EACH ROW EXECUTE PROCEDURE checkFiscal();

CREATE OR REPLACE FUNCTION checkAutoridadDeMesa() RETURNS TRIGGER AS $$
	DECLARE
	edad INT;
	BEGIN
	SELECT date_part('year',age(fechaNacimiento))  INTO edad FROM Persona WHERE idPersona = NEW.idPersona AND fechaDefuncion IS NULL ;
	IF edad < 16 THEN
		RAISE EXCEPTION 'Hay que tener mas de 16 años y estar vivo para ser autoridad de Mesa';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckInsertAutoridadDeMesa
	BEFORE INSERT ON AutoridadDeMesa
	FOR EACH ROW EXECUTE PROCEDURE checkAutoridadDeMesa();


CREATE TRIGGER CheckUpdateAutoridadDeMesa
	BEFORE UPDATE ON AutoridadDeMesa
	FOR EACH ROW EXECUTE PROCEDURE checkAutoridadDeMesa();

CREATE OR REPLACE FUNCTION checkVotaEn() RETURNS TRIGGER AS $$
	DECLARE
	fechaDF date;
	fechaE date;
	edad INT;
	BEGIN
	SELECT date_part('year',age(fechaNacimiento)),fechaDefuncion  INTO edad,fechaDF FROM Persona WHERE idPersona = NEW.idCiudadano ;  
	SELECT fecha INTO fechaE FROM MesaElectoral M INNER JOIN Eleccion E ON M.idEleccion = E.idEleccion WHERE M.idMesaElectoral = NEW.idMesaElectoral;
	IF edad < 16 THEN
		RAISE EXCEPTION 'Solo los mayores de 16 años pueden votar. No insista.';
	ELSE
		IF fechaDF IS NOT NULL AND fechaE > fechaDF THEN
			RAISE EXCEPTION 'Los Muertos No Votan';
		ELSE
			IF (SELECT count(*) FROM VotaEn V INNER JOIN MesaElectoral M ON V.idMesaElectoral = M.idMesaElectoral INNER JOIN Eleccion E ON M.idEleccion = E.idEleccion
			WHERE M.idEleccion = (SELECT idEleccion from MesaElectoral WHERE idMesaElectoral = NEW.idMesaElectoral) AND V.idCiudadano = New.idCiudadano ) >  0 THEN
				RAISE EXCEPTION 'El ciudadano ya fue asignado a una Mesa para esta eleccion';              
			ELSE
				RETURN NEW;
			END IF;
		END IF;
	END IF;
	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER CheckInsertVotaEn
	BEFORE INSERT ON VotaEn
	FOR EACH ROW EXECUTE PROCEDURE checkVotaEn();


CREATE TRIGGER CheckUpdateVotaEn
	BEFORE UPDATE ON VotaEn
	FOR EACH ROW EXECUTE PROCEDURE checkVotaEn();

/** Obtiene idTerritorio,iTipoTerritorio y nombre de Territorios contenidos para un idTerritorio dado */
CREATE OR REPLACE FUNCTION obtenerTerritorios(id INT) RETURNS TABLE (idT INT,idTT INT,n varchar(255)) AS $$
WITH RECURSIVE Territorios_Contenidos(idTerritorio,idTerritorioPadre,nombre) AS (
	SELECT idTerritorio,idTerritorioPadre,nombre FROM Territorio WHERE idTerritorio = $1
	UNION ALL
	   SELECT t.idTerritorio,t.idTerritorioPadre,t.nombre
	    FROM Territorios_Contenidos tc,territorio t
	    WHERE t.idterritorioPadre = tc.idterritorio
	  )
	SELECT * FROM Territorios_Contenidos;
$$ LANGUAGE 'sql';



