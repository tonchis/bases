create table TipoTerritorio(
			idTipoTerritorio serial primary key,
			nombre varchar(255)
			);

create table Territorio(
			idTerritorio serial primary key,
			nombre varchar(255),
			idTipoTerritorio int not null references TipoTerritorio
			);
create table Persona(
			idPersonal serial primary key,
			nombre varchar(255) not null,
			apellido varchar(255) not null,
			fechaNacimiento	date not null,
			fechaDefuncion date
			);



create table Documento(
			tipo varchar(255) not null,
			numero int not null CHECK(numero > 0),
			idPersona int  not null references Persona,
			PRIMARY KEY (tipo,numero)
			);



create table ViveEn(
		idPersona int not null references Persona,
		idTerritorio int not null references Territorio,
		fechaDesde date not null,
		PRIMARY KEY(idPersona,idTerritorio,fechaDesde)
		);

create table OriundaDe(
		idPersona int not null references Persona,
		idTerritorio int not null references Territorio,
		PRIMARY KEY(idPersona,idTerritorio)
		);

create table Tecnico(
			idPersona int not null references Persona,
			PRIMARY KEY(idPersona)
			);
create table Ciudadano(
			idPersona int not null references Persona,
			PRIMARY KEY(idPersona)
			);
create table Candidato(
			idPersona int not null references Persona,
			PRIMARY KEY(idPersona)
			);
create table AutoridadDeMesa(
			idPersona int not null references Persona,
			PRIMARY KEY(idPersona)
			);
create table Presidente(
			idPersona int not null references Persona,
			PRIMARY KEY(idPersona)
			);
create table VicePresidente(
			idPersona int not null references Persona,
			PRIMARY KEY(idPersona)
			);
create table Fiscal(
			idPersona int not null references Persona,
			PRIMARY KEY(idPersona)
			);

create table TipoEleccion(
			idTipoEleccion serial primary key,
			nombre varchar(255) not null
			);
create table Eleccion(			
			idEleccion serial primary key,
			fecha date not null,
			idTipoEleccion int not null references TipoEleccion,
			idTerritorio int not null references Territorio
			);

----------------
create table Camioneta(
			idCamioneta serial primary key,
			idPersona int not null references Persona
			);

create table CentroVotacion(
			idCentroVotacion serial primary key,
			direccion varchar(255) not null,
			idTerritorio int not null references Territorio,
			idCamioneta int not null references Camioneta
			);

			
create table MesaElectoral(
			idMesaElectoral serial primary key,
			numero int not null check( numero > 0),
			idPresidente int not  null references Presidente,
			idVicePresidente int not null references VicePresidente,
			idTecnico int not null references Tecnico,
			idCentroVotacion int not null references CentroVotacion,
			idEleccion int not null references Eleccion,
			UNIQUE(numero,idEleccion)
			);

create table MesaPlebiscito(
			idMesaElectoral int not null references MesaElectoral primary key
			);
create table MesaCandidato(
			idMesaElectoral int not null references MesaElectoral primary key
			);

create table Plebiscito(
			idPlebiscito serial primary key,
			consulta varchar(255)
			);
create table VotosPlebiscito(
			idPlebiscito int not null references Plebiscito,
			idMesaElectoral int not null references MesaPlebiscito,
			aFavor int not null DEFAULT 0 check(aFavor >= 0 ),
			enContra int not null DEFAULT 0 check(enContra >= 0 ),
			PRIMARY KEY(idPlebiscito,idMesaElectoral)
			);

create table PartidoPolitico(
			idPartidoPolitico serial primary key,
			nombre varchar(255)
			);
			
create table VotosCandidato(
			idMesaElectoral int not null references MesaCandidato,
			idCandidato int not null references Candidato,
			cantidad int not null DEFAULT 0 CHECK( cantidad >= 0 ),
			PRIMARY KEY(idMesaElectoral,idCandidato)
			);
create table SePostula(
		idEleccion int not null references Eleccion,
		idCandidato int not null references Candidato,
		idPartidoPolitico int not null references PartidoPolitico,
		primary key(idEleccion,idCandidato)
		);

create table Fiscaliza(
		idMesaElectoral int not null references MesaElectoral,
		idFiscal int not null references Fiscal,
		idPartidoPolitico int not null references PartidoPolitico,
		primary key(idMesaElectoral,idFiscal)
		);


create table VotaEn(
		idCiudadano int not null references Ciudadano,
		idMesaElectoral int not null references MesaElectoral,
		fecha date,
		hora time,
		PRIMARY KEY(idCiudadano,idMesaElectoral)
		);