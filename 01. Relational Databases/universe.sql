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
    description text,
    age_in_millions_of_years numeric,
    galaxy_types character varying(30)
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
    name character varying(30) NOT NULL,
    is_asteroid boolean,
    is_spherical boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    has_life boolean,
    planet_types character varying(20),
    star_id integer
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
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth integer,
    star_type character varying(30),
    galaxy_id integer
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
-- Name: telescope; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.telescope (
    telescope_id integer NOT NULL,
    start_year integer NOT NULL,
    stop_year integer,
    confirmed_discoveries integer,
    name character varying(100) NOT NULL
);


ALTER TABLE public.telescope OWNER TO freecodecamp;

--
-- Name: telescope_telescope_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.telescope_telescope_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telescope_telescope_id_seq OWNER TO freecodecamp;

--
-- Name: telescope_telescope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.telescope_telescope_id_seq OWNED BY public.telescope.telescope_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: telescope telescope_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope ALTER COLUMN telescope_id SET DEFAULT nextval('public.telescope_telescope_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home cosmic system containing hundreds of billions of stars and our Solar System.', 13600, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', 'The nearest major galaxy to the Milky Way, currently heading toward a future collision with us.', 10000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum (M33)', 'The third-largest member of our Local Group, known for its rapid star-formation regions.', 12000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirpool (M51)', 'A classic grand-design spiral galaxy interacting with its smaller companion, NGC 5195.', 400, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud (LMC)', 'A Prominent satelite galaxy of the Milky Way visible to the naked eye from the Southern Hemisphere.', 1100, 'Irregular (Magellanic)');
INSERT INTO public.galaxy VALUES (6, 'Messier 87(M87)', 'A massive supergiant galaxy housing the first supermassive black hole ever directly imaged.', 13200, 'Eliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', false, true, 1);
INSERT INTO public.moon VALUES (2, 'Ganymede', false, true, 2);
INSERT INTO public.moon VALUES (3, 'Callisto', false, true, 2);
INSERT INTO public.moon VALUES (4, 'Io', false, true, 2);
INSERT INTO public.moon VALUES (5, 'Europa', false, true, 2);
INSERT INTO public.moon VALUES (6, 'Amalthea', true, false, 2);
INSERT INTO public.moon VALUES (7, 'Himalia', true, false, 2);
INSERT INTO public.moon VALUES (8, 'Elara', true, false, 2);
INSERT INTO public.moon VALUES (9, 'Betelgeuse b-I', false, true, 3);
INSERT INTO public.moon VALUES (10, 'Betelgeuse b-II', true, false, 3);
INSERT INTO public.moon VALUES (11, 'Betelgeuse c-I', false, true, 4);
INSERT INTO public.moon VALUES (12, 'V1-b-I', false, true, 5);
INSERT INTO public.moon VALUES (13, 'V1-c-I', true, false, 6);
INSERT INTO public.moon VALUES (14, 'M33 X-7 b-I', true, false, 7);
INSERT INTO public.moon VALUES (15, 'M33 X-7 c-I', false, true, 8);
INSERT INTO public.moon VALUES (16, 'SN 2011dh-b-I', false, true, 9);
INSERT INTO public.moon VALUES (17, 'SN 2011dh-c-I', true, false, 10);
INSERT INTO public.moon VALUES (18, 'WOH G64-b-I', true, false, 11);
INSERT INTO public.moon VALUES (19, 'M87 Progenitor-b-I', true, false, 12);
INSERT INTO public.moon VALUES (20, 'M87 Progenitor-b-II', true, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Terrestrial', 7);
INSERT INTO public.planet VALUES (2, 'Jupiter', false, 'Gas', 7);
INSERT INTO public.planet VALUES (3, 'Betelgeuse b', false, 'Gas', 1);
INSERT INTO public.planet VALUES (5, 'V1-b', false, 'Terrestrial', 3);
INSERT INTO public.planet VALUES (6, 'V1-c', false, 'Ice', 3);
INSERT INTO public.planet VALUES (7, 'M33 X-7b', false, 'Lava', 2);
INSERT INTO public.planet VALUES (8, 'M33 X-7c', false, 'Gas', 2);
INSERT INTO public.planet VALUES (9, 'SN 2011dh-b', false, 'Gas', 4);
INSERT INTO public.planet VALUES (10, 'SN 2011dh-c', false, 'Ice', 4);
INSERT INTO public.planet VALUES (11, 'WOH G64-b', false, 'Gas', 5);
INSERT INTO public.planet VALUES (12, 'M87 Progenitor-b', false, 'Chthonian', 6);
INSERT INTO public.planet VALUES (4, 'Betelgeuse c', false, 'Ice', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 550, 'Red Superiant', 1);
INSERT INTO public.star VALUES (2, 'M33 X-7 Companion', 27000000, 'O-type Supergiant', 3);
INSERT INTO public.star VALUES (3, 'V1 (Hubble Variable No. 1)', 25000000, 'Cepheid Variable', 2);
INSERT INTO public.star VALUES (4, 'SN 2011dh Progenitor', 230000000, 'Yellow Supergiant', 4);
INSERT INTO public.star VALUES (5, 'WOH G64', 1630000, 'Red Supergiant', 5);
INSERT INTO public.star VALUES (6, 'M87* Central Black Hole Progenitor', 535000000, 'Core Collapsed Supergiant', 6);
INSERT INTO public.star VALUES (7, 'Sun', 0, 'Yellow Dwarf', 1);


--
-- Data for Name: telescope; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.telescope VALUES (1, 2009, 2018, 2662, 'Kepler Space Telescope');
INSERT INTO public.telescope VALUES (2, 2018, NULL, 890, 'TESS (Transiting Exoplanet Survey Satelite)');
INSERT INTO public.telescope VALUES (3, 2006, 2013, 33, 'CoRoT (Convection, Rotation and planetary Transits');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: telescope_telescope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.telescope_telescope_id_seq', 3, true);


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
-- Name: telescope telescope_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescope_name_key UNIQUE (name);


--
-- Name: telescope telescope_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescope_pkey PRIMARY KEY (telescope_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

