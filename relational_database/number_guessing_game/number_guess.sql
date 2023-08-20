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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: guesses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guesses (
    username character varying(22) NOT NULL,
    best_guesses integer NOT NULL,
    games_played integer NOT NULL
);


ALTER TABLE public.guesses OWNER TO freecodecamp;

--
-- Data for Name: guesses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guesses VALUES ('user_1692535826607', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692535826606', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692536043906', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692536043905', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692537745908', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692537745907', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692537898108', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692537898107', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692538133805', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692538133806', 35, 1);
INSERT INTO public.guesses VALUES ('user_1692538416308', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692538416307', 0, 0);
INSERT INTO public.guesses VALUES ('naol', 10, 2);
INSERT INTO public.guesses VALUES ('user_1692539453207', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692539453206', 117, 1);
INSERT INTO public.guesses VALUES ('user_1692539856206', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692539856205', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692540436009', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692540436008', 0, 0);
INSERT INTO public.guesses VALUES ('user_1692540772205', 225, 2);
INSERT INTO public.guesses VALUES ('user_1692540772206', 171, 5);
INSERT INTO public.guesses VALUES ('user_1692541130406', 352, 2);
INSERT INTO public.guesses VALUES ('user_1692541130407', 341, 5);


--
-- Name: guesses guesses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

