--
-- PostgreSQL database dump
--

\restrict vQdfBn1QF6rZugdysO1Qwlr16vxPbImX7uLOQitsrXc3VffNYOlqds1ByscDEhV

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-06-08 12:52:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 251 (class 1259 OID 25779)
-- Name: admin_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_team (
    admin_id integer NOT NULL,
    admin_type character varying(20) NOT NULL,
    admin_email character varying(255) NOT NULL,
    admin_pass character varying(255) NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT admin_team_admin_type_check CHECK (((admin_type)::text = ANY ((ARRAY['main-dev'::character varying, 'auditor'::character varying, 'sub-dev'::character varying])::text[])))
);


ALTER TABLE public.admin_team OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25278)
-- Name: customer_enquiries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_enquiries (
    enquiry_id integer NOT NULL,
    user_type character varying(100),
    contact character varying(20),
    email character varying(100),
    message text,
    date_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.customer_enquiries OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25277)
-- Name: customer_enquiries_enquiry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_enquiries_enquiry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_enquiries_enquiry_id_seq OWNER TO postgres;

--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 219
-- Name: customer_enquiries_enquiry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_enquiries_enquiry_id_seq OWNED BY public.customer_enquiries.enquiry_id;


--
-- TOC entry 250 (class 1259 OID 25751)
-- Name: customer_purchase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_purchase (
    cid integer,
    item_id integer,
    pid integer,
    pay_method integer,
    warr_or_exc integer,
    amount_paid numeric(10,2),
    purchase_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.customer_purchase OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 25664)
-- Name: customer_reg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_reg (
    cid integer NOT NULL,
    cname character varying(40) NOT NULL,
    cmobile character varying(14) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.customer_reg OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 25663)
-- Name: customer_reg_cid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_reg_cid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_reg_cid_seq OWNER TO postgres;

--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 238
-- Name: customer_reg_cid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_reg_cid_seq OWNED BY public.customer_reg.cid;


--
-- TOC entry 249 (class 1259 OID 25729)
-- Name: deliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliveries (
    delivery_id integer NOT NULL,
    delivery_date date,
    item_id integer,
    delivery_status_id integer,
    pay_status_id integer
);


ALTER TABLE public.deliveries OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 25728)
-- Name: deliveries_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deliveries_delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deliveries_delivery_id_seq OWNER TO postgres;

--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 248
-- Name: deliveries_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deliveries_delivery_id_seq OWNED BY public.deliveries.delivery_id;


--
-- TOC entry 247 (class 1259 OID 25719)
-- Name: delivery_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_status (
    id integer NOT NULL,
    delivery_status character varying(20) NOT NULL,
    CONSTRAINT delivery_status_delivery_status_check CHECK (((delivery_status)::text = ANY ((ARRAY['dispatched'::character varying, 'received'::character varying, 'cancelled'::character varying, 'undelivered'::character varying])::text[])))
);


ALTER TABLE public.delivery_status OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 25718)
-- Name: delivery_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.delivery_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.delivery_status_id_seq OWNER TO postgres;

--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 246
-- Name: delivery_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.delivery_status_id_seq OWNED BY public.delivery_status.id;


--
-- TOC entry 230 (class 1259 OID 25587)
-- Name: item_exchange_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_exchange_status (
    id integer NOT NULL,
    exchange_status character varying(20) NOT NULL,
    CONSTRAINT item_exchange_status_exchange_status_check CHECK (((exchange_status)::text = ANY ((ARRAY['applicable'::character varying, 'not_applicable'::character varying])::text[])))
);


ALTER TABLE public.item_exchange_status OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25586)
-- Name: item_exchange_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_exchange_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_exchange_status_id_seq OWNER TO postgres;

--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 229
-- Name: item_exchange_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_exchange_status_id_seq OWNED BY public.item_exchange_status.id;


--
-- TOC entry 234 (class 1259 OID 25629)
-- Name: item_listing_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_listing_inventory (
    id integer NOT NULL,
    item_size integer,
    image_url character varying(255),
    quantity integer NOT NULL,
    item_name character varying(255)
);


ALTER TABLE public.item_listing_inventory OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25628)
-- Name: item_listing_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_listing_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_listing_inventory_id_seq OWNER TO postgres;

--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 233
-- Name: item_listing_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_listing_inventory_id_seq OWNED BY public.item_listing_inventory.id;


--
-- TOC entry 237 (class 1259 OID 25655)
-- Name: item_names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_names (
    id integer,
    item_name character varying(255)
);


ALTER TABLE public.item_names OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25607)
-- Name: item_size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_size (
    id integer NOT NULL,
    foot_wear_size character varying(20) NOT NULL,
    CONSTRAINT item_size_foot_wear_size_check CHECK (((foot_wear_size)::text = ANY ((ARRAY['xtra_small'::character varying, 'small'::character varying, 'medium'::character varying, 'large'::character varying, 'extra_large'::character varying])::text[])))
);


ALTER TABLE public.item_size OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25606)
-- Name: item_size_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_size_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_size_id_seq OWNER TO postgres;

--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 231
-- Name: item_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_size_id_seq OWNED BY public.item_size.id;


--
-- TOC entry 222 (class 1259 OID 25547)
-- Name: item_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_status (
    id integer NOT NULL,
    item_status character varying(20) NOT NULL,
    CONSTRAINT item_status_item_status_check CHECK (((item_status)::text = ANY ((ARRAY['delivered'::character varying, 'notdelivered'::character varying, 'in_stock'::character varying, 'exchange_policy_true'::character varying, 'exchange_policy_false'::character varying])::text[])))
);


ALTER TABLE public.item_status OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25546)
-- Name: item_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_status_id_seq OWNER TO postgres;

--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 221
-- Name: item_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_status_id_seq OWNED BY public.item_status.id;


--
-- TOC entry 243 (class 1259 OID 25694)
-- Name: logis_comp_contr_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logis_comp_contr_status (
    id integer NOT NULL,
    contract_status character varying(20) NOT NULL,
    CONSTRAINT logis_comp_contr_status_contract_status_check CHECK (((contract_status)::text = ANY ((ARRAY['in_contract'::character varying, 'lapse'::character varying, 'revoked'::character varying])::text[])))
);


ALTER TABLE public.logis_comp_contr_status OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 25693)
-- Name: logis_comp_contr_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logis_comp_contr_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logis_comp_contr_status_id_seq OWNER TO postgres;

--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 242
-- Name: logis_comp_contr_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logis_comp_contr_status_id_seq OWNED BY public.logis_comp_contr_status.id;


--
-- TOC entry 245 (class 1259 OID 25704)
-- Name: logistic_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logistic_company (
    id integer NOT NULL,
    logistic_company character varying(255) NOT NULL,
    contract_start date DEFAULT CURRENT_DATE,
    contract_end_date date,
    status integer
);


ALTER TABLE public.logistic_company OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 25703)
-- Name: logistic_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logistic_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logistic_company_id_seq OWNER TO postgres;

--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 244
-- Name: logistic_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logistic_company_id_seq OWNED BY public.logistic_company.id;


--
-- TOC entry 241 (class 1259 OID 25675)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    order_date date DEFAULT CURRENT_DATE,
    item_id integer,
    custormer_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 25674)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 240
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 224 (class 1259 OID 25557)
-- Name: pay_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pay_status (
    id integer NOT NULL,
    pay_status character varying(20) NOT NULL,
    CONSTRAINT pay_status_pay_status_check CHECK (((pay_status)::text = ANY ((ARRAY['cash'::character varying, 'online'::character varying, 'both_cash&online'::character varying, 'cash_on_delivery'::character varying])::text[])))
);


ALTER TABLE public.pay_status OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25556)
-- Name: pay_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pay_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pay_status_id_seq OWNER TO postgres;

--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 223
-- Name: pay_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pay_status_id_seq OWNED BY public.pay_status.id;


--
-- TOC entry 236 (class 1259 OID 25643)
-- Name: price_listing_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_listing_inventory (
    id integer NOT NULL,
    item_id integer,
    price numeric(10,2)
);


ALTER TABLE public.price_listing_inventory OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 25642)
-- Name: price_listing_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_listing_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.price_listing_inventory_id_seq OWNER TO postgres;

--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 235
-- Name: price_listing_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_listing_inventory_id_seq OWNED BY public.price_listing_inventory.id;


--
-- TOC entry 226 (class 1259 OID 25567)
-- Name: roles_enquiry_form; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_enquiry_form (
    id integer NOT NULL,
    role character varying(20) NOT NULL,
    CONSTRAINT roles_enquiry_form_role_check CHECK (((role)::text = ANY ((ARRAY['customer'::character varying, 'sales'::character varying, 'marketing'::character varying, 'dealer/supplier'::character varying])::text[])))
);


ALTER TABLE public.roles_enquiry_form OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25566)
-- Name: roles_enquiry_form_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_enquiry_form_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_enquiry_form_id_seq OWNER TO postgres;

--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 225
-- Name: roles_enquiry_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_enquiry_form_id_seq OWNED BY public.roles_enquiry_form.id;


--
-- TOC entry 228 (class 1259 OID 25577)
-- Name: warranty_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warranty_status (
    id integer NOT NULL,
    warranty_status character varying(20) NOT NULL,
    CONSTRAINT warranty_status_warranty_status_check CHECK (((warranty_status)::text = ANY ((ARRAY['applicable'::character varying, 'not_applicable'::character varying])::text[])))
);


ALTER TABLE public.warranty_status OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25576)
-- Name: warranty_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warranty_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.warranty_status_id_seq OWNER TO postgres;

--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 227
-- Name: warranty_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warranty_status_id_seq OWNED BY public.warranty_status.id;


--
-- TOC entry 4891 (class 2604 OID 25281)
-- Name: customer_enquiries enquiry_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_enquiries ALTER COLUMN enquiry_id SET DEFAULT nextval('public.customer_enquiries_enquiry_id_seq'::regclass);


--
-- TOC entry 4901 (class 2604 OID 26074)
-- Name: customer_reg cid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_reg ALTER COLUMN cid SET DEFAULT nextval('public.customer_reg_cid_seq'::regclass);


--
-- TOC entry 4909 (class 2604 OID 25732)
-- Name: deliveries delivery_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries ALTER COLUMN delivery_id SET DEFAULT nextval('public.deliveries_delivery_id_seq'::regclass);


--
-- TOC entry 4908 (class 2604 OID 25722)
-- Name: delivery_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_status ALTER COLUMN id SET DEFAULT nextval('public.delivery_status_id_seq'::regclass);


--
-- TOC entry 4897 (class 2604 OID 25590)
-- Name: item_exchange_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_exchange_status ALTER COLUMN id SET DEFAULT nextval('public.item_exchange_status_id_seq'::regclass);


--
-- TOC entry 4899 (class 2604 OID 25632)
-- Name: item_listing_inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_listing_inventory ALTER COLUMN id SET DEFAULT nextval('public.item_listing_inventory_id_seq'::regclass);


--
-- TOC entry 4898 (class 2604 OID 25610)
-- Name: item_size id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_size ALTER COLUMN id SET DEFAULT nextval('public.item_size_id_seq'::regclass);


--
-- TOC entry 4893 (class 2604 OID 25550)
-- Name: item_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_status ALTER COLUMN id SET DEFAULT nextval('public.item_status_id_seq'::regclass);


--
-- TOC entry 4905 (class 2604 OID 25697)
-- Name: logis_comp_contr_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logis_comp_contr_status ALTER COLUMN id SET DEFAULT nextval('public.logis_comp_contr_status_id_seq'::regclass);


--
-- TOC entry 4906 (class 2604 OID 25707)
-- Name: logistic_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logistic_company ALTER COLUMN id SET DEFAULT nextval('public.logistic_company_id_seq'::regclass);


--
-- TOC entry 4903 (class 2604 OID 25678)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4894 (class 2604 OID 25560)
-- Name: pay_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pay_status ALTER COLUMN id SET DEFAULT nextval('public.pay_status_id_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 25646)
-- Name: price_listing_inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_listing_inventory ALTER COLUMN id SET DEFAULT nextval('public.price_listing_inventory_id_seq'::regclass);


--
-- TOC entry 4895 (class 2604 OID 25570)
-- Name: roles_enquiry_form id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_enquiry_form ALTER COLUMN id SET DEFAULT nextval('public.roles_enquiry_form_id_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 25580)
-- Name: warranty_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warranty_status ALTER COLUMN id SET DEFAULT nextval('public.warranty_status_id_seq'::regclass);


--
-- TOC entry 5147 (class 0 OID 25779)
-- Dependencies: 251
-- Data for Name: admin_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_team VALUES (8080, 'main-dev', 'chandan@gmail.com', 'admin', '2026-05-17 06:04:27.831152');


--
-- TOC entry 5116 (class 0 OID 25278)
-- Dependencies: 220
-- Data for Name: customer_enquiries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer_enquiries VALUES (5, 'Sales & Marketing Professional', '5050', '8080@5000.com', 'I want to talk to you', '2026-05-17 10:30:18.516304');
INSERT INTO public.customer_enquiries VALUES (6, 'Consumer', '9090909', 'complain@person.com', 'complain ...', '2026-05-17 11:17:11.763985');
INSERT INTO public.customer_enquiries VALUES (7, 'Sales & Marketing Professional', '90909090909', 'abc@gmail.com', 'i want to talk to you', '2026-05-21 10:40:39.15741');
INSERT INTO public.customer_enquiries VALUES (8, 'Dealer & Supplier', '90909090', 'adidas@dealer.com', 'deals in adidas shoes', '2026-05-30 12:51:24.371592');


--
-- TOC entry 5146 (class 0 OID 25751)
-- Dependencies: 250
-- Data for Name: customer_purchase; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer_purchase VALUES (3, 1, 1, 2, 1, NULL, '2026-06-04 17:17:47.719854');
INSERT INTO public.customer_purchase VALUES (4, 2, 2, 2, 1, 100.00, '2026-06-04 17:17:47.719854');
INSERT INTO public.customer_purchase VALUES (4, 2, 2, 2, 1, 100.00, '2026-06-04 17:17:47.719854');
INSERT INTO public.customer_purchase VALUES (4, 3, 3, 2, 1, 100.00, '2026-06-04 17:30:02.278122');
INSERT INTO public.customer_purchase VALUES (4, 4, 4, 2, 1, 200.00, '2026-06-04 17:33:07.569691');
INSERT INTO public.customer_purchase VALUES (5, 5, 5, 2, 1, 100.00, '2026-06-05 16:43:47.656573');
INSERT INTO public.customer_purchase VALUES (6, 5, 5, 2, 1, 100.00, '2026-06-05 16:44:17.166488');
INSERT INTO public.customer_purchase VALUES (9, 6, 6, 2, 1, 100.00, '2026-06-05 17:18:47.029655');


--
-- TOC entry 5135 (class 0 OID 25664)
-- Dependencies: 239
-- Data for Name: customer_reg; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer_reg VALUES (1, 'New Customer', '9090808070', '2026-06-04 06:20:50.860995');
INSERT INTO public.customer_reg VALUES (2, 'A', '123123', '2026-06-04 16:45:55.501507');
INSERT INTO public.customer_reg VALUES (3, 'Aayush', '123890', '2026-06-04 16:51:53.257225');
INSERT INTO public.customer_reg VALUES (4, 'Mr X', '111222', '2026-06-04 17:14:01.794289');
INSERT INTO public.customer_reg VALUES (5, 'Aayush', '123123', '2026-06-05 16:43:35.356693');
INSERT INTO public.customer_reg VALUES (6, 'Aman', '234234', '2026-06-05 16:44:10.560616');
INSERT INTO public.customer_reg VALUES (7, 'chandan', '345345', '2026-06-05 16:44:36.649813');
INSERT INTO public.customer_reg VALUES (8, 'ABC Khan', '645645', '2026-06-05 16:58:54.963037');
INSERT INTO public.customer_reg VALUES (9, 'ABC Khan', '645645', '2026-06-05 16:58:58.482598');


--
-- TOC entry 5145 (class 0 OID 25729)
-- Dependencies: 249
-- Data for Name: deliveries; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5143 (class 0 OID 25719)
-- Dependencies: 247
-- Data for Name: delivery_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.delivery_status VALUES (1, 'dispatched');
INSERT INTO public.delivery_status VALUES (2, 'received');
INSERT INTO public.delivery_status VALUES (3, 'cancelled');
INSERT INTO public.delivery_status VALUES (4, 'undelivered');


--
-- TOC entry 5126 (class 0 OID 25587)
-- Dependencies: 230
-- Data for Name: item_exchange_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item_exchange_status VALUES (1, 'applicable');
INSERT INTO public.item_exchange_status VALUES (2, 'not_applicable');


--
-- TOC entry 5130 (class 0 OID 25629)
-- Dependencies: 234
-- Data for Name: item_listing_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item_listing_inventory VALUES (1, 5, 'item_listing_images/flowers.jpg', 0, 'Demo_image');
INSERT INTO public.item_listing_inventory VALUES (2, 3, 'item_listing_images/car.jpg', 0, 'ToyCar');
INSERT INTO public.item_listing_inventory VALUES (3, 5, 'item_listing_images/car.jpg', 0, 'New Car');
INSERT INTO public.item_listing_inventory VALUES (4, 5, 'item_listing_images/flowers.jpg', 0, 'hello flower');
INSERT INTO public.item_listing_inventory VALUES (5, 4, 'item_listing_images/sneakers_pic.jpg', 0, 'Black Sneakers');
INSERT INTO public.item_listing_inventory VALUES (6, 4, 'item_listing_images/sneakers_pic.jpg', 0, 'Black Snikers');


--
-- TOC entry 5133 (class 0 OID 25655)
-- Dependencies: 237
-- Data for Name: item_names; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5128 (class 0 OID 25607)
-- Dependencies: 232
-- Data for Name: item_size; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item_size VALUES (1, 'xtra_small');
INSERT INTO public.item_size VALUES (2, 'small');
INSERT INTO public.item_size VALUES (3, 'medium');
INSERT INTO public.item_size VALUES (4, 'large');
INSERT INTO public.item_size VALUES (5, 'extra_large');


--
-- TOC entry 5118 (class 0 OID 25547)
-- Dependencies: 222
-- Data for Name: item_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item_status VALUES (1, 'delivered');
INSERT INTO public.item_status VALUES (2, 'notdelivered');
INSERT INTO public.item_status VALUES (3, 'in_stock');


--
-- TOC entry 5139 (class 0 OID 25694)
-- Dependencies: 243
-- Data for Name: logis_comp_contr_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logis_comp_contr_status VALUES (1, 'in_contract');
INSERT INTO public.logis_comp_contr_status VALUES (2, 'lapse');
INSERT INTO public.logis_comp_contr_status VALUES (3, 'revoked');


--
-- TOC entry 5141 (class 0 OID 25704)
-- Dependencies: 245
-- Data for Name: logistic_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logistic_company VALUES (1, 'Logistic Company AA', '2026-05-01', '2026-06-30', 1);
INSERT INTO public.logistic_company VALUES (2, 'Logistic Company B', '2026-07-11', '2027-06-30', 1);


--
-- TOC entry 5137 (class 0 OID 25675)
-- Dependencies: 241
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders VALUES (1, '2026-06-04', 1, 3);
INSERT INTO public.orders VALUES (2, '2026-06-04', 2, 4);
INSERT INTO public.orders VALUES (3, '2026-06-04', 2, 4);
INSERT INTO public.orders VALUES (4, '2026-06-04', 3, 4);
INSERT INTO public.orders VALUES (5, '2026-06-04', 4, 4);
INSERT INTO public.orders VALUES (6, '2026-06-05', 5, 5);
INSERT INTO public.orders VALUES (7, '2026-06-05', 5, 6);
INSERT INTO public.orders VALUES (8, '2026-06-05', 6, 9);


--
-- TOC entry 5120 (class 0 OID 25557)
-- Dependencies: 224
-- Data for Name: pay_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pay_status VALUES (1, 'cash');
INSERT INTO public.pay_status VALUES (2, 'online');
INSERT INTO public.pay_status VALUES (3, 'both_cash&online');
INSERT INTO public.pay_status VALUES (4, 'cash_on_delivery');


--
-- TOC entry 5132 (class 0 OID 25643)
-- Dependencies: 236
-- Data for Name: price_listing_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.price_listing_inventory VALUES (1, 1, 100000.00);
INSERT INTO public.price_listing_inventory VALUES (2, 2, 100.00);
INSERT INTO public.price_listing_inventory VALUES (3, 3, 100.00);
INSERT INTO public.price_listing_inventory VALUES (4, 4, 200.00);
INSERT INTO public.price_listing_inventory VALUES (5, 5, 100.00);
INSERT INTO public.price_listing_inventory VALUES (6, 6, 100.00);


--
-- TOC entry 5122 (class 0 OID 25567)
-- Dependencies: 226
-- Data for Name: roles_enquiry_form; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5124 (class 0 OID 25577)
-- Dependencies: 228
-- Data for Name: warranty_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.warranty_status VALUES (1, 'applicable');
INSERT INTO public.warranty_status VALUES (2, 'not_applicable');


--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 219
-- Name: customer_enquiries_enquiry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_enquiries_enquiry_id_seq', 8, true);


--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 238
-- Name: customer_reg_cid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_reg_cid_seq', 9, true);


--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 248
-- Name: deliveries_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deliveries_delivery_id_seq', 1, false);


--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 246
-- Name: delivery_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.delivery_status_id_seq', 1, false);


--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 229
-- Name: item_exchange_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_exchange_status_id_seq', 1, false);


--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 233
-- Name: item_listing_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_listing_inventory_id_seq', 6, true);


--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 231
-- Name: item_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_size_id_seq', 1, false);


--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 221
-- Name: item_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_status_id_seq', 1, false);


--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 242
-- Name: logis_comp_contr_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logis_comp_contr_status_id_seq', 1, false);


--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 244
-- Name: logistic_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logistic_company_id_seq', 2, true);


--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 240
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 8, true);


--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 223
-- Name: pay_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pay_status_id_seq', 1, false);


--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 235
-- Name: price_listing_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_listing_inventory_id_seq', 6, true);


--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 225
-- Name: roles_enquiry_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_enquiry_form_id_seq', 1, false);


--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 227
-- Name: warranty_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.warranty_status_id_seq', 1, false);


--
-- TOC entry 4953 (class 2606 OID 25791)
-- Name: admin_team admin_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_team
    ADD CONSTRAINT admin_team_pkey PRIMARY KEY (admin_id);


--
-- TOC entry 4922 (class 2606 OID 25286)
-- Name: customer_enquiries customer_enquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_enquiries
    ADD CONSTRAINT customer_enquiries_pkey PRIMARY KEY (enquiry_id);


--
-- TOC entry 4940 (class 2606 OID 25673)
-- Name: customer_reg customer_reg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_reg
    ADD CONSTRAINT customer_reg_pkey PRIMARY KEY (cid);


--
-- TOC entry 4951 (class 2606 OID 25735)
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (delivery_id);


--
-- TOC entry 4949 (class 2606 OID 25727)
-- Name: delivery_status delivery_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_status
    ADD CONSTRAINT delivery_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4932 (class 2606 OID 25595)
-- Name: item_exchange_status item_exchange_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_exchange_status
    ADD CONSTRAINT item_exchange_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4936 (class 2606 OID 25636)
-- Name: item_listing_inventory item_listing_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_listing_inventory
    ADD CONSTRAINT item_listing_inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 4934 (class 2606 OID 25615)
-- Name: item_size item_size_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_size
    ADD CONSTRAINT item_size_pkey PRIMARY KEY (id);


--
-- TOC entry 4924 (class 2606 OID 25555)
-- Name: item_status item_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_status
    ADD CONSTRAINT item_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4944 (class 2606 OID 25702)
-- Name: logis_comp_contr_status logis_comp_contr_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logis_comp_contr_status
    ADD CONSTRAINT logis_comp_contr_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4947 (class 2606 OID 25712)
-- Name: logistic_company logistic_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logistic_company
    ADD CONSTRAINT logistic_company_pkey PRIMARY KEY (id);


--
-- TOC entry 4942 (class 2606 OID 25682)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4926 (class 2606 OID 25565)
-- Name: pay_status pay_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pay_status
    ADD CONSTRAINT pay_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4938 (class 2606 OID 25649)
-- Name: price_listing_inventory price_listing_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_listing_inventory
    ADD CONSTRAINT price_listing_inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 4928 (class 2606 OID 25575)
-- Name: roles_enquiry_form roles_enquiry_form_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_enquiry_form
    ADD CONSTRAINT roles_enquiry_form_pkey PRIMARY KEY (id);


--
-- TOC entry 4930 (class 2606 OID 25585)
-- Name: warranty_status warranty_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warranty_status
    ADD CONSTRAINT warranty_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4945 (class 1259 OID 26102)
-- Name: idx_logistic_company_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_logistic_company_name ON public.logistic_company USING btree (logistic_company);


--
-- TOC entry 4963 (class 2606 OID 25754)
-- Name: customer_purchase customer_purchase_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_purchase
    ADD CONSTRAINT customer_purchase_cid_fkey FOREIGN KEY (cid) REFERENCES public.customer_reg(cid);


--
-- TOC entry 4964 (class 2606 OID 25759)
-- Name: customer_purchase customer_purchase_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_purchase
    ADD CONSTRAINT customer_purchase_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item_listing_inventory(id);


--
-- TOC entry 4965 (class 2606 OID 25769)
-- Name: customer_purchase customer_purchase_pay_method_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_purchase
    ADD CONSTRAINT customer_purchase_pay_method_fkey FOREIGN KEY (pay_method) REFERENCES public.pay_status(id);


--
-- TOC entry 4966 (class 2606 OID 25764)
-- Name: customer_purchase customer_purchase_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_purchase
    ADD CONSTRAINT customer_purchase_pid_fkey FOREIGN KEY (pid) REFERENCES public.price_listing_inventory(id);


--
-- TOC entry 4967 (class 2606 OID 25774)
-- Name: customer_purchase customer_purchase_warr_or_exc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_purchase
    ADD CONSTRAINT customer_purchase_warr_or_exc_fkey FOREIGN KEY (warr_or_exc) REFERENCES public.warranty_status(id);


--
-- TOC entry 4960 (class 2606 OID 25741)
-- Name: deliveries deliveries_delivery_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_delivery_status_id_fkey FOREIGN KEY (delivery_status_id) REFERENCES public.delivery_status(id);


--
-- TOC entry 4961 (class 2606 OID 25736)
-- Name: deliveries deliveries_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item_listing_inventory(id);


--
-- TOC entry 4962 (class 2606 OID 25746)
-- Name: deliveries deliveries_pay_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pay_status_id_fkey FOREIGN KEY (pay_status_id) REFERENCES public.pay_status(id);


--
-- TOC entry 4954 (class 2606 OID 25637)
-- Name: item_listing_inventory item_listing_inventory_item_size_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_listing_inventory
    ADD CONSTRAINT item_listing_inventory_item_size_fkey FOREIGN KEY (item_size) REFERENCES public.item_size(id);


--
-- TOC entry 4956 (class 2606 OID 25658)
-- Name: item_names item_names_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_names
    ADD CONSTRAINT item_names_id_fkey FOREIGN KEY (id) REFERENCES public.item_listing_inventory(id);


--
-- TOC entry 4959 (class 2606 OID 25713)
-- Name: logistic_company logistic_company_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logistic_company
    ADD CONSTRAINT logistic_company_status_fkey FOREIGN KEY (status) REFERENCES public.logis_comp_contr_status(id);


--
-- TOC entry 4957 (class 2606 OID 25688)
-- Name: orders orders_custormer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_custormer_id_fkey FOREIGN KEY (custormer_id) REFERENCES public.customer_reg(cid);


--
-- TOC entry 4958 (class 2606 OID 25683)
-- Name: orders orders_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item_listing_inventory(id);


--
-- TOC entry 4955 (class 2606 OID 25650)
-- Name: price_listing_inventory price_listing_inventory_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_listing_inventory
    ADD CONSTRAINT price_listing_inventory_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item_listing_inventory(id);


-- Completed on 2026-06-08 12:52:56

--
-- PostgreSQL database dump complete
--

\unrestrict vQdfBn1QF6rZugdysO1Qwlr16vxPbImX7uLOQitsrXc3VffNYOlqds1ByscDEhV

