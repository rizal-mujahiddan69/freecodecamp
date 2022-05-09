--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(64) NOT NULL,
    right_ascension integer,
    declination integer,
    area numeric(12,2),
    number_star integer,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    radius integer,
    distance_from_earth integer,
    apparent_magnitude numeric(3,2),
    description text,
    is_spherical boolean,
    has_life boolean
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
    name character varying(64) NOT NULL,
    radius_km integer,
    distance_from_earth_km bigint,
    apparent_magnitude numeric(5,2),
    description text,
    is_spherical boolean,
    has_life boolean,
    planet_id integer,
    ranking_size_solar_moon integer
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
    name character varying(64) NOT NULL,
    radius_km integer,
    distance_from_earth_km bigint,
    apparent_magnitude numeric(5,2),
    description text,
    is_spherical boolean,
    has_life boolean,
    star_id integer,
    number_moon integer
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
    name character varying(64) NOT NULL,
    radius integer,
    distance_from_earth integer,
    apparent_magnitude numeric(5,2),
    description text,
    is_spherical boolean,
    has_life boolean,
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 19, -25, 867.00, 68, 'zodiac southern hemisphere');
INSERT INTO public.constellation VALUES (2, 'Andromeda', 23, 53, 722.00, 65, 'from ptomely north of celestial equator');
INSERT INTO public.constellation VALUES (3, 'Canis Major', 6, -11, 380.00, 32, 'Constellation from South hemisphere (Like Dog)');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 52850, 25600, 5.10, 'my galaxy', false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 110000, 2538000, 3.44, 'Galaxy nearest Milky Way', false, false);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf', 13, 25000, -0.10, 'Dwarf Gaaxy nearest Milky Way', false, false);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 85000, 20870000, 7.86, 'Galaxy shape like Pinwheel', false, false);
INSERT INTO public.galaxy VALUES (5, 'Sagittarius Dwarf Spherodial', 5000, 62530, 4.50, 'One Satelite Galaxy Milky', false, false);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 30000, 2723000, 5.72, 'galaxy with constellation triangulum and third largest galaxy and can see it, AND shape triangle', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 384400, -12.74, 'Only one moon in Earth', true, false, 3, 5);
INSERT INTO public.moon VALUES (2, 'Phobos', 11267, 77790000, 11.80, 'One of twin moon in Mars', false, false, 4, 85);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 77790000, 12.89, 'One of twin moon in Mars', false, false, 4, 99);
INSERT INTO public.moon VALUES (4, 'Europa', 1561, 628300000, 5.29, 'One of Galilean moon and smallest that group  in Jupyter', true, false, 5, 6);
INSERT INTO public.moon VALUES (5, 'Ganymede', 2634, 628300000, 4.61, 'One of Galilean moon and Larrgest that group in Jupyter', true, false, 5, 1);
INSERT INTO public.moon VALUES (6, 'Io', 1822, 628300000, 5.02, 'One of Galilean moon and third-Largest that group in Jupyter', true, false, 5, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, 628300000, 5.65, 'One of Galilean moon and second-Largest that group in Jupyter', true, false, 5, 3);
INSERT INTO public.moon VALUES (8, 'Amalthea', 84, 628300000, 14.10, 'Third closest orbit in moon Jupyter', false, false, 5, 37);
INSERT INTO public.moon VALUES (9, 'Thebe', 49, 628300000, 6.20, 'fourth nearest moon in jupyter', false, false, 5, 44);
INSERT INTO public.moon VALUES (10, 'Hermippe', 2, 628300000, 22.10, 'with group ankake group in jupyter', false, false, 5, 167);
INSERT INTO public.moon VALUES (11, 'Titan', 2575, 1433507075, 8.20, 'Largest Moon in Saturn', true, false, 6, 2);
INSERT INTO public.moon VALUES (12, 'Rhea', 764, 1272000000, 10.00, 'Second-Largest Moon in Saturn', true, false, 6, 9);
INSERT INTO public.moon VALUES (13, 'Iapetus', 735, 1272000000, 10.20, 'Third-Largest Moon in Saturn', true, false, 6, 11);
INSERT INTO public.moon VALUES (14, 'Dione', 561, 1272000000, 10.40, 'Fourth-Largest Moon in Saturn', true, false, 6, 15);
INSERT INTO public.moon VALUES (15, 'Tethys', 531, 1272000000, 10.20, 'Mid-sized Moon in Saturn', true, false, 6, 16);
INSERT INTO public.moon VALUES (16, 'Titania', 788, 2723000000, 13.90, 'Second-Largest moon in Uranus', true, false, 7, 8);
INSERT INTO public.moon VALUES (17, 'Oberon', 761, 2723000000, 14.10, 'Second-Largest moon in Uranus', true, false, 7, 10);
INSERT INTO public.moon VALUES (18, 'Umbriel', 585, 2723000000, 14.50, 'Second-heaviest moon in Uranus', true, false, 7, 13);
INSERT INTO public.moon VALUES (19, 'Triton', 1353, 4338000000, 13.47, 'Largest moon in Neptune', true, false, 8, 7);
INSERT INTO public.moon VALUES (20, 'Proteus', 210, 4338000000, 19.70, 'Second=Largest moon in Neptune', true, false, 8, 21);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2440, 130380000, 0.23, 'first nearest planet in Solar System', true, false, 1, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 6052, 146680000, -4.14, 'second nearest planet in Solar System', true, false, 1, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 6371, 0, -2.50, 'My planet', true, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3390, 246820000, -2.91, 'Fourth planet in Solar System', true, false, 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupyter', 69911, 851440000, -2.20, 'Largest planet in Solar System', true, false, 1, 79);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232, 1521100000, -0.24, 'Beautiful planet in Solar System', true, false, 1, 82);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, 3096900000, 5.68, 'Seventh planet in Solar System', true, false, 1, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622, 4582000000, 7.78, 'Eighth planet in Solar System', true, false, 1, 14);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 120025, 40113498494986, 11.13, 'Planet in Proxima Centaur', true, false, 7, 0);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 349555, 39735069263902, 11.10, 'Planet in Proxima Centaur', true, false, 7, 0);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 5161, 39735069263902, 11.10, 'Planet in Proxima Centaur', true, false, 7, 0);
INSERT INTO public.planet VALUES (12, 'HR 8799 e', 83893, 1220434230962820, 6.00, 'planet in HR 8799', true, false, 8, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 0, -26.70, 'Star in Solar System', true, false, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 0, 643, 0.50, 'tenth brightest star in night sky', true, false, 1);
INSERT INTO public.star VALUES (3, 'Antares', 0, 555, 1.09, 'fifteenth brightest star in night sky', true, false, 1);
INSERT INTO public.star VALUES (4, 'UY Scuti', 0, 5219, 9.43, 'tenth Largest star in galaxy Milky Way', false, false, 1);
INSERT INTO public.star VALUES (5, 'Alpheratz', 0, 97, 2.06, 'one of tentLargest star in Andromeda', true, false, 2);
INSERT INTO public.star VALUES (6, 'HR 5171', 0, 11740, 6.80, 'one of Largest star in Milky Way', true, false, 1);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 0, 4, 11.05, 'Nearest Star in Sun', true, false, 1);
INSERT INTO public.star VALUES (8, 'HR 8799', 0, 127, 5.96, 'Star in Debris Disk', true, false, 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellation_naame_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_naame_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

