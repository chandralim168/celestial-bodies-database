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
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    galaxy_type character varying(255),
    has_life boolean DEFAULT false NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL
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
-- Name: galaxy_star_planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star_planet_moon (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.galaxy_star_planet_moon OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    size integer NOT NULL,
    has_ice boolean DEFAULT false NOT NULL,
    surface_temp numeric(5,2) NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    size integer NOT NULL,
    is_spherical boolean DEFAULT false NOT NULL,
    planet_type character varying(255) NOT NULL,
    distance_from_star numeric(10,2) NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    luminosity numeric(10,2) NOT NULL,
    mass integer NOT NULL,
    is_spherical boolean DEFAULT false NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy, containing our solar system.', 'Spiral', true, 13000, 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A nearby spiral galaxy.', 'Spiral', false, 10000, 2.50);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small spiral galaxy near Andromeda.', 'Spiral', true, 12000, 3.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A galaxy known for its distinct spiral arms.', 'Spiral', false, 3000, 10.50);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A galaxy with a large bulge at the center.', 'Spiral', false, 8000, 35.00);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A large elliptical galaxy in the Virgo Cluster.', 'Elliptical', false, 13000, 50.00);


--
-- Data for Name: galaxy_star_planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star_planet_moon VALUES (1, 1, 1, 1);
INSERT INTO public.galaxy_star_planet_moon VALUES (1, 1, 2, 2);
INSERT INTO public.galaxy_star_planet_moon VALUES (1, 2, 3, 3);
INSERT INTO public.galaxy_star_planet_moon VALUES (2, 3, 4, 4);
INSERT INTO public.galaxy_star_planet_moon VALUES (3, 4, 5, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, true, -20.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 22, false, -50.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 12, false, -60.00);
INSERT INTO public.moon VALUES (4, 'Titan', 2, 5150, true, -180.00);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121, true, -160.00);
INSERT INTO public.moon VALUES (6, 'Io', 3, 3643, false, 150.00);
INSERT INTO public.moon VALUES (7, 'Ganymede', 3, 5268, true, -130.00);
INSERT INTO public.moon VALUES (8, 'Callisto', 3, 4821, true, -140.00);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 504, true, -200.00);
INSERT INTO public.moon VALUES (10, 'Rhea', 4, 1528, true, -170.00);
INSERT INTO public.moon VALUES (11, 'Mimas', 4, 396, false, -180.00);
INSERT INTO public.moon VALUES (12, 'Dione', 4, 1123, true, -190.00);
INSERT INTO public.moon VALUES (13, 'Iapetus', 4, 1469, true, -160.00);
INSERT INTO public.moon VALUES (14, 'Triton', 5, 2706, true, -235.00);
INSERT INTO public.moon VALUES (15, 'Proteus', 5, 418, false, -220.00);
INSERT INTO public.moon VALUES (16, 'Miranda', 5, 471, true, -200.00);
INSERT INTO public.moon VALUES (17, 'Ariel', 5, 1158, true, -180.00);
INSERT INTO public.moon VALUES (18, 'Umbriel', 5, 1173, true, -190.00);
INSERT INTO public.moon VALUES (19, 'Titania', 5, 1578, true, -210.00);
INSERT INTO public.moon VALUES (20, 'Oberon', 5, 1523, true, -220.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, true, 'Terrestrial', 1.00);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 6779, true, 'Terrestrial', 1.50);
INSERT INTO public.planet VALUES (3, 'Jupiter', 2, 139820, true, 'Gas Giant', 5.20);
INSERT INTO public.planet VALUES (4, 'Saturn', 2, 116460, true, 'Gas Giant', 9.50);
INSERT INTO public.planet VALUES (5, 'Venus', 3, 12104, true, 'Terrestrial', 0.72);
INSERT INTO public.planet VALUES (6, 'Mercury', 3, 4879, true, 'Terrestrial', 0.39);
INSERT INTO public.planet VALUES (7, 'Uranus', 4, 50724, true, 'Ice Giant', 19.20);
INSERT INTO public.planet VALUES (8, 'Neptune', 5, 49528, true, 'Ice Giant', 30.10);
INSERT INTO public.planet VALUES (9, 'Pluto', 6, 2376, false, 'Dwarf Planet', 39.50);
INSERT INTO public.planet VALUES (10, 'Titan', 1, 5150, true, 'Moon', 1.22);
INSERT INTO public.planet VALUES (11, 'Ceres', 4, 940, true, 'Dwarf Planet', 2.70);
INSERT INTO public.planet VALUES (12, 'Earth II', 1, 13000, true, 'Terrestrial', 1.20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 3.85, 1989000, true, 0.00);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 1.52, 2500000, true, 4.37);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 2, 1.21, 2000000, false, 642.50);
INSERT INTO public.star VALUES (4, 'Sirius', 3, 25.40, 4000000, true, 8.60);
INSERT INTO public.star VALUES (5, 'Rigel', 4, 120.30, 1300000, true, 863.00);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 5, 0.00, 1500000, false, 4.20);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_pkey PRIMARY KEY (galaxy_id, star_id, planet_id, moon_id);


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
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

