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
	idTerritorio INT NOT NULL REFERENCES Territorio
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
	UNIQUE(numero,idEleccion)
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

