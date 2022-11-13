--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO sergio;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO sergio;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO sergio;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO sergio;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO sergio;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO sergio;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: autor_autor; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.autor_autor (
    id bigint NOT NULL,
    nombres character varying(50) NOT NULL,
    apellidos character varying(50) NOT NULL,
    nacionaldiad character varying(20) NOT NULL,
    edad integer NOT NULL,
    CONSTRAINT autor_autor_edad_check CHECK ((edad >= 0))
);


ALTER TABLE public.autor_autor OWNER TO sergio;

--
-- Name: autor_autor_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.autor_autor ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.autor_autor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO sergio;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO sergio;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO sergio;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO sergio;

--
-- Name: home_empleados; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.home_empleados (
    persona_ptr_id bigint NOT NULL,
    empleo character varying(50) NOT NULL
);


ALTER TABLE public.home_empleados OWNER TO sergio;

--
-- Name: lector_lector; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.lector_lector (
    id bigint NOT NULL,
    nombres character varying(50) NOT NULL,
    apellidos character varying(50) NOT NULL,
    nacionalidad character varying(20) NOT NULL,
    edad integer NOT NULL,
    CONSTRAINT lector_lector_edad_check CHECK ((edad >= 0))
);


ALTER TABLE public.lector_lector OWNER TO sergio;

--
-- Name: lector_lector_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.lector_lector ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lector_lector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: lector_prestamo; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.lector_prestamo (
    id bigint NOT NULL,
    fecha_prestamo date NOT NULL,
    fecha_devolucion date,
    devuelto boolean NOT NULL,
    lector_id bigint NOT NULL,
    libro_id bigint NOT NULL
);


ALTER TABLE public.lector_prestamo OWNER TO sergio;

--
-- Name: lector_prestamo_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.lector_prestamo ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lector_prestamo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: libro_categoria; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.libro_categoria (
    id bigint NOT NULL,
    nombre character varying(30)
);


ALTER TABLE public.libro_categoria OWNER TO sergio;

--
-- Name: libro_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.libro_categoria ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.libro_categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: libro_libro; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.libro_libro (
    id bigint NOT NULL,
    titulo character varying(50) NOT NULL,
    fecha date NOT NULL,
    portada character varying(100) NOT NULL,
    visitas integer NOT NULL,
    categoria_id bigint NOT NULL,
    CONSTRAINT libro_libro_visitas_check CHECK ((visitas >= 0))
);


ALTER TABLE public.libro_libro OWNER TO sergio;

--
-- Name: libro_libro_autores; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.libro_libro_autores (
    id bigint NOT NULL,
    libro_id bigint NOT NULL,
    autor_id bigint NOT NULL
);


ALTER TABLE public.libro_libro_autores OWNER TO sergio;

--
-- Name: libro_libro_autores_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.libro_libro_autores ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.libro_libro_autores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: libro_libro_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.libro_libro ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.libro_libro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pesona; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public.pesona (
    id bigint NOT NULL,
    full_name character varying(50) NOT NULL,
    pais character varying(30) NOT NULL,
    pasaporte character varying(50) NOT NULL,
    edad integer NOT NULL,
    apelativo character varying(10) NOT NULL,
    CONSTRAINT edad_mayor_18 CHECK ((edad >= 18))
);


ALTER TABLE public.pesona OWNER TO sergio;

--
-- Name: pesona_id_seq; Type: SEQUENCE; Schema: public; Owner: sergio
--

ALTER TABLE public.pesona ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pesona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add autor	7	add_autor
26	Can change autor	7	change_autor
27	Can delete autor	7	delete_autor
28	Can view autor	7	view_autor
29	Can add categoria	8	add_categoria
30	Can change categoria	8	change_categoria
31	Can delete categoria	8	delete_categoria
32	Can view categoria	8	view_categoria
33	Can add Libro	9	add_libro
34	Can change Libro	9	change_libro
35	Can delete Libro	9	delete_libro
36	Can view Libro	9	view_libro
37	Can add lector	10	add_lector
38	Can change lector	10	change_lector
39	Can delete lector	10	delete_lector
40	Can view lector	10	view_lector
41	Can add prestamo	11	add_prestamo
42	Can change prestamo	11	change_prestamo
43	Can delete prestamo	11	delete_prestamo
44	Can view prestamo	11	view_prestamo
45	Can add Persona	12	add_persona
46	Can change Persona	12	change_persona
47	Can delete Persona	12	delete_persona
48	Can view Persona	12	view_persona
49	Can add empleados	13	add_empleados
50	Can change empleados	13	change_empleados
51	Can delete empleados	13	delete_empleados
52	Can view empleados	13	view_empleados
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$390000$FygLfIIyVcol16PljIPSuU$35FbtI8p61d6h5zDLFO7gt+6BZpm91ZA8iF29GVFgOI=	2022-11-10 19:49:02.510768+01	t	sergio			sergio_bellaco@hotmail.es	t	t	2022-11-10 19:48:53.032128+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: autor_autor; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.autor_autor (id, nombres, apellidos, nacionaldiad, edad) FROM stdin;
1	Joana	Marcús	Inglesa	35
2	Juan	Gómez-Jurado	argentina	56
3	Almudena	Grandes	España	48
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-11-10 19:54:31.691261+01	1	1 - Novela romántica	1	[{"added": {}}]	8	1
2	2022-11-10 19:55:24.672509+01	1	1 Joana-Marcús	1	[{"added": {}}]	7	1
3	2022-11-10 19:56:13.794085+01	1	1 - Después de diciembre (Meses a tu lado 2)	1	[{"added": {}}]	9	1
4	2022-11-10 19:57:16.459424+01	2	2 Juan-Gómez-Jurado	1	[{"added": {}}]	7	1
5	2022-11-10 19:57:49.045241+01	2	2 - Novela drama	1	[{"added": {}}]	8	1
6	2022-11-10 19:58:00.296139+01	2	2 - Todo arde	1	[{"added": {}}]	9	1
7	2022-11-10 19:58:41.570708+01	3	3 Almudena-Grandes	1	[{"added": {}}]	7	1
8	2022-11-10 19:58:55.307954+01	3	3 - Todo va a a mejorar	1	[{"added": {}}]	9	1
9	2022-11-11 12:35:34.043498+01	1	JuanPerez	1	[{"added": {}}]	12	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	autor	autor
8	libro	categoria
9	libro	libro
10	lector	lector
11	lector	prestamo
12	home	persona
13	home	empleados
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-11-10 19:46:15.774853+01
2	auth	0001_initial	2022-11-10 19:46:15.880571+01
3	admin	0001_initial	2022-11-10 19:46:15.910491+01
4	admin	0002_logentry_remove_auto_add	2022-11-10 19:46:15.915478+01
5	admin	0003_logentry_add_action_flag_choices	2022-11-10 19:46:15.921462+01
6	contenttypes	0002_remove_content_type_name	2022-11-10 19:46:15.932432+01
7	auth	0002_alter_permission_name_max_length	2022-11-10 19:46:15.938416+01
8	auth	0003_alter_user_email_max_length	2022-11-10 19:46:15.9444+01
9	auth	0004_alter_user_username_opts	2022-11-10 19:46:15.949387+01
10	auth	0005_alter_user_last_login_null	2022-11-10 19:46:15.954373+01
11	auth	0006_require_contenttypes_0002	2022-11-10 19:46:15.956368+01
12	auth	0007_alter_validators_add_error_messages	2022-11-10 19:46:15.961356+01
13	auth	0008_alter_user_username_max_length	2022-11-10 19:46:15.973323+01
14	auth	0009_alter_user_last_name_max_length	2022-11-10 19:46:15.980304+01
15	auth	0010_alter_group_name_max_length	2022-11-10 19:46:15.987286+01
16	auth	0011_update_proxy_permissions	2022-11-10 19:46:15.992272+01
17	auth	0012_alter_user_first_name_max_length	2022-11-10 19:46:15.998256+01
18	autor	0001_initial	2022-11-10 19:46:16.005237+01
19	libro	0001_initial	2022-11-10 19:46:16.04513+01
20	libro	0002_alter_categoria_nombre_alter_libro_categoria_and_more	2022-11-10 19:46:16.054108+01
21	libro	0003_alter_libro_options	2022-11-10 19:46:16.058096+01
22	lector	0001_initial	2022-11-10 19:46:16.084027+01
23	lector	0002_alter_prestamo_lector	2022-11-10 19:46:16.089013+01
24	lector	0003_alter_prestamo_lector_alter_prestamo_libro	2022-11-10 19:46:16.095995+01
25	sessions	0001_initial	2022-11-10 19:46:16.113947+01
26	home	0001_initial	2022-11-11 12:24:20.868163+01
27	home	0002_alter_persona_unique_together_persona_edad_mayor_18	2022-11-11 12:32:13.820177+01
28	home	0003_empleados	2022-11-11 18:55:24.813555+01
29	autor	0002_rename_nombre_autor_nombres_alter_autor_nacionaldiad	2022-11-11 19:08:16.183547+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
f96z8u1edx5t8ol9ja1zpo3nh2kbnx4r	.eJxVjDsOwjAQBe_iGll2_Isp6TmDtfbu4gBypDipEHeHSCmgfTPzXiLBtta0dVrShOIstDj9bhnKg9oO8A7tNssyt3WZstwVedAurzPS83K4fwcVev3W2bN3lh0p9EPMykAkh1qDB8rRMhkH4ONgmM3ItrBVmQALBh51iEG8P_3mONE:1otCbm:5LFB1gvsoOFRTr6mL_v-YHkXS_a9pMINqnOKvaUpfpM	2022-11-24 19:49:02.512763+01
\.


--
-- Data for Name: home_empleados; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.home_empleados (persona_ptr_id, empleo) FROM stdin;
\.


--
-- Data for Name: lector_lector; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.lector_lector (id, nombres, apellidos, nacionalidad, edad) FROM stdin;
\.


--
-- Data for Name: lector_prestamo; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.lector_prestamo (id, fecha_prestamo, fecha_devolucion, devuelto, lector_id, libro_id) FROM stdin;
\.


--
-- Data for Name: libro_categoria; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.libro_categoria (id, nombre) FROM stdin;
1	Novela romántica
2	Novela drama
\.


--
-- Data for Name: libro_libro; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.libro_libro (id, titulo, fecha, portada, visitas, categoria_id) FROM stdin;
1	Después de diciembre (Meses a tu lado 2)	2022-11-10		0	1
2	Todo arde	2022-11-10		0	2
3	Todo va a a mejorar	2022-11-10		0	2
\.


--
-- Data for Name: libro_libro_autores; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.libro_libro_autores (id, libro_id, autor_id) FROM stdin;
1	1	1
2	2	2
3	3	3
\.


--
-- Data for Name: pesona; Type: TABLE DATA; Schema: public; Owner: sergio
--

COPY public.pesona (id, full_name, pais, pasaporte, edad, apelativo) FROM stdin;
1	JuanPerez	peru	464646464646	20	Perez
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: autor_autor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.autor_autor_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 9, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Name: lector_lector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.lector_lector_id_seq', 1, false);


--
-- Name: lector_prestamo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.lector_prestamo_id_seq', 1, false);


--
-- Name: libro_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.libro_categoria_id_seq', 2, true);


--
-- Name: libro_libro_autores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.libro_libro_autores_id_seq', 3, true);


--
-- Name: libro_libro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.libro_libro_id_seq', 3, true);


--
-- Name: pesona_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergio
--

SELECT pg_catalog.setval('public.pesona_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: autor_autor autor_autor_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.autor_autor
    ADD CONSTRAINT autor_autor_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: home_empleados home_empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.home_empleados
    ADD CONSTRAINT home_empleados_pkey PRIMARY KEY (persona_ptr_id);


--
-- Name: lector_lector lector_lector_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.lector_lector
    ADD CONSTRAINT lector_lector_pkey PRIMARY KEY (id);


--
-- Name: lector_prestamo lector_prestamo_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.lector_prestamo
    ADD CONSTRAINT lector_prestamo_pkey PRIMARY KEY (id);


--
-- Name: libro_categoria libro_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.libro_categoria
    ADD CONSTRAINT libro_categoria_pkey PRIMARY KEY (id);


--
-- Name: libro_libro_autores libro_libro_autores_libro_id_autor_id_be0815cf_uniq; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.libro_libro_autores
    ADD CONSTRAINT libro_libro_autores_libro_id_autor_id_be0815cf_uniq UNIQUE (libro_id, autor_id);


--
-- Name: libro_libro_autores libro_libro_autores_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.libro_libro_autores
    ADD CONSTRAINT libro_libro_autores_pkey PRIMARY KEY (id);


--
-- Name: libro_libro libro_libro_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.libro_libro
    ADD CONSTRAINT libro_libro_pkey PRIMARY KEY (id);


--
-- Name: pesona pesona_pais_apelativo_f771d833_uniq; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.pesona
    ADD CONSTRAINT pesona_pais_apelativo_f771d833_uniq UNIQUE (pais, apelativo);


--
-- Name: pesona pesona_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.pesona
    ADD CONSTRAINT pesona_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: lector_prestamo_lector_id_a0108599; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX lector_prestamo_lector_id_a0108599 ON public.lector_prestamo USING btree (lector_id);


--
-- Name: lector_prestamo_libro_id_c94b640a; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX lector_prestamo_libro_id_c94b640a ON public.lector_prestamo USING btree (libro_id);


--
-- Name: libro_libro_autores_autor_id_75c78bd2; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX libro_libro_autores_autor_id_75c78bd2 ON public.libro_libro_autores USING btree (autor_id);


--
-- Name: libro_libro_autores_libro_id_f32f518c; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX libro_libro_autores_libro_id_f32f518c ON public.libro_libro_autores USING btree (libro_id);


--
-- Name: libro_libro_categoria_id_5981495f; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX libro_libro_categoria_id_5981495f ON public.libro_libro USING btree (categoria_id);


--
-- Name: libro_titulo_idx; Type: INDEX; Schema: public; Owner: sergio
--

CREATE INDEX libro_titulo_idx ON public.libro_libro USING gin (titulo public.gin_trgm_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_empleados home_empleados_persona_ptr_id_27de5a76_fk_pesona_id; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.home_empleados
    ADD CONSTRAINT home_empleados_persona_ptr_id_27de5a76_fk_pesona_id FOREIGN KEY (persona_ptr_id) REFERENCES public.pesona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lector_prestamo lector_prestamo_lector_id_a0108599_fk_lector_lector_id; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.lector_prestamo
    ADD CONSTRAINT lector_prestamo_lector_id_a0108599_fk_lector_lector_id FOREIGN KEY (lector_id) REFERENCES public.lector_lector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lector_prestamo lector_prestamo_libro_id_c94b640a_fk_libro_libro_id; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.lector_prestamo
    ADD CONSTRAINT lector_prestamo_libro_id_c94b640a_fk_libro_libro_id FOREIGN KEY (libro_id) REFERENCES public.libro_libro(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: libro_libro_autores libro_libro_autores_autor_id_75c78bd2_fk_autor_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.libro_libro_autores
    ADD CONSTRAINT libro_libro_autores_autor_id_75c78bd2_fk_autor_autor_id FOREIGN KEY (autor_id) REFERENCES public.autor_autor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: libro_libro_autores libro_libro_autores_libro_id_f32f518c_fk_libro_libro_id; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.libro_libro_autores
    ADD CONSTRAINT libro_libro_autores_libro_id_f32f518c_fk_libro_libro_id FOREIGN KEY (libro_id) REFERENCES public.libro_libro(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: libro_libro libro_libro_categoria_id_5981495f_fk_libro_categoria_id; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public.libro_libro
    ADD CONSTRAINT libro_libro_categoria_id_5981495f_fk_libro_categoria_id FOREIGN KEY (categoria_id) REFERENCES public.libro_categoria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--
