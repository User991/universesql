--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_ly numeric(10,1),
    has_supermassive_black_hole boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    distance_from_planet_km numeric(12,1),
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    planet_types_id integer,
    age_in_millions_of_years integer,
    distance_from_earth_ly numeric(10,3),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    is_rocky boolean NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_ly numeric(10,3),
    is_spherical boolean NOT NULL,
    is_main_sequence boolean NOT NULL,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lattea', 'Spirale', 13600, 0.0, true, 'Our galaxy, it contains the Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spirale', 10000, 2537000.0, true, 'Grande galassia spirale più vicina');
INSERT INTO public.galaxy VALUES (3, 'Triangolo', 'Spirale', 10000, 2730000.0, false, 'Galassia spirale del Gruppo Locale');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lenticolare', 13000, 31100000.0, true, 'Rigonfiamento centrale molto pronunciato');
INSERT INTO public.galaxy VALUES (5, 'Girandola', 'Spirale', 13000, 31000000.0, true, 'Interagisce con la compagna NGC 5195');
INSERT INTO public.galaxy VALUES (6, 'Grande Nube di Magellano', 'Irregolare', 13300, 163000.0, false, 'Galassia satellite della Via Lattea');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3474, 384400.0, true, false, 'Unica luna naturale della Terra');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 9376.0, false, false, 'Piccola luna marziana irregolare');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 23463.0, false, false, 'La luna marziana piu piccola');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 421700.0, true, false, 'Corpo vulcanicamente piu attivo del sistema solare');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 671100.0, true, false, 'Superficie di ghiaccio con oceano sottostante');
INSERT INTO public.moon VALUES (6, 'Ganimede', 5, 5268, 1070400.0, true, false, 'La luna piu grande del sistema solare');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 1882700.0, true, false, 'Superficie molto craterizzata');
INSERT INTO public.moon VALUES (8, 'Amaltea', 5, 167, 181400.0, false, false, 'Piccola luna interna di Giove');
INSERT INTO public.moon VALUES (9, 'Titano', 6, 5150, 1221870.0, true, true, 'Atmosfera densa di azoto, laghi di metano');
INSERT INTO public.moon VALUES (10, 'Encelado', 6, 504, 238040.0, true, false, 'Geyser di vapore acqueo dal polo sud');
INSERT INTO public.moon VALUES (11, 'Rea', 6, 1527, 527100.0, true, false, 'Seconda luna di Saturno per dimensioni');
INSERT INTO public.moon VALUES (12, 'Giapeto', 6, 1469, 3560840.0, true, false, 'Due emisferi di colore molto diverso');
INSERT INTO public.moon VALUES (13, 'Mimas', 6, 396, 185540.0, true, false, 'Cratere gigante Herschel');
INSERT INTO public.moon VALUES (14, 'Iperione', 6, 270, 1481010.0, false, false, 'Forma caotica, superficie spugnosa');
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1577, 435900.0, true, false, 'La luna piu grande di Urano');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1523, 583500.0, true, false, 'Superficie antica con crateri');
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 472, 129900.0, true, false, 'Formazioni geologiche molto irregolari');
INSERT INTO public.moon VALUES (18, 'Tritone', 8, 2707, 354760.0, true, true, 'Orbita retrograda, atmosfera tenue');
INSERT INTO public.moon VALUES (19, 'Sirio Luna', 10, 3800, 500000.0, true, false, 'Luna fittizia di Sirio Prime');
INSERT INTO public.moon VALUES (20, 'Aurora Luna', 12, 2500, 300000.0, true, false, 'Luna fittizia di Aurora Prime');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, 1, 4500, 0.000, false, true, 'Pianeta piu interno, molto caldo');
INSERT INTO public.planet VALUES (2, 'Venere', 1, 1, 4500, 0.000, false, true, 'Atmosfera densa di C02 effetto serra estremo');
INSERT INTO public.planet VALUES (3, 'Terra', 1, 1, 4500, 0.000, true, true, 'Unico pianeta noto con vita');
INSERT INTO public.planet VALUES (4, 'Marte', 1, 1, 4500, 0.000, false, true, 'Pianeta rosso con monte Olympus');
INSERT INTO public.planet VALUES (5, 'Giove', 1, 2, 4500, 0.000, false, true, 'Pianeta piu grande del sistema solare');
INSERT INTO public.planet VALUES (6, 'Saturno', 1, 2, 4500, 0.000, false, true, 'Notevole sistema di anelli');
INSERT INTO public.planet VALUES (7, 'Urano', 1, 3, 4500, 0.000, false, true, 'Gigante di ghiaccio con asse molto inclinato');
INSERT INTO public.planet VALUES (8, 'Nettuno', 1, 3, 4500, 0.000, false, true, 'Pianeta piu esterno, venti molto forti');
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 1, 4800, 4246.000, false, true, 'Esopianeta nella zona abitabile di Proxima');
INSERT INTO public.planet VALUES (10, 'Sirio Prime', 3, 2, 200, 8.600, false, true, 'Gigante gassoso fittizio attorno a Sirio');
INSERT INTO public.planet VALUES (11, 'Vega II', 5, 1, 400, 25.000, false, true, 'Esopianeta roccioso fittizio');
INSERT INTO public.planet VALUES (12, 'Aurora Prime', 6, 1, 2000, 2537000.000, false, true, 'Esopianeta fittizio in Andromeda');


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestre', 'Pianeta roccioso con superficie solida', true);
INSERT INTO public.planet_types VALUES (2, 'Gigante gassoso', 'Pianeta composto soprattutto da idrogeno ed elio', false);
INSERT INTO public.planet_types VALUES (3, 'Gigante di ghiaccio', 'Pianeta con mantello di ghiacci e idrogeno molecolare', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sole', 1, 4600, 0.000, true, true, 'Stella di tipo G2, centro del sistema solare');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 4.246, true, true, 'Nana rossa più vicina al Sole');
INSERT INTO public.star VALUES (3, 'Sirio', 1, 250, 8.600, true, true, 'La stella più luminosa del cielo notturno');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 10, 548.000, true, false, 'Supergigante rossa nella costellazione di Orione');
INSERT INTO public.star VALUES (5, 'Vega', 1, 455, 25.000, true, true, 'Stella bianca della costellazione della Lira');
INSERT INTO public.star VALUES (6, 'Andromeda Alpha', 2, 6000, 2537000.000, true, true, 'Stella fittizia nella galassia di Andromeda');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

