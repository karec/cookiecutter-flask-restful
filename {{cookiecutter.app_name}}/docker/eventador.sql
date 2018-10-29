--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.vpcs DROP CONSTRAINT IF EXISTS vpcs_agent_id_fkey;
ALTER TABLE IF EXISTS ONLY public.pipelines DROP CONSTRAINT IF EXISTS userid;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS orgid;
ALTER TABLE IF EXISTS ONLY public.nb_users DROP CONSTRAINT IF EXISTS nb_users_deployment_id_fk;
ALTER TABLE IF EXISTS ONLY public.ev8s_results DROP CONSTRAINT IF EXISTS ev8s_results_workid_fkey;
ALTER TABLE IF EXISTS ONLY public.ev8s_builder DROP CONSTRAINT IF EXISTS ev8s_builder_vpcid_fkey;
ALTER TABLE IF EXISTS ONLY public.ev8s_builder DROP CONSTRAINT IF EXISTS ev8s_builder_orgid_fkey;
ALTER TABLE IF EXISTS ONLY public.ev8s_builder DROP CONSTRAINT IF EXISTS ev8s_builder_deploymentid_fkey;
ALTER TABLE IF EXISTS ONLY public.pipelines DROP CONSTRAINT IF EXISTS deploymentsid_fk;
ALTER TABLE IF EXISTS ONLY public.deployments DROP CONSTRAINT IF EXISTS deployments_vpcid_fk;
ALTER TABLE IF EXISTS ONLY public.deployments DROP CONSTRAINT IF EXISTS deployments_packageid_fk;
ALTER TABLE IF EXISTS ONLY public.deployments DROP CONSTRAINT IF EXISTS deployments_orgid_fk;
ALTER TABLE IF EXISTS ONLY public.acls DROP CONSTRAINT IF EXISTS deploymentid_fk;
ALTER TABLE IF EXISTS ONLY public.stacks DROP CONSTRAINT IF EXISTS deployment_fk;
ALTER TABLE IF EXISTS ONLY public.client_certs DROP CONSTRAINT IF EXISTS client_certs_deploymentid_fk;
ALTER TABLE IF EXISTS ONLY public.checkouts DROP CONSTRAINT IF EXISTS checkouts_orgid_fk;
ALTER TABLE IF EXISTS ONLY public.checkouts DROP CONSTRAINT IF EXISTS checkouts_deploymentid_fk;
ALTER TABLE IF EXISTS ONLY public.build_reservations DROP CONSTRAINT IF EXISTS build_reservations_deploymentid_fk;
DROP INDEX IF EXISTS public.vpcs_region_i;
DROP INDEX IF EXISTS public.vpcs_orgid_i;
DROP INDEX IF EXISTS public.users_primary_orgid_uniq;
DROP INDEX IF EXISTS public.users_github_token_i;
DROP INDEX IF EXISTS public.users_github_id_i;
DROP INDEX IF EXISTS public.users_email_isactive_uniq;
DROP INDEX IF EXISTS public.users_email_i;
DROP INDEX IF EXISTS public.username_deployment_short_i;
DROP INDEX IF EXISTS public.stacks_region_i;
DROP INDEX IF EXISTS public.projects_status_i;
DROP INDEX IF EXISTS public.orgs_permissions_map_userid_idx;
DROP INDEX IF EXISTS public.orgs_permissions_map_orgid_idx;
DROP INDEX IF EXISTS public.ipset_acls_queue_region_i;
DROP INDEX IF EXISTS public.host_name_i;
DROP INDEX IF EXISTS public.host_container_name_i;
DROP INDEX IF EXISTS public.ev8s_results_workid_i;
DROP INDEX IF EXISTS public.ev8s_results_vpcid_i;
DROP INDEX IF EXISTS public.ev8s_builder_workid_i;
DROP INDEX IF EXISTS public.ev8s_builder_vpcid_status_code_i;
DROP INDEX IF EXISTS public.ev8s_builder_vpcid_i;
DROP INDEX IF EXISTS public.ev8s_builder_deploymentid_i;
DROP INDEX IF EXISTS public.ev8s_agent_dns_api_key_i;
DROP INDEX IF EXISTS public.ev8s_agent_agent_api_key_i;
DROP INDEX IF EXISTS public.deployments_region_i;
DROP INDEX IF EXISTS public.deploymentid_status_i;
DROP INDEX IF EXISTS public.deployment_short_i;
DROP INDEX IF EXISTS public.cloud_builder_region_i;
DROP INDEX IF EXISTS public.cloud_builder_message_type_status_code_idx;
DROP INDEX IF EXISTS public.checkouts_region_i;
DROP INDEX IF EXISTS public.checkedout_i;
DROP INDEX IF EXISTS public.build_reservations_component_deployment_i;
DROP INDEX IF EXISTS public.acls_region_i;
ALTER TABLE IF EXISTS ONLY public.vpcs DROP CONSTRAINT IF EXISTS vpcs_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.stripe_subscriptions DROP CONSTRAINT IF EXISTS stripe_subscriptions_pkey;
ALTER TABLE IF EXISTS ONLY public.stripe_orgs DROP CONSTRAINT IF EXISTS stripe_orgs_pkey;
ALTER TABLE IF EXISTS ONLY public.stacks DROP CONSTRAINT IF EXISTS stacks_pkey;
ALTER TABLE IF EXISTS ONLY public.projects DROP CONSTRAINT IF EXISTS projects_pkey;
ALTER TABLE IF EXISTS ONLY public.pipelines DROP CONSTRAINT IF EXISTS pipelines_pkey;
ALTER TABLE IF EXISTS ONLY public.orgs DROP CONSTRAINT IF EXISTS orgs_pkey;
ALTER TABLE IF EXISTS ONLY public.orgs_permissions_map DROP CONSTRAINT IF EXISTS orgs_permissions_map_pkey;
ALTER TABLE IF EXISTS ONLY public.orgs_invites DROP CONSTRAINT IF EXISTS orgs_invites_pkey;
ALTER TABLE IF EXISTS ONLY public.orgs DROP CONSTRAINT IF EXISTS orgname;
ALTER TABLE IF EXISTS ONLY public.nb_users DROP CONSTRAINT IF EXISTS nb_users_pkey;
ALTER TABLE IF EXISTS ONLY public.metadata_backup DROP CONSTRAINT IF EXISTS metadata_backup_pkey;
ALTER TABLE IF EXISTS ONLY public.ipset_acls_queue DROP CONSTRAINT IF EXISTS ipset_acls_queue_pkey;
ALTER TABLE IF EXISTS ONLY public.ev8s_results DROP CONSTRAINT IF EXISTS ev8s_results_pkey;
ALTER TABLE IF EXISTS ONLY public.ev8s_builder DROP CONSTRAINT IF EXISTS ev8s_builder_pkey;
ALTER TABLE IF EXISTS ONLY public.ev8s_agent DROP CONSTRAINT IF EXISTS ev8s_agent_pkey;
ALTER TABLE IF EXISTS ONLY public.deployments DROP CONSTRAINT IF EXISTS deployments_pkey;
ALTER TABLE IF EXISTS ONLY public.deployment_packages DROP CONSTRAINT IF EXISTS deployment_packages_pkey;
ALTER TABLE IF EXISTS ONLY public.cloud_builder DROP CONSTRAINT IF EXISTS cloud_builder_pkey;
ALTER TABLE IF EXISTS ONLY public.client_certs DROP CONSTRAINT IF EXISTS client_certs_pk;
ALTER TABLE IF EXISTS ONLY public.checkouts DROP CONSTRAINT IF EXISTS checkouts_pkey;
ALTER TABLE IF EXISTS ONLY public.build_reservations DROP CONSTRAINT IF EXISTS build_reservations_pk;
ALTER TABLE IF EXISTS ONLY public.beta_users DROP CONSTRAINT IF EXISTS beta_users_pkey;
ALTER TABLE IF EXISTS ONLY public.acls DROP CONSTRAINT IF EXISTS acls_pkey;
ALTER TABLE IF EXISTS public.cloud_builder ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.users_pre_uniq_email;
DROP TABLE IF EXISTS public.users_bak;
DROP TABLE IF EXISTS public.users_backup_20170515;
DROP TABLE IF EXISTS public.users_back;
DROP TABLE IF EXISTS public.user_log;
DROP SEQUENCE IF EXISTS public.user_log_seq;
DROP TABLE IF EXISTS public.stacks;
DROP TABLE IF EXISTS public.software_versions;
DROP TABLE IF EXISTS public.sales_leads_archive;
DROP TABLE IF EXISTS public.sales_leads;
DROP VIEW IF EXISTS public.released_checkouts;
DROP TABLE IF EXISTS public.regions;
DROP SEQUENCE IF EXISTS public.regions_seq;
DROP TABLE IF EXISTS public.projects_templates;
DROP SEQUENCE IF EXISTS public.projects_seq;
DROP TABLE IF EXISTS public.projects_emb_20171214;
DROP TABLE IF EXISTS public.projects_deployments_map_emb_20171214;
DROP TABLE IF EXISTS public.projects_deployments_map;
DROP TABLE IF EXISTS public.projects;
DROP TABLE IF EXISTS public.plans_packages;
DROP TABLE IF EXISTS public.plans;
DROP TABLE IF EXISTS public.pipelines;
DROP TABLE IF EXISTS public.orgs_permissions_map;
DROP TABLE IF EXISTS public.orgs_invites;
DROP TABLE IF EXISTS public.nb_users;
DROP SEQUENCE IF EXISTS public.nb_users_seq;
DROP TABLE IF EXISTS public.metadata_backup;
DROP SEQUENCE IF EXISTS public.metadata_backup_seq;
DROP VIEW IF EXISTS public.mailinglist;
DROP TABLE IF EXISTS public.kg_orgs_bak;
DROP TABLE IF EXISTS public.ipset_acls_queue;
DROP SEQUENCE IF EXISTS public.ipset_acls_queue_seq;
DROP VIEW IF EXISTS public.free_vpcs;
DROP TABLE IF EXISTS public.vpcs;
DROP SEQUENCE IF EXISTS public.vpcs_seq;
DROP TABLE IF EXISTS public.foo;
DROP TABLE IF EXISTS public.ev_configs;
DROP TABLE IF EXISTS public.ev8s_results;
DROP SEQUENCE IF EXISTS public.ev8s_results_seq;
DROP TABLE IF EXISTS public.ev8s_builder;
DROP SEQUENCE IF EXISTS public.ev8s_builder_seq;
DROP TABLE IF EXISTS public.ev8s_agent;
DROP SEQUENCE IF EXISTS public.ev8s_agent_seq;
DROP TABLE IF EXISTS public.enterprise_map;
DROP TABLE IF EXISTS public.enterprise_log;
DROP TABLE IF EXISTS public.deployments_backup_emb_20171206;
DROP TABLE IF EXISTS public.deployments_backup_emb_20170105;
DROP TABLE IF EXISTS public.deployment_packages_bak;
DROP TABLE IF EXISTS public.deployment_packages_backup;
DROP SEQUENCE IF EXISTS public.cloud_builder_id_seq;
DROP TABLE IF EXISTS public.cloud_builder;
DROP TABLE IF EXISTS public.client_certs;
DROP TABLE IF EXISTS public.build_reservations;
DROP TABLE IF EXISTS public.blocked_register_domains;
DROP VIEW IF EXISTS public.billing_trial_past_due;
DROP VIEW IF EXISTS public.billing_trial;
DROP VIEW IF EXISTS public.billing_stripe_audit;
DROP VIEW IF EXISTS public.billing_new_nodes_by_plan_by_month;
DROP VIEW IF EXISTS public.billing_eventador_processing_units_total;
DROP VIEW IF EXISTS public.billing_eventador_processing_units_master;
DROP TABLE IF EXISTS public.deployment_packages;
DROP SEQUENCE IF EXISTS public.deployment_packages_seq;
DROP VIEW IF EXISTS public.billing_cum_rev_by_month;
DROP VIEW IF EXISTS public.billing_rev_by_month;
DROP VIEW IF EXISTS public.billing_cum_nodes_by_month;
DROP VIEW IF EXISTS public.billing_new_nodes_by_month;
DROP TABLE IF EXISTS public.billing_plannames;
DROP VIEW IF EXISTS public.billing_cum_customers_by_month;
DROP VIEW IF EXISTS public.billing_new_customers_by_month;
DROP VIEW IF EXISTS public.billing_active_ledger;
DROP VIEW IF EXISTS public.billing_master;
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.stripe_subscriptions;
DROP TABLE IF EXISTS public.stripe_orgs;
DROP TABLE IF EXISTS public.orgs;
DROP TABLE IF EXISTS public.deployments;
DROP TABLE IF EXISTS public.beta_users;
DROP SEQUENCE IF EXISTS public.betaid_seq;
DROP VIEW IF EXISTS public.available_checkouts;
DROP TABLE IF EXISTS public.checkouts;
DROP SEQUENCE IF EXISTS public.checkouts_seq;
DROP TABLE IF EXISTS public.acls_backup_emb_20171206;
DROP TABLE IF EXISTS public.acls;
DROP SEQUENCE IF EXISTS public.acls_seq;
DROP FUNCTION IF EXISTS public.json_update(data json, update_data json);
DROP FUNCTION IF EXISTS public.json_unlint(from_json json);
DROP FUNCTION IF EXISTS public.json_merge(data json, merge_data json);
DROP FUNCTION IF EXISTS public.json_lint(from_json json, ntab integer);
DROP FUNCTION IF EXISTS public.json_delete(data json, keys text[]);
DROP FUNCTION IF EXISTS public.json_append(data json, insert_data json);
DROP FUNCTION IF EXISTS public.generate_create_table_statement(p_table_name character varying);
DROP TYPE IF EXISTS public.project_status;
DROP TYPE IF EXISTS public.org_access_level;
DROP EXTENSION IF EXISTS plpgsql;
DROP SCHEMA IF EXISTS topology;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO eventador_admin;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: eventador_admin
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO eventador_admin;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: org_access_level; Type: TYPE; Schema: public; Owner: eventador_admin
--

CREATE TYPE public.org_access_level AS ENUM (
    'owner',
    'member',
    'readonly',
    'admin'
);


ALTER TYPE public.org_access_level OWNER TO eventador_admin;

--
-- Name: project_status; Type: TYPE; Schema: public; Owner: eventador_admin
--

CREATE TYPE public.project_status AS ENUM (
    'Building',
    'Running',
    'Stopped',
    'Failed',
    'Success',
    'Deploy Failed',
    'Deployed'
);


ALTER TYPE public.project_status OWNER TO eventador_admin;

--
-- Name: generate_create_table_statement(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_create_table_statement(p_table_name character varying) RETURNS text
    LANGUAGE plpgsql
    AS $_$
DECLARE
    v_table_ddl   text;
    column_record record;
BEGIN
    FOR column_record IN 
        SELECT 
            b.nspname as schema_name,
            b.relname as table_name,
            a.attname as column_name,
            pg_catalog.format_type(a.atttypid, a.atttypmod) as column_type,
            CASE WHEN 
                (SELECT substring(pg_catalog.pg_get_expr(d.adbin, d.adrelid) for 128)
                 FROM pg_catalog.pg_attrdef d
                 WHERE d.adrelid = a.attrelid AND d.adnum = a.attnum AND a.atthasdef) IS NOT NULL THEN
                'DEFAULT '|| (SELECT substring(pg_catalog.pg_get_expr(d.adbin, d.adrelid) for 128)
                              FROM pg_catalog.pg_attrdef d
                              WHERE d.adrelid = a.attrelid AND d.adnum = a.attnum AND a.atthasdef)
            ELSE
                ''
            END as column_default_value,
            CASE WHEN a.attnotnull = true THEN 
                'NOT NULL'
            ELSE
                'NULL'
            END as column_not_null,
            a.attnum as attnum,
            e.max_attnum as max_attnum
        FROM 
            pg_catalog.pg_attribute a
            INNER JOIN 
             (SELECT c.oid,
                n.nspname,
                c.relname
              FROM pg_catalog.pg_class c
                   LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
              WHERE c.relname ~ ('^('||p_table_name||')$')
                AND pg_catalog.pg_table_is_visible(c.oid)
              ORDER BY 2, 3) b
            ON a.attrelid = b.oid
            INNER JOIN 
             (SELECT 
                  a.attrelid,
                  max(a.attnum) as max_attnum
              FROM pg_catalog.pg_attribute a
              WHERE a.attnum > 0 
                AND NOT a.attisdropped
              GROUP BY a.attrelid) e
            ON a.attrelid=e.attrelid
        WHERE a.attnum > 0 
          AND NOT a.attisdropped
        ORDER BY a.attnum
    LOOP
        IF column_record.attnum = 1 THEN
            v_table_ddl:='CREATE TABLE '||column_record.schema_name||'.'||column_record.table_name||' (';
        ELSE
            v_table_ddl:=v_table_ddl||',';
        END IF;

        IF column_record.attnum <= column_record.max_attnum THEN
            v_table_ddl:=v_table_ddl||chr(10)||
                     '    '||column_record.column_name||' '||column_record.column_type||' '||column_record.column_default_value||' '||column_record.column_not_null;
        END IF;
    END LOOP;

    v_table_ddl:=v_table_ddl||');';
    RETURN v_table_ddl;
END;
$_$;


ALTER FUNCTION public.generate_create_table_statement(p_table_name character varying) OWNER TO eventador_admin;

--
-- Name: json_append(json, json); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.json_append(data json, insert_data json) RETURNS json
    LANGUAGE sql IMMUTABLE
    AS $$
    SELECT ('{'||string_agg(to_json(key)||':'||value, ',')||'}')::json
    FROM (
        SELECT * FROM json_each(data)
        UNION ALL
        SELECT * FROM json_each(insert_data)
    ) t;
$$;


ALTER FUNCTION public.json_append(data json, insert_data json) OWNER TO eventador_admin;

--
-- Name: json_delete(json, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.json_delete(data json, keys text[]) RETURNS json
    LANGUAGE sql IMMUTABLE
    AS $$
    SELECT ('{'||string_agg(to_json(key)||':'||value, ',')||'}')::json
    FROM (
        SELECT * FROM json_each(data)
        WHERE key <>ALL(keys)
    ) t;
$$;


ALTER FUNCTION public.json_delete(data json, keys text[]) OWNER TO eventador_admin;

--
-- Name: json_lint(json, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.json_lint(from_json json, ntab integer DEFAULT 0) RETURNS json
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT (CASE substring(from_json::text FROM '(?m)^[\s]*(.)') /* Get first non-whitespace */
        WHEN '[' THEN
                (E'[\n'
                        || (SELECT string_agg(repeat(E'\t', ntab + 1) || json_lint(value, ntab + 1)::text, E',\n') FROM json_array_elements(from_json)) ||
                E'\n' || repeat(E'\t', ntab) || ']')
        WHEN '{' THEN
                (E'{\n'
                        || (SELECT string_agg(repeat(E'\t', ntab + 1) || to_json(key)::text || ': ' || json_lint(value, ntab + 1)::text, E',\n') FROM json_each(from_json)) ||
                E'\n' || repeat(E'\t', ntab) || '}')
        ELSE
                from_json::text
END)::json
$$;


ALTER FUNCTION public.json_lint(from_json json, ntab integer) OWNER TO eventador_admin;

--
-- Name: json_merge(json, json); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.json_merge(data json, merge_data json) RETURNS json
    LANGUAGE sql IMMUTABLE
    AS $$
    SELECT ('{'||string_agg(to_json(key)||':'||value, ',')||'}')::json
    FROM (
        WITH to_merge AS (
            SELECT * FROM json_each(merge_data)
        )
        SELECT *
        FROM json_each(data)
        WHERE key NOT IN (SELECT key FROM to_merge)
        UNION ALL
        SELECT * FROM to_merge
    ) t;
$$;


ALTER FUNCTION public.json_merge(data json, merge_data json) OWNER TO eventador_admin;

--
-- Name: json_unlint(json); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.json_unlint(from_json json) RETURNS json
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT (CASE substring(from_json::text FROM '(?m)^[\s]*(.)') /* Get first non-whitespace */
WHEN '[' THEN
('['
|| (SELECT string_agg(json_unlint(value)::text, ',') FROM json_array_elements(from_json)) ||
']')
WHEN '{' THEN
('{'
|| (SELECT string_agg(to_json(key)::text || ':' || json_unlint(value)::text, ',') FROM json_each(from_json)) ||
'}')
ELSE
from_json::text
END)::json
$$;


ALTER FUNCTION public.json_unlint(from_json json) OWNER TO eventador_admin;

--
-- Name: json_update(json, json); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.json_update(data json, update_data json) RETURNS json
    LANGUAGE sql IMMUTABLE
    AS $$
    SELECT ('{'||string_agg(to_json(key)||':'||value, ',')||'}')::json
    FROM (
        WITH old_data AS (
            SELECT * FROM json_each(data)
        ), to_update AS (
            SELECT * FROM json_each(update_data)
            WHERE key IN (SELECT key FROM old_data)
        )
    SELECT * FROM old_data
    WHERE key NOT IN (SELECT key FROM to_update)
    UNION ALL
    SELECT * FROM to_update
) t;
$$;


ALTER FUNCTION public.json_update(data json, update_data json) OWNER TO eventador_admin;

--
-- Name: acls_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.acls_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acls_seq OWNER TO eventador_admin;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acls (
    aclid bigint DEFAULT nextval('public.acls_seq'::regclass) NOT NULL,
    cidrmask character varying(32),
    comment character varying(50),
    deploymentid character(32),
    status character varying(24) DEFAULT 'Active'::character varying,
    host character varying(256),
    container_name character varying(32),
    dtcreated timestamp without time zone DEFAULT now(),
    region character varying(32) DEFAULT 'aws:us-east-1'::character varying
);


ALTER TABLE public.acls OWNER TO eventador_admin;

--
-- Name: acls_backup_emb_20171206; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.acls_backup_emb_20171206 (
    aclid bigint,
    cidrmask character varying(32),
    comment character varying(50),
    deploymentid character(32),
    status character varying(24),
    host character varying(256),
    container_name character varying(32),
    dtcreated timestamp without time zone,
    region character varying(32)
);


ALTER TABLE public.acls_backup_emb_20171206 OWNER TO eventador_admin;

--
-- Name: checkouts_seq; Type: SEQUENCE; Schema: public; Owner: eventador_admin
--

CREATE SEQUENCE public.checkouts_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkouts_seq OWNER TO eventador_admin;

--
-- Name: checkouts; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.checkouts (
    checkoutid bigint DEFAULT nextval('public.checkouts_seq'::regclass) NOT NULL,
    checkedout boolean DEFAULT false NOT NULL,
    container_type character varying(32) NOT NULL,
    host character varying(256) NOT NULL,
    container_image character varying(32) NOT NULL,
    container_name character varying(32) NOT NULL,
    config_json jsonb NOT NULL,
    config_full jsonb NOT NULL,
    type character varying(32),
    dtcreated timestamp without time zone DEFAULT now() NOT NULL,
    deploymentid character(32),
    orgid character(32),
    dtclaimed timestamp without time zone,
    dtreleased timestamp without time zone,
    region character varying(32) DEFAULT 'aws:us-east-1'::character varying
);


ALTER TABLE public.checkouts OWNER TO eventador_admin;

--
-- Name: available_checkouts; Type: VIEW; Schema: public; Owner: eventador_admin
--

CREATE VIEW public.available_checkouts AS
 SELECT checkouts.checkoutid,
    checkouts.host,
    checkouts.container_name,
    checkouts.region,
    checkouts.container_image,
    checkouts.dtcreated,
    checkouts.checkedout
   FROM public.checkouts
  WHERE (checkouts.checkedout = false)
  ORDER BY checkouts.region, checkouts.checkoutid;


ALTER TABLE public.available_checkouts OWNER TO eventador_admin;

--
-- Name: betaid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.betaid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.betaid_seq OWNER TO eventador_admin;

--
-- Name: beta_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beta_users (
    betaid bigint DEFAULT nextval('public.betaid_seq'::regclass) NOT NULL,
    name character varying(50),
    company character varying(50),
    email character varying(50),
    phone character varying(50),
    comments character varying(250),
    dtcreated timestamp without time zone DEFAULT now(),
    followed_up boolean DEFAULT false
);


ALTER TABLE public.beta_users OWNER TO eventador_admin;

--
-- Name: deployments; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.deployments (
    deploymentid character(32) NOT NULL,
    deploymentname character varying(50),
    orgid character(32),
    status character varying(50) DEFAULT 'Active'::character varying,
    packageid integer,
    vpcid integer,
    dtcreated timestamp without time zone DEFAULT now(),
    hostmap json,
    aws_public_sg_id character varying(25),
    ca_cert character varying(3000),
    ca_key character varying(5000),
    progress integer DEFAULT 5,
    notebook_password character varying(50),
    region character varying(32) DEFAULT 'aws:us-east-1'::character varying,
    stripe_subscriptionid character varying(50),
    description character varying(500),
    dttrialexpire timestamp without time zone DEFAULT (now() + '30 days'::interval),
    dtfreeexpire timestamp without time zone DEFAULT (now() + '90 days'::interval),
    projects_deployment_secret character(32) DEFAULT NULL::bpchar,
    dtdeleted timestamp without time zone
);


ALTER TABLE public.deployments OWNER TO eventador_admin;

--
-- Name: orgs; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.orgs (
    orgid character(32) NOT NULL,
    orgname character varying(50),
    internal boolean DEFAULT false,
    billing_method character varying DEFAULT 'stripe'::character varying,
    force_premium boolean DEFAULT false,
    stripe_billing_method boolean
);


ALTER TABLE public.orgs OWNER TO eventador_admin;

--
-- Name: stripe_orgs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stripe_orgs (
    orgid character(32) NOT NULL,
    payload jsonb
);


ALTER TABLE public.stripe_orgs OWNER TO eventador_admin;

--
-- Name: stripe_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stripe_subscriptions (
    deploymentid character varying(32) NOT NULL,
    stripe_subscriptionid character varying(50),
    payload jsonb
);


ALTER TABLE public.stripe_subscriptions OWNER TO eventador_admin;

--
-- Name: users; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.users (
    userid character(32) NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    email character varying(100),
    password character varying(64),
    username character varying(64),
    is_active boolean DEFAULT true,
    orgid character(32),
    wiz_step integer DEFAULT 0,
    isverified boolean DEFAULT false,
    verification_key character varying(128),
    dtcreated timestamp without time zone DEFAULT now(),
    dashboard_preferences jsonb,
    internal boolean DEFAULT false,
    stripeid character varying(150),
    pw_reset_key character varying(128),
    github_token character varying(256),
    primary_orgid character(32),
    github_id integer,
    campaign character varying(50)
);


ALTER TABLE public.users OWNER TO eventador_admin;

--
-- Name: billing_master; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_master AS
 SELECT e.email,
    e.username,
    a.orgid,
    a.orgname,
    b.deploymentname,
    b.dtcreated,
    b.region,
    (((c.payload -> 'plan'::text) ->> 'name'::text))::character varying AS planname,
    (((c.payload -> 'plan'::text) -> 'amount'::text))::character varying AS amount,
    ((c.payload ->> 'status'::text))::character varying AS stripe_status,
    b.status,
    ((((d.payload -> 'data'::text) -> 0) ->> 'last4'::text))::character varying AS last4,
        CASE
            WHEN ((((c.payload ->> 'status'::text))::character varying)::text = 'past_due'::text) THEN ((('now'::text)::date)::timestamp without time zone - b.dtcreated)
            WHEN ((((c.payload ->> 'status'::text))::character varying)::text = 'trialing'::text) THEN ((('now'::text)::date)::timestamp without time zone - b.dtcreated)
            ELSE NULL::interval
        END AS trial_end
   FROM public.orgs a,
    public.deployments b,
    public.stripe_subscriptions c,
    public.stripe_orgs d,
    public.users e
  WHERE ((a.orgid = b.orgid) AND (b.deploymentid = (c.deploymentid)::bpchar) AND (a.orgid = d.orgid) AND (e.primary_orgid = a.orgid) AND ((e.email)::text !~~ '%eventador%'::text));


ALTER TABLE public.billing_master OWNER TO eventador_admin;

--
-- Name: billing_active_ledger; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_active_ledger AS
 SELECT billing_master.email,
    billing_master.username,
    billing_master.orgid,
    billing_master.orgname,
    billing_master.deploymentname,
    billing_master.dtcreated,
    billing_master.region,
    billing_master.planname,
    billing_master.amount,
    billing_master.stripe_status,
    billing_master.status,
    billing_master.last4,
    billing_master.trial_end
   FROM public.billing_master
  WHERE (((billing_master.amount)::text <> '0'::text) AND ((billing_master.status)::text <> 'canceled'::text) AND ((billing_master.email)::text !~~ '%eventador%'::text) AND ((billing_master.status)::text <> 'past_due'::text))
  ORDER BY billing_master.status DESC, billing_master.username, billing_master.amount;


ALTER TABLE public.billing_active_ledger OWNER TO eventador_admin;

--
-- Name: billing_new_customers_by_month; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_new_customers_by_month AS
 SELECT date_trunc('month'::text, billing_master.dtcreated) AS thedate,
    count(*) AS customers
   FROM public.billing_master
  WHERE (((billing_master.amount)::text <> '0'::text) AND ((billing_master.status)::text <> 'canceled'::text) AND ((billing_master.email)::text !~~ '%eventador%'::text))
  GROUP BY (date_trunc('month'::text, billing_master.dtcreated))
  ORDER BY (date_trunc('month'::text, billing_master.dtcreated));


ALTER TABLE public.billing_new_customers_by_month OWNER TO eventador_admin;

--
-- Name: billing_cum_customers_by_month; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_cum_customers_by_month AS
 SELECT billing_new_customers_by_month.thedate,
    sum(sum(billing_new_customers_by_month.customers)) OVER (ORDER BY billing_new_customers_by_month.thedate) AS sum
   FROM public.billing_new_customers_by_month
  GROUP BY billing_new_customers_by_month.thedate;


ALTER TABLE public.billing_cum_customers_by_month OWNER TO eventador_admin;

--
-- Name: billing_plannames; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing_plannames (
    planname character varying,
    node_count integer
);


ALTER TABLE public.billing_plannames OWNER TO eventador_admin;

--
-- Name: billing_new_nodes_by_month; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_new_nodes_by_month AS
 SELECT date_trunc('month'::text, billing_master.dtcreated) AS thedate,
    sum(billing_plannames.node_count) AS nodes
   FROM public.billing_master,
    public.billing_plannames
  WHERE (((billing_master.planname)::text = (billing_plannames.planname)::text) AND ((billing_master.amount)::text <> '0'::text) AND ((billing_master.status)::text <> 'canceled'::text) AND ((billing_master.email)::text !~~ '%eventador%'::text))
  GROUP BY (date_trunc('month'::text, billing_master.dtcreated))
  ORDER BY (date_trunc('month'::text, billing_master.dtcreated));


ALTER TABLE public.billing_new_nodes_by_month OWNER TO eventador_admin;

--
-- Name: billing_cum_nodes_by_month; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_cum_nodes_by_month AS
 SELECT billing_new_nodes_by_month.thedate,
    sum(sum(billing_new_nodes_by_month.nodes)) OVER (ORDER BY billing_new_nodes_by_month.thedate) AS sum
   FROM public.billing_new_nodes_by_month
  GROUP BY billing_new_nodes_by_month.thedate;


ALTER TABLE public.billing_cum_nodes_by_month OWNER TO eventador_admin;

--
-- Name: billing_rev_by_month; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_rev_by_month AS
 SELECT date_trunc('month'::text, billing_master.dtcreated) AS thedate,
    (sum((billing_master.amount)::integer) / 100) AS rev
   FROM public.billing_master
  WHERE (((billing_master.amount)::text <> '0'::text) AND ((billing_master.status)::text <> 'canceled'::text) AND ((billing_master.email)::text !~~ '%eventador%'::text))
  GROUP BY (date_trunc('month'::text, billing_master.dtcreated))
  ORDER BY (date_trunc('month'::text, billing_master.dtcreated));


ALTER TABLE public.billing_rev_by_month OWNER TO eventador_admin;

--
-- Name: billing_cum_rev_by_month; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_cum_rev_by_month AS
 SELECT billing_rev_by_month.thedate,
    sum(sum(billing_rev_by_month.rev)) OVER (ORDER BY billing_rev_by_month.thedate) AS sum
   FROM public.billing_rev_by_month
  GROUP BY billing_rev_by_month.thedate;


ALTER TABLE public.billing_cum_rev_by_month OWNER TO eventador_admin;

--
-- Name: deployment_packages_seq; Type: SEQUENCE; Schema: public; Owner: eventador_admin
--

CREATE SEQUENCE public.deployment_packages_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deployment_packages_seq OWNER TO eventador_admin;

--
-- Name: deployment_packages; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.deployment_packages (
    packageid integer DEFAULT nextval('public.deployment_packages_seq'::regclass) NOT NULL,
    payload jsonb,
    style character varying(25),
    active boolean DEFAULT false,
    deployable boolean DEFAULT true,
    subscriptioncost double precision,
    scalable boolean DEFAULT true,
    description character varying(100),
    tags character varying[],
    subdescription character varying(100),
    components character varying[],
    planid integer,
    eventador_processing_units double precision
);


ALTER TABLE public.deployment_packages OWNER TO eventador_admin;

--
-- Name: billing_eventador_processing_units_master; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_eventador_processing_units_master AS
 SELECT a.deploymentname,
    a.packageid,
    json_array_length((a.hostmap -> 'kafka'::text)) AS json_array_length,
    b.eventador_processing_units,
    ((json_array_length((a.hostmap -> 'kafka'::text)))::double precision * b.eventador_processing_units) AS total_units,
    (((b.payload -> 'package'::text) -> 0) ->> 'type'::text) AS type
   FROM public.deployments a,
    public.deployment_packages b
  WHERE ((a.packageid = b.packageid) AND ((a.status)::text = 'Active'::text) AND ((((b.payload -> 'package'::text) -> 0) ->> 'name'::text) = 'kafka'::text))
  ORDER BY a.packageid;


ALTER TABLE public.billing_eventador_processing_units_master OWNER TO eventador_admin;

--
-- Name: billing_eventador_processing_units_total; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_eventador_processing_units_total AS
 SELECT sum(billing_eventador_processing_units_master.total_units) AS sum
   FROM public.billing_eventador_processing_units_master;


ALTER TABLE public.billing_eventador_processing_units_total OWNER TO eventador_admin;

--
-- Name: billing_new_nodes_by_plan_by_month; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_new_nodes_by_plan_by_month AS
 SELECT date_trunc('month'::text, billing_master.dtcreated) AS thedate,
    billing_plannames.planname,
    sum(billing_plannames.node_count) AS nodes
   FROM public.billing_master,
    public.billing_plannames
  WHERE (((billing_master.planname)::text = (billing_plannames.planname)::text) AND ((billing_master.amount)::text <> '0'::text) AND ((billing_master.status)::text <> 'canceled'::text))
  GROUP BY (date_trunc('month'::text, billing_master.dtcreated)), billing_plannames.planname
  ORDER BY (date_trunc('month'::text, billing_master.dtcreated));


ALTER TABLE public.billing_new_nodes_by_plan_by_month OWNER TO eventador_admin;

--
-- Name: billing_stripe_audit; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_stripe_audit AS
 SELECT billing_master.email,
    billing_master.username,
    billing_master.deploymentname,
    billing_master.status,
    billing_master.stripe_status,
    billing_master.last4
   FROM public.billing_master
  WHERE (lower((billing_master.stripe_status)::text) <> lower((billing_master.status)::text));


ALTER TABLE public.billing_stripe_audit OWNER TO eventador_admin;

--
-- Name: billing_trial; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_trial AS
 SELECT billing_master.email,
    billing_master.username,
    billing_master.orgid,
    billing_master.orgname,
    billing_master.deploymentname,
    billing_master.dtcreated,
    billing_master.region,
    billing_master.planname,
    billing_master.amount,
    billing_master.status,
    billing_master.last4,
    billing_master.trial_end
   FROM public.billing_master
  WHERE (((billing_master.status)::text = 'trialing'::text) AND (billing_master.last4 IS NULL));


ALTER TABLE public.billing_trial OWNER TO eventador_admin;

--
-- Name: billing_trial_past_due; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.billing_trial_past_due AS
 SELECT billing_master.email,
    billing_master.username,
    billing_master.orgid,
    billing_master.orgname,
    billing_master.deploymentname,
    billing_master.dtcreated,
    billing_master.region,
    billing_master.planname,
    billing_master.amount,
    billing_master.status,
    billing_master.last4,
    billing_master.trial_end
   FROM public.billing_master
  WHERE ((billing_master.status)::text = 'past_due'::text);


ALTER TABLE public.billing_trial_past_due OWNER TO eventador_admin;

--
-- Name: blocked_register_domains; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.blocked_register_domains (
    domain character varying(50) NOT NULL,
    dtcreated timestamp without time zone DEFAULT now()
);


ALTER TABLE public.blocked_register_domains OWNER TO eventador_admin;

--
-- Name: build_reservations; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.build_reservations (
    reservationid character(32) NOT NULL,
    deploymentid character(32) NOT NULL,
    details jsonb,
    progress integer DEFAULT 5,
    status character varying(50) DEFAULT 'Pending'::character varying,
    dtcreated timestamp without time zone DEFAULT now(),
    component character varying(50)
);


ALTER TABLE public.build_reservations OWNER TO eventador_admin;

--
-- Name: client_certs; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.client_certs (
    certid character(32) NOT NULL,
    deploymentid character(32) NOT NULL,
    cn character varying(50) NOT NULL,
    dtcreated timestamp without time zone DEFAULT now()
);


ALTER TABLE public.client_certs OWNER TO eventador_admin;

--
-- Name: cloud_builder; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.cloud_builder (
    dtcreated timestamp without time zone DEFAULT now(),
    dtupdated timestamp without time zone DEFAULT now(),
    status_code integer,
    payload json,
    last_message text,
    id bigint NOT NULL,
    message_type integer NOT NULL,
    region character varying(32) DEFAULT 'aws:us-east-1'::character varying
);


ALTER TABLE public.cloud_builder OWNER TO eventador_admin;

--
-- Name: cloud_builder_id_seq; Type: SEQUENCE; Schema: public; Owner: eventador_admin
--

CREATE SEQUENCE public.cloud_builder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cloud_builder_id_seq OWNER TO eventador_admin;

--
-- Name: cloud_builder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eventador_admin
--

ALTER SEQUENCE public.cloud_builder_id_seq OWNED BY public.cloud_builder.id;


--
-- Name: deployment_packages_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deployment_packages_backup (
    packageid integer,
    payload jsonb,
    style character varying(25)
);


ALTER TABLE public.deployment_packages_backup OWNER TO eventador_admin;

--
-- Name: deployment_packages_bak; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deployment_packages_bak (
    packageid integer,
    payload jsonb,
    style character varying(25),
    active boolean,
    deployable boolean,
    subscriptioncost double precision,
    scalable boolean
);


ALTER TABLE public.deployment_packages_bak OWNER TO eventador_admin;

--
-- Name: deployments_backup_emb_20170105; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.deployments_backup_emb_20170105 (
    deploymentid character(32),
    deploymentname character varying(50),
    orgid character(32),
    status character varying(50),
    packageid integer,
    vpcid integer,
    dtcreated timestamp without time zone,
    hostmap json,
    aws_public_sg_id character varying(25),
    ca_cert character varying(3000),
    ca_key character varying(5000),
    progress integer,
    notebook_password character varying(50),
    region character varying(32)
);


ALTER TABLE public.deployments_backup_emb_20170105 OWNER TO eventador_admin;

--
-- Name: deployments_backup_emb_20171206; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.deployments_backup_emb_20171206 (
    deploymentid character(32),
    deploymentname character varying(50),
    orgid character(32),
    status character varying(50),
    packageid integer,
    vpcid integer,
    dtcreated timestamp without time zone,
    hostmap json,
    aws_public_sg_id character varying(25),
    ca_cert character varying(3000),
    ca_key character varying(5000),
    progress integer,
    notebook_password character varying(50),
    region character varying(32),
    stripe_subscriptionid character varying(50),
    description character varying(500),
    dttrialexpire timestamp without time zone,
    dtfreeexpire timestamp without time zone,
    projects_deployment_secret character(32)
);


ALTER TABLE public.deployments_backup_emb_20171206 OWNER TO eventador_admin;

--
-- Name: enterprise_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enterprise_log (
    orgid character varying(32),
    dtcreated timestamp without time zone DEFAULT now(),
    payload json
);


ALTER TABLE public.enterprise_log OWNER TO eventador_admin;

--
-- Name: enterprise_map; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.enterprise_map (
    name character varying(255) NOT NULL,
    customer_id character(8) NOT NULL,
    environment_id character(8) NOT NULL,
    environment_dc character varying(32),
    partition character varying(32),
    orgid character varying(32),
    org_uri character varying(250),
    org_api_key character varying(32)
);


ALTER TABLE public.enterprise_map OWNER TO eventador_admin;

--
-- Name: ev8s_agent_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ev8s_agent_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ev8s_agent_seq OWNER TO eventador_admin;

--
-- Name: ev8s_agent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ev8s_agent (
    id bigint DEFAULT nextval('public.ev8s_agent_seq'::regclass) NOT NULL,
    agent_api_key character varying(256) NOT NULL,
    agent_private_key character varying(3000) NOT NULL,
    dns_api_key character varying(256) NOT NULL,
    dns_zone character varying(256) NOT NULL,
    metadata jsonb,
    active boolean DEFAULT false,
    created timestamp without time zone DEFAULT now(),
    updated timestamp without time zone DEFAULT now(),
    dt_last_api_poll timestamp without time zone,
    dt_last_dns_poll timestamp without time zone
);


ALTER TABLE public.ev8s_agent OWNER TO eventador_admin;

--
-- Name: ev8s_builder_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ev8s_builder_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ev8s_builder_seq OWNER TO eventador_admin;

--
-- Name: ev8s_builder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ev8s_builder (
    id bigint DEFAULT nextval('public.ev8s_builder_seq'::regclass) NOT NULL,
    workid character(32) NOT NULL,
    deploymentid character varying(32) NOT NULL,
    orgid character varying(32) NOT NULL,
    vpcid bigint NOT NULL,
    payload jsonb NOT NULL,
    status_code bigint NOT NULL,
    created timestamp without time zone DEFAULT now(),
    updated timestamp without time zone DEFAULT now()
);


ALTER TABLE public.ev8s_builder OWNER TO eventador_admin;

--
-- Name: ev8s_results_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ev8s_results_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ev8s_results_seq OWNER TO eventador_admin;

--
-- Name: ev8s_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ev8s_results (
    id bigint DEFAULT nextval('public.ev8s_results_seq'::regclass) NOT NULL,
    workid character(32) NOT NULL,
    taskid character(32) NOT NULL,
    vpcid bigint NOT NULL,
    payload jsonb NOT NULL,
    success boolean NOT NULL,
    created timestamp without time zone DEFAULT now()
);


ALTER TABLE public.ev8s_results OWNER TO eventador_admin;

--
-- Name: ev_configs; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.ev_configs (
    environment character varying(25),
    config_json jsonb
);


ALTER TABLE public.ev_configs OWNER TO eventador_admin;

--
-- Name: foo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foo (
    id integer
);


ALTER TABLE public.foo OWNER TO eventador_admin;

--
-- Name: vpcs_seq; Type: SEQUENCE; Schema: public; Owner: eventador_admin
--

CREATE SEQUENCE public.vpcs_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vpcs_seq OWNER TO eventador_admin;

--
-- Name: vpcs; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.vpcs (
    vpcid integer DEFAULT nextval('public.vpcs_seq'::regclass) NOT NULL,
    subnet cidr,
    aws_vpc_id character varying(25),
    orgid character(32),
    vpc_resources json,
    region character varying(32) DEFAULT 'aws:us-east-1'::character varying,
    agent_id bigint
);


ALTER TABLE public.vpcs OWNER TO eventador_admin;

--
-- Name: free_vpcs; Type: VIEW; Schema: public; Owner: eventador_admin
--

CREATE VIEW public.free_vpcs AS
 SELECT vpcs.vpcid,
    vpcs.subnet,
    vpcs.aws_vpc_id,
    vpcs.orgid,
    vpcs.vpc_resources,
    vpcs.region
   FROM public.vpcs
  WHERE (vpcs.orgid IS NULL)
  ORDER BY vpcs.region, vpcs.subnet;


ALTER TABLE public.free_vpcs OWNER TO eventador_admin;

--
-- Name: ipset_acls_queue_seq; Type: SEQUENCE; Schema: public; Owner: eventador_admin
--

CREATE SEQUENCE public.ipset_acls_queue_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipset_acls_queue_seq OWNER TO eventador_admin;

--
-- Name: ipset_acls_queue; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.ipset_acls_queue (
    id bigint DEFAULT nextval('public.ipset_acls_queue_seq'::regclass) NOT NULL,
    host character varying(256) NOT NULL,
    container_name character varying(32) NOT NULL,
    cidrmask character varying(18) NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    dtcreated timestamp without time zone DEFAULT now() NOT NULL,
    action character varying(16) NOT NULL,
    region character varying(32) DEFAULT 'aws:us-east-1'::character varying
);


ALTER TABLE public.ipset_acls_queue OWNER TO eventador_admin;

--
-- Name: kg_orgs_bak; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kg_orgs_bak (
    orgid character(32),
    orgname character varying(50),
    internal boolean,
    billing_method character varying,
    force_premium boolean,
    stripe_billing_method boolean,
    org_type character varying(25),
    org_uri character varying(100),
    org_api_key character varying(100)
);


ALTER TABLE public.kg_orgs_bak OWNER TO eventador_admin;

--
-- Name: mailinglist; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.mailinglist AS
 SELECT users.email,
    users.firstname,
    users.lastname
   FROM public.users
  WHERE (users.orgid IN ( SELECT orgs.orgid
           FROM public.orgs
          WHERE (orgs.internal = false)));


ALTER TABLE public.mailinglist OWNER TO eventador_admin;

--
-- Name: metadata_backup_seq; Type: SEQUENCE; Schema: public; Owner: eventador_admin
--

CREATE SEQUENCE public.metadata_backup_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metadata_backup_seq OWNER TO eventador_admin;

--
-- Name: metadata_backup; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.metadata_backup (
    mbid bigint DEFAULT nextval('public.metadata_backup_seq'::regclass) NOT NULL,
    type character varying(32) NOT NULL,
    subtype character varying(32),
    dtbackedup timestamp without time zone DEFAULT now() NOT NULL,
    data jsonb NOT NULL,
    description character varying(128)
);


ALTER TABLE public.metadata_backup OWNER TO eventador_admin;

--
-- Name: nb_users_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nb_users_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nb_users_seq OWNER TO eventador_admin;

--
-- Name: nb_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nb_users (
    userid bigint DEFAULT nextval('public.nb_users_seq'::regclass) NOT NULL,
    username character varying(50) DEFAULT 'notebook'::character varying,
    password character varying(100),
    deployment_short character varying(12),
    deploymentid character(32)
);


ALTER TABLE public.nb_users OWNER TO eventador_admin;

--
-- Name: orgs_invites; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.orgs_invites (
    orgid character(32) NOT NULL,
    access_level public.org_access_level NOT NULL,
    userid character(32) NOT NULL,
    invited_by_userid character(32) NOT NULL,
    invited_date timestamp without time zone DEFAULT now() NOT NULL,
    accepted boolean DEFAULT false NOT NULL,
    ignored boolean DEFAULT false NOT NULL
);


ALTER TABLE public.orgs_invites OWNER TO eventador_admin;

--
-- Name: orgs_permissions_map; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.orgs_permissions_map (
    orgid character(32) NOT NULL,
    userid character(36) NOT NULL,
    access_level public.org_access_level NOT NULL
);


ALTER TABLE public.orgs_permissions_map OWNER TO eventador_admin;

--
-- Name: pipelines; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.pipelines (
    userid character(32) NOT NULL,
    namespace character varying(100) NOT NULL,
    customer_database_config json,
    apikey character(32),
    customer_schema_config jsonb,
    schema_created character(1),
    dtcreated timestamp without time zone DEFAULT now(),
    api_endpoint character varying(100),
    description character varying(250),
    status character varying(12) DEFAULT 'Active'::character varying NOT NULL,
    dtupdated timestamp without time zone,
    deploymentid character(32)
);


ALTER TABLE public.pipelines OWNER TO eventador_admin;

--
-- Name: plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plans (
    planid integer,
    description character varying(250),
    hourly_price character varying(12)
);


ALTER TABLE public.plans OWNER TO eventador_admin;

--
-- Name: plans_packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plans_packages (
    planid integer,
    packageid integer
);


ALTER TABLE public.plans_packages OWNER TO eventador_admin;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.projects (
    projectid character(32) NOT NULL,
    projectname character varying(255) NOT NULL,
    orgid character(32) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    last_deploy_qa timestamp without time zone,
    last_deploy_production timestamp without time zone,
    github_repo character varying(255) NOT NULL,
    last_deployed_commit character(8) DEFAULT NULL::bpchar,
    description character varying(500),
    github_secret character(32) DEFAULT NULL::bpchar,
    github_url character varying(255) DEFAULT NULL::character varying,
    project_builder_secret character(32) DEFAULT NULL::bpchar,
    github_repo_id bigint,
    github_ssh_url character varying(255) DEFAULT NULL::character varying,
    github_https_url character varying(255) DEFAULT NULL::character varying,
    github_org_name character varying(255),
    status character varying DEFAULT 'Active'::character varying,
    default_arguments character varying(1024) DEFAULT NULL::character varying,
    default_entrypoint character varying(255) DEFAULT NULL::character varying,
    deploy_key_public character varying(4096) DEFAULT NULL::character varying,
    deploy_key_private character varying(4096) DEFAULT NULL::character varying
);


ALTER TABLE public.projects OWNER TO eventador_admin;

--
-- Name: projects_deployments_map; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.projects_deployments_map (
    deploymentid character(32),
    projectid character(32),
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    last_log_offset bigint,
    status public.project_status NOT NULL,
    last_deploy timestamp without time zone DEFAULT now() NOT NULL,
    deployed_version character varying(32),
    arguments character varying(1024) DEFAULT NULL::character varying,
    classname character varying(255) DEFAULT NULL::character varying,
    auto_deploy boolean DEFAULT false,
    parallelism integer DEFAULT 1,
    log_offsets bigint[],
    build_id character(32) NOT NULL,
    job_id character varying(50),
    arguments_unparsed character varying(4096)
);


ALTER TABLE public.projects_deployments_map OWNER TO eventador_admin;

--
-- Name: projects_deployments_map_emb_20171214; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.projects_deployments_map_emb_20171214 (
    deploymentid character(32),
    projectid character(32),
    created_date timestamp without time zone,
    last_log_offset bigint,
    status public.project_status,
    last_deploy timestamp without time zone,
    deployed_version character varying(32),
    arguments character varying(255),
    classname character varying(255),
    auto_deploy boolean,
    parallelism integer,
    log_offsets bigint[],
    build_id character(32),
    job_id character varying(50),
    arguments_unparsed character varying(4096)
);


ALTER TABLE public.projects_deployments_map_emb_20171214 OWNER TO eventador_admin;

--
-- Name: projects_emb_20171214; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.projects_emb_20171214 (
    projectid character(32),
    projectname character varying(255),
    orgid character(32),
    created_date timestamp without time zone,
    last_deploy_qa timestamp without time zone,
    last_deploy_production timestamp without time zone,
    github_repo character varying(255),
    last_deployed_commit character(8),
    description character varying(500),
    github_secret character(32),
    github_url character varying(255),
    project_builder_secret character(32),
    github_repo_id bigint,
    github_ssh_url character varying(255),
    github_https_url character varying(255),
    github_org_name character varying(255),
    status character varying,
    default_arguments character varying(255),
    default_entrypoint character varying(255),
    deploy_key_public character varying(4096),
    deploy_key_private character varying(4096)
);


ALTER TABLE public.projects_emb_20171214 OWNER TO eventador_admin;

--
-- Name: projects_seq; Type: SEQUENCE; Schema: public; Owner: eventador_admin
--

CREATE SEQUENCE public.projects_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_seq OWNER TO eventador_admin;

--
-- Name: projects_templates; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.projects_templates (
    template_id integer,
    template_name character varying(255) NOT NULL,
    template_source_url character varying(255) NOT NULL,
    template_language character varying(255) NOT NULL,
    is_paid boolean DEFAULT false,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    arguments character varying(255) DEFAULT NULL::character varying,
    entrypoint character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.projects_templates OWNER TO eventador_admin;

--
-- Name: regions_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_seq OWNER TO eventador_admin;

--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    regionid integer DEFAULT nextval('public.regions_seq'::regclass),
    regionname character varying(32),
    description character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.regions OWNER TO eventador_admin;

--
-- Name: released_checkouts; Type: VIEW; Schema: public; Owner: eventador_admin
--

CREATE VIEW public.released_checkouts AS
 SELECT concat('cd /app/cloud_builder && /root/.virtualenvs/sandbox_builder/bin/python sandbox_recycle_wrapper.py ', checkouts.host, ' ', "substring"((checkouts.container_name)::text, 2), ' ', checkouts.checkoutid) AS recycle_cmd,
    checkouts.checkedout,
    checkouts.deploymentid,
    checkouts.dtreleased
   FROM public.checkouts
  WHERE (checkouts.dtreleased IS NOT NULL)
  ORDER BY checkouts.host, checkouts.container_name;


ALTER TABLE public.released_checkouts OWNER TO eventador_admin;

--
-- Name: sales_leads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_leads (
    orgname character varying(50),
    url text,
    "desc" text,
    status text,
    contact character varying(64),
    title text,
    email character varying(100),
    phone text
);


ALTER TABLE public.sales_leads OWNER TO eventador_admin;

--
-- Name: sales_leads_archive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_leads_archive (
    orgname character varying(50),
    url text,
    "desc" text,
    status text,
    contact character varying(64),
    title text,
    email character varying(100),
    phone text
);


ALTER TABLE public.sales_leads_archive OWNER TO eventador_admin;

--
-- Name: software_versions; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.software_versions (
    name character varying(20) NOT NULL,
    version character varying(20) NOT NULL,
    isdefault boolean DEFAULT false,
    active boolean DEFAULT false,
    tags character varying[],
    description character varying(100)
);


ALTER TABLE public.software_versions OWNER TO eventador_admin;

--
-- Name: stacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stacks (
    stackid character(32) NOT NULL,
    deploymentid character(32),
    stackname character varying(100),
    stacktype character varying(25),
    status character varying(50) DEFAULT 'Active'::character varying,
    dtcreated date DEFAULT now(),
    payload json,
    description character varying(250) DEFAULT 'PipelineDB allows for real-time aggregations, filters, views using continuous views and simple SQL'::character varying,
    displayname character varying(50) DEFAULT 'Default PipelineDB (JSON)'::character varying,
    region character varying(32) DEFAULT 'aws:us-east-1'::character varying
);


ALTER TABLE public.stacks OWNER TO eventador_admin;

--
-- Name: user_log_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_log_seq OWNER TO eventador_admin;

--
-- Name: user_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_log (
    user_logid integer DEFAULT nextval('public.user_log_seq'::regclass),
    action character varying(1000),
    value character varying(20),
    dtcreated timestamp without time zone DEFAULT now(),
    userid character(32)
);


ALTER TABLE public.user_log OWNER TO eventador_admin;

--
-- Name: users_back; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_back (
    userid character(32),
    firstname character varying(50),
    lastname character varying(50),
    email character varying(100),
    password character varying(64),
    username character varying(64),
    is_active boolean,
    orgid character(32),
    wiz_step integer,
    isverified boolean,
    verification_key character varying(128),
    dtcreated timestamp without time zone
);


ALTER TABLE public.users_back OWNER TO eventador_admin;

--
-- Name: users_backup_20170515; Type: TABLE; Schema: public; Owner: eventador_admin
--

CREATE TABLE public.users_backup_20170515 (
    userid character(32),
    firstname character varying(50),
    lastname character varying(50),
    email character varying(100),
    password character varying(64),
    username character varying(64),
    is_active boolean,
    orgid character(32),
    wiz_step integer,
    isverified boolean,
    verification_key character varying(128),
    dtcreated timestamp without time zone,
    dashboard_preferences jsonb,
    internal boolean,
    stripeid character varying(150),
    pw_reset_key character varying(128),
    github_token character varying(256)
);


ALTER TABLE public.users_backup_20170515 OWNER TO eventador_admin;

--
-- Name: users_bak; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_bak (
    userid character(32),
    firstname character varying(50),
    lastname character varying(50),
    email character varying(100),
    password character varying(64),
    username character varying(64),
    is_active boolean,
    orgid character(32)
);


ALTER TABLE public.users_bak OWNER TO eventador_admin;

--
-- Name: users_pre_uniq_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_pre_uniq_email (
    userid character(32),
    firstname character varying(50),
    lastname character varying(50),
    email character varying(100),
    password character varying(64),
    username character varying(64),
    is_active boolean,
    orgid character(32),
    wiz_step integer,
    isverified boolean,
    verification_key character varying(128),
    dtcreated timestamp without time zone,
    dashboard_preferences jsonb,
    internal boolean,
    stripeid character varying(150),
    pw_reset_key character varying(128),
    github_token character varying(256)
);


ALTER TABLE public.users_pre_uniq_email OWNER TO eventador_admin;

--
-- Name: cloud_builder id; Type: DEFAULT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.cloud_builder ALTER COLUMN id SET DEFAULT nextval('public.cloud_builder_id_seq'::regclass);


--
-- Data for Name: acls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.acls (aclid, cidrmask, comment, deploymentid, status, host, container_name, dtcreated, region) FROM stdin;
\.


--
-- Data for Name: acls_backup_emb_20171206; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.acls_backup_emb_20171206 (aclid, cidrmask, comment, deploymentid, status, host, container_name, dtcreated, region) FROM stdin;
\.


--
-- Name: acls_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.acls_seq', 1, false);


--
-- Data for Name: beta_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beta_users (betaid, name, company, email, phone, comments, dtcreated, followed_up) FROM stdin;
\.


--
-- Name: betaid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.betaid_seq', 1, false);


--
-- Data for Name: billing_plannames; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_plannames (planname, node_count) FROM stdin;
\.


--
-- Data for Name: blocked_register_domains; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.blocked_register_domains (domain, dtcreated) FROM stdin;
\.


--
-- Data for Name: build_reservations; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.build_reservations (reservationid, deploymentid, details, progress, status, dtcreated, component) FROM stdin;
\.


--
-- Data for Name: checkouts; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.checkouts (checkoutid, checkedout, container_type, host, container_image, container_name, config_json, config_full, type, dtcreated, deploymentid, orgid, dtclaimed, dtreleased, region) FROM stdin;
\.


--
-- Name: checkouts_seq; Type: SEQUENCE SET; Schema: public; Owner: eventador_admin
--

SELECT pg_catalog.setval('public.checkouts_seq', 1, false);


--
-- Data for Name: client_certs; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.client_certs (certid, deploymentid, cn, dtcreated) FROM stdin;
\.


--
-- Data for Name: cloud_builder; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.cloud_builder (dtcreated, dtupdated, status_code, payload, last_message, id, message_type, region) FROM stdin;
2018-06-18 22:11:25.578181	2018-06-18 22:14:16.824561	1	{"status": {"exception": "none", "details": {"subnet": "subnet-025344891c0191438", "hostmap": {"node_exporter_port": 9100, "sasl_super_username": "ce602a2e_ev_38b3b2df1169", "sasl_super_password": "44959f3cbb7040c58b7d1b26151e7efc", "zookeeper": [{"zone": "us-west-2a", "ip": "10.20.0.184", "id": "i-08d81f3cd18df720d", "host": "ce602a2e-zookeeper0.cartera-usw2.eventador.io", "version": "3.4.10", "port": 2181}], "jetty_auth": ["eventador", "36e8d2c16ce049f7bd02601907c4f7f7"], "kafka": [{"zone": "us-west-2a", "ip": "10.20.0.105", "id": "i-008c0e70807318621", "host": "ce602a2e-kafka0.cartera-usw2.eventador.io", "version": "1.1.0", "port": 9092}]}, "vpc": "sg-0d4fed4cc0800288e", "acl_sg": "sg-0f3f990f2abc35740", "node_ids": {"zookeeper": ["i-08d81f3cd18df720d"], "kafka": ["i-008c0e70807318621"]}, "sg": "vpc-0c4990420d2fd1acc"}, "last_stage": "configure_kafka_super_auth"}, "slack_ident": "57e7836fe86144f3a97a102a528c91ad 10a26b3fd2914c88988732edce602a2e(test1) 2", "ca_cert": null, "notebook_password": "5f9255f4676f4881a6a28054789f77c5", "ca_key": null, "deploymentid": "10a26b3fd2914c88988732edce602a2e", "orgid": "57e7836fe86144f3a97a102a528c91ad", "additional_brokers": 0, "target_versions": {"kafka": "1.1.0"}, "aws_public_sg_id": null, "package": [{"count": 1, "data_disk_config": {"disk_type": "gp2", "disk_size": 25}, "swap_disk_config": {"disk_type": "gp2", "disk_size": 4}, "name": "kafka", "target_version": "1.1.0", "type": "t2.medium"}, {"count": 1, "data_disk_config": {"disk_type": "gp2", "disk_size": 25}, "type": "t2.medium", "name": "zookeeper", "target_version": "1.1.0"}], "orgname": "eventador_support's Team", "region": "aws:us-west-2", "userid": "cd1866b3c2004fbebcc6bccd77fdf686", "deploymentname": "test1", "hostmap": null, "packageid": 1, "projects_deployment_secret": "27a4925d37e4443c8ea729dee812f2b8"}	\N	2	10	aws:us-west-2
2018-06-18 22:18:59.840559	2018-06-18 22:21:46.425037	2	{"status": {"exception": "none", "details": {"subnet": "subnet-025344891c0191438", "hostmap": {"node_exporter_port": 9100, "kafka_discovery": "0fc9049b-kafka-discovery.cartera-usw2.eventador.io", "sasl_super_username": "0fc9049b_ev_a420f457c949", "sasl_super_password": "2ac56f80dd1e44968829a272eeb4b3a7", "zookeeper": [{"zone": "us-west-2a", "ip": "10.20.0.37", "id": "i-0d423cb910f464740", "host": "0fc9049b-zookeeper0.cartera-usw2.eventador.io", "version": "3.4.10", "port": 2181}], "jetty_auth": ["eventador", "c70cdf8ded63428f8a033c782a33df0d"], "kafka": [{"zone": "us-west-2a", "ip": "10.20.0.76", "id": "i-0b4bf5f69efa8a2de", "host": "0fc9049b-kafka0.cartera-usw2.eventador.io", "version": "1.1.0", "port": 9092}]}, "vpc": "sg-0d4fed4cc0800288e", "acl_sg": "sg-0f3f990f2abc35740", "kafka_default_topic": {"topic_config": {}, "partition_count": 32, "status": "success", "name": "defaultsink", "replication_factor": 1}, "node_ids": {"zookeeper": ["i-0d423cb910f464740"], "kafka": ["i-0b4bf5f69efa8a2de"]}, "sg": "vpc-0c4990420d2fd1acc"}, "last_stage": "successful"}, "slack_ident": "57e7836fe86144f3a97a102a528c91ad 368ca13592b04d0c8efe287a0fc9049b(test2) 3", "ca_cert": null, "notebook_password": "db70192c33544f54bfbed206d1ff4559", "ca_key": null, "deploymentid": "368ca13592b04d0c8efe287a0fc9049b", "orgid": "57e7836fe86144f3a97a102a528c91ad", "additional_brokers": 0, "target_versions": {"kafka": "1.1.0"}, "aws_public_sg_id": null, "package": [{"count": 1, "data_disk_config": {"disk_type": "gp2", "disk_size": 25}, "swap_disk_config": {"disk_type": "gp2", "disk_size": 4}, "name": "kafka", "target_version": "1.1.0", "type": "t2.medium"}, {"count": 1, "data_disk_config": {"disk_type": "gp2", "disk_size": 25}, "type": "t2.medium", "name": "zookeeper", "target_version": "1.1.0"}], "orgname": "eventador_support's Team", "region": "aws:us-west-2", "userid": "cd1866b3c2004fbebcc6bccd77fdf686", "deploymentname": "test2", "hostmap": null, "packageid": 1, "projects_deployment_secret": "f49fe260c37940e4a656f7b669c5fd63"}	\N	3	10	aws:us-west-2
2018-06-18 22:21:46.426769	2018-06-18 22:21:46.426769	1	{"status": {"exception": "none", "details": {"subnet": "subnet-025344891c0191438", "hostmap": {"node_exporter_port": 9100, "kafka_discovery": "0fc9049b-kafka-discovery.cartera-usw2.eventador.io", "sasl_super_username": "0fc9049b_ev_a420f457c949", "sasl_super_password": "2ac56f80dd1e44968829a272eeb4b3a7", "zookeeper": [{"zone": "us-west-2a", "ip": "10.20.0.37", "id": "i-0d423cb910f464740", "host": "0fc9049b-zookeeper0.cartera-usw2.eventador.io", "version": "3.4.10", "port": 2181}], "jetty_auth": ["eventador", "c70cdf8ded63428f8a033c782a33df0d"], "kafka": [{"zone": "us-west-2a", "ip": "10.20.0.76", "id": "i-0b4bf5f69efa8a2de", "host": "0fc9049b-kafka0.cartera-usw2.eventador.io", "version": "1.1.0", "port": 9092}]}, "vpc": "sg-0d4fed4cc0800288e", "acl_sg": "sg-0f3f990f2abc35740", "kafka_default_topic": {"topic_config": {}, "partition_count": 32, "status": "success", "name": "defaultsink", "replication_factor": 1}, "node_ids": {"zookeeper": ["i-0d423cb910f464740"], "kafka": ["i-0b4bf5f69efa8a2de"]}, "sg": "vpc-0c4990420d2fd1acc"}, "last_stage": "successful"}, "slack_ident": "57e7836fe86144f3a97a102a528c91ad 368ca13592b04d0c8efe287a0fc9049b(test2) 3", "ca_cert": null, "notebook_password": "db70192c33544f54bfbed206d1ff4559", "ca_key": null, "deploymentid": "368ca13592b04d0c8efe287a0fc9049b", "orgid": "57e7836fe86144f3a97a102a528c91ad", "additional_brokers": 0, "target_versions": {"kafka": "1.1.0"}, "aws_public_sg_id": null, "package": [{"count": 1, "data_disk_config": {"disk_type": "gp2", "disk_size": 25}, "swap_disk_config": {"disk_type": "gp2", "disk_size": 4}, "name": "kafka", "target_version": "1.1.0", "type": "t2.medium"}, {"count": 1, "data_disk_config": {"disk_type": "gp2", "disk_size": 25}, "type": "t2.medium", "name": "zookeeper", "target_version": "1.1.0"}], "orgname": "eventador_support's Team", "region": "aws:us-west-2", "userid": "cd1866b3c2004fbebcc6bccd77fdf686", "deploymentname": "test2", "hostmap": null, "packageid": 1, "projects_deployment_secret": "f49fe260c37940e4a656f7b669c5fd63"}	Building stats services	4	200	aws:us-west-2
2018-06-20 18:49:21.283705	2018-06-20 18:50:49.277645	2	{"status": {"exception": "none", "details": {}, "last_stage": "successful"}, "ca_key": "-----BEGIN ENCRYPTED PRIVATE KEY-----\\n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\\nNN8Ul3TJhW2Zzp8HU1F6wQ==\\n-----END ENCRYPTED PRIVATE KEY-----\\n", "slack_ident": "57e7836fe86144f3a97a102a528c91ad 368ca13592b04d0c8efe287a0fc9049b(test2) 5", "aws_public_sg_id": "sg-0f3f990f2abc35740", "ca_cert": "-----BEGIN CERTIFICATE-----\\nMIIFKDCCAxCgAwIBAgIBATANBgkqhkiG9w0BAQsFADA0MTIwMAYDVQQDDCkwZmM5\\nMDQ5Yi1jYS5wdWIuY2FydGVyYS11c3cyLmV2ZW50YWRvci5pbzAeFw0xODA2MTgy\\nMjIwMzFaFw0yODA2MTUyMjIwMzFaMDQxMjAwBgNVBAMMKTBmYzkwNDliLWNhLnB1\\nYi5jYXJ0ZXJhLXVzdzIuZXZlbnRhZG9yLmlvMIICIjANBgkqhkiG9w0BAQEFAAOC\\nAg8AMIICCgKCAgEAyEZFYb4WIwN7AE4isxowutUfPq0Xd2D9HSmMaWD9MrgHT7Sa\\neWMUrOBXwbBYlA/rj/HvA6ygzo32e7wXNfF9K6Rqub/rz0/VzQrozguud+Dab7X5\\nYRPko+y3J2vhTCfnYstlv0ZVOmNU5rgR+goAUNMtB1wl0XxEdG9Q/c9HxNRqE85t\\ngaDog4mD+izkaB9+d8qkuxbRiRzx3wub/CaZXcP1Cd84j7Ocam+qIM345E2uHGzQ\\n33YzkE8jcyxryYoisP2wBib2//00G3ZLOVWSSI1hIL8HnvML0fob6l4rcJD9ELYD\\n0toW1qFZP3DjfHQJyWriVlDWtq0qAj6K0SC3ozy/kjrDZNhEQu8AX144naHPC2Di\\ndQGd8IyWtpv8BON5yujhu+ZPc3BP8LQ5q2QVhje6CpJVSOvtOvdTg3vzl5UxGgoQ\\nW/htx1huAjJo0YK8oTjAAKk8WHGKF5Ovmv7/5R4CN5G31vfLjwUyXTd5GIFunBDj\\n+a1eGIkYGwdUvLKGM+BW1Q/y0zbCqhmKrA0RTt1LsgLHBPp+TtdBbFsq2Pxv0ci7\\nP2ngpJli4Eb66JKsOt0Al0TKr93xcPVCEXfBS3OFH9lLtiplb3YG1GP7F34zUvZ6\\nB1pwI5zrou5C8xRUyVVx94p+2VK9ESaklJ42MbPmievuAwDwFhoKKzhmPzcCAwEA\\nAaNFMEMwEgYDVR0TAQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAQYwHQYDVR0O\\nBBYEFMZSGzmK6qdqvFrzXx9vFHIeJ5vaMA0GCSqGSIb3DQEBCwUAA4ICAQAVw6Jp\\nnMA1Zjeyn+4reLPaC8yM1wvKznkwvkQQyw3VyYMH1vldl/vY7ZcmoHXccd0Jher3\\neSJgL2cHhZg+UDRjjlEYNDXog47OCXj+uFXApaccF/gWAh0C3HSUunqkorQHJd0A\\n9ie4jSozZpADKGk9zLVVPhEedkbeleZNT7Y1XHOXBCOxXcJA+frYqnOcELtsSorQ\\njpX98g4QgHANIAvqmxGtqGMc7OuUIJqA+SQ3SogUrDkxDz/DjwqU/MyendILj4ue\\n8+1Prsd8gTgW1Q+2GkvSwUDOzfq2hS3GXznu7Kbb7ifcgaJaJ1dL906mhJO6YPwn\\nPfevdvDtK11tWeRzSlzMsndbgI5vER40SnQ2XHnMFAReX/0YQONnIuW0zJB544sh\\nvr+/za2PY376SLBPu2IbheHxquWlMl0cfnijQmBRMkcJXTsyLEZ59RvHO5UH/j0u\\nbNGxzRwG5PgLeaepeSPXw4624MCPyNPCnev4Dj4O7UC/LDS/paK75y73LWH4Ia+2\\ncJGmnZXlmjlnwrH0pxz2ZNxN2X8ObwxHGrHKzbyUuK7f46E+kM7TseLtZJRskDAt\\n5u4E8TAyuN+v0hMbJQonjDwzsF5u00BYX1jFdFdywcD2uPQw2cd0AvcdfjK/xJ2B\\nDs//pnrtrqAgZMV+2Oa1PP5jasyIAcMX+/MPWA==\\n-----END CERTIFICATE-----\\n", "orgname": "eventador_support's Team", "region": "aws:us-west-2", "notebook_password": "db70192c33544f54bfbed206d1ff4559", "deploymentname": "test2", "deploymentid": "368ca13592b04d0c8efe287a0fc9049b", "hostmap": {"kafka_discovery": "0fc9049b-kafka-discovery.cartera-usw2.eventador.io", "zookeeper": [{"zone": "us-west-2a", "ip": "10.20.0.37", "port": 2181, "host": "0fc9049b-zookeeper0.cartera-usw2.eventador.io", "version": "3.4.10", "id": "i-0d423cb910f464740"}], "jetty_auth": ["eventador", "c70cdf8ded63428f8a033c782a33df0d"], "sasl_super_password": "2ac56f80dd1e44968829a272eeb4b3a7", "kafka": [{"zone": "us-west-2a", "ip": "10.20.0.76", "port": 9092, "host": "0fc9049b-kafka0.cartera-usw2.eventador.io", "version": "1.1.0", "id": "i-0b4bf5f69efa8a2de"}], "node_exporter_port": 9100, "sasl_super_username": "0fc9049b_ev_a420f457c949"}, "orgid": "57e7836fe86144f3a97a102a528c91ad", "packageid": 1, "projects_deployment_secret": "f49fe260c37940e4a656f7b669c5fd63"}	Destroying deployment	5	11	aws:us-west-2
2018-06-20 18:50:49.283453	2018-06-20 18:50:49.283453	1	{"status": {"exception": "none", "details": {}, "last_stage": "successful"}, "ca_key": "-----BEGIN ENCRYPTED PRIVATE KEY-----\\n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\\nNN8Ul3TJhW2Zzp8HU1F6wQ==\\n-----END ENCRYPTED PRIVATE KEY-----\\n", "slack_ident": "57e7836fe86144f3a97a102a528c91ad 368ca13592b04d0c8efe287a0fc9049b(test2) 5", "aws_public_sg_id": "sg-0f3f990f2abc35740", "ca_cert": "-----BEGIN CERTIFICATE-----\\nMIIFKDCCAxCgAwIBAgIBATANBgkqhkiG9w0BAQsFADA0MTIwMAYDVQQDDCkwZmM5\\nMDQ5Yi1jYS5wdWIuY2FydGVyYS11c3cyLmV2ZW50YWRvci5pbzAeFw0xODA2MTgy\\nMjIwMzFaFw0yODA2MTUyMjIwMzFaMDQxMjAwBgNVBAMMKTBmYzkwNDliLWNhLnB1\\nYi5jYXJ0ZXJhLXVzdzIuZXZlbnRhZG9yLmlvMIICIjANBgkqhkiG9w0BAQEFAAOC\\nAg8AMIICCgKCAgEAyEZFYb4WIwN7AE4isxowutUfPq0Xd2D9HSmMaWD9MrgHT7Sa\\neWMUrOBXwbBYlA/rj/HvA6ygzo32e7wXNfF9K6Rqub/rz0/VzQrozguud+Dab7X5\\nYRPko+y3J2vhTCfnYstlv0ZVOmNU5rgR+goAUNMtB1wl0XxEdG9Q/c9HxNRqE85t\\ngaDog4mD+izkaB9+d8qkuxbRiRzx3wub/CaZXcP1Cd84j7Ocam+qIM345E2uHGzQ\\n33YzkE8jcyxryYoisP2wBib2//00G3ZLOVWSSI1hIL8HnvML0fob6l4rcJD9ELYD\\n0toW1qFZP3DjfHQJyWriVlDWtq0qAj6K0SC3ozy/kjrDZNhEQu8AX144naHPC2Di\\ndQGd8IyWtpv8BON5yujhu+ZPc3BP8LQ5q2QVhje6CpJVSOvtOvdTg3vzl5UxGgoQ\\nW/htx1huAjJo0YK8oTjAAKk8WHGKF5Ovmv7/5R4CN5G31vfLjwUyXTd5GIFunBDj\\n+a1eGIkYGwdUvLKGM+BW1Q/y0zbCqhmKrA0RTt1LsgLHBPp+TtdBbFsq2Pxv0ci7\\nP2ngpJli4Eb66JKsOt0Al0TKr93xcPVCEXfBS3OFH9lLtiplb3YG1GP7F34zUvZ6\\nB1pwI5zrou5C8xRUyVVx94p+2VK9ESaklJ42MbPmievuAwDwFhoKKzhmPzcCAwEA\\nAaNFMEMwEgYDVR0TAQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAQYwHQYDVR0O\\nBBYEFMZSGzmK6qdqvFrzXx9vFHIeJ5vaMA0GCSqGSIb3DQEBCwUAA4ICAQAVw6Jp\\nnMA1Zjeyn+4reLPaC8yM1wvKznkwvkQQyw3VyYMH1vldl/vY7ZcmoHXccd0Jher3\\neSJgL2cHhZg+UDRjjlEYNDXog47OCXj+uFXApaccF/gWAh0C3HSUunqkorQHJd0A\\n9ie4jSozZpADKGk9zLVVPhEedkbeleZNT7Y1XHOXBCOxXcJA+frYqnOcELtsSorQ\\njpX98g4QgHANIAvqmxGtqGMc7OuUIJqA+SQ3SogUrDkxDz/DjwqU/MyendILj4ue\\n8+1Prsd8gTgW1Q+2GkvSwUDOzfq2hS3GXznu7Kbb7ifcgaJaJ1dL906mhJO6YPwn\\nPfevdvDtK11tWeRzSlzMsndbgI5vER40SnQ2XHnMFAReX/0YQONnIuW0zJB544sh\\nvr+/za2PY376SLBPu2IbheHxquWlMl0cfnijQmBRMkcJXTsyLEZ59RvHO5UH/j0u\\nbNGxzRwG5PgLeaepeSPXw4624MCPyNPCnev4Dj4O7UC/LDS/paK75y73LWH4Ia+2\\ncJGmnZXlmjlnwrH0pxz2ZNxN2X8ObwxHGrHKzbyUuK7f46E+kM7TseLtZJRskDAt\\n5u4E8TAyuN+v0hMbJQonjDwzsF5u00BYX1jFdFdywcD2uPQw2cd0AvcdfjK/xJ2B\\nDs//pnrtrqAgZMV+2Oa1PP5jasyIAcMX+/MPWA==\\n-----END CERTIFICATE-----\\n", "orgname": "eventador_support's Team", "region": "aws:us-west-2", "notebook_password": "db70192c33544f54bfbed206d1ff4559", "deploymentname": "test2", "deploymentid": "368ca13592b04d0c8efe287a0fc9049b", "hostmap": {"kafka_discovery": "0fc9049b-kafka-discovery.cartera-usw2.eventador.io", "zookeeper": [{"zone": "us-west-2a", "ip": "10.20.0.37", "port": 2181, "host": "0fc9049b-zookeeper0.cartera-usw2.eventador.io", "version": "3.4.10", "id": "i-0d423cb910f464740"}], "jetty_auth": ["eventador", "c70cdf8ded63428f8a033c782a33df0d"], "sasl_super_password": "2ac56f80dd1e44968829a272eeb4b3a7", "kafka": [{"zone": "us-west-2a", "ip": "10.20.0.76", "port": 9092, "host": "0fc9049b-kafka0.cartera-usw2.eventador.io", "version": "1.1.0", "id": "i-0b4bf5f69efa8a2de"}], "node_exporter_port": 9100, "sasl_super_username": "0fc9049b_ev_a420f457c949"}, "orgid": "57e7836fe86144f3a97a102a528c91ad", "packageid": 1, "projects_deployment_secret": "f49fe260c37940e4a656f7b669c5fd63"}	Deleting stats services	6	205	aws:us-west-2
2018-06-20 18:59:34.160489	2018-06-20 19:01:04.589667	2	{"status": {"exception": "none", "details": {}, "last_stage": "successful"}, "ca_key": null, "slack_ident": "57e7836fe86144f3a97a102a528c91ad 10a26b3fd2914c88988732edce602a2e(test1) 7", "aws_public_sg_id": "sg-0f3f990f2abc35740", "ca_cert": null, "orgname": "eventador_support's Team", "region": "aws:us-west-2", "notebook_password": "5f9255f4676f4881a6a28054789f77c5", "deploymentname": "test1", "deploymentid": "10a26b3fd2914c88988732edce602a2e", "hostmap": null, "orgid": "57e7836fe86144f3a97a102a528c91ad", "packageid": 1, "projects_deployment_secret": "27a4925d37e4443c8ea729dee812f2b8"}	Destroying deployment	7	11	aws:us-west-2
2018-06-20 19:01:04.594956	2018-06-20 19:01:04.594956	1	{"status": {"exception": "none", "details": {}, "last_stage": "successful"}, "ca_key": null, "slack_ident": "57e7836fe86144f3a97a102a528c91ad 10a26b3fd2914c88988732edce602a2e(test1) 7", "aws_public_sg_id": "sg-0f3f990f2abc35740", "ca_cert": null, "orgname": "eventador_support's Team", "region": "aws:us-west-2", "notebook_password": "5f9255f4676f4881a6a28054789f77c5", "deploymentname": "test1", "deploymentid": "10a26b3fd2914c88988732edce602a2e", "hostmap": null, "orgid": "57e7836fe86144f3a97a102a528c91ad", "packageid": 1, "projects_deployment_secret": "27a4925d37e4443c8ea729dee812f2b8"}	Deleting stats services	8	205	aws:us-west-2
2018-10-03 22:22:44.896038	2018-10-03 22:22:44.896038	1	{"deploymentid":"00000000","userid":"00000000","additional_brokers":0,"target_versions":{"kafka":"2.0.0"},"package":[{"name":"kafka","type":"t2.medium","count":1,"data_disk_config":{"disk_size":25,"disk_type":"gp2"},"swap_disk_config":{"disk_size":4,"disk_type":"gp2"}},{"name":"zookeeper","type":"t2.medium","count":1,"data_disk_config":{"disk_size":25,"disk_type":"gp2"}}]}	\N	9	1000	aws:us-west-2
\.


--
-- Name: cloud_builder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eventador_admin
--

SELECT pg_catalog.setval('public.cloud_builder_id_seq', 9, true);


--
-- Data for Name: deployment_packages; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.deployment_packages (packageid, payload, style, active, deployable, subscriptioncost, scalable, description, tags, subdescription, components, planid, eventador_processing_units) FROM stdin;
10000	{"package": [{"name": "kafka", "type": "m4.xlarge", "count": 3, "data_disk_config": {"disk_size": 500, "disk_type": "gp2"}, "swap_disk_config": {"disk_size": 4, "disk_type": "gp2"}}, {"name": "zookeeper", "type": "m4.large", "count": 5, "data_disk_config": {"disk_size": 50, "disk_type": "gp2"}}]}	Apache Kafka	t	t	\N	t	Enterprise Generic Deployment Package	{prod}	3 Kafka Brokers, 5 Zookeeper Nodes	{kafka}	\N	\N
1	{"package": [{"name": "kafka", "type": "t2.medium", "count": 1, "data_disk_config": {"disk_size": 25, "disk_type": "gp2"}, "swap_disk_config": {"disk_size": 4, "disk_type": "gp2"}}, {"name": "zookeeper", "type": "t2.medium", "count": 1, "data_disk_config": {"disk_size": 25, "disk_type": "gp2"}}]}	JMO Testing	t	t	\N	t	Enterprise Generic Deployment Package	{prod}	1 Kafka Brokers, 1 Zookeeper Nodes	{kafka}	\N	\N
\.


--
-- Data for Name: deployment_packages_backup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deployment_packages_backup (packageid, payload, style) FROM stdin;
\.


--
-- Data for Name: deployment_packages_bak; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deployment_packages_bak (packageid, payload, style, active, deployable, subscriptioncost, scalable) FROM stdin;
\.


--
-- Name: deployment_packages_seq; Type: SEQUENCE SET; Schema: public; Owner: eventador_admin
--

SELECT pg_catalog.setval('public.deployment_packages_seq', 1, false);


--
-- Data for Name: deployments; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.deployments (deploymentid, deploymentname, orgid, status, packageid, vpcid, dtcreated, hostmap, aws_public_sg_id, ca_cert, ca_key, progress, notebook_password, region, stripe_subscriptionid, description, dttrialexpire, dtfreeexpire, projects_deployment_secret, dtdeleted) FROM stdin;
368ca13592b04d0c8efe287a0fc9049b	test2	57e7836fe86144f3a97a102a528c91ad	Deleted	1	1	2018-06-18 22:18:59.840559	{"node_exporter_port": 9100, "kafka_discovery": "0fc9049b-kafka-discovery.cartera-usw2.eventador.io", "sasl_super_username": "0fc9049b_ev_a420f457c949", "sasl_super_password": "2ac56f80dd1e44968829a272eeb4b3a7", "zookeeper": [{"zone": "us-west-2a", "ip": "10.20.0.37", "id": "i-0d423cb910f464740", "host": "0fc9049b-zookeeper0.cartera-usw2.eventador.io", "version": "3.4.10", "port": 2181}], "jetty_auth": ["eventador", "c70cdf8ded63428f8a033c782a33df0d"], "kafka": [{"zone": "us-west-2a", "ip": "10.20.0.76", "id": "i-0b4bf5f69efa8a2de", "host": "0fc9049b-kafka0.cartera-usw2.eventador.io", "version": "1.1.0", "port": 9092}]}	sg-0f3f990f2abc35740	\N	\N	100	db70192c33544f54bfbed206d1ff4559	aws:us-west-2	\N		2018-07-18 22:18:59.840559	2018-09-16 22:18:59.840559	f49fe260c37940e4a656f7b669c5fd63	2018-06-20 18:49:21.264812
10a26b3fd2914c88988732edce602a2e	test1	57e7836fe86144f3a97a102a528c91ad	Deleted	1	1	2018-06-18 22:11:25.578181	\N	sg-0f3f990f2abc35740	\N	\N	65	5f9255f4676f4881a6a28054789f77c5	aws:us-west-2	\N		2018-07-18 22:11:25.578181	2018-09-16 22:11:25.578181	27a4925d37e4443c8ea729dee812f2b8	2018-06-20 18:59:34.141066
00000000                        	test_ev8s_0	87654321                        	Active	10000	2	2018-10-03 22:21:11.620349	\N	\N	\N	\N	5	notebook	aws:us-west-2	\N		2018-11-02 22:21:11.620349	2019-01-01 22:21:11.620349	project                         	\N
\.


--
-- Data for Name: deployments_backup_emb_20170105; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.deployments_backup_emb_20170105 (deploymentid, deploymentname, orgid, status, packageid, vpcid, dtcreated, hostmap, aws_public_sg_id, ca_cert, ca_key, progress, notebook_password, region) FROM stdin;
\.


--
-- Data for Name: deployments_backup_emb_20171206; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.deployments_backup_emb_20171206 (deploymentid, deploymentname, orgid, status, packageid, vpcid, dtcreated, hostmap, aws_public_sg_id, ca_cert, ca_key, progress, notebook_password, region, stripe_subscriptionid, description, dttrialexpire, dtfreeexpire, projects_deployment_secret) FROM stdin;
\.


--
-- Data for Name: enterprise_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enterprise_log (orgid, dtcreated, payload) FROM stdin;
\.


--
-- Data for Name: enterprise_map; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.enterprise_map (name, customer_id, environment_id, environment_dc, partition, orgid, org_uri, org_api_key) FROM stdin;
\.


--
-- Data for Name: ev8s_agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ev8s_agent (id, agent_api_key, agent_private_key, dns_api_key, dns_zone, metadata, active, created, updated, dt_last_api_poll, dt_last_dns_poll) FROM stdin;
1	2aa1b73ecc154213b30478900281e13a	-----BEGIN EC PRIVATE KEY-----\\nMIHcAgEBBEIBfveTvDwVa2oKBJT9Z72fa3StuA8jb6HpPRoE3qTsqhzUY7RN59e8\\n2XAgwZl3usCSVU08zfyLQxEiF23Tly5+EBSgBwYFK4EEACOhgYkDgYYABAG73v6J\\nUiKsUm7q7fzT39Er53oMrVP8UVMxSLCf7oO3vQqrPUiPrA9PAdwsBn1Jqd7++lu6\\nowSZp5by5569cQCwkQBPMVyigHFhUbzjCT1wlUh20Z3JQccjMbumCIAuZ24mBZ6I\\npSp+iL7U/1sgBI26NJFuEQme9ZfQ205Zn7A+K70TEQ==\\n-----END EC PRIVATE KEY-----\\n	74001e69de6a477cb01b65fbe047a865	aws-a.evstreams.net	{"key_name": "entc000_ev8s_key", "subnet_ids_csv": "subnet-0be16c2bbcc375aeb,subnet-023965c9b4e3ced83,subnet-0209328d9822ad337", "dns_api_endpoint": "entc000-dns.api.eventador.io", "eks_cluster_name": "entc000_ev8s", "ev8s_api_endpoint": "entc000-ev8s.api.eventador.io", "eks_cluster_region": "us-west-2", "agent_public_key_pem": "-----BEGIN PUBLIC KEY-----\\nMIGbMBAGByqGSM49AgEGBSuBBAAjA4GGAAQBu97+iVIirFJu6u3809/RK+d6DK1T\\n/FFTMUiwn+6Dt70Kqz1Ij6wPTwHcLAZ9Sane/vpbuqMEmaeW8ueevXEAsJEATzFc\\nooBxYVG84wk9cJVIdtGdyUHHIzG7pgiALmduJgWeiKUqfoi+1P9bIASNujSRbhEJ\\nnvWX0NtOWZ+wPiu9ExE=\\n-----END PUBLIC KEY-----\\n", "eks_cluster_endpoint": "https://6FE2CBAFAD504B59B95D7DB113FDE829.yl4.us-west-2.eks.amazonaws.com", "component_security_groups": ["sg-04a19f1ac0932a302", "sg-0c94e0300458d8323", "sg-0cdab275bdd5c1ede"], "eks_cluster_ca_cert_base64": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRFNE1Ea3hOekUxTURReU0xb1hEVEk0TURreE5ERTFNRFF5TTFvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTHZKClc1V3JCMHo2SElnZ0o1VEc4NEVOa2lxM3Q4eDlqWXlnK3MvTTlnUTN2ekZBb0tOODd6UWI0TTVId0xKMWxUa0MKdDhqSHN2ZVhlVVduREhkYU16c2tjVnlsOWFNK0ZibFBwenM2OGRyU3QyVGNxTERMRVBiUzhEOVFucytYVDN0SAozaFFkRWJadDBKNFVZZmUvU3M2OUhMd21wZTBxWkFBZkFNYmhJb2VXalVxemdFa2orL1hTdmZHZmxDWTJmSUNGCllIMk8wcENMekgwc1UycHhXUldOOVdRWVlSTnpERjQzSUwxYjRMd3FXMFVtZ1RBbmNRNktjRm9POUpNaUlHUFQKNWJzVERRMmpyMGdUdzAwKzV3MHV4RGV2SzlWTGpka3NyMDZ6aDZ5RFBvaURmK09hOUlOcHhGeHV2bkJQTFVqdApzKzBaOEpjUjA1SHhKMTgrWEpNQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFHZXhnZEg3ZDhsNlVtbW16TnBDTHZidzZXT2QKSkM2bFhLaXNDMCt6UmRxNnMxdDJaK2MweVgzZytlNE5ONzd3cW9FdVU3VGtwdGtvbVNhcE4zdytQNWxEMVpqUApjUHJxZUlTdjVqRXhPYnl3emVJWW02aVR6UHdPcTV5TjFua01RYUttTExzaDVEeCtyekx0MGhHMUlMdWlEOGxTCjBGckpXbTFacnI3WTd5SHBEUkJXSFhjdC95L1ZQOGJvWDk2V0JmOTRmemp3a3ZtTGtVaWNxNnZCbVZUYnlkRXoKUUptelQvU3BkWVoyMGdXVmovSjlsa2k1M2tpdUo1VjRFMUtpOWdzenNjK01meno0cTdxZFJKempObFAxUlkrRgpybTNXQnc3VklmVThmTmU4YzlielJOWFgzS3NYK2JjcDBhQkpnUTkwZ25JMnJ6elhEd1RyQWtPYy9ZST0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="}	t	2018-09-21 21:03:33.102127	2018-09-21 21:03:33.102127	\N	\N
\.


--
-- Name: ev8s_agent_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ev8s_agent_seq', 1, true);


--
-- Data for Name: ev8s_builder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ev8s_builder (id, workid, deploymentid, orgid, vpcid, payload, status_code, created, updated) FROM stdin;
\.


--
-- Name: ev8s_builder_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ev8s_builder_seq', 1, false);


--
-- Data for Name: ev8s_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ev8s_results (id, workid, taskid, vpcid, payload, success, created) FROM stdin;
\.


--
-- Name: ev8s_results_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ev8s_results_seq', 1, false);


--
-- Data for Name: ev_configs; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.ev_configs (environment, config_json) FROM stdin;
\.


--
-- Data for Name: foo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.foo (id) FROM stdin;
\.


--
-- Data for Name: ipset_acls_queue; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.ipset_acls_queue (id, host, container_name, cidrmask, processed, dtcreated, action, region) FROM stdin;
\.


--
-- Name: ipset_acls_queue_seq; Type: SEQUENCE SET; Schema: public; Owner: eventador_admin
--

SELECT pg_catalog.setval('public.ipset_acls_queue_seq', 1, false);


--
-- Data for Name: kg_orgs_bak; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kg_orgs_bak (orgid, orgname, internal, billing_method, force_premium, stripe_billing_method, org_type, org_uri, org_api_key) FROM stdin;
\.


--
-- Data for Name: metadata_backup; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.metadata_backup (mbid, type, subtype, dtbackedup, data, description) FROM stdin;
\.


--
-- Name: metadata_backup_seq; Type: SEQUENCE SET; Schema: public; Owner: eventador_admin
--

SELECT pg_catalog.setval('public.metadata_backup_seq', 1, false);


--
-- Data for Name: nb_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nb_users (userid, username, password, deployment_short, deploymentid) FROM stdin;
\.


--
-- Name: nb_users_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nb_users_seq', 1, false);


--
-- Data for Name: orgs; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.orgs (orgid, orgname, internal, billing_method, force_premium, stripe_billing_method) FROM stdin;
57e7836fe86144f3a97a102a528c91ad	eventador_support's Team	f	Invoiced	f	\N
393cd6b7937c4726ba499d8b22c74605	eventador_jmo1's Team	f	stripe	f	\N
5105eacfb11546699d1fd1f330fc7a70	eventador_emb's Team	f	stripe	f	\N
c016c47185b442dcb2a27b8226b5dfbb	eventador_jmo2's Team	f	stripe	f	\N
a2bff4bcef6d4338ab1af39e44f8cfa3	eventador_jmo3's Team	f	stripe	f	\N
87654321	ev8s_dev's Team	f	Invoiced	f	\N
\.


--
-- Data for Name: orgs_invites; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.orgs_invites (orgid, access_level, userid, invited_by_userid, invited_date, accepted, ignored) FROM stdin;
\.


--
-- Data for Name: orgs_permissions_map; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.orgs_permissions_map (orgid, userid, access_level) FROM stdin;
57e7836fe86144f3a97a102a528c91ad	cd1866b3c2004fbebcc6bccd77fdf686    	owner
393cd6b7937c4726ba499d8b22c74605	a9e54733056d4a538fc6fb31c1e796f2    	owner
57e7836fe86144f3a97a102a528c91ad	a9e54733056d4a538fc6fb31c1e796f2    	member
5105eacfb11546699d1fd1f330fc7a70	18d1d752e6ef487d93dba2aeb29f8103    	owner
c016c47185b442dcb2a27b8226b5dfbb	a1f9e3ac914945b6902637d0170c7e82    	owner
57e7836fe86144f3a97a102a528c91ad	a1f9e3ac914945b6902637d0170c7e82    	member
87654321                        	cd1866b3c2004fbebcc6bccd77fdf686    	admin
87654321                        	00000000                            	owner
\.


--
-- Data for Name: pipelines; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.pipelines (userid, namespace, customer_database_config, apikey, customer_schema_config, schema_created, dtcreated, api_endpoint, description, status, dtupdated, deploymentid) FROM stdin;
\.


--
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plans (planid, description, hourly_price) FROM stdin;
\.


--
-- Data for Name: plans_packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plans_packages (planid, packageid) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.projects (projectid, projectname, orgid, created_date, last_deploy_qa, last_deploy_production, github_repo, last_deployed_commit, description, github_secret, github_url, project_builder_secret, github_repo_id, github_ssh_url, github_https_url, github_org_name, status, default_arguments, default_entrypoint, deploy_key_public, deploy_key_private) FROM stdin;
\.


--
-- Data for Name: projects_deployments_map; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.projects_deployments_map (deploymentid, projectid, created_date, last_log_offset, status, last_deploy, deployed_version, arguments, classname, auto_deploy, parallelism, log_offsets, build_id, job_id, arguments_unparsed) FROM stdin;
\.


--
-- Data for Name: projects_deployments_map_emb_20171214; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.projects_deployments_map_emb_20171214 (deploymentid, projectid, created_date, last_log_offset, status, last_deploy, deployed_version, arguments, classname, auto_deploy, parallelism, log_offsets, build_id, job_id, arguments_unparsed) FROM stdin;
\.


--
-- Data for Name: projects_emb_20171214; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.projects_emb_20171214 (projectid, projectname, orgid, created_date, last_deploy_qa, last_deploy_production, github_repo, last_deployed_commit, description, github_secret, github_url, project_builder_secret, github_repo_id, github_ssh_url, github_https_url, github_org_name, status, default_arguments, default_entrypoint, deploy_key_public, deploy_key_private) FROM stdin;
\.


--
-- Name: projects_seq; Type: SEQUENCE SET; Schema: public; Owner: eventador_admin
--

SELECT pg_catalog.setval('public.projects_seq', 1, false);


--
-- Data for Name: projects_templates; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.projects_templates (template_id, template_name, template_source_url, template_language, is_paid, created_date, arguments, entrypoint) FROM stdin;
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (regionid, regionname, description) FROM stdin;
1	aws:us-west-2	Amazon AWS Us-West (Oregon)
\.


--
-- Name: regions_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_seq', 1, true);


--
-- Data for Name: sales_leads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_leads (orgname, url, "desc", status, contact, title, email, phone) FROM stdin;
\.


--
-- Data for Name: sales_leads_archive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_leads_archive (orgname, url, "desc", status, contact, title, email, phone) FROM stdin;
\.


--
-- Data for Name: software_versions; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.software_versions (name, version, isdefault, active, tags, description) FROM stdin;
kafka	1.1.0	t	t	{dev,stage,prod}	\N
\.


--
-- Data for Name: stacks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stacks (stackid, deploymentid, stackname, stacktype, status, dtcreated, payload, description, displayname, region) FROM stdin;
\.


--
-- Data for Name: stripe_orgs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stripe_orgs (orgid, payload) FROM stdin;
\.


--
-- Data for Name: stripe_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stripe_subscriptions (deploymentid, stripe_subscriptionid, payload) FROM stdin;
\.


--
-- Data for Name: user_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_log (user_logid, action, value, dtcreated, userid) FROM stdin;
\.


--
-- Name: user_log_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_log_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.users (userid, firstname, lastname, email, password, username, is_active, orgid, wiz_step, isverified, verification_key, dtcreated, dashboard_preferences, internal, stripeid, pw_reset_key, github_token, primary_orgid, github_id, campaign) FROM stdin;
cd1866b3c2004fbebcc6bccd77fdf686	Eventador	Support	support@eventador.io	$2b$12$aTf8W1v.1KIXyRKoviaMZeoOIG7sOQqM196iU3qJNO/G91lOkaTDG	eventador_support	t	57e7836fe86144f3a97a102a528c91ad	0	t	InN1cHBvcnRAZXZlbnRhZG9yLmlvIg.DGKfaQ.v7KUjyRNogMtn7CpS7m_jKXiGTc	2018-06-18 21:42:30.480765	\N	f	cus_B8Qb9cpTxjdBwB	\N	\N	57e7836fe86144f3a97a102a528c91ad	\N	\N
a9e54733056d4a538fc6fb31c1e796f2	John	Moore	john+jmo1@eventador.io	$2b$12$tn8/IjJihMrHlw29j3lwMeMJF/rvf1wznf2cwKowwt2zDv.ycxmMS	eventador_jmo1	t	393cd6b7937c4726ba499d8b22c74605	0	t	enterprise	2018-08-08 03:33:22.358729	\N	f	\N	\N	\N	393cd6b7937c4726ba499d8b22c74605	\N	manual
18d1d752e6ef487d93dba2aeb29f8103	Erik	Beebe	erik+eventadoremb@beebe.cc	$2b$12$m05CeiuEiYqxrBt5m14bceW2KwJxifQ6WUA0eVqFJlKPmM2.eT.Uy	eventador_emb	t	5105eacfb11546699d1fd1f330fc7a70	0	t	enterprise	2018-08-08 16:43:12.451727	\N	f	\N	\N	\N	5105eacfb11546699d1fd1f330fc7a70	\N	manual
a1f9e3ac914945b6902637d0170c7e82	John	Moore	john+jmo2@eventador.io	$2b$12$1XYEmAQLUDF24cppKTVlrOLGGzAycxjnNxCzOvleARgpz4W9NsTm2	eventador_jmo2	t	57e7836fe86144f3a97a102a528c91ad	0	t	enterprise	2018-08-08 17:07:57.573742	\N	f	\N	\N	\N	c016c47185b442dcb2a27b8226b5dfbb	\N	manual
00000000                        	Ev8s	Dev	john+c000_ev8s_dev@eventador.io	$2b$12$aTf8W1v.1KIXyRKoviaMZeoOIG7sOQqM196iU3qJNO/G91lOkaTDG	ev8s_dev	t	87654321                        	0	f	verification	2018-10-03 21:24:00.678272	\N	f	cus_B8Qb9cpTxjdBwB	\N	\N	ffffff00                        	\N	manual
\.


--
-- Data for Name: users_back; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_back (userid, firstname, lastname, email, password, username, is_active, orgid, wiz_step, isverified, verification_key, dtcreated) FROM stdin;
\.


--
-- Data for Name: users_backup_20170515; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.users_backup_20170515 (userid, firstname, lastname, email, password, username, is_active, orgid, wiz_step, isverified, verification_key, dtcreated, dashboard_preferences, internal, stripeid, pw_reset_key, github_token) FROM stdin;
\.


--
-- Data for Name: users_bak; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_bak (userid, firstname, lastname, email, password, username, is_active, orgid) FROM stdin;
\.


--
-- Data for Name: users_pre_uniq_email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_pre_uniq_email (userid, firstname, lastname, email, password, username, is_active, orgid, wiz_step, isverified, verification_key, dtcreated, dashboard_preferences, internal, stripeid, pw_reset_key, github_token) FROM stdin;
\.


--
-- Data for Name: vpcs; Type: TABLE DATA; Schema: public; Owner: eventador_admin
--

COPY public.vpcs (vpcid, subnet, aws_vpc_id, orgid, vpc_resources, region, agent_id) FROM stdin;
1	10.20.0.0/16	vpc-0c4990420d2fd1acc	57e7836fe86144f3a97a102a528c91ad	\N	aws:us-west-2	\N
2	192.168.200.0/21	vpc-08681625256afce58	87654321                        	{}	aws:us-west-2	1
\.


--
-- Name: vpcs_seq; Type: SEQUENCE SET; Schema: public; Owner: eventador_admin
--

SELECT pg_catalog.setval('public.vpcs_seq', 2, true);


--
-- Name: acls acls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acls
    ADD CONSTRAINT acls_pkey PRIMARY KEY (aclid);


--
-- Name: beta_users beta_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beta_users
    ADD CONSTRAINT beta_users_pkey PRIMARY KEY (betaid);


--
-- Name: build_reservations build_reservations_pk; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.build_reservations
    ADD CONSTRAINT build_reservations_pk PRIMARY KEY (reservationid);


--
-- Name: checkouts checkouts_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.checkouts
    ADD CONSTRAINT checkouts_pkey PRIMARY KEY (checkoutid);


--
-- Name: client_certs client_certs_pk; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.client_certs
    ADD CONSTRAINT client_certs_pk PRIMARY KEY (certid);


--
-- Name: cloud_builder cloud_builder_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.cloud_builder
    ADD CONSTRAINT cloud_builder_pkey PRIMARY KEY (id);


--
-- Name: deployment_packages deployment_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.deployment_packages
    ADD CONSTRAINT deployment_packages_pkey PRIMARY KEY (packageid);


--
-- Name: deployments deployments_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.deployments
    ADD CONSTRAINT deployments_pkey PRIMARY KEY (deploymentid);


--
-- Name: ev8s_agent ev8s_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev8s_agent
    ADD CONSTRAINT ev8s_agent_pkey PRIMARY KEY (id);


--
-- Name: ev8s_builder ev8s_builder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev8s_builder
    ADD CONSTRAINT ev8s_builder_pkey PRIMARY KEY (id);


--
-- Name: ev8s_results ev8s_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev8s_results
    ADD CONSTRAINT ev8s_results_pkey PRIMARY KEY (id);


--
-- Name: ipset_acls_queue ipset_acls_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.ipset_acls_queue
    ADD CONSTRAINT ipset_acls_queue_pkey PRIMARY KEY (id);


--
-- Name: metadata_backup metadata_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.metadata_backup
    ADD CONSTRAINT metadata_backup_pkey PRIMARY KEY (mbid);


--
-- Name: nb_users nb_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nb_users
    ADD CONSTRAINT nb_users_pkey PRIMARY KEY (userid);


--
-- Name: orgs orgname; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.orgs
    ADD CONSTRAINT orgname UNIQUE (orgname);


--
-- Name: orgs_invites orgs_invites_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.orgs_invites
    ADD CONSTRAINT orgs_invites_pkey PRIMARY KEY (orgid, userid);


--
-- Name: orgs_permissions_map orgs_permissions_map_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.orgs_permissions_map
    ADD CONSTRAINT orgs_permissions_map_pkey PRIMARY KEY (orgid, userid);


--
-- Name: orgs orgs_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.orgs
    ADD CONSTRAINT orgs_pkey PRIMARY KEY (orgid);


--
-- Name: pipelines pipelines_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.pipelines
    ADD CONSTRAINT pipelines_pkey PRIMARY KEY (userid, namespace, status);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (projectid);


--
-- Name: stacks stacks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stacks
    ADD CONSTRAINT stacks_pkey PRIMARY KEY (stackid);


--
-- Name: stripe_orgs stripe_orgs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stripe_orgs
    ADD CONSTRAINT stripe_orgs_pkey PRIMARY KEY (orgid);


--
-- Name: stripe_subscriptions stripe_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stripe_subscriptions
    ADD CONSTRAINT stripe_subscriptions_pkey PRIMARY KEY (deploymentid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: vpcs vpcs_pkey; Type: CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.vpcs
    ADD CONSTRAINT vpcs_pkey PRIMARY KEY (vpcid);


--
-- Name: acls_region_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX acls_region_i ON public.acls USING btree (region);


--
-- Name: build_reservations_component_deployment_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX build_reservations_component_deployment_i ON public.build_reservations USING btree (deploymentid, component);


--
-- Name: checkedout_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX checkedout_i ON public.checkouts USING btree (checkedout);


--
-- Name: checkouts_region_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX checkouts_region_i ON public.checkouts USING btree (region);


--
-- Name: cloud_builder_message_type_status_code_idx; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX cloud_builder_message_type_status_code_idx ON public.cloud_builder USING btree (message_type, status_code);


--
-- Name: cloud_builder_region_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX cloud_builder_region_i ON public.cloud_builder USING btree (region);


--
-- Name: deployment_short_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deployment_short_i ON public.nb_users USING btree (deployment_short);


--
-- Name: deploymentid_status_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deploymentid_status_i ON public.acls USING btree (deploymentid, status);


--
-- Name: deployments_region_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX deployments_region_i ON public.deployments USING btree (region);


--
-- Name: ev8s_agent_agent_api_key_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ev8s_agent_agent_api_key_i ON public.ev8s_agent USING btree (agent_api_key);


--
-- Name: ev8s_agent_dns_api_key_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ev8s_agent_dns_api_key_i ON public.ev8s_agent USING btree (dns_api_key);


--
-- Name: ev8s_builder_deploymentid_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ev8s_builder_deploymentid_i ON public.ev8s_builder USING btree (deploymentid);


--
-- Name: ev8s_builder_vpcid_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ev8s_builder_vpcid_i ON public.ev8s_builder USING btree (vpcid);


--
-- Name: ev8s_builder_vpcid_status_code_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ev8s_builder_vpcid_status_code_i ON public.ev8s_builder USING btree (vpcid, status_code);


--
-- Name: ev8s_builder_workid_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ev8s_builder_workid_i ON public.ev8s_builder USING btree (workid);


--
-- Name: ev8s_results_vpcid_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ev8s_results_vpcid_i ON public.ev8s_results USING btree (vpcid);


--
-- Name: ev8s_results_workid_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ev8s_results_workid_i ON public.ev8s_results USING btree (workid);


--
-- Name: host_container_name_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX host_container_name_i ON public.acls USING btree (host, container_name);


--
-- Name: host_name_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE UNIQUE INDEX host_name_i ON public.checkouts USING btree (host, container_name);


--
-- Name: ipset_acls_queue_region_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX ipset_acls_queue_region_i ON public.ipset_acls_queue USING btree (region);


--
-- Name: orgs_permissions_map_orgid_idx; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX orgs_permissions_map_orgid_idx ON public.orgs_permissions_map USING btree (orgid);


--
-- Name: orgs_permissions_map_userid_idx; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX orgs_permissions_map_userid_idx ON public.orgs_permissions_map USING btree (userid);


--
-- Name: projects_status_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX projects_status_i ON public.projects USING btree (status);


--
-- Name: stacks_region_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stacks_region_i ON public.stacks USING btree (region);


--
-- Name: username_deployment_short_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX username_deployment_short_i ON public.nb_users USING btree (username, deployment_short);


--
-- Name: users_email_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX users_email_i ON public.users USING btree (email);


--
-- Name: users_email_isactive_uniq; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE UNIQUE INDEX users_email_isactive_uniq ON public.users USING btree (email, is_active);


--
-- Name: users_github_id_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX users_github_id_i ON public.users USING btree (github_id);


--
-- Name: users_github_token_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX users_github_token_i ON public.users USING btree (github_token);


--
-- Name: users_primary_orgid_uniq; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE UNIQUE INDEX users_primary_orgid_uniq ON public.users USING btree (primary_orgid);


--
-- Name: vpcs_orgid_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX vpcs_orgid_i ON public.vpcs USING btree (orgid);


--
-- Name: vpcs_region_i; Type: INDEX; Schema: public; Owner: eventador_admin
--

CREATE INDEX vpcs_region_i ON public.vpcs USING btree (region);


--
-- Name: build_reservations build_reservations_deploymentid_fk; Type: FK CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.build_reservations
    ADD CONSTRAINT build_reservations_deploymentid_fk FOREIGN KEY (deploymentid) REFERENCES public.deployments(deploymentid);


--
-- Name: checkouts checkouts_deploymentid_fk; Type: FK CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.checkouts
    ADD CONSTRAINT checkouts_deploymentid_fk FOREIGN KEY (deploymentid) REFERENCES public.deployments(deploymentid);


--
-- Name: checkouts checkouts_orgid_fk; Type: FK CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.checkouts
    ADD CONSTRAINT checkouts_orgid_fk FOREIGN KEY (orgid) REFERENCES public.orgs(orgid);


--
-- Name: client_certs client_certs_deploymentid_fk; Type: FK CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.client_certs
    ADD CONSTRAINT client_certs_deploymentid_fk FOREIGN KEY (deploymentid) REFERENCES public.deployments(deploymentid);


--
-- Name: stacks deployment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stacks
    ADD CONSTRAINT deployment_fk FOREIGN KEY (deploymentid) REFERENCES public.deployments(deploymentid) ON DELETE CASCADE;


--
-- Name: acls deploymentid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acls
    ADD CONSTRAINT deploymentid_fk FOREIGN KEY (deploymentid) REFERENCES public.deployments(deploymentid);


--
-- Name: deployments deployments_orgid_fk; Type: FK CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.deployments
    ADD CONSTRAINT deployments_orgid_fk FOREIGN KEY (orgid) REFERENCES public.orgs(orgid) MATCH FULL;


--
-- Name: deployments deployments_packageid_fk; Type: FK CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.deployments
    ADD CONSTRAINT deployments_packageid_fk FOREIGN KEY (packageid) REFERENCES public.deployment_packages(packageid);


--
-- Name: deployments deployments_vpcid_fk; Type: FK CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.deployments
    ADD CONSTRAINT deployments_vpcid_fk FOREIGN KEY (vpcid) REFERENCES public.vpcs(vpcid);


--
-- Name: pipelines deploymentsid_fk; Type: FK CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.pipelines
    ADD CONSTRAINT deploymentsid_fk FOREIGN KEY (deploymentid) REFERENCES public.deployments(deploymentid);


--
-- Name: ev8s_builder ev8s_builder_deploymentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev8s_builder
    ADD CONSTRAINT ev8s_builder_deploymentid_fkey FOREIGN KEY (deploymentid) REFERENCES public.deployments(deploymentid);


--
-- Name: ev8s_builder ev8s_builder_orgid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev8s_builder
    ADD CONSTRAINT ev8s_builder_orgid_fkey FOREIGN KEY (orgid) REFERENCES public.orgs(orgid);


--
-- Name: ev8s_builder ev8s_builder_vpcid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev8s_builder
    ADD CONSTRAINT ev8s_builder_vpcid_fkey FOREIGN KEY (vpcid) REFERENCES public.vpcs(vpcid);


--
-- Name: ev8s_results ev8s_results_workid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev8s_results
    ADD CONSTRAINT ev8s_results_workid_fkey FOREIGN KEY (workid) REFERENCES public.ev8s_builder(workid);


--
-- Name: nb_users nb_users_deployment_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nb_users
    ADD CONSTRAINT nb_users_deployment_id_fk FOREIGN KEY (deploymentid) REFERENCES public.deployments(deploymentid);


--
-- Name: users orgid; Type: FK CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT orgid FOREIGN KEY (orgid) REFERENCES public.orgs(orgid) MATCH FULL;


--
-- Name: pipelines userid; Type: FK CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.pipelines
    ADD CONSTRAINT userid FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: vpcs vpcs_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eventador_admin
--

ALTER TABLE ONLY public.vpcs
    ADD CONSTRAINT vpcs_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.ev8s_agent(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

