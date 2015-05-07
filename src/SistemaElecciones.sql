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
	idPersona INT NOT NULL REFERENCES Persona,
	patente varchar(255) NOT NULL
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

CREATE OR REPLACE FUNCTION checkPartidoDeFiscalPostulado() RETURNS TRIGGER AS $$
	BEGIN
	IF (SELECT count(*) FROM MesaElectoral M INNER JOIN Eleccion E ON M.idEleccion = E.idEleccion
		INNER JOIN SePostula S on E.idEleccion =  S.idEleccion
		WHERE M.idMesaElectoral = NEW.idMesaElectoral AND S.idPartidoPolitico = NEW.idPartidoPolitico) = 0 THEN
		RAISE EXCEPTION 'El partido a fiscalizar no esta postulado o la Mesa no existe';              
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckInsertPartidoDeFiscalPostuladoFiscaliza
	BEFORE INSERT ON Fiscaliza 
	FOR EACH ROW EXECUTE PROCEDURE checkPartidoDeFiscalPostulado();


CREATE TRIGGER CheckUpdatePartidoDeFiscalPostuladoFiscaliza
	BEFORE UPDATE ON Fiscaliza 
	FOR EACH ROW EXECUTE PROCEDURE checkPartidoDeFiscalPostulado();

CREATE OR REPLACE FUNCTION checkFiscalNoEsAutoridadParaEleccion() RETURNS TRIGGER AS $$
	DECLARE
	idE	INT;
	BEGIN
	SELECT idEleccion INTO idE FROM MesaElectoral WHERE idMesaElectoral = NEW.idMesaElectoral;
	IF NEW.idFiscal IN  (SELECT AutoridadesEleccion(idE)) THEN
		RAISE EXCEPTION 'El fiscal ya es autoridad de Mesa o la Mesa no existe';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER CheckInsertNoEsAutoridadParaEleccionFiscaliza
	BEFORE INSERT ON Fiscaliza 
	FOR EACH ROW EXECUTE PROCEDURE checkFiscalNoEsAutoridadParaEleccion();


CREATE TRIGGER CheckUpdateNoEsAutoridadParaEleccionFiscaliza
	BEFORE UPDATE ON Fiscaliza 
	FOR EACH ROW EXECUTE PROCEDURE checkFiscalNoEsAutoridadParaEleccion();

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

CREATE OR REPLACE FUNCTION checkMayor16VotaEn() RETURNS TRIGGER AS $$
	DECLARE
	edad INT;
	BEGIN
	SELECT date_part('year',age(fechaNacimiento))  INTO edad FROM Persona WHERE idPersona = NEW.idCiudadano ; 
	IF edad < 16 THEN
		RAISE EXCEPTION 'Solo los mayores de 16 años pueden votar. No insista.';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckInsertMayor16VotaEn
	BEFORE INSERT ON VotaEn
	FOR EACH ROW EXECUTE PROCEDURE checkMayor16VotaEn();


CREATE TRIGGER CheckUpdateMayor16VotaEnVotaEn
	BEFORE UPDATE ON VotaEn
	FOR EACH ROW EXECUTE PROCEDURE checkMayor16VotaEn();

CREATE OR REPLACE FUNCTION checkDefuncionVotaEn() RETURNS TRIGGER AS $$
	DECLARE
	fechaDF date;
	fechaE date;
	BEGIN
	SELECT fecha INTO fechaE FROM MesaElectoral M INNER JOIN Eleccion E ON M.idEleccion = E.idEleccion WHERE M.idMesaElectoral = NEW.idMesaElectoral;
	SELECT fechaDefuncion  INTO fechaDF FROM Persona WHERE idPersona = NEW.idCiudadano ;  
	IF fechaDF IS NOT NULL AND fechaE > fechaDF THEN
		RAISE EXCEPTION 'Los Muertos No Votan';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER CheckInsertDefuncionVotaEn
	BEFORE INSERT ON VotaEn
	FOR EACH ROW EXECUTE PROCEDURE checkDefuncionVotaEn();


CREATE TRIGGER CheckUpdateDefuncionEnVotaEn
	BEFORE UPDATE ON VotaEn
	FOR EACH ROW EXECUTE PROCEDURE checkDefuncionVotaEn();
	
CREATE OR REPLACE FUNCTION checkMesaUnicaaPorCiudadanoPorEleccionVotaEn() RETURNS TRIGGER AS $$
	BEGIN
	IF (SELECT count(*) FROM VotaEn V INNER JOIN MesaElectoral M ON V.idMesaElectoral = M.idMesaElectoral INNER JOIN Eleccion E ON M.idEleccion = E.idEleccion
	WHERE M.idEleccion = (SELECT idEleccion from MesaElectoral WHERE idMesaElectoral = NEW.idMesaElectoral) AND V.idCiudadano = New.idCiudadano ) >  0 THEN
		RAISE EXCEPTION 'El ciudadano ya fue asignado a una Mesa para esta eleccion';              
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER CheckInsertMesaUnicaaPorCiudadanoPorEleccionVotaEn
	BEFORE INSERT ON VotaEn
	FOR EACH ROW EXECUTE PROCEDURE checkMesaUnicaaPorCiudadanoPorEleccionVotaEn();


CREATE TRIGGER CheckUpdateMesaUnicaaPorCiudadanoPorEleccionVotaEn
	BEFORE UPDATE ON VotaEn
	FOR EACH ROW EXECUTE PROCEDURE checkMesaUnicaaPorCiudadanoPorEleccionVotaEn();

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


CREATE OR REPLACE FUNCTION CheckMesaCandidato() RETURNS TRIGGER AS $$
BEGIN
	IF (SELECT idTipoEleccion FROM MesaElectoral M INNER JOIN Eleccion E ON M.idEleccion = E.idEleccion
	WHERE M.idMesaElectoral = NEW.idMesaElectoral) = 4  THEN
		RAISE EXCEPTION 'No se puede tener MesaCandidato para plebiscito';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckInsertMesaCandidato
	BEFORE INSERT ON MesaCandidato
	FOR EACH ROW EXECUTE PROCEDURE CheckMesaCandidato();

CREATE TRIGGER CheckUpdateMesaCandidato
	BEFORE UPDATE ON MesaCandidato
	FOR EACH ROW EXECUTE PROCEDURE CheckMesaCandidato();

CREATE OR REPLACE FUNCTION CheckMesaPlebiscito() RETURNS TRIGGER AS $$
BEGIN
	IF (SELECT idTipoEleccion FROM MesaElectoral M INNER JOIN Eleccion E ON M.idEleccion = E.idEleccion
	WHERE M.idMesaElectoral = NEW.idMesaElectoral) <> 4  THEN
		RAISE EXCEPTION 'No se puede tener MesaPlebiscito para Elecciones que no sean del tipo Plebiscito';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;
										
CREATE TRIGGER CheckInsertMesaPlebiscito
	BEFORE INSERT ON MesaPlebiscito
	FOR EACH ROW EXECUTE PROCEDURE CheckMesaPlebiscito();
	
CREATE TRIGGER CheckUpdateMesaPlebiscito
	BEFORE UPDATE ON MesaPlebiscito
	FOR EACH ROW EXECUTE PROCEDURE CheckMesaPlebiscito();


CREATE OR REPLACE FUNCTION CheckViveEn() RETURNS TRIGGER AS $$
BEGIN
	IF NEW.idPersona IN (SELECT P.idPersona FROM Persona P WHERE NEW.fechaDesde < P.fechaNacimiento OR NEW.fechaDesde > P.fechaDefuncion)
	THEN
		RAISE EXCEPTION 'No se puede ir a vivir a un lugar antes de haber nacido o despues de haber muerto';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckInsertViveEn
	BEFORE INSERT ON ViveEn
	FOR EACH ROW EXECUTE PROCEDURE CheckViveEn();
	
CREATE TRIGGER CheckUpdateViveEn
	BEFORE UPDATE ON ViveEn
	FOR EACH ROW EXECUTE PROCEDURE CheckViveEn();


-- Voy a buscar la mesa donde la persona esta tratando de votar y me fijo que el centro de votacion de la mesa este en el
-- mismo territorio donde vive la persona al momento de la eleccion.
-- Para eso me traigo, de los lugares donde vivio la persona, aquel donde vive desde antes de la eleccion pero no hay otro 
-- donde haya vivido despues de ese pero tambien antes de la eleccion.
CREATE OR REPLACE FUNCTION CheckVotaEnDondeVive() RETURNS TRIGGER AS $$
BEGIN
	IF NOT EXISTS ( select me.idMesaElectoral
					from MesaElectoral me
					inner join CentroVotacion ce on ce.idCentroVotacion = me.idCentroVotacion
					inner join Eleccion e on e.idEleccion = me.idEleccion
					inner join ViveEn ve on ve.idPersona = NEW.idCiudadano
					where NEW.idMesaElectoral = me.idMesaElectoral
					and ve.idTerritorio = ce.idTerritorio
					and ve.fechaDesde < e.fecha
					and not exists (select ve2.fechaDesde
									from ViveEn ve2
									where ve2.idPersona = NEW.idCiudadano
									and ve2.fechaDesde > ve.fechaDesde 
									and ve2.fechaDesde < e.fecha)
		)
	THEN
		RAISE EXCEPTION 'No se puede asignar a una persona para que vote en una mesa que esta en un territorio donde la persona no vive al momento de la eleccion';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckVotaEnDondeViveInsert
	BEFORE INSERT ON VotaEn
	FOR EACH ROW EXECUTE PROCEDURE CheckVotaEnDondeVive();
	
CREATE TRIGGER CheckVotaEnDondeViveUpdate
	BEFORE UPDATE ON VotaEn
	FOR EACH ROW EXECUTE PROCEDURE CheckVotaEnDondeVive();



-- Quiero que el candidato viva en un territorio contenido en el territorio de la eleccion desde hace 2 años o mas
-- y que no se haya mudado a un nuevo territorio despues de eso pero antes de la fecha de la eleccion
-- si ese nuevo territorio no estuviera contenido dentro del territorio de la eleccion
CREATE OR REPLACE FUNCTION CheckSePostula() RETURNS TRIGGER AS $$
BEGIN
	IF NOT EXISTS ( select ve.idTerritorio 
					from Eleccion e
					inner join ViveEn ve on ve.idPersona = NEW.idCandidato
					where e.idEleccion = NEW.idEleccion
					and ve.fechaDesde < (e.fecha-INTERVAL '2 years')
					and ve.idTerritorio in (select idT from obtenerTerritorios(e.idTerritorio))
					and not exists (
						select ve2.idTerritorio
						from ViveEn ve2 
						where ve2.idPersona = NEW.idCandidato
						and ve2.idTerritorio not in (select idT from obtenerTerritorios(e.idTerritorio))
						and ve2.fechaDesde > ve.fechaDesde
						and ve2.fechaDesde < e.fecha
					)
		)
	THEN
		RAISE EXCEPTION 'No se puede postular a una eleccion si no hace al menos 2 años que vive en el territorio de la eleccion';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckSePostulaInsert
	BEFORE INSERT ON SePostula
	FOR EACH ROW EXECUTE PROCEDURE CheckSePostula();
	
CREATE TRIGGER CheckSePostulaUpdate
	BEFORE UPDATE ON SePostula
	FOR EACH ROW EXECUTE PROCEDURE CheckSePostula();



CREATE OR REPLACE FUNCTION CheckCentroVotacionEnCiudad() RETURNS TRIGGER AS $$
	BEGIN
	IF (SELECT count(*) FROM Territorio WHERE idTerritorio=NEW.idTerritorio AND idTipoTerritorio=3) = 0 THEN
		RAISE EXCEPTION 'El centro de votacion solo puede pertenecer a ciudades';              
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER CheckCentroVotacionEnCiudadInsert
	BEFORE INSERT ON CentroVotacion
	FOR EACH ROW EXECUTE PROCEDURE CheckCentroVotacionEnCiudad();



CREATE OR REPLACE FUNCTION CheckTerritorioMesaEnTerritorioEleccion() RETURNS TRIGGER AS $$
DECLARE
	territorioCentro int;
	territorioEleccion int;
BEGIN
	select cv.idTerritorio into territorioCentro from CentroVotacion cv where cv.idCentroVotacion = NEW.idCentroVotacion;
	select e.idTerritorio into territorioEleccion from Eleccion e where e.idEleccion = NEW.idEleccion;
	IF territorioCentro NOT IN (select idT from obtenerTerritorios(territorioEleccion))
	THEN
		RAISE EXCEPTION 'El territorio del centro de votacion de la mesa electoral debe estar contenido en el territorio de la eleccion a la que corresponde la mesa';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckTerritorioMesaEnTerritorioEleccionInsert
	BEFORE INSERT ON MesaElectoral
	FOR EACH ROW EXECUTE PROCEDURE CheckTerritorioMesaEnTerritorioEleccion();

	
	

CREATE OR REPLACE FUNCTION checkVotosCandidatoCantidad() RETURNS TRIGGER AS $$
DECLARE
	votosMesa INT;
	votosCandidato INT; 
BEGIN
	SELECT count(*) INTO VotosMesa FROM VotaEn WHERE idMesaElectoral = NEW.idMesaElectoral AND Hora IS NOT NULL;
	SELECT SUM(Cantidad) INTO votosCandidato FROM VotosCandidato WHERE idMesaElectoral = NEW.idMesaElectoral;
	IF votosCandidato > votosMesa THEN
	      RAISE EXCEPTION '(Candidatos) La suma de votos no puede ser mayor a la cantidad de gente que voto en la Mesa';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckInsertVotosCandidatoCantidad
	BEFORE INSERT ON VotosCandidato
	FOR EACH ROW EXECUTE PROCEDURE checkVotosCandidatoCantidad();

CREATE TRIGGER CheckUpdateVotosCandidatoCantidad
	BEFORE UPDATE ON VotosCandidato
	FOR EACH ROW EXECUTE PROCEDURE checkVotosCandidatoCantidad();

	
CREATE OR REPLACE FUNCTION checkVotosPlebiscitoCantidad() RETURNS TRIGGER AS $$
DECLARE
	votosMesa INT;
	VotosAFavorPlebiscito INT; 
	VotosEnContraPlebiscito INT;
BEGIN
	SELECT count(*) INTO VotosMesa FROM VotaEn WHERE idMesaElectoral = NEW.idMesaElectoral AND Hora IS NOT NULL;
	SELECT SUM(aFavor),SUM(enContra) INTO VotosAFavorPlebiscito,VotosEnContraPlebiscito FROM VotosPlebiscito WHERE idMesaElectoral = NEW.idMesaElectoral;
	IF VotosAFavorPlebiscito + VotosEnContraPlebiscito  > votosMesa THEN
	      RAISE EXCEPTION '(Plebiscito) La suma de votos no puede ser mayor a la cantidad de gente que voto en la Mesa';
	ELSE
		RETURN NEW;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckInsertVotosPlebiscitoCantidad
	BEFORE INSERT ON VotosPlebiscito
	FOR EACH ROW EXECUTE PROCEDURE checkVotosPlebiscitoCantidad();

CREATE TRIGGER CheckUpdateVotosPlebiscitoCantidad
	BEFORE UPDATE ON VotosPlebiscito
	FOR EACH ROW EXECUTE PROCEDURE checkVotosPlebiscitoCantidad();
