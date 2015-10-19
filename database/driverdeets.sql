--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: platehate; Tablespace: 
--

CREATE TABLE cities (
    city_id bigint NOT NULL,
    city text NOT NULL,
    stub text NOT NULL,
    region_id integer NOT NULL,
    metro_id bigint NOT NULL
);


ALTER TABLE cities OWNER TO platehate;

--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE cities_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_city_id_seq OWNER TO platehate;

--
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE cities_city_id_seq OWNED BY cities.city_id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: platehate; Tablespace: 
--

CREATE TABLE countries (
    country_id bigint NOT NULL,
    country text NOT NULL,
    stub text NOT NULL
);


ALTER TABLE countries OWNER TO platehate;

--
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE countries_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_country_id_seq OWNER TO platehate;

--
-- Name: countries_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE countries_country_id_seq OWNED BY countries.country_id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: platehate; Tablespace: 
--

CREATE TABLE messages (
    message_id bigint NOT NULL,
    user_id bigint NOT NULL,
    plate_id bigint NOT NULL,
    body text NOT NULL,
    viewed boolean DEFAULT false NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE messages OWNER TO platehate;

--
-- Name: messages_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE messages_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messages_messages_id_seq OWNER TO platehate;

--
-- Name: metros; Type: TABLE; Schema: public; Owner: platehate; Tablespace: 
--

CREATE TABLE metros (
    metro_id bigint NOT NULL,
    metro text NOT NULL,
    stub text NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE metros OWNER TO platehate;

--
-- Name: metros_metro_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE metros_metro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metros_metro_id_seq OWNER TO platehate;

--
-- Name: metros_metro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE metros_metro_id_seq OWNED BY metros.metro_id;


--
-- Name: plates; Type: TABLE; Schema: public; Owner: platehate; Tablespace: 
--

CREATE TABLE plates (
    plate_id bigint NOT NULL,
    plate text NOT NULL,
    region_id bigint NOT NULL
);


ALTER TABLE plates OWNER TO platehate;

--
-- Name: plates_plate_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE plates_plate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plates_plate_id_seq OWNER TO platehate;

--
-- Name: plates_plate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE plates_plate_id_seq OWNED BY plates.plate_id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: platehate; Tablespace: 
--

CREATE TABLE regions (
    region_id bigint NOT NULL,
    region text NOT NULL,
    stub text NOT NULL,
    country_id integer NOT NULL,
    abbr text
);


ALTER TABLE regions OWNER TO platehate;

--
-- Name: regions_region_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE regions_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE regions_region_id_seq OWNER TO platehate;

--
-- Name: regions_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE regions_region_id_seq OWNED BY regions.region_id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: platehate; Tablespace: 
--

CREATE TABLE reviews (
    review_id bigint NOT NULL,
    user_id bigint NOT NULL,
    plate_id bigint NOT NULL,
    body text NOT NULL,
    rating smallint NOT NULL,
    city_id bigint NOT NULL,
    viewed boolean DEFAULT false NOT NULL,
    anonymous boolean DEFAULT false NOT NULL,
    funny integer DEFAULT 0 NOT NULL,
    useful integer DEFAULT 0 NOT NULL,
    mean integer DEFAULT 0 NOT NULL,
    nice integer DEFAULT 0 NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE reviews OWNER TO platehate;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE reviews_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_review_id_seq OWNER TO platehate;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE reviews_review_id_seq OWNED BY reviews.review_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: platehate; Tablespace: 
--

CREATE TABLE users (
    user_id bigint NOT NULL,
    email text,
    password text NOT NULL,
    login text NOT NULL,
    reset_code text
);


ALTER TABLE users OWNER TO platehate;

--
-- Name: users_plates; Type: TABLE; Schema: public; Owner: platehate; Tablespace: 
--

CREATE TABLE users_plates (
    user_id bigint NOT NULL,
    plate_id bigint NOT NULL
);


ALTER TABLE users_plates OWNER TO platehate;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO platehate;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: platehate; Tablespace: 
--

CREATE TABLE votes (
    user_id bigint NOT NULL,
    review_id bigint NOT NULL,
    type text NOT NULL
);


ALTER TABLE votes OWNER TO platehate;

--
-- Name: city_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY cities ALTER COLUMN city_id SET DEFAULT nextval('cities_city_id_seq'::regclass);


--
-- Name: country_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY countries ALTER COLUMN country_id SET DEFAULT nextval('countries_country_id_seq'::regclass);


--
-- Name: metro_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY metros ALTER COLUMN metro_id SET DEFAULT nextval('metros_metro_id_seq'::regclass);


--
-- Name: plate_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY plates ALTER COLUMN plate_id SET DEFAULT nextval('plates_plate_id_seq'::regclass);


--
-- Name: region_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY regions ALTER COLUMN region_id SET DEFAULT nextval('regions_region_id_seq'::regclass);


--
-- Name: review_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY reviews ALTER COLUMN review_id SET DEFAULT nextval('reviews_review_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Name: city_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT city_id_pk PRIMARY KEY (city_id);


--
-- Name: country_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT country_id_pk PRIMARY KEY (country_id);


--
-- Name: country_uq; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT country_uq UNIQUE (country);


--
-- Name: login_uq; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT login_uq UNIQUE (login);


--
-- Name: message_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT message_id_pk PRIMARY KEY (message_id);


--
-- Name: metro_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY metros
    ADD CONSTRAINT metro_id_pk PRIMARY KEY (metro_id);


--
-- Name: plate_body_uq; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT plate_body_uq UNIQUE (plate_id, body);


--
-- Name: plate_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY plates
    ADD CONSTRAINT plate_id_pk PRIMARY KEY (plate_id);


--
-- Name: plate_region_uq; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY plates
    ADD CONSTRAINT plate_region_uq UNIQUE (plate, region_id);


--
-- Name: region_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT region_id_pk PRIMARY KEY (region_id);


--
-- Name: review_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT review_id_pk PRIMARY KEY (review_id);


--
-- Name: stub_uq; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT stub_uq UNIQUE (stub);


--
-- Name: user_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_id_pk PRIMARY KEY (user_id);


--
-- Name: user_plate_uq; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace: 
--

ALTER TABLE ONLY users_plates
    ADD CONSTRAINT user_plate_uq UNIQUE (user_id, plate_id);


--
-- Name: city_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT city_id_fk FOREIGN KEY (city_id) REFERENCES cities(city_id) MATCH FULL;


--
-- Name: country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT country_id_fk FOREIGN KEY (country_id) REFERENCES countries(country_id) MATCH FULL;


--
-- Name: metro_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT metro_id_fk FOREIGN KEY (metro_id) REFERENCES metros(metro_id) MATCH FULL;


--
-- Name: plate_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT plate_id_fk FOREIGN KEY (plate_id) REFERENCES plates(plate_id) MATCH FULL;


--
-- Name: plate_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY users_plates
    ADD CONSTRAINT plate_id_fk FOREIGN KEY (plate_id) REFERENCES plates(plate_id) MATCH FULL;


--
-- Name: plate_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT plate_id_fk FOREIGN KEY (plate_id) REFERENCES plates(plate_id) MATCH FULL;


--
-- Name: region_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY plates
    ADD CONSTRAINT region_id_fk FOREIGN KEY (region_id) REFERENCES regions(region_id) MATCH FULL;


--
-- Name: region_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT region_id_fk FOREIGN KEY (region_id) REFERENCES regions(region_id) MATCH FULL;


--
-- Name: region_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY metros
    ADD CONSTRAINT region_id_fk FOREIGN KEY (region_id) REFERENCES regions(region_id) MATCH FULL;


--
-- Name: review_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT review_id_fk FOREIGN KEY (review_id) REFERENCES reviews(review_id) MATCH FULL;


--
-- Name: user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id) MATCH FULL;


--
-- Name: user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY users_plates
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id) MATCH FULL;


--
-- Name: user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id) MATCH FULL;


--
-- Name: user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id) MATCH FULL;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

