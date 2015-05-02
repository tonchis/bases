--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: autoridaddemesa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE autoridaddemesa (
    idpersona integer NOT NULL
);


ALTER TABLE autoridaddemesa OWNER TO postgres;

--
-- Name: camioneta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE camioneta (
    idcamioneta integer NOT NULL,
    idpersona integer NOT NULL
);


ALTER TABLE camioneta OWNER TO postgres;

--
-- Name: camioneta_idcamioneta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE camioneta_idcamioneta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camioneta_idcamioneta_seq OWNER TO postgres;

--
-- Name: camioneta_idcamioneta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE camioneta_idcamioneta_seq OWNED BY camioneta.idcamioneta;


--
-- Name: candidato; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE candidato (
    idpersona integer NOT NULL
);


ALTER TABLE candidato OWNER TO postgres;

--
-- Name: centrovotacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE centrovotacion (
    idcentrovotacion integer NOT NULL,
    direccion character varying(255) NOT NULL,
    idterritorio integer NOT NULL,
    idcamioneta integer NOT NULL
);


ALTER TABLE centrovotacion OWNER TO postgres;

--
-- Name: centrovotacion_idcentrovotacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE centrovotacion_idcentrovotacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE centrovotacion_idcentrovotacion_seq OWNER TO postgres;

--
-- Name: centrovotacion_idcentrovotacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE centrovotacion_idcentrovotacion_seq OWNED BY centrovotacion.idcentrovotacion;


--
-- Name: ciudadano; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ciudadano (
    idpersona integer NOT NULL
);


ALTER TABLE ciudadano OWNER TO postgres;

--
-- Name: documento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documento (
    tipo character varying(255) NOT NULL,
    numero integer NOT NULL,
    idpersona integer NOT NULL,
    CONSTRAINT documento_numero_check CHECK ((numero > 0))
);


ALTER TABLE documento OWNER TO postgres;

--
-- Name: eleccion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE eleccion (
    ideleccion integer NOT NULL,
    fecha date NOT NULL,
    idtipoeleccion integer NOT NULL,
    idterritorio integer NOT NULL
);


ALTER TABLE eleccion OWNER TO postgres;

--
-- Name: eleccion_ideleccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE eleccion_ideleccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eleccion_ideleccion_seq OWNER TO postgres;

--
-- Name: eleccion_ideleccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE eleccion_ideleccion_seq OWNED BY eleccion.ideleccion;


--
-- Name: fiscal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fiscal (
    idpersona integer NOT NULL
);


ALTER TABLE fiscal OWNER TO postgres;

--
-- Name: fiscaliza; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fiscaliza (
    idmesaelectoral integer NOT NULL,
    idfiscal integer NOT NULL,
    idpartidopolitico integer NOT NULL
);


ALTER TABLE fiscaliza OWNER TO postgres;

--
-- Name: mesacandidato; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mesacandidato (
    idmesaelectoral integer NOT NULL
);


ALTER TABLE mesacandidato OWNER TO postgres;

--
-- Name: mesaelectoral; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mesaelectoral (
    idmesaelectoral integer NOT NULL,
    numero integer NOT NULL,
    idpresidente integer NOT NULL,
    idvicepresidente integer NOT NULL,
    idtecnico integer NOT NULL,
    idcentrovotacion integer NOT NULL,
    ideleccion integer NOT NULL,
    CONSTRAINT mesaelectoral_numero_check CHECK ((numero > 0))
);


ALTER TABLE mesaelectoral OWNER TO postgres;

--
-- Name: mesaelectoral_idmesaelectoral_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mesaelectoral_idmesaelectoral_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mesaelectoral_idmesaelectoral_seq OWNER TO postgres;

--
-- Name: mesaelectoral_idmesaelectoral_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mesaelectoral_idmesaelectoral_seq OWNED BY mesaelectoral.idmesaelectoral;


--
-- Name: mesaplebiscito; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mesaplebiscito (
    idmesaelectoral integer NOT NULL
);


ALTER TABLE mesaplebiscito OWNER TO postgres;

--
-- Name: oriundade; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oriundade (
    idpersona integer NOT NULL,
    idterritorio integer NOT NULL
);


ALTER TABLE oriundade OWNER TO postgres;

--
-- Name: partidopolitico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE partidopolitico (
    idpartidopolitico integer NOT NULL,
    nombre character varying(255)
);


ALTER TABLE partidopolitico OWNER TO postgres;

--
-- Name: partidopolitico_idpartidopolitico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE partidopolitico_idpartidopolitico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE partidopolitico_idpartidopolitico_seq OWNER TO postgres;

--
-- Name: partidopolitico_idpartidopolitico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE partidopolitico_idpartidopolitico_seq OWNED BY partidopolitico.idpartidopolitico;


--
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona (
    idpersonal integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    fechanacimiento date NOT NULL,
    fechadefuncion date
);


ALTER TABLE persona OWNER TO postgres;

--
-- Name: persona_idpersonal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_idpersonal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE persona_idpersonal_seq OWNER TO postgres;

--
-- Name: persona_idpersonal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_idpersonal_seq OWNED BY persona.idpersonal;


--
-- Name: plebiscito; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE plebiscito (
    idplebiscito integer NOT NULL,
    consulta character varying(255)
);


ALTER TABLE plebiscito OWNER TO postgres;

--
-- Name: plebiscito_idplebiscito_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plebiscito_idplebiscito_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plebiscito_idplebiscito_seq OWNER TO postgres;

--
-- Name: plebiscito_idplebiscito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plebiscito_idplebiscito_seq OWNED BY plebiscito.idplebiscito;


--
-- Name: presidente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE presidente (
    idpersona integer NOT NULL
);


ALTER TABLE presidente OWNER TO postgres;

--
-- Name: sepostula; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sepostula (
    ideleccion integer NOT NULL,
    idcandidato integer NOT NULL,
    idpartidopolitico integer NOT NULL
);


ALTER TABLE sepostula OWNER TO postgres;

--
-- Name: tecnico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tecnico (
    idpersona integer NOT NULL
);


ALTER TABLE tecnico OWNER TO postgres;

--
-- Name: territorio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE territorio (
    idterritorio integer NOT NULL,
    nombre character varying(255),
    idtipoterritorio integer NOT NULL
);


ALTER TABLE territorio OWNER TO postgres;

--
-- Name: territorio_idterritorio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE territorio_idterritorio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE territorio_idterritorio_seq OWNER TO postgres;

--
-- Name: territorio_idterritorio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE territorio_idterritorio_seq OWNED BY territorio.idterritorio;


--
-- Name: tipoeleccion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipoeleccion (
    idtipoeleccion integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE tipoeleccion OWNER TO postgres;

--
-- Name: tipoeleccion_idtipoeleccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipoeleccion_idtipoeleccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipoeleccion_idtipoeleccion_seq OWNER TO postgres;

--
-- Name: tipoeleccion_idtipoeleccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipoeleccion_idtipoeleccion_seq OWNED BY tipoeleccion.idtipoeleccion;


--
-- Name: tipoterritorio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipoterritorio (
    idtipoterritorio integer NOT NULL,
    nombre character varying(255)
);


ALTER TABLE tipoterritorio OWNER TO postgres;

--
-- Name: tipoterritorio_idtipoterritorio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipoterritorio_idtipoterritorio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipoterritorio_idtipoterritorio_seq OWNER TO postgres;

--
-- Name: tipoterritorio_idtipoterritorio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipoterritorio_idtipoterritorio_seq OWNED BY tipoterritorio.idtipoterritorio;


--
-- Name: vicepresidente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vicepresidente (
    idpersona integer NOT NULL
);


ALTER TABLE vicepresidente OWNER TO postgres;

--
-- Name: viveen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE viveen (
    idpersona integer NOT NULL,
    idterritorio integer NOT NULL,
    fechadesde date NOT NULL
);


ALTER TABLE viveen OWNER TO postgres;

--
-- Name: votaen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE votaen (
    idciudadano integer NOT NULL,
    idmesaelectoral integer NOT NULL,
    fecha date,
    hora time without time zone
);


ALTER TABLE votaen OWNER TO postgres;

--
-- Name: votoscandidato; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE votoscandidato (
    idmesaelectoral integer NOT NULL,
    idcandidato integer NOT NULL,
    cantidad integer DEFAULT 0 NOT NULL,
    CONSTRAINT votoscandidato_cantidad_check CHECK ((cantidad >= 0))
);


ALTER TABLE votoscandidato OWNER TO postgres;

--
-- Name: votosplebiscito; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE votosplebiscito (
    idplebiscito integer NOT NULL,
    idmesaelectoral integer NOT NULL,
    afavor integer DEFAULT 0 NOT NULL,
    encontra integer DEFAULT 0 NOT NULL,
    CONSTRAINT votosplebiscito_afavor_check CHECK ((afavor >= 0)),
    CONSTRAINT votosplebiscito_encontra_check CHECK ((encontra >= 0))
);


ALTER TABLE votosplebiscito OWNER TO postgres;

--
-- Name: idcamioneta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camioneta ALTER COLUMN idcamioneta SET DEFAULT nextval('camioneta_idcamioneta_seq'::regclass);


--
-- Name: idcentrovotacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY centrovotacion ALTER COLUMN idcentrovotacion SET DEFAULT nextval('centrovotacion_idcentrovotacion_seq'::regclass);


--
-- Name: ideleccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eleccion ALTER COLUMN ideleccion SET DEFAULT nextval('eleccion_ideleccion_seq'::regclass);


--
-- Name: idmesaelectoral; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mesaelectoral ALTER COLUMN idmesaelectoral SET DEFAULT nextval('mesaelectoral_idmesaelectoral_seq'::regclass);


--
-- Name: idpartidopolitico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partidopolitico ALTER COLUMN idpartidopolitico SET DEFAULT nextval('partidopolitico_idpartidopolitico_seq'::regclass);


--
-- Name: idpersonal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona ALTER COLUMN idpersonal SET DEFAULT nextval('persona_idpersonal_seq'::regclass);


--
-- Name: idplebiscito; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plebiscito ALTER COLUMN idplebiscito SET DEFAULT nextval('plebiscito_idplebiscito_seq'::regclass);


--
-- Name: idterritorio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY territorio ALTER COLUMN idterritorio SET DEFAULT nextval('territorio_idterritorio_seq'::regclass);


--
-- Name: idtipoeleccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipoeleccion ALTER COLUMN idtipoeleccion SET DEFAULT nextval('tipoeleccion_idtipoeleccion_seq'::regclass);


--
-- Name: idtipoterritorio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipoterritorio ALTER COLUMN idtipoterritorio SET DEFAULT nextval('tipoterritorio_idtipoterritorio_seq'::regclass);


--
-- Data for Name: autoridaddemesa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY autoridaddemesa (idpersona) FROM stdin;
\.


--
-- Data for Name: camioneta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY camioneta (idcamioneta, idpersona) FROM stdin;
\.


--
-- Name: camioneta_idcamioneta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('camioneta_idcamioneta_seq', 1, false);


--
-- Data for Name: candidato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY candidato (idpersona) FROM stdin;
\.


--
-- Data for Name: centrovotacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY centrovotacion (idcentrovotacion, direccion, idterritorio, idcamioneta) FROM stdin;
\.


--
-- Name: centrovotacion_idcentrovotacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('centrovotacion_idcentrovotacion_seq', 1, false);


--
-- Data for Name: ciudadano; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ciudadano (idpersona) FROM stdin;
\.


--
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documento (tipo, numero, idpersona) FROM stdin;
\.


--
-- Data for Name: eleccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eleccion (ideleccion, fecha, idtipoeleccion, idterritorio) FROM stdin;
\.


--
-- Name: eleccion_ideleccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('eleccion_ideleccion_seq', 1, false);


--
-- Data for Name: fiscal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fiscal (idpersona) FROM stdin;
\.


--
-- Data for Name: fiscaliza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fiscaliza (idmesaelectoral, idfiscal, idpartidopolitico) FROM stdin;
\.


--
-- Data for Name: mesacandidato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mesacandidato (idmesaelectoral) FROM stdin;
\.


--
-- Data for Name: mesaelectoral; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mesaelectoral (idmesaelectoral, numero, idpresidente, idvicepresidente, idtecnico, idcentrovotacion, ideleccion) FROM stdin;
\.


--
-- Name: mesaelectoral_idmesaelectoral_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mesaelectoral_idmesaelectoral_seq', 1, false);


--
-- Data for Name: mesaplebiscito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mesaplebiscito (idmesaelectoral) FROM stdin;
\.


--
-- Data for Name: oriundade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oriundade (idpersona, idterritorio) FROM stdin;
\.


--
-- Data for Name: partidopolitico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY partidopolitico (idpartidopolitico, nombre) FROM stdin;
\.


--
-- Name: partidopolitico_idpartidopolitico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('partidopolitico_idpartidopolitico_seq', 1, false);


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persona (idpersonal, nombre, apellido, fechanacimiento, fechadefuncion) FROM stdin;
\.


--
-- Name: persona_idpersonal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persona_idpersonal_seq', 1, false);


--
-- Data for Name: plebiscito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY plebiscito (idplebiscito, consulta) FROM stdin;
\.


--
-- Name: plebiscito_idplebiscito_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('plebiscito_idplebiscito_seq', 1, false);


--
-- Data for Name: presidente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY presidente (idpersona) FROM stdin;
\.


--
-- Data for Name: sepostula; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sepostula (ideleccion, idcandidato, idpartidopolitico) FROM stdin;
\.


--
-- Data for Name: tecnico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tecnico (idpersona) FROM stdin;
\.


--
-- Data for Name: territorio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY territorio (idterritorio, nombre, idtipoterritorio) FROM stdin;
\.


--
-- Name: territorio_idterritorio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('territorio_idterritorio_seq', 1, false);


--
-- Data for Name: tipoeleccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipoeleccion (idtipoeleccion, nombre) FROM stdin;
\.


--
-- Name: tipoeleccion_idtipoeleccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipoeleccion_idtipoeleccion_seq', 1, false);


--
-- Data for Name: tipoterritorio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipoterritorio (idtipoterritorio, nombre) FROM stdin;
\.


--
-- Name: tipoterritorio_idtipoterritorio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipoterritorio_idtipoterritorio_seq', 1, false);


--
-- Data for Name: vicepresidente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vicepresidente (idpersona) FROM stdin;
\.


--
-- Data for Name: viveen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY viveen (idpersona, idterritorio, fechadesde) FROM stdin;
\.


--
-- Data for Name: votaen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY votaen (idciudadano, idmesaelectoral, fecha, hora) FROM stdin;
\.


--
-- Data for Name: votoscandidato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY votoscandidato (idmesaelectoral, idcandidato, cantidad) FROM stdin;
\.


--
-- Data for Name: votosplebiscito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY votosplebiscito (idplebiscito, idmesaelectoral, afavor, encontra) FROM stdin;
\.


--
-- Name: autoridaddemesa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autoridaddemesa
    ADD CONSTRAINT autoridaddemesa_pkey PRIMARY KEY (idpersona);


--
-- Name: camioneta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY camioneta
    ADD CONSTRAINT camioneta_pkey PRIMARY KEY (idcamioneta);


--
-- Name: candidato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY candidato
    ADD CONSTRAINT candidato_pkey PRIMARY KEY (idpersona);


--
-- Name: centrovotacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY centrovotacion
    ADD CONSTRAINT centrovotacion_pkey PRIMARY KEY (idcentrovotacion);


--
-- Name: ciudadano_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ciudadano
    ADD CONSTRAINT ciudadano_pkey PRIMARY KEY (idpersona);


--
-- Name: documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (tipo, numero);


--
-- Name: eleccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY eleccion
    ADD CONSTRAINT eleccion_pkey PRIMARY KEY (ideleccion);


--
-- Name: fiscal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fiscal
    ADD CONSTRAINT fiscal_pkey PRIMARY KEY (idpersona);


--
-- Name: fiscaliza_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fiscaliza
    ADD CONSTRAINT fiscaliza_pkey PRIMARY KEY (idmesaelectoral, idfiscal);


--
-- Name: mesacandidato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mesacandidato
    ADD CONSTRAINT mesacandidato_pkey PRIMARY KEY (idmesaelectoral);


--
-- Name: mesaelectoral_numero_ideleccion_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mesaelectoral
    ADD CONSTRAINT mesaelectoral_numero_ideleccion_key UNIQUE (numero, ideleccion);


--
-- Name: mesaelectoral_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mesaelectoral
    ADD CONSTRAINT mesaelectoral_pkey PRIMARY KEY (idmesaelectoral);


--
-- Name: mesaplebiscito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mesaplebiscito
    ADD CONSTRAINT mesaplebiscito_pkey PRIMARY KEY (idmesaelectoral);


--
-- Name: oriundade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oriundade
    ADD CONSTRAINT oriundade_pkey PRIMARY KEY (idpersona, idterritorio);


--
-- Name: partidopolitico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY partidopolitico
    ADD CONSTRAINT partidopolitico_pkey PRIMARY KEY (idpartidopolitico);


--
-- Name: persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (idpersonal);


--
-- Name: plebiscito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY plebiscito
    ADD CONSTRAINT plebiscito_pkey PRIMARY KEY (idplebiscito);


--
-- Name: presidente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presidente
    ADD CONSTRAINT presidente_pkey PRIMARY KEY (idpersona);


--
-- Name: sepostula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sepostula
    ADD CONSTRAINT sepostula_pkey PRIMARY KEY (ideleccion, idcandidato);


--
-- Name: tecnico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tecnico
    ADD CONSTRAINT tecnico_pkey PRIMARY KEY (idpersona);


--
-- Name: territorio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY territorio
    ADD CONSTRAINT territorio_pkey PRIMARY KEY (idterritorio);


--
-- Name: tipoeleccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipoeleccion
    ADD CONSTRAINT tipoeleccion_pkey PRIMARY KEY (idtipoeleccion);


--
-- Name: tipoterritorio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipoterritorio
    ADD CONSTRAINT tipoterritorio_pkey PRIMARY KEY (idtipoterritorio);


--
-- Name: vicepresidente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vicepresidente
    ADD CONSTRAINT vicepresidente_pkey PRIMARY KEY (idpersona);


--
-- Name: viveen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY viveen
    ADD CONSTRAINT viveen_pkey PRIMARY KEY (idpersona, idterritorio, fechadesde);


--
-- Name: votaen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY votaen
    ADD CONSTRAINT votaen_pkey PRIMARY KEY (idciudadano, idmesaelectoral);


--
-- Name: votoscandidato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY votoscandidato
    ADD CONSTRAINT votoscandidato_pkey PRIMARY KEY (idmesaelectoral, idcandidato);


--
-- Name: votosplebiscito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY votosplebiscito
    ADD CONSTRAINT votosplebiscito_pkey PRIMARY KEY (idplebiscito, idmesaelectoral);


--
-- Name: autoridaddemesa_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY autoridaddemesa
    ADD CONSTRAINT autoridaddemesa_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES persona(idpersonal);


--
-- Name: camioneta_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camioneta
    ADD CONSTRAINT camioneta_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES persona(idpersonal);


--
-- Name: candidato_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY candidato
    ADD CONSTRAINT candidato_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES persona(idpersonal);


--
-- Name: centrovotacion_idcamioneta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY centrovotacion
    ADD CONSTRAINT centrovotacion_idcamioneta_fkey FOREIGN KEY (idcamioneta) REFERENCES camioneta(idcamioneta);


--
-- Name: centrovotacion_idterritorio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY centrovotacion
    ADD CONSTRAINT centrovotacion_idterritorio_fkey FOREIGN KEY (idterritorio) REFERENCES territorio(idterritorio);


--
-- Name: ciudadano_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudadano
    ADD CONSTRAINT ciudadano_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES persona(idpersonal);


--
-- Name: documento_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT documento_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES persona(idpersonal);


--
-- Name: eleccion_idterritorio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eleccion
    ADD CONSTRAINT eleccion_idterritorio_fkey FOREIGN KEY (idterritorio) REFERENCES territorio(idterritorio);


--
-- Name: eleccion_idtipoeleccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eleccion
    ADD CONSTRAINT eleccion_idtipoeleccion_fkey FOREIGN KEY (idtipoeleccion) REFERENCES tipoeleccion(idtipoeleccion);


--
-- Name: fiscal_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fiscal
    ADD CONSTRAINT fiscal_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES persona(idpersonal);


--
-- Name: fiscaliza_idfiscal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fiscaliza
    ADD CONSTRAINT fiscaliza_idfiscal_fkey FOREIGN KEY (idfiscal) REFERENCES fiscal(idpersona);


--
-- Name: fiscaliza_idmesaelectoral_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fiscaliza
    ADD CONSTRAINT fiscaliza_idmesaelectoral_fkey FOREIGN KEY (idmesaelectoral) REFERENCES mesaelectoral(idmesaelectoral);


--
-- Name: fiscaliza_idpartidopolitico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fiscaliza
    ADD CONSTRAINT fiscaliza_idpartidopolitico_fkey FOREIGN KEY (idpartidopolitico) REFERENCES partidopolitico(idpartidopolitico);


--
-- Name: mesacandidato_idmesaelectoral_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mesacandidato
    ADD CONSTRAINT mesacandidato_idmesaelectoral_fkey FOREIGN KEY (idmesaelectoral) REFERENCES mesaelectoral(idmesaelectoral);


--
-- Name: mesaelectoral_idcentrovotacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mesaelectoral
    ADD CONSTRAINT mesaelectoral_idcentrovotacion_fkey FOREIGN KEY (idcentrovotacion) REFERENCES centrovotacion(idcentrovotacion);


--
-- Name: mesaelectoral_ideleccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mesaelectoral
    ADD CONSTRAINT mesaelectoral_ideleccion_fkey FOREIGN KEY (ideleccion) REFERENCES eleccion(ideleccion);


--
-- Name: mesaelectoral_idpresidente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mesaelectoral
    ADD CONSTRAINT mesaelectoral_idpresidente_fkey FOREIGN KEY (idpresidente) REFERENCES presidente(idpersona);


--
-- Name: mesaelectoral_idtecnico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mesaelectoral
    ADD CONSTRAINT mesaelectoral_idtecnico_fkey FOREIGN KEY (idtecnico) REFERENCES tecnico(idpersona);


--
-- Name: mesaelectoral_idvicepresidente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mesaelectoral
    ADD CONSTRAINT mesaelectoral_idvicepresidente_fkey FOREIGN KEY (idvicepresidente) REFERENCES vicepresidente(idpersona);


--
-- Name: mesaplebiscito_idmesaelectoral_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mesaplebiscito
    ADD CONSTRAINT mesaplebiscito_idmesaelectoral_fkey FOREIGN KEY (idmesaelectoral) REFERENCES mesaelectoral(idmesaelectoral);


--
-- Name: oriundade_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oriundade
    ADD CONSTRAINT oriundade_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES persona(idpersonal);


--
-- Name: oriundade_idterritorio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oriundade
    ADD CONSTRAINT oriundade_idterritorio_fkey FOREIGN KEY (idterritorio) REFERENCES territorio(idterritorio);


--
-- Name: presidente_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presidente
    ADD CONSTRAINT presidente_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES persona(idpersonal);


--
-- Name: sepostula_idcandidato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sepostula
    ADD CONSTRAINT sepostula_idcandidato_fkey FOREIGN KEY (idcandidato) REFERENCES candidato(idpersona);


--
-- Name: sepostula_ideleccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sepostula
    ADD CONSTRAINT sepostula_ideleccion_fkey FOREIGN KEY (ideleccion) REFERENCES eleccion(ideleccion);


--
-- Name: sepostula_idpartidopolitico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sepostula
    ADD CONSTRAINT sepostula_idpartidopolitico_fkey FOREIGN KEY (idpartidopolitico) REFERENCES partidopolitico(idpartidopolitico);


--
-- Name: tecnico_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tecnico
    ADD CONSTRAINT tecnico_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES persona(idpersonal);


--
-- Name: territorio_idtipoterritorio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY territorio
    ADD CONSTRAINT territorio_idtipoterritorio_fkey FOREIGN KEY (idtipoterritorio) REFERENCES tipoterritorio(idtipoterritorio);


--
-- Name: vicepresidente_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vicepresidente
    ADD CONSTRAINT vicepresidente_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES persona(idpersonal);


--
-- Name: viveen_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viveen
    ADD CONSTRAINT viveen_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES persona(idpersonal);


--
-- Name: viveen_idterritorio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viveen
    ADD CONSTRAINT viveen_idterritorio_fkey FOREIGN KEY (idterritorio) REFERENCES territorio(idterritorio);


--
-- Name: votaen_idciudadano_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votaen
    ADD CONSTRAINT votaen_idciudadano_fkey FOREIGN KEY (idciudadano) REFERENCES ciudadano(idpersona);


--
-- Name: votaen_idmesaelectoral_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votaen
    ADD CONSTRAINT votaen_idmesaelectoral_fkey FOREIGN KEY (idmesaelectoral) REFERENCES mesaelectoral(idmesaelectoral);


--
-- Name: votoscandidato_idcandidato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votoscandidato
    ADD CONSTRAINT votoscandidato_idcandidato_fkey FOREIGN KEY (idcandidato) REFERENCES candidato(idpersona);


--
-- Name: votoscandidato_idmesaelectoral_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votoscandidato
    ADD CONSTRAINT votoscandidato_idmesaelectoral_fkey FOREIGN KEY (idmesaelectoral) REFERENCES mesacandidato(idmesaelectoral);


--
-- Name: votosplebiscito_idmesaelectoral_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votosplebiscito
    ADD CONSTRAINT votosplebiscito_idmesaelectoral_fkey FOREIGN KEY (idmesaelectoral) REFERENCES mesaplebiscito(idmesaelectoral);


--
-- Name: votosplebiscito_idplebiscito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votosplebiscito
    ADD CONSTRAINT votosplebiscito_idplebiscito_fkey FOREIGN KEY (idplebiscito) REFERENCES plebiscito(idplebiscito);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

