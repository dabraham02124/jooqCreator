--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.16
-- Dumped by pg_dump version 11.3

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: company
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO company;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: company
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ams_dagger_links; Type: TABLE; Schema: public; Owner: ams-reporting-metrics
--

CREATE TABLE public.ams_dagger_links (
    cause_id integer NOT NULL,
    effect_id integer NOT NULL,
    created_time timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL
);


ALTER TABLE public.ams_dagger_links OWNER TO "ams-reporting-metrics";

--
-- Name: ams_dagger_requests; Type: TABLE; Schema: public; Owner: ams-reporting-metrics
--

CREATE TABLE public.ams_dagger_requests (
    "time" timestamp without time zone NOT NULL,
    num_ids_in integer NOT NULL,
    num_links_out integer NOT NULL,
    num_ids_out integer NOT NULL
);


ALTER TABLE public.ams_dagger_requests OWNER TO "ams-reporting-metrics";

--
-- Name: ams_viewer_action_instance_ids; Type: TABLE; Schema: public; Owner: ams-reporting-metrics
--

CREATE TABLE public.ams_viewer_action_instance_ids (
    action_id integer NOT NULL,
    alert_instance_id integer NOT NULL
);


ALTER TABLE public.ams_viewer_action_instance_ids OWNER TO "ams-reporting-metrics";

--
-- Name: ams_viewer_action_types; Type: TABLE; Schema: public; Owner: ams-reporting-metrics
--

CREATE TABLE public.ams_viewer_action_types (
    action_type_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.ams_viewer_action_types OWNER TO "ams-reporting-metrics";

--
-- Name: ams_viewer_actions; Type: TABLE; Schema: public; Owner: ams-reporting-metrics
--

CREATE TABLE public.ams_viewer_actions (
    action_id integer NOT NULL,
    user_name character varying(20) NOT NULL,
    "time" timestamp without time zone NOT NULL,
    action_type_id integer NOT NULL,
    ticket_id integer NOT NULL
);


ALTER TABLE public.ams_viewer_actions OWNER TO "ams-reporting-metrics";

--
-- Name: ams_viewer_criteria; Type: TABLE; Schema: public; Owner: ams-reporting-metrics
--

CREATE TABLE public.ams_viewer_criteria (
    criteria_id integer NOT NULL,
    criteria_text text NOT NULL
);


ALTER TABLE public.ams_viewer_criteria OWNER TO "ams-reporting-metrics";

--
-- Name: ams_viewer_requests; Type: TABLE; Schema: public; Owner: ams-reporting-metrics
--

CREATE TABLE public.ams_viewer_requests (
    user_name character varying(20) NOT NULL,
    "time" timestamp without time zone NOT NULL,
    criteria_id integer NOT NULL,
    num_ids_out integer NOT NULL,
    num_links_out integer NOT NULL,
    distinct_causes_out integer NOT NULL,
    distinct_effects_out integer NOT NULL
);


ALTER TABLE public.ams_viewer_requests OWNER TO "ams-reporting-metrics";

--
-- Name: ams_viewer_action_types ams_viewer_action_types_pkey; Type: CONSTRAINT; Schema: public; Owner: ams-reporting-metrics
--

ALTER TABLE ONLY public.ams_viewer_action_types
    ADD CONSTRAINT ams_viewer_action_types_pkey PRIMARY KEY (action_type_id);


--
-- Name: ams_viewer_actions ams_viewer_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: ams-reporting-metrics
--

ALTER TABLE ONLY public.ams_viewer_actions
    ADD CONSTRAINT ams_viewer_actions_pkey PRIMARY KEY (action_id);


--
-- Name: ams_viewer_criteria ams_viewer_criteria_pkey; Type: CONSTRAINT; Schema: public; Owner: ams-reporting-metrics
--

ALTER TABLE ONLY public.ams_viewer_criteria
    ADD CONSTRAINT ams_viewer_criteria_pkey PRIMARY KEY (criteria_id);


--
-- Name: ams_viewer_action_instance_ids ams_viewer_action_instance_ids_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ams-reporting-metrics
--

ALTER TABLE ONLY public.ams_viewer_action_instance_ids
    ADD CONSTRAINT ams_viewer_action_instance_ids_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.ams_viewer_actions(action_id);


--
-- Name: ams_viewer_actions ams_viewer_actions_action_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ams-reporting-metrics
--

ALTER TABLE ONLY public.ams_viewer_actions
    ADD CONSTRAINT ams_viewer_actions_action_type_id_fkey FOREIGN KEY (action_type_id) REFERENCES public.ams_viewer_action_types(action_type_id);


--
-- Name: ams_viewer_requests ams_viewer_requests_criteria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ams-reporting-metrics
--

ALTER TABLE ONLY public.ams_viewer_requests
    ADD CONSTRAINT ams_viewer_requests_criteria_id_fkey FOREIGN KEY (criteria_id) REFERENCES public.ams_viewer_criteria(criteria_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: company
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM company;
GRANT ALL ON SCHEMA public TO company;
GRANT USAGE ON SCHEMA public TO PUBLIC;
GRANT CREATE ON SCHEMA public TO "ams-reporting-metrics";


--
-- Name: TABLE ams_dagger_links; Type: ACL; Schema: public; Owner: ams-reporting-metrics
--

REVOKE ALL ON TABLE public.ams_dagger_links FROM PUBLIC;
REVOKE ALL ON TABLE public.ams_dagger_links FROM "ams-reporting-metrics";
GRANT ALL ON TABLE public.ams_dagger_links TO "ams-reporting-metrics";
GRANT SELECT ON TABLE public.ams_dagger_links TO "ams-reporting-metrics_readonly";


--
-- Name: TABLE ams_dagger_requests; Type: ACL; Schema: public; Owner: ams-reporting-metrics
--

REVOKE ALL ON TABLE public.ams_dagger_requests FROM PUBLIC;
REVOKE ALL ON TABLE public.ams_dagger_requests FROM "ams-reporting-metrics";
GRANT ALL ON TABLE public.ams_dagger_requests TO "ams-reporting-metrics";
GRANT SELECT ON TABLE public.ams_dagger_requests TO "ams-reporting-metrics_readonly";


--
-- Name: TABLE ams_viewer_action_instance_ids; Type: ACL; Schema: public; Owner: ams-reporting-metrics
--

REVOKE ALL ON TABLE public.ams_viewer_action_instance_ids FROM PUBLIC;
REVOKE ALL ON TABLE public.ams_viewer_action_instance_ids FROM "ams-reporting-metrics";
GRANT ALL ON TABLE public.ams_viewer_action_instance_ids TO "ams-reporting-metrics";
GRANT SELECT ON TABLE public.ams_viewer_action_instance_ids TO "ams-reporting-metrics_readonly";


--
-- Name: TABLE ams_viewer_action_types; Type: ACL; Schema: public; Owner: ams-reporting-metrics
--

REVOKE ALL ON TABLE public.ams_viewer_action_types FROM PUBLIC;
REVOKE ALL ON TABLE public.ams_viewer_action_types FROM "ams-reporting-metrics";
GRANT ALL ON TABLE public.ams_viewer_action_types TO "ams-reporting-metrics";
GRANT SELECT ON TABLE public.ams_viewer_action_types TO "ams-reporting-metrics_readonly";


--
-- Name: TABLE ams_viewer_actions; Type: ACL; Schema: public; Owner: ams-reporting-metrics
--

REVOKE ALL ON TABLE public.ams_viewer_actions FROM PUBLIC;
REVOKE ALL ON TABLE public.ams_viewer_actions FROM "ams-reporting-metrics";
GRANT ALL ON TABLE public.ams_viewer_actions TO "ams-reporting-metrics";
GRANT SELECT ON TABLE public.ams_viewer_actions TO "ams-reporting-metrics_readonly";


--
-- Name: TABLE ams_viewer_criteria; Type: ACL; Schema: public; Owner: ams-reporting-metrics
--

REVOKE ALL ON TABLE public.ams_viewer_criteria FROM PUBLIC;
REVOKE ALL ON TABLE public.ams_viewer_criteria FROM "ams-reporting-metrics";
GRANT ALL ON TABLE public.ams_viewer_criteria TO "ams-reporting-metrics";
GRANT SELECT ON TABLE public.ams_viewer_criteria TO "ams-reporting-metrics_readonly";


--
-- Name: TABLE ams_viewer_requests; Type: ACL; Schema: public; Owner: ams-reporting-metrics
--

REVOKE ALL ON TABLE public.ams_viewer_requests FROM PUBLIC;
REVOKE ALL ON TABLE public.ams_viewer_requests FROM "ams-reporting-metrics";
GRANT ALL ON TABLE public.ams_viewer_requests TO "ams-reporting-metrics";
GRANT SELECT ON TABLE public.ams_viewer_requests TO "ams-reporting-metrics_readonly";


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: ams-reporting-metrics
--

ALTER DEFAULT PRIVILEGES FOR ROLE "ams-reporting-metrics" IN SCHEMA public REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE "ams-reporting-metrics" IN SCHEMA public REVOKE ALL ON TABLES  FROM "ams-reporting-metrics";
ALTER DEFAULT PRIVILEGES FOR ROLE "ams-reporting-metrics" IN SCHEMA public GRANT SELECT ON TABLES  TO "ams-reporting-metrics_readonly";


--
-- PostgreSQL database dump complete
--

