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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(5,1),
    distance_from_earth numeric(5,1),
    galaxy_type character varying(30)
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
    description text,
    age_in_millions_of_years numeric(5,1),
    planet_id integer NOT NULL
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
    description text,
    age_in_millions_of_years numeric(5,1),
    distance_from_earth numeric(5,1),
    planet_type character varying(30),
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL
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
-- Name: space_probe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_probe (
    space_probe_id integer NOT NULL,
    name character varying(30) NOT NULL,
    days_around integer,
    images_taken integer,
    description text
);


ALTER TABLE public.space_probe OWNER TO freecodecamp;

--
-- Name: space_probe_probe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_probe_probe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_probe_probe_id_seq OWNER TO freecodecamp;

--
-- Name: space_probe_probe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_probe_probe_id_seq OWNED BY public.space_probe.space_probe_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(5,1),
    distance_from_earth numeric(5,1),
    star_type character varying(30),
    galaxy_id integer NOT NULL
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
-- Name: space_probe space_probe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_probe ALTER COLUMN space_probe_id SET DEFAULT nextval('public.space_probe_probe_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy containing our solar system', 1350.0, 0.0, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Spiral galaxy, the nearest major galaxy to the Milky Way', 1000.0, 2.5, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral galaxy, part of the Local Group with Milky Way and Andromeda', 9800.0, 2.7, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Unbarred spiral galaxy with a prominent dust lane', 1300.0, 29.3, 'Unbarred Spiral');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Peculiar elliptical galaxy with a dust lane', 1000.0, 12.4, 'Peculiar');
INSERT INTO public.galaxy VALUES (6, 'Bode''s Galaxy', 'Spiral galaxy with two prominent arms', 1200.0, 12.0, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna (Moon)', 'Earth''s only natural satellite, with craters, maria, and evidence of past volcanism', 4543.0, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Inner moon of Mars, irregular in shape and thought to be a captured asteroid', 4500.0, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Outer moon of Mars, smaller and smoother than Phobos', 4500.0, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanic moon of Jupiter, the most geologically active body in the solar system', 4570.0, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 'Moon of Jupiter with a possible subsurface ocean, considered a potential habitat for life', 4570.0, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the solar system, larger than Mercury, with potential internal ocean', 4570.0, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Second-largest moon of Jupiter, heavily cratered with a possible subsurface ocean', 4570.0, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn''s largest moon, with a thick atmosphere, lakes of liquid methane, and potential for prebiotic chemistry', 4570.0, 4);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Second-largest moon of Saturn, icy and heavily cratered, with a possible subsurface ocean', 4570.0, 4);
INSERT INTO public.moon VALUES (10, 'Dione', 'Fifth-largest moon of Saturn, icy and heavily cratered, with a tenuous atmosphere', 4570.0, 4);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Sixth-largest moon of Saturn, icy and heavily cratered, with a large canyon', 4570.0, 4);
INSERT INTO public.moon VALUES (12, 'Enceladus', 'Saturn''s moon with active geysers, potentially harboring a subsurface ocean and hydrothermal vents', 4570.0, 4);
INSERT INTO public.moon VALUES (13, 'Mimas', 'Small, icy moon of Saturn, nicknamed the "Death Star" for its large crater resembling a giant eye', 4570.0, 4);
INSERT INTO public.moon VALUES (14, 'Hyperion', 'Irregularly shaped moon of Saturn, covered in craters and ridges, resembling a sponge', 4570.0, 4);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Small moon of Uranus, with dark red coloring and a complex geological history', 4560.0, 8);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Largest moon of Uranus, with a smooth, icy surface and potential for internal activity', 4560.0, 8);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Darkest moon of Uranus, heavily cratered with a possible internal ocean', 4560.0, 8);
INSERT INTO public.moon VALUES (18, 'Titania', 'Second-largest moon of Uranus, icy and heavily cratered, with a possible internal ocean', 4560.0, 8);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Ninth-largest moon in the solar system, icy and heavily cratered, with a possible internal ocean', 4560.0, 8);
INSERT INTO public.moon VALUES (20, 'Triton', 'Neptune''s largest moon, geologically active with geysers', 4500.0, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial planet with a breathable atmosphere and liquid water', 4543.0, 0.0, 'Terrestrial', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial planet with a thin atmosphere and evidence of past water activity', 4500.0, 225.0, 'Terrestrial', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas giant, the largest planet in our solar system', 4570.0, 778.0, 'Gas Giant', false, true, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas giant with prominent rings', 4570.0, 1433.0, 'Gas Giant', false, true, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 'Terrestrial planet with a dense, hot atmosphere and no liquid water', 4500.0, 41.0, 'Terrestrial', false, true, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', 'Terrestrial planet closest to the Sun, with extreme temperature variations', 4563.0, 89.0, 'Terrestrial', false, true, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice giant, the eighth planet from the Sun, with strong winds and a dark blue spot', 4550.0, 4503.0, 'Ice Giant', false, true, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Ice giant, the seventh planet from the Sun, tilted on its side and with bluish-green color', 4543.0, 2875.0, 'Ice Giant', false, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet located in the Kuiper Belt, once considered the ninth planet', 4568.0, 5906.0, 'Dwarf Planet', false, true, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 'Dwarf planet in the Kuiper Belt, larger than Pluto by mass, but slightly smaller in volume', 4540.0, 5914.0, 'Dwarf Planet', false, true, 1);
INSERT INTO public.planet VALUES (11, 'Makemake', 'Dwarf planet in the Kuiper Belt, one of the largest known trans-Neptunian objects', 4560.0, 6511.0, 'Dwarf Planet', false, true, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 'Dwarf planet in the Kuiper Belt, with an elongated shape and a bright icy surface', 4550.0, 6449.0, 'Dwarf Planet', false, true, 1);


--
-- Data for Name: space_probe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_probe VALUES (1, 'Voyager 1', 45162, 691000, 'Currently in interstellar space, visited Jupiter, Saturn, Uranus, and Neptune');
INSERT INTO public.space_probe VALUES (2, 'Voyager 2', 46090, 339000, 'Currently in interstellar space, visited Jupiter, Saturn, Uranus, and Neptune');
INSERT INTO public.space_probe VALUES (3, 'Pioneer 10', 14974, 52500, 'Flew past Jupiter but went into interstellar space, no longer sending data');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow dwarf star at the center of our solar system', 4600.0, 0.0, 'G-type', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red dwarf star, the closest star to the Sun', 5000.0, 4.2, 'M-type', 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in the night sky, a binary system consisting of a white dwarf and a main-sequence star', 250.0, 8.6, 'A-type', 1);
INSERT INTO public.star VALUES (4, 'Canopus', 'The second brightest star in the night sky, a yellow-white giant star', 300.0, 313.0, 'F-type', 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'A red supergiant star in the constellation Orion, nearing the end of its life', 8.5, 548.0, 'M-type', 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'A blue supergiant star in the constellation Orion, one of the brightest stars in the galaxy', 8.0, 860.0, 'B-type', 1);


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
-- Name: space_probe_probe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_probe_probe_id_seq', 3, true);


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
-- Name: space_probe space_probe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_probe
    ADD CONSTRAINT space_probe_name_key UNIQUE (name);


--
-- Name: space_probe space_probe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_probe
    ADD CONSTRAINT space_probe_pkey PRIMARY KEY (space_probe_id);


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


