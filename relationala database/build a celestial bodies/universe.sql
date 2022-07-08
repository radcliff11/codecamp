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
    name character varying(40) NOT NULL,
    description text,
    age_in_million_of_years integer,
    distance_from_earth numeric
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
-- Name: inhabiting_race; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.inhabiting_race (
    inhabiting_race_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.inhabiting_race OWNER TO freecodecamp;

--
-- Name: inhabiting_race_inhabiting_race_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.inhabiting_race_inhabiting_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inhabiting_race_inhabiting_race_id_seq OWNER TO freecodecamp;

--
-- Name: inhabiting_race_inhabiting_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.inhabiting_race_inhabiting_race_id_seq OWNED BY public.inhabiting_race.inhabiting_race_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
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
    name character varying(40) NOT NULL,
    inhabitant_found boolean,
    fauna_found boolean,
    description text,
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
    description text,
    age_in_million_of_years integer,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: inhabiting_race inhabiting_race_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabiting_race ALTER COLUMN inhabiting_race_id SET DEFAULT nextval('public.inhabiting_race_inhabiting_race_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'gal-1', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'gal-2', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'gal-3', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'gal-4', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'gal-5', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'gal-6', NULL, NULL, NULL);


--
-- Data for Name: inhabiting_race; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.inhabiting_race VALUES (1, 'earthling', NULL);
INSERT INTO public.inhabiting_race VALUES (2, 'martian', NULL);
INSERT INTO public.inhabiting_race VALUES (3, 'venumoids', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'm-1', NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'm-2', NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, 'm-3', NULL, NULL, 1);
INSERT INTO public.moon VALUES (4, 'm-4', NULL, NULL, 1);
INSERT INTO public.moon VALUES (5, 'm-5', NULL, NULL, 1);
INSERT INTO public.moon VALUES (6, 'm-6', NULL, NULL, 2);
INSERT INTO public.moon VALUES (7, 'm-7', NULL, NULL, 2);
INSERT INTO public.moon VALUES (8, 'm-8', NULL, NULL, 2);
INSERT INTO public.moon VALUES (9, 'm-9', NULL, NULL, 2);
INSERT INTO public.moon VALUES (10, 'm-10', NULL, NULL, 2);
INSERT INTO public.moon VALUES (11, 'm-11', NULL, NULL, 3);
INSERT INTO public.moon VALUES (12, 'm-12', NULL, NULL, 3);
INSERT INTO public.moon VALUES (13, 'm-13', NULL, NULL, 3);
INSERT INTO public.moon VALUES (14, 'm-14', NULL, NULL, 3);
INSERT INTO public.moon VALUES (15, 'm-15', NULL, NULL, 3);
INSERT INTO public.moon VALUES (16, 'm-16', NULL, NULL, 4);
INSERT INTO public.moon VALUES (17, 'm-17', NULL, NULL, 4);
INSERT INTO public.moon VALUES (18, 'm-18', NULL, NULL, 4);
INSERT INTO public.moon VALUES (19, 'm-19', NULL, NULL, 4);
INSERT INTO public.moon VALUES (20, 'm-20', NULL, NULL, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'plan-1', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'plan-2', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (3, 'plan-3', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'plan-4', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'plan-5', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'plan-6', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'plan-7', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (8, 'plan-8', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (9, 'plan-9', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (10, 'plan-10', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'plan-11', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (12, 'plan-12', NULL, NULL, NULL, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star-1', NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'star-2', NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'star-3', NULL, NULL, 3);
INSERT INTO public.star VALUES (4, 'star-4', NULL, NULL, 4);
INSERT INTO public.star VALUES (5, 'star-5', NULL, NULL, 5);
INSERT INTO public.star VALUES (6, 'star-6', NULL, NULL, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: inhabiting_race_inhabiting_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.inhabiting_race_inhabiting_race_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 33, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy description_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT description_unique UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: inhabiting_race inhabiting_race_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabiting_race
    ADD CONSTRAINT inhabiting_race_description_key UNIQUE (description);


--
-- Name: inhabiting_race inhabiting_race_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabiting_race
    ADD CONSTRAINT inhabiting_race_pkey PRIMARY KEY (inhabiting_race_id);


--
-- Name: moon moon_description_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_unique UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_unique UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_unique UNIQUE (description);


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
