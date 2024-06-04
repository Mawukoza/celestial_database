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
    name character varying(100) NOT NULL,
    type character varying(50),
    distance_from_earth double precision,
    number_of_stars bigint,
    discovered_date date,
    description text,
    has_life boolean,
    age_in_billion_years integer
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
    name character varying(100) NOT NULL,
    planet_id integer,
    orbital_period integer,
    discovered_date date,
    distance_from_earth numeric(20,2)
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
-- Name: moon_surface_features; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_surface_features (
    moon_surface_features_id integer NOT NULL,
    moon_id integer,
    name character varying(100) NOT NULL,
    type character varying(50),
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.moon_surface_features OWNER TO freecodecamp;

--
-- Name: moon_surface_features_moon_surface_features_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_surface_features_moon_surface_features_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_surface_features_moon_surface_features_id_seq OWNER TO freecodecamp;

--
-- Name: moon_surface_features_moon_surface_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_surface_features_moon_surface_features_id_seq OWNED BY public.moon_surface_features.moon_surface_features_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    type character varying(50),
    mass double precision,
    orbital_period double precision,
    has_life boolean
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    type character varying(50),
    mass double precision,
    luminosity double precision
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
-- Name: moon_surface_features moon_surface_features_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_surface_features ALTER COLUMN moon_surface_features_id SET DEFAULT nextval('public.moon_surface_features_moon_surface_features_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 100000000000, NULL, 'The Milky Way is the galaxy that contains our Solar System.', true, 14);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 1000000000000, '0964-01-01', 'The Andromeda Galaxy is the closest spiral galaxy to the Milky Way.', false, 10);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2730000, 40000000000, '1764-01-01', 'The Triangulum Galaxy is a member of the Local Group of galaxies.', false, 10);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, 100000000000, '1773-01-01', 'The Whirlpool Galaxy is known for its beautiful spiral structure.', false, 12);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 28000000, 100000000000, '1781-01-01', 'The Sombrero Galaxy has a bright nucleus and a prominent dust lane.', false, 13);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 21000000, 100000000000, '1781-01-01', 'The Pinwheel Galaxy is a face-on spiral galaxy in the constellation Ursa Major.', false, 14);
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'Irregular', 163000, 30000000000, NULL, 'The Large Magellanic Cloud is a satellite galaxy of the Milky Way.', false, 13);
INSERT INTO public.galaxy VALUES (8, 'Small Magellanic Cloud', 'Irregular', 200000, 7000000000, NULL, 'The Small Magellanic Cloud is a dwarf galaxy near the Milky Way.', false, 13);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 27, NULL, 384400.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0, '1877-08-17', 9376.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1, '1877-08-17', 23460.00);
INSERT INTO public.moon VALUES (4, 'Io', 5, 2, '1610-01-08', 628.30);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4, '1610-01-08', 670.90);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7, '1610-01-08', 1070.40);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 17, '1610-01-08', 1882.70);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 16, '1655-03-25', 1222.00);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 5, '1672-12-23', 527.00);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 79, '1671-10-25', 3561.30);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 3, '1684-03-21', 377.40);
INSERT INTO public.moon VALUES (12, 'Triton', 8, 6, '1846-10-10', 354760.00);
INSERT INTO public.moon VALUES (13, 'Charon', 9, 6, '1978-06-22', 19000.00);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 1, '1948-02-16', 1298700.00);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 4, '1851-10-24', 1210000.00);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 3, '1851-10-24', 1910200.00);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 13, '1787-01-11', 2110300.00);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 9, '1787-01-11', 1787300.00);
INSERT INTO public.moon VALUES (19, 'Mimas', 6, 1, '1789-09-17', 2373780.00);
INSERT INTO public.moon VALUES (20, 'Enceladus', 6, 1, '1789-08-28', 2401900.00);


--
-- Data for Name: moon_surface_features; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_surface_features VALUES (1, 1, 'Mare Tranquillitatis', 'Mare', 8.5, 31.4);
INSERT INTO public.moon_surface_features VALUES (2, 1, 'Crater Copernicus', 'Impact crater', 9.7, 20);
INSERT INTO public.moon_surface_features VALUES (3, 1, 'Montes Apenninus', 'Mountain range', 18.5, 3.7);
INSERT INTO public.moon_surface_features VALUES (4, 1, 'Vallis Schröteri', 'Valley', -29.7, -3);
INSERT INTO public.moon_surface_features VALUES (5, 1, 'Sinus Iridum', 'Bay', 45, -31);
INSERT INTO public.moon_surface_features VALUES (6, 2, 'Mare Orientale', 'Mare', -19.3, -92.8);
INSERT INTO public.moon_surface_features VALUES (7, 2, 'Tycho', 'Impact crater', -43.4, -11.2);
INSERT INTO public.moon_surface_features VALUES (8, 2, 'Montes Haemus', 'Mountain range', -0.2, -51);
INSERT INTO public.moon_surface_features VALUES (9, 2, 'Rupes Altai', 'Cliff', 11.4, 20);
INSERT INTO public.moon_surface_features VALUES (10, 2, 'Lacus Excellentiae', 'Lake', -15, -65);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0.055, 87.97, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0.815, 224.7, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1, 365.25, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 0.107, 687, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 317.8, 4331, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 95.16, 10747, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 14.54, 30589, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 17.15, 59800, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'Terrestrial', 1.27, 11.2, false);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 5, 'Super-Earth', 2.4, 289.9, NULL);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 6, 'Terrestrial', 0.388, 4.05, NULL);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 6, 'Terrestrial', 0.692, 6.1, NULL);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1f', 6, 'Terrestrial', 0.68, 9.21, NULL);
INSERT INTO public.planet VALUES (14, 'Gliese 581c', 7, 'Super-Earth', 5.6, 13, NULL);
INSERT INTO public.planet VALUES (15, 'Gliese 581d', 7, 'Super-Earth', 6.98, 66.87, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 2.02, 25.4);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red supergiant', 18, 126000);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'Red dwarf', 0.12, 0.0017);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 'Blue supergiant', 21, 120000);
INSERT INTO public.star VALUES (6, 'Vega', 2, 'A-type', 2.1, 40.12);
INSERT INTO public.star VALUES (7, 'Altair', 3, 'A-type', 1.8, 10.6);
INSERT INTO public.star VALUES (8, 'Aldebaran', 4, 'Red giant', 1.7, 518);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_surface_features_moon_surface_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_surface_features_moon_surface_features_id_seq', 10, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: moon_surface_features moon_surface_features_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_surface_features
    ADD CONSTRAINT moon_surface_features_name_key UNIQUE (name);


--
-- Name: moon_surface_features moon_surface_features_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_surface_features
    ADD CONSTRAINT moon_surface_features_pkey PRIMARY KEY (moon_surface_features_id);


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
-- Name: moon_surface_features moon_surface_features_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_surface_features
    ADD CONSTRAINT moon_surface_features_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

