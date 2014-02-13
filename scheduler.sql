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
-- Name: bookings; Type: TABLE; Schema: public; Owner: paul; Tablespace: 
--

CREATE TABLE bookings (
    id integer NOT NULL,
    course_id integer,
    start timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    classroom_id integer,
    endtime timestamp without time zone
);


ALTER TABLE public.bookings OWNER TO paul;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: paul
--

CREATE SEQUENCE bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookings_id_seq OWNER TO paul;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paul
--

ALTER SEQUENCE bookings_id_seq OWNED BY bookings.id;


--
-- Name: classrooms; Type: TABLE; Schema: public; Owner: paul; Tablespace: 
--

CREATE TABLE classrooms (
    id integer NOT NULL,
    name character varying(255),
    capacity integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.classrooms OWNER TO paul;

--
-- Name: classrooms_id_seq; Type: SEQUENCE; Schema: public; Owner: paul
--

CREATE SEQUENCE classrooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classrooms_id_seq OWNER TO paul;

--
-- Name: classrooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paul
--

ALTER SEQUENCE classrooms_id_seq OWNED BY classrooms.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: paul; Tablespace: 
--

CREATE TABLE courses (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    start timestamp without time zone,
    "Mondaystart" integer,
    "Mondayend" integer,
    "Tuesdaystart" integer,
    "Tuesdayend" integer,
    "Wednesdaystart" integer,
    "Wednesdayend" integer,
    "Thursdaystart" integer,
    "Thursdayend" integer,
    "Fridaystart" integer,
    "Fridayend" integer,
    "Saturdaystart" integer,
    "Saturdayend" integer,
    "Sundaystart" integer,
    "Sundayend" integer,
    "Mondaystartm" integer,
    "Mondayendm" integer,
    "Tuesdaystartm" integer,
    "Tuesdayendm" integer,
    "Wednesdaystartm" integer,
    "Wednesdayendm" integer,
    "Thursdaystartm" integer,
    "Thursdayendm" integer,
    "Fridaystartm" integer,
    "Fridayendm" integer,
    "Saturdaystartm" integer,
    "Saturdayendm" integer,
    "Sundaystartm" integer,
    "Sundayendm" integer,
    endtime timestamp without time zone,
    classroom_id integer,
    force_classroom boolean,
    capacity integer
);


ALTER TABLE public.courses OWNER TO paul;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: paul
--

CREATE SEQUENCE courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO paul;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paul
--

ALTER SEQUENCE courses_id_seq OWNED BY courses.id;


--
-- Name: courses_instructors; Type: TABLE; Schema: public; Owner: paul; Tablespace: 
--

CREATE TABLE courses_instructors (
    id integer NOT NULL,
    course_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.courses_instructors OWNER TO paul;

--
-- Name: courses_instructors_id_seq; Type: SEQUENCE; Schema: public; Owner: paul
--

CREATE SEQUENCE courses_instructors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_instructors_id_seq OWNER TO paul;

--
-- Name: courses_instructors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paul
--

ALTER SEQUENCE courses_instructors_id_seq OWNED BY courses_instructors.id;


--
-- Name: courses_users; Type: TABLE; Schema: public; Owner: paul; Tablespace: 
--

CREATE TABLE courses_users (
    id integer NOT NULL,
    course_id integer,
    user_id integer,
    user_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.courses_users OWNER TO paul;

--
-- Name: courses_users_id_seq; Type: SEQUENCE; Schema: public; Owner: paul
--

CREATE SEQUENCE courses_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_users_id_seq OWNER TO paul;

--
-- Name: courses_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paul
--

ALTER SEQUENCE courses_users_id_seq OWNED BY courses_users.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: paul; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO paul;

--
-- Name: users; Type: TABLE; Schema: public; Owner: paul; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    password_digest character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    admin boolean
);


ALTER TABLE public.users OWNER TO paul;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: paul
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO paul;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paul
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paul
--

ALTER TABLE ONLY bookings ALTER COLUMN id SET DEFAULT nextval('bookings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paul
--

ALTER TABLE ONLY classrooms ALTER COLUMN id SET DEFAULT nextval('classrooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paul
--

ALTER TABLE ONLY courses ALTER COLUMN id SET DEFAULT nextval('courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paul
--

ALTER TABLE ONLY courses_instructors ALTER COLUMN id SET DEFAULT nextval('courses_instructors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paul
--

ALTER TABLE ONLY courses_users ALTER COLUMN id SET DEFAULT nextval('courses_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paul
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY bookings (id, course_id, start, created_at, updated_at, classroom_id, endtime) FROM stdin;
585	197	2014-02-12 10:00:00	2014-02-12 08:20:39.152543	2014-02-12 08:20:39.152543	6	2014-02-12 12:00:00
587	196	2014-02-12 18:00:00	2014-02-12 08:22:54.61195	2014-02-12 08:22:54.61195	6	2014-02-12 21:00:00
589	198	2014-02-14 06:00:00	2014-02-12 09:16:25.007011	2014-02-12 09:16:25.007011	6	2014-02-14 18:00:00
\.


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paul
--

SELECT pg_catalog.setval('bookings_id_seq', 589, true);


--
-- Data for Name: classrooms; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY classrooms (id, name, capacity, created_at, updated_at) FROM stdin;
6	1	25	2014-02-03 13:15:40.481397	2014-02-03 13:15:40.481397
7	2	20	2014-02-03 13:15:40.503748	2014-02-03 13:15:40.503748
8	3	15	2014-02-03 13:15:40.514614	2014-02-03 13:15:40.514614
9	4	30	2014-02-03 13:15:40.518726	2014-02-03 13:15:40.518726
10	5	25	2014-02-03 13:15:40.522495	2014-02-03 13:15:40.522495
\.


--
-- Name: classrooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paul
--

SELECT pg_catalog.setval('classrooms_id_seq', 10, true);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY courses (id, name, created_at, updated_at, start, "Mondaystart", "Mondayend", "Tuesdaystart", "Tuesdayend", "Wednesdaystart", "Wednesdayend", "Thursdaystart", "Thursdayend", "Fridaystart", "Fridayend", "Saturdaystart", "Saturdayend", "Sundaystart", "Sundayend", "Mondaystartm", "Mondayendm", "Tuesdaystartm", "Tuesdayendm", "Wednesdaystartm", "Wednesdayendm", "Thursdaystartm", "Thursdayendm", "Fridaystartm", "Fridayendm", "Saturdaystartm", "Saturdayendm", "Sundaystartm", "Sundayendm", endtime, classroom_id, force_classroom, capacity) FROM stdin;
197	123	2014-02-12 08:20:39.149522	2014-02-12 08:20:39.149522	2014-02-12 00:00:00	\N	\N	\N	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	2014-02-12 00:00:00	6	f	\N
196	Paul	2014-02-12 07:44:11.068903	2014-02-12 08:22:54.607919	2014-02-12 00:00:00	\N	\N	\N	\N	18	21	9	21	9	11	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	\N	\N	\N	\N	2014-02-12 00:00:00	6	f	\N
198	P5	2014-02-12 08:47:37.825331	2014-02-12 08:47:37.825331	2014-02-14 00:00:00	\N	\N	\N	\N	\N	\N	\N	\N	6	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	2014-02-14 00:00:00	6	f	\N
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paul
--

SELECT pg_catalog.setval('courses_id_seq', 198, true);


--
-- Data for Name: courses_instructors; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY courses_instructors (id, course_id, user_id, created_at, updated_at) FROM stdin;
18	193	2	2014-02-08 14:11:18.701777	2014-02-08 14:11:18.701777
19	194	2	2014-02-08 14:16:18.107399	2014-02-08 14:16:18.107399
20	196	2	2014-02-12 07:44:11.074267	2014-02-12 07:44:11.074267
21	197	2	2014-02-12 08:20:39.15719	2014-02-12 08:20:39.15719
22	198	2	2014-02-12 08:47:37.836902	2014-02-12 08:47:37.836902
\.


--
-- Name: courses_instructors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paul
--

SELECT pg_catalog.setval('courses_instructors_id_seq', 22, true);


--
-- Data for Name: courses_users; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY courses_users (id, course_id, user_id, user_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: courses_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paul
--

SELECT pg_catalog.setval('courses_users_id_seq', 50, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY schema_migrations (version) FROM stdin;
20140203093327
20140203123640
20140203125830
20140203130119
20140203134029
20140203151601
20140203155645
20140203160208
20140203161259
20140203184046
20140203184744
20140204092110
20140204092716
20140204093356
20140204093522
20140206064859
20140206081334
20140206122453
20140206172553
20140212081346
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY users (id, name, email, password_digest, created_at, updated_at, admin) FROM stdin;
3	Sue	sue@sue.com	$2a$10$hg99zCA43KRB6lqGIjUrcuUBNtZkiBeRedbt8vRFurxDq.kZr6nGe	2014-02-06 16:22:17.463402	2014-02-06 16:22:17.463402	\N
4	John	john@john.com	$2a$10$f/HbS1WD4ZeZ2DgSRhpMeOubGkKgRWzxFZNSILPX6XkRcC02hPzXe	2014-02-06 18:03:01.549973	2014-02-06 18:03:01.549973	\N
5	Imran	imran@imran.com	$2a$10$uagrh10CfDkCWl0Vp8.0zenmk/6ZUugiNqOkQibcv8PWuHWrQLtCe	2014-02-06 18:24:37.047195	2014-02-06 18:24:37.047195	\N
2	Paul	paul@lainchbury.com	$2a$10$Q2KFL6niyLmiDwDLYql.XOoKoPYCgB8Z/S.Xgn4ucDiWALkOTMgem	2014-02-05 12:24:00.140048	2014-02-06 20:41:03.23182	t
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paul
--

SELECT pg_catalog.setval('users_id_seq', 5, true);


--
-- Name: bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: paul; Tablespace: 
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: classrooms_pkey; Type: CONSTRAINT; Schema: public; Owner: paul; Tablespace: 
--

ALTER TABLE ONLY classrooms
    ADD CONSTRAINT classrooms_pkey PRIMARY KEY (id);


--
-- Name: courses_instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: paul; Tablespace: 
--

ALTER TABLE ONLY courses_instructors
    ADD CONSTRAINT courses_instructors_pkey PRIMARY KEY (id);


--
-- Name: courses_pkey; Type: CONSTRAINT; Schema: public; Owner: paul; Tablespace: 
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: courses_users_pkey; Type: CONSTRAINT; Schema: public; Owner: paul; Tablespace: 
--

ALTER TABLE ONLY courses_users
    ADD CONSTRAINT courses_users_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: paul; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: paul; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: paul
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM paul;
GRANT ALL ON SCHEMA public TO paul;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

