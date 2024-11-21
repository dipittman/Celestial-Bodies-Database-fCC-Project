--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_type text,
    constellation text,
    visual_magnitude numeric,
    distance_from_earth_in_million_light_years integer NOT NULL,
    other_ids text
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    visual_magnitude numeric,
    is_spherical boolean,
    larger_than_moon boolean
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    name character varying(30) NOT NULL,
    nebula_id integer NOT NULL,
    constellation text,
    visual_magnitude numeric,
    distance_in_lightyears integer NOT NULL,
    other_ids text
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    planet_type text NOT NULL,
    star_id integer,
    visual_magnitude numeric,
    larger_than_earth boolean,
    other_names text
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    star_type text,
    visual_magnitude numeric,
    distance_from_sun_in_mly integer NOT NULL,
    galaxy_id integer,
    other_names text
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
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'spiral', 'sagittarius', 5.1, 0, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'spiral', 'andromeda', 3.1, 2, 'M31');
INSERT INTO public.galaxy VALUES ('Cigar', 3, 'irregular', 'ursa major', 8.4, 12, 'M82');
INSERT INTO public.galaxy VALUES ('Spindle', 4, 'lenticular', 'draco', 10.7, 44, 'M102');
INSERT INTO public.galaxy VALUES ('Black Eye', 5, 'spiral', 'coma berenices', 9.8, 17, 'M64');
INSERT INTO public.galaxy VALUES ('Smoking Gun', 6, 'elliptical', 'virgo', 9.6, 54, 'M87');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('the Moon', 1, 3, -12.6, true, NULL);
INSERT INTO public.moon VALUES ('Phobos', 2, 4, 11.8, false, false);
INSERT INTO public.moon VALUES ('Deimos', 3, 4, 12.45, false, false);
INSERT INTO public.moon VALUES ('Europa', 4, 5, 5.29, true, false);
INSERT INTO public.moon VALUES ('Ganymede', 5, 5, 4.6, true, true);
INSERT INTO public.moon VALUES ('Callisto', 6, 5, 5.7, true, true);
INSERT INTO public.moon VALUES ('Io', 7, 5, 5, true, true);
INSERT INTO public.moon VALUES ('Titan', 8, 6, 8.2, true, true);
INSERT INTO public.moon VALUES ('Enceladus', 9, 6, 11.7, true, false);
INSERT INTO public.moon VALUES ('Hyperion', 10, 6, 14.2, false, false);
INSERT INTO public.moon VALUES ('Pandora', 11, 6, 16.5, false, false);
INSERT INTO public.moon VALUES ('Prometheus', 12, 6, 15.8, false, false);
INSERT INTO public.moon VALUES ('Miranda', 13, 7, 16.6, true, false);
INSERT INTO public.moon VALUES ('Ariel', 14, 7, 14.8, true, false);
INSERT INTO public.moon VALUES ('Umbriel', 15, 7, 14.8, true, false);
INSERT INTO public.moon VALUES ('Titania', 16, 7, 13.9, true, false);
INSERT INTO public.moon VALUES ('Oberon', 17, 7, 14.2, true, false);
INSERT INTO public.moon VALUES ('Triton', 18, 8, 13.5, true, false);
INSERT INTO public.moon VALUES ('Despina', 19, 8, 22.6, false, false);
INSERT INTO public.moon VALUES ('Proteus', 20, 8, 20.3, false, false);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES ('Crab', 1, 'taurus', 8.4, 6500, 'M1');
INSERT INTO public.nebula VALUES ('Lagoon', 2, 'sagittarius', 6, 5200, 'M8');
INSERT INTO public.nebula VALUES ('Eagle', 3, 'serpens', 6, 7000, 'M16');
INSERT INTO public.nebula VALUES ('Dumbbell', 4, 'vulpecula', 7.5, 1200, 'M27');
INSERT INTO public.nebula VALUES ('Orion', 5, 'orion', 4, 1500, 'M42');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 'terrestrial', 1, -2.2, false, NULL);
INSERT INTO public.planet VALUES ('Venus', 2, 'terrestrial', 1, -4.6, false, NULL);
INSERT INTO public.planet VALUES ('Earth', 3, 'terrestrial', 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Mars', 4, 'terrestrial', 1, -2.3, false, NULL);
INSERT INTO public.planet VALUES ('Jupiter', 5, 'gas', 1, -2.7, true, NULL);
INSERT INTO public.planet VALUES ('Saturn', 6, 'gas', 1, -0.55, true, NULL);
INSERT INTO public.planet VALUES ('Uranus', 7, 'ice', 1, 5.68, true, NULL);
INSERT INTO public.planet VALUES ('Neptune', 8, 'ice', 1, 7.8, true, NULL);
INSERT INTO public.planet VALUES ('Spe', 9, 'gas', 2, 5.22, true, '14 Andromedae b');
INSERT INTO public.planet VALUES ('Taphao Thong', 10, 'gas', 3, 5, true, '47 Ursae majoris b');
INSERT INTO public.planet VALUES ('Taphao Kaew', 11, 'gas', 3, 5, true, '47 Ursae majoris c');
INSERT INTO public.planet VALUES ('Proxima Centauri b', 12, 'super earth', 4, 11, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('the Sun', 1, 'main sequence', -26.74, 0, 1, NULL);
INSERT INTO public.star VALUES ('Veritate', 2, 'red giant', 5.22, 247, 2, '14 Andromedae');
INSERT INTO public.star VALUES ('Chalawan', 3, 'main-sequence', 5.03, 46, 1, '47 Ursae Majoris');
INSERT INTO public.star VALUES ('Proxima Centauri', 4, 'red dwarf', 11.1, 4, 1, NULL);
INSERT INTO public.star VALUES ('Alpheratz', 5, 'binary', 2.06, 97, 2, 'Alpha Andromedae');
INSERT INTO public.star VALUES ('Sirius', 6, 'binary', -1.46, 9, 1, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_other_ids_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_other_ids_key UNIQUE (other_ids);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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

