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
    width_light_year integer,
    blackholes integer,
    drift_speed numeric,
    description text NOT NULL,
    is_visible boolean,
    is_fictional boolean,
    galaxy_type_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(30) NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy__type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy__type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy__type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy__type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy__type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


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
    distance_from_planet integer,
    diameter integer,
    tempreture numeric,
    description text NOT NULL,
    is_spherical boolean,
    water_present boolean,
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
    tempreture integer,
    tweens integer,
    gravity numeric,
    description text NOT NULL,
    has_life boolean,
    has_intelligent_life boolean,
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
    name character varying(30) NOT NULL,
    brightness integer,
    age integer,
    luminousity numeric,
    description text NOT NULL,
    is_giant boolean,
    dieing boolean,
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy__type_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'ESO 383-G 076', 1764000, 3, 151, '90% total B-light', true, true, 2);
INSERT INTO public.galaxy VALUES (2, 'ESO 248-G 006', 1454000, 3, 151, '90% total B-light', true, false, 3);
INSERT INTO public.galaxy VALUES (3, 'ESO 409-G 025', 1290000, 3, 151, '90% total B-light', true, true, 3);
INSERT INTO public.galaxy VALUES (4, 'Abell 3039 BCG B', 1134000, 3, 151, '90% total B-light', false, true, 1);
INSERT INTO public.galaxy VALUES (5, '2MASX J14102504+6337103', 1132000, 3, 151, '90% total B-light', false, false, 2);
INSERT INTO public.galaxy VALUES (6, 'ESO 151-G 041', 1115000, 3, 151, '90% total B-light', true, false, 1);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Ellipticals', 'desc one');
INSERT INTO public.galaxy_type VALUES (2, 'Spirals', 'desc two');
INSERT INTO public.galaxy_type VALUES (3, 'Dwarfs', 'desc three');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Chlidonias leucopterus', 28, 6, 17.9, 'metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus', true, false, 3);
INSERT INTO public.moon VALUES (2, 'Larus dominicanus', 62, 9, 7.9, 'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', false, false, 7);
INSERT INTO public.moon VALUES (3, 'Tamiasciurus hudsonicus', 25, 1, 16.6, 'fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a', false, false, 9);
INSERT INTO public.moon VALUES (4, 'Psittacula krameri', 89, 7, 17.5, 'quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue', true, false, 4);
INSERT INTO public.moon VALUES (5, 'Canis lupus', 31, 7, 2.5, 'venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi', false, false, 10);
INSERT INTO public.moon VALUES (6, 'Pandon haliaetus', 5, 10, 5.5, 'vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec', true, false, 4);
INSERT INTO public.moon VALUES (7, 'Microcebus murinus', 4, 8, 6.4, 'vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel', true, false, 12);
INSERT INTO public.moon VALUES (8, 'Macaca radiata', 72, 10, 1.2, 'morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque', true, true, 9);
INSERT INTO public.moon VALUES (9, 'Crotalus triseriatus', 49, 5, 2.8, 'quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur', false, true, 1);
INSERT INTO public.moon VALUES (10, 'Sciurus vulgaris', 23, 4, 18.9, 'aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu', false, false, 1);
INSERT INTO public.moon VALUES (11, 'Anas bahamensis', 62, 4, 17.7, 'erat quisque erat eros viverra eget congue eget semper rutrum nulla', true, true, 11);
INSERT INTO public.moon VALUES (12, 'Climacteris melanura', 34, 1, 14.1, 'proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut', true, true, 7);
INSERT INTO public.moon VALUES (13, 'Galago crassicaudataus', 67, 2, 7.4, 'vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor', true, true, 3);
INSERT INTO public.moon VALUES (14, 'Butorides striatus', 73, 8, 13.8, 'in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit', true, true, 10);
INSERT INTO public.moon VALUES (15, 'Macaca nemestrina', 92, 4, 10.7, 'amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin', false, true, 7);
INSERT INTO public.moon VALUES (16, 'Damaliscus dorcas', 1, 4, 5.4, 'enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum', true, true, 1);
INSERT INTO public.moon VALUES (17, 'Cathartes aura', 7, 5, 5.5, 'cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam', true, true, 7);
INSERT INTO public.moon VALUES (18, 'Graspus graspus', 68, 6, 10.3, 'venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada', false, true, 1);
INSERT INTO public.moon VALUES (19, 'Vombatus ursinus', 87, 9, 10.6, 'a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices', false, true, 1);
INSERT INTO public.moon VALUES (20, 'Phalacrocorax carbo', 98, 1, 15.1, 'dui maecenas tristique est et tempus semper est quam pharetra', false, true, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Branta canadensis', 97, 6, 10, 'dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula', false, true, 4);
INSERT INTO public.planet VALUES (2, 'Macropus eugenii', 12, 3, 12, 'urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium', true, true, 2);
INSERT INTO public.planet VALUES (3, 'Laniarius ferrugineus', 42, 7, 10, 'amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus', true, true, 3);
INSERT INTO public.planet VALUES (4, 'Acrantophis madagascariensis', 19, 5, 14, 'volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet', true, false, 2);
INSERT INTO public.planet VALUES (5, 'Cordylus giganteus', 53, 10, 18, 'mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero', false, false, 2);
INSERT INTO public.planet VALUES (6, 'Larus novaehollandiae', 27, 6, 12, 'ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in', true, false, 5);
INSERT INTO public.planet VALUES (7, 'Cathartes aura', 17, 7, 16, 'nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque', false, false, 6);
INSERT INTO public.planet VALUES (8, 'Chauna torquata', 8, 3, 18, 'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut', true, true, 5);
INSERT INTO public.planet VALUES (9, 'Ceratotherium simum', 22, 10, 12, 'diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed', false, false, 5);
INSERT INTO public.planet VALUES (10, 'Macropus rufogriseus', 61, 8, 16, 'vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus', false, false, 2);
INSERT INTO public.planet VALUES (11, 'Pitangus sulphuratus', 46, 6, 1, 'adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in', true, true, 2);
INSERT INTO public.planet VALUES (12, 'Sus scrofa', 44, 9, 19, 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque', false, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Stephenson 2 DFK 1', 2, 100, 3, 'bright', false, false, 4);
INSERT INTO public.star VALUES (2, 'Orbit of Saturn', 3, 646, 4, 'less bright', true, false, 3);
INSERT INTO public.star VALUES (3, 'RSGC1-F01', 5, 10023, 6, 'extreme bright', true, true, 5);
INSERT INTO public.star VALUES (4, 'VY Canis Majoris', 1, 43, 1, 'dim', false, false, 1);
INSERT INTO public.star VALUES (5, 'CM Velorum', 1, 80, 2, 'dim', false, false, 2);
INSERT INTO public.star VALUES (6, 'AH Scorpii', 3, 92, 3, 'bright', true, false, 6);


--
-- Name: galaxy__type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy__type_galaxy_type_id_seq', 3, true);


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
-- Name: galaxy_type galaxy__type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy__type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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

