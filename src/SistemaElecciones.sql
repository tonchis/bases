DROP TABLE IF EXISTS  VotaEn;
DROP TABLE IF EXISTS  Fiscaliza;
DROP TABLE IF EXISTS  SePostula;
DROP TABLE IF EXISTS  VotosCandidato;
DROP TABLE IF EXISTS  PartidoPolitico;
DROP TABLE IF EXISTS  VotosPlebiscito;
DROP TABLE IF EXISTS  Plebiscito;
DROP TABLE IF EXISTS  MesaCandidato;
DROP TABLE IF EXISTS  MesaPlebiscito;
DROP TABLE IF EXISTS  MesaElectoral;
DROP TABLE IF EXISTS  CentroVotacion;
DROP TABLE IF EXISTS  Camioneta;
DROP TABLE IF EXISTS  Eleccion;
DROP TABLE IF EXISTS  TipoEleccion;
DROP TABLE IF EXISTS  Fiscal;
DROP TABLE IF EXISTS  VicePresidente;
DROP TABLE IF EXISTS  Presidente;
DROP TABLE IF EXISTS  AutoridadDeMesa;
DROP TABLE IF EXISTS  Candidato;
DROP TABLE IF EXISTS  Ciudadano;
DROP TABLE IF EXISTS  Tecnico;
DROP TABLE IF EXISTS  ViveEn;
DROP TABLE IF EXISTS  Documento;
DROP TABLE IF EXISTS  Persona;
DROP TABLE IF EXISTS  Territorio;
DROP TABLE IF EXISTS  TipoTerritorio;

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
	fechaDefuncion DATE,
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
