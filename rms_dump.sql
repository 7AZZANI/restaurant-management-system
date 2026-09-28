--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: account_user; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.account_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    email character varying(70) NOT NULL,
    name character varying(50),
    is_superuser boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    last_login timestamp with time zone,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.account_user OWNER TO rms_user;

--
-- Name: account_user_groups; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.account_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.account_user_groups OWNER TO rms_user;

--
-- Name: account_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.account_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.account_user_groups_id_seq OWNER TO rms_user;

--
-- Name: account_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.account_user_groups_id_seq OWNED BY public.account_user_groups.id;


--
-- Name: account_user_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.account_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.account_user_id_seq OWNER TO rms_user;

--
-- Name: account_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.account_user_id_seq OWNED BY public.account_user.id;


--
-- Name: account_user_user_permissions; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.account_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.account_user_user_permissions OWNER TO rms_user;

--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.account_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.account_user_user_permissions_id_seq OWNER TO rms_user;

--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.account_user_user_permissions_id_seq OWNED BY public.account_user_user_permissions.id;


--
-- Name: admin_interface_theme; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.admin_interface_theme (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    active boolean NOT NULL,
    title character varying(50) NOT NULL,
    title_visible boolean NOT NULL,
    logo character varying(100) NOT NULL,
    logo_visible boolean NOT NULL,
    css_header_background_color character varying(10) NOT NULL,
    title_color character varying(10) NOT NULL,
    css_header_text_color character varying(10) NOT NULL,
    css_header_link_color character varying(10) NOT NULL,
    css_header_link_hover_color character varying(10) NOT NULL,
    css_module_background_color character varying(10) NOT NULL,
    css_module_text_color character varying(10) NOT NULL,
    css_module_link_color character varying(10) NOT NULL,
    css_module_link_hover_color character varying(10) NOT NULL,
    css_module_rounded_corners boolean NOT NULL,
    css_generic_link_color character varying(10) NOT NULL,
    css_generic_link_hover_color character varying(10) NOT NULL,
    css_save_button_background_color character varying(10) NOT NULL,
    css_save_button_background_hover_color character varying(10) NOT NULL,
    css_save_button_text_color character varying(10) NOT NULL,
    css_delete_button_background_color character varying(10) NOT NULL,
    css_delete_button_background_hover_color character varying(10) NOT NULL,
    css_delete_button_text_color character varying(10) NOT NULL,
    list_filter_dropdown boolean NOT NULL,
    related_modal_active boolean NOT NULL,
    related_modal_background_color character varying(10) NOT NULL,
    related_modal_rounded_corners boolean NOT NULL,
    logo_color character varying(10) NOT NULL,
    recent_actions_visible boolean NOT NULL,
    favicon character varying(100) NOT NULL,
    related_modal_background_opacity character varying(5) NOT NULL,
    env_name character varying(50) NOT NULL,
    env_visible_in_header boolean NOT NULL,
    env_color character varying(10) NOT NULL,
    env_visible_in_favicon boolean NOT NULL,
    related_modal_close_button_visible boolean NOT NULL,
    language_chooser_active boolean NOT NULL,
    language_chooser_display character varying(10) NOT NULL,
    list_filter_sticky boolean NOT NULL,
    form_pagination_sticky boolean NOT NULL,
    form_submit_sticky boolean NOT NULL,
    css_module_background_selected_color character varying(10) NOT NULL,
    css_module_link_selected_color character varying(10) NOT NULL,
    logo_max_height smallint NOT NULL,
    logo_max_width smallint NOT NULL,
    foldable_apps boolean NOT NULL,
    CONSTRAINT admin_interface_theme_logo_max_height_check CHECK ((logo_max_height >= 0)),
    CONSTRAINT admin_interface_theme_logo_max_width_check CHECK ((logo_max_width >= 0))
);


ALTER TABLE public.admin_interface_theme OWNER TO rms_user;

--
-- Name: admin_interface_theme_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.admin_interface_theme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_interface_theme_id_seq OWNER TO rms_user;

--
-- Name: admin_interface_theme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.admin_interface_theme_id_seq OWNED BY public.admin_interface_theme.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO rms_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO rms_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO rms_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO rms_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO rms_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO rms_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO rms_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO rms_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO rms_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO rms_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO rms_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO rms_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO rms_user;

--
-- Name: management_category; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.management_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    image character varying(100),
    created_at timestamp with time zone NOT NULL,
    rank integer NOT NULL,
    description text,
    CONSTRAINT management_category_rank_check CHECK ((rank >= 0))
);


ALTER TABLE public.management_category OWNER TO rms_user;

--
-- Name: management_category_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.management_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.management_category_id_seq OWNER TO rms_user;

--
-- Name: management_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.management_category_id_seq OWNED BY public.management_category.id;


--
-- Name: management_fooditem; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.management_fooditem (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    price double precision NOT NULL,
    image character varying(100) NOT NULL,
    category_id bigint NOT NULL,
    slug character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    quantity_available integer NOT NULL
);


ALTER TABLE public.management_fooditem OWNER TO rms_user;

--
-- Name: management_fooditem_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.management_fooditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.management_fooditem_id_seq OWNER TO rms_user;

--
-- Name: management_fooditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.management_fooditem_id_seq OWNED BY public.management_fooditem.id;


--
-- Name: management_fooditem_ingredients; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.management_fooditem_ingredients (
    id bigint NOT NULL,
    fooditem_id bigint NOT NULL,
    fooditemingredient_id bigint NOT NULL
);


ALTER TABLE public.management_fooditem_ingredients OWNER TO rms_user;

--
-- Name: management_fooditem_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.management_fooditem_ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.management_fooditem_ingredients_id_seq OWNER TO rms_user;

--
-- Name: management_fooditem_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.management_fooditem_ingredients_id_seq OWNED BY public.management_fooditem_ingredients.id;


--
-- Name: management_fooditemingredient; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.management_fooditemingredient (
    id bigint NOT NULL,
    quantity double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    ingredient_id bigint NOT NULL,
    unit_id bigint NOT NULL
);


ALTER TABLE public.management_fooditemingredient OWNER TO rms_user;

--
-- Name: management_fooditemingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.management_fooditemingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.management_fooditemingredient_id_seq OWNER TO rms_user;

--
-- Name: management_fooditemingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.management_fooditemingredient_id_seq OWNED BY public.management_fooditemingredient.id;


--
-- Name: management_ingredient; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.management_ingredient (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    quantity_available double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    unit_id bigint NOT NULL,
    type character varying(10) NOT NULL,
    "limit" double precision NOT NULL
);


ALTER TABLE public.management_ingredient OWNER TO rms_user;

--
-- Name: management_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.management_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.management_ingredient_id_seq OWNER TO rms_user;

--
-- Name: management_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.management_ingredient_id_seq OWNED BY public.management_ingredient.id;


--
-- Name: management_order; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.management_order (
    id bigint NOT NULL,
    table_no integer NOT NULL,
    date timestamp with time zone NOT NULL,
    total_price double precision NOT NULL,
    order_no integer NOT NULL,
    status character varying(10) NOT NULL,
    CONSTRAINT management_order_order_no_check CHECK ((order_no >= 0)),
    CONSTRAINT management_order_table_no_check CHECK ((table_no >= 0))
);


ALTER TABLE public.management_order OWNER TO rms_user;

--
-- Name: management_order_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.management_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.management_order_id_seq OWNER TO rms_user;

--
-- Name: management_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.management_order_id_seq OWNED BY public.management_order.id;


--
-- Name: management_orderitem; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.management_orderitem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    total_price double precision NOT NULL,
    food_item_id bigint NOT NULL,
    order_id bigint NOT NULL,
    CONSTRAINT management_orderitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.management_orderitem OWNER TO rms_user;

--
-- Name: management_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.management_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.management_orderitem_id_seq OWNER TO rms_user;

--
-- Name: management_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.management_orderitem_id_seq OWNED BY public.management_orderitem.id;


--
-- Name: management_quantityunit; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.management_quantityunit (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.management_quantityunit OWNER TO rms_user;

--
-- Name: management_quantityunit_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.management_quantityunit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.management_quantityunit_id_seq OWNER TO rms_user;

--
-- Name: management_quantityunit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.management_quantityunit_id_seq OWNED BY public.management_quantityunit.id;


--
-- Name: webpush_group; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.webpush_group (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.webpush_group OWNER TO rms_user;

--
-- Name: webpush_group_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.webpush_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.webpush_group_id_seq OWNER TO rms_user;

--
-- Name: webpush_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.webpush_group_id_seq OWNED BY public.webpush_group.id;


--
-- Name: webpush_pushinformation; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.webpush_pushinformation (
    id bigint NOT NULL,
    group_id bigint,
    subscription_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.webpush_pushinformation OWNER TO rms_user;

--
-- Name: webpush_pushinformation_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.webpush_pushinformation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.webpush_pushinformation_id_seq OWNER TO rms_user;

--
-- Name: webpush_pushinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.webpush_pushinformation_id_seq OWNED BY public.webpush_pushinformation.id;


--
-- Name: webpush_subscriptioninfo; Type: TABLE; Schema: public; Owner: rms_user
--

CREATE TABLE public.webpush_subscriptioninfo (
    id bigint NOT NULL,
    browser character varying(100) NOT NULL,
    endpoint character varying(500) NOT NULL,
    auth character varying(100) NOT NULL,
    p256dh character varying(100) NOT NULL
);


ALTER TABLE public.webpush_subscriptioninfo OWNER TO rms_user;

--
-- Name: webpush_subscriptioninfo_id_seq; Type: SEQUENCE; Schema: public; Owner: rms_user
--

CREATE SEQUENCE public.webpush_subscriptioninfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.webpush_subscriptioninfo_id_seq OWNER TO rms_user;

--
-- Name: webpush_subscriptioninfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rms_user
--

ALTER SEQUENCE public.webpush_subscriptioninfo_id_seq OWNED BY public.webpush_subscriptioninfo.id;


--
-- Name: account_user id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user ALTER COLUMN id SET DEFAULT nextval('public.account_user_id_seq'::regclass);


--
-- Name: account_user_groups id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user_groups ALTER COLUMN id SET DEFAULT nextval('public.account_user_groups_id_seq'::regclass);


--
-- Name: account_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.account_user_user_permissions_id_seq'::regclass);


--
-- Name: admin_interface_theme id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.admin_interface_theme ALTER COLUMN id SET DEFAULT nextval('public.admin_interface_theme_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: management_category id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_category ALTER COLUMN id SET DEFAULT nextval('public.management_category_id_seq'::regclass);


--
-- Name: management_fooditem id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditem ALTER COLUMN id SET DEFAULT nextval('public.management_fooditem_id_seq'::regclass);


--
-- Name: management_fooditem_ingredients id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditem_ingredients ALTER COLUMN id SET DEFAULT nextval('public.management_fooditem_ingredients_id_seq'::regclass);


--
-- Name: management_fooditemingredient id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditemingredient ALTER COLUMN id SET DEFAULT nextval('public.management_fooditemingredient_id_seq'::regclass);


--
-- Name: management_ingredient id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_ingredient ALTER COLUMN id SET DEFAULT nextval('public.management_ingredient_id_seq'::regclass);


--
-- Name: management_order id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_order ALTER COLUMN id SET DEFAULT nextval('public.management_order_id_seq'::regclass);


--
-- Name: management_orderitem id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_orderitem ALTER COLUMN id SET DEFAULT nextval('public.management_orderitem_id_seq'::regclass);


--
-- Name: management_quantityunit id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_quantityunit ALTER COLUMN id SET DEFAULT nextval('public.management_quantityunit_id_seq'::regclass);


--
-- Name: webpush_group id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.webpush_group ALTER COLUMN id SET DEFAULT nextval('public.webpush_group_id_seq'::regclass);


--
-- Name: webpush_pushinformation id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.webpush_pushinformation ALTER COLUMN id SET DEFAULT nextval('public.webpush_pushinformation_id_seq'::regclass);


--
-- Name: webpush_subscriptioninfo id; Type: DEFAULT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.webpush_subscriptioninfo ALTER COLUMN id SET DEFAULT nextval('public.webpush_subscriptioninfo_id_seq'::regclass);


--
-- Data for Name: account_user; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.account_user (id, password, email, name, is_superuser, is_staff, is_active, last_login, date_created) FROM stdin;
1	pbkdf2_sha256$320000$8vTuSTtWAlpyiBzQEE0Q87$kwM+uXRSdc6uEPLR9rCaY+thgxeOUPYGQ7H9pKEkysQ=	admin@rms.com	Vishal Tailor	t	t	t	2022-07-21 10:56:46.803707+05:30	2022-07-01 18:00:04.425322+05:30
\.


--
-- Data for Name: account_user_groups; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.account_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: account_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.account_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: admin_interface_theme; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.admin_interface_theme (id, name, active, title, title_visible, logo, logo_visible, css_header_background_color, title_color, css_header_text_color, css_header_link_color, css_header_link_hover_color, css_module_background_color, css_module_text_color, css_module_link_color, css_module_link_hover_color, css_module_rounded_corners, css_generic_link_color, css_generic_link_hover_color, css_save_button_background_color, css_save_button_background_hover_color, css_save_button_text_color, css_delete_button_background_color, css_delete_button_background_hover_color, css_delete_button_text_color, list_filter_dropdown, related_modal_active, related_modal_background_color, related_modal_rounded_corners, logo_color, recent_actions_visible, favicon, related_modal_background_opacity, env_name, env_visible_in_header, env_color, env_visible_in_favicon, related_modal_close_button_visible, language_chooser_active, language_chooser_display, list_filter_sticky, form_pagination_sticky, form_submit_sticky, css_module_background_selected_color, css_module_link_selected_color, logo_max_height, logo_max_width, foldable_apps) FROM stdin;
1	Labayk	t	the arabic restaurant	t	admin-interface/logo/logo_etxdhwV.png	t	#CFB27F	#872712	#872712	#000000	#872712	#9C865F	#FFFFFF	#FFFFFF	#872712	t	#0C3C26	#156641	#748D63	#4A5A3F	#FFFFFF	#BA2121	#A41515	#FFFFFF	t	t	#000000	t	#FFFFFF	t		0.3		t	#E74C3C	t	t	t	code	t	f	f	#FFFFCC	#FFFFFF	25	400	t
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add Theme	7	add_theme
26	Can change Theme	7	change_theme
27	Can delete Theme	7	delete_theme
28	Can view Theme	7	view_theme
29	Can add category	8	add_category
30	Can change category	8	change_category
31	Can delete category	8	delete_category
32	Can view category	8	view_category
33	Can add food item	9	add_fooditem
34	Can change food item	9	change_fooditem
35	Can delete food item	9	delete_fooditem
36	Can view food item	9	view_fooditem
37	Can add order item	10	add_orderitem
38	Can change order item	10	change_orderitem
39	Can delete order item	10	delete_orderitem
40	Can view order item	10	view_orderitem
41	Can add order	11	add_order
42	Can change order	11	change_order
43	Can delete order	11	delete_order
44	Can view order	11	view_order
45	Can add group	12	add_group
46	Can change group	12	change_group
47	Can delete group	12	delete_group
48	Can view group	12	view_group
49	Can add push information	13	add_pushinformation
50	Can change push information	13	change_pushinformation
51	Can delete push information	13	delete_pushinformation
52	Can view push information	13	view_pushinformation
53	Can add subscription info	14	add_subscriptioninfo
54	Can change subscription info	14	change_subscriptioninfo
55	Can delete subscription info	14	delete_subscriptioninfo
56	Can view subscription info	14	view_subscriptioninfo
57	Can add quantity unit	15	add_quantityunit
58	Can change quantity unit	15	change_quantityunit
59	Can delete quantity unit	15	delete_quantityunit
60	Can view quantity unit	15	view_quantityunit
61	Can add ingredient	16	add_ingredient
62	Can change ingredient	16	change_ingredient
63	Can delete ingredient	16	delete_ingredient
64	Can view ingredient	16	view_ingredient
65	Can add food item ingredient	17	add_fooditemingredient
66	Can change food item ingredient	17	change_fooditemingredient
67	Can delete food item ingredient	17	delete_fooditemingredient
68	Can view food item ingredient	17	view_fooditemingredient
69	Can add inventory	16	add_inventory
70	Can change inventory	16	change_inventory
71	Can delete inventory	16	delete_inventory
72	Can view inventory	16	view_inventory
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-07-02 17:37:50.190755+05:30	1	Appetizer and salad	1	[{"added": {}}]	8	1
2	2022-07-02 17:38:16.494718+05:30	2	Breakfast	1	[{"added": {}}]	8	1
3	2022-07-02 17:38:26.090084+05:30	3	Soup	1	[{"added": {}}]	8	1
4	2022-07-02 17:38:50.306217+05:30	4	Shawarma	1	[{"added": {}}]	8	1
5	2022-07-02 17:39:06.451704+05:30	5	Rice meals	1	[{"added": {}}]	8	1
6	2022-07-02 17:39:16.14504+05:30	6	Grilled	1	[{"added": {}}]	8	1
7	2022-07-02 17:39:27.679257+05:30	7	Falafel	1	[{"added": {}}]	8	1
8	2022-07-02 17:39:40.731747+05:30	8	Drinks	1	[{"added": {}}]	8	1
9	2022-07-02 17:39:59.410694+05:30	9	Additionals	1	[{"added": {}}]	8	1
10	2022-07-02 17:40:11.930568+05:30	9	Additional	2	[{"changed": {"fields": ["Name"]}}]	8	1
11	2022-07-02 18:47:34.932962+05:30	1	Hummus	1	[{"added": {}}]	9	1
12	2022-07-02 18:48:23.552359+05:30	2	Hummus Beirute	1	[{"added": {}}]	9	1
13	2022-07-02 18:48:53.278974+05:30	3	Moutabel	1	[{"added": {}}]	9	1
14	2022-07-02 18:49:21.395891+05:30	4	Yogurt With Cucumber	1	[{"added": {}}]	9	1
15	2022-07-02 18:49:45.42048+05:30	5	Tabboulah	1	[{"added": {}}]	9	1
16	2022-07-02 18:50:19.480749+05:30	6	Fattush	1	[{"added": {}}]	9	1
17	2022-07-02 18:50:53.054072+05:30	7	Arabic Salad	1	[{"added": {}}]	9	1
18	2022-07-02 18:51:52.16787+05:30	8	French Fries	1	[{"added": {}}]	9	1
19	2022-07-02 18:53:11.109054+05:30	9	Ful Modomas With Tahina	1	[{"added": {}}]	9	1
20	2022-07-02 18:54:01.5403+05:30	10	Ful sudani	1	[{"added": {}}]	9	1
21	2022-07-02 18:54:10.790347+05:30	10	Ful Sudani	2	[{"changed": {"fields": ["Name"]}}]	9	1
22	2022-07-02 18:54:36.15365+05:30	11	Shakshuka	1	[{"added": {}}]	9	1
23	2022-07-02 18:55:12.588125+05:30	12	Chicken Mughalgal	1	[{"added": {}}]	9	1
24	2022-07-02 18:55:59.830795+05:30	13	Fried Egg (Sunny-Side Up)	1	[{"added": {}}]	9	1
25	2022-07-02 18:56:35.801757+05:30	14	Cheese Omelette	1	[{"added": {}}]	9	1
26	2022-07-02 18:57:05.235079+05:30	15	Lintel Soup	1	[{"added": {}}]	9	1
27	2022-07-02 18:57:43.131162+05:30	16	Shawarma Sandwich	1	[{"added": {}}]	9	1
28	2022-07-02 18:58:49.733338+05:30	17	Shawarma Rice	1	[{"added": {}}]	9	1
29	2022-07-02 18:59:28.503909+05:30	18	Shawarma Arabic Plate	1	[{"added": {}}]	9	1
30	2022-07-02 18:59:55.463212+05:30	19	Shawarma Meal	1	[{"added": {}}]	9	1
31	2022-07-02 19:00:35.146801+05:30	20	Biryani Chicken	1	[{"added": {}}]	9	1
32	2022-07-02 19:01:00.154596+05:30	21	Biryani Beef	1	[{"added": {}}]	9	1
33	2022-07-02 19:01:26.067047+05:30	22	Kabsa Chicken	1	[{"added": {}}]	9	1
34	2022-07-02 19:02:11.619674+05:30	23	Kabsa Beef	1	[{"added": {}}]	9	1
35	2022-07-02 19:02:45.049763+05:30	24	Mandi Chicken	1	[{"added": {}}]	9	1
36	2022-07-02 19:03:16.442054+05:30	25	Mandi Beef	1	[{"added": {}}]	9	1
37	2022-07-02 19:03:43.551365+05:30	26	Biryani Fish	1	[{"added": {}}]	9	1
38	2022-07-02 19:04:17.707189+05:30	27	Kabsa Fish	1	[{"added": {}}]	9	1
39	2022-07-02 19:04:47.851661+05:30	28	Fried Chicken Meal	1	[{"added": {}}]	9	1
40	2022-07-02 19:51:06.728561+05:30	29	Mix Grilled	1	[{"added": {}}]	9	1
41	2022-07-02 19:51:30.604999+05:30	30	Beef Kebab	1	[{"added": {}}]	9	1
42	2022-07-02 19:51:59.960325+05:30	31	Chicken Kebab	1	[{"added": {}}]	9	1
43	2022-07-02 19:52:31.842833+05:30	32	Eggplant Beef Kebab	1	[{"added": {}}]	9	1
44	2022-07-02 19:53:18.767115+05:30	33	Shish Tawook	1	[{"added": {}}]	9	1
45	2022-07-02 19:53:47.48527+05:30	34	Beef Tikka	1	[{"added": {}}]	9	1
46	2022-07-02 19:54:30.148709+05:30	35	Chicken Wings	1	[{"added": {}}]	9	1
47	2022-07-02 19:54:54.308693+05:30	36	Tandoori	1	[{"added": {}}]	9	1
48	2022-07-02 19:55:24.944271+05:30	37	Falafel Plate	1	[{"added": {}}]	9	1
49	2022-07-02 19:55:57.108801+05:30	38	Falafel Sandwich	1	[{"added": {}}]	9	1
50	2022-07-02 19:56:44.152569+05:30	39	Black Tea (Medium)	1	[{"added": {}}]	9	1
51	2022-07-02 19:57:14.994047+05:30	40	Black Tea (Large)	1	[{"added": {}}]	9	1
52	2022-07-02 19:58:07.121112+05:30	41	Karak Tea (Medium)	1	[{"added": {}}]	9	1
53	2022-07-02 19:58:32.715663+05:30	42	Karak Tea (Large)	1	[{"added": {}}]	9	1
54	2022-07-02 19:59:00.837347+05:30	43	Bottled Water	1	[{"added": {}}]	9	1
55	2022-07-02 19:59:32.389849+05:30	44	Soda In Can	1	[{"added": {}}]	9	1
56	2022-07-02 19:59:57.288672+05:30	45	Yogurt Shake	1	[{"added": {}}]	9	1
57	2022-07-02 20:00:27.604155+05:30	46	Mango Shake	1	[{"added": {}}]	9	1
58	2022-07-02 20:00:58.567974+05:30	47	Banana Shake	1	[{"added": {}}]	9	1
59	2022-07-02 20:01:21.366364+05:30	48	Avacado Shake	1	[{"added": {}}]	9	1
60	2022-07-02 20:02:23.646923+05:30	49	Orange Juice	1	[{"added": {}}]	9	1
61	2022-07-02 20:02:46.566249+05:30	50	Pineapple Juice	1	[{"added": {}}]	9	1
62	2022-07-02 20:03:23.929862+05:30	51	Mango Juice	1	[{"added": {}}]	9	1
63	2022-07-02 20:03:50.235742+05:30	52	Khubz	1	[{"added": {}}]	9	1
64	2022-07-02 20:04:26.642147+05:30	53	Extra Rice (Solo)	1	[{"added": {}}]	9	1
65	2022-07-02 20:05:18.906329+05:30	54	Extra Rice (Platter)	1	[{"added": {}}]	9	1
66	2022-07-02 20:06:01.570315+05:30	55	Yogurt Sauce	1	[{"added": {}}]	9	1
67	2022-07-03 09:53:44.165318+05:30	1	Labayk	2	[{"changed": {"fields": ["Name", "Logo", "Title", "Visible", "Background color", "Text color", "Link hover color", "Background color", "Link hover color"]}}]	7	1
68	2022-07-03 09:54:42.271236+05:30	1	Labayk	2	[{"changed": {"fields": ["Max height", "Background color"]}}]	7	1
69	2022-07-03 09:55:58.352231+05:30	1	Labayk	2	[{"changed": {"fields": ["Background color", "Background hover color"]}}]	7	1
70	2022-07-03 09:59:53.242638+05:30	1	Labayk	2	[{"changed": {"fields": ["Logo"]}}]	7	1
71	2022-07-03 10:01:18.523378+05:30	1	Labayk	2	[{"changed": {"fields": ["Color", "Visible", "Background color", "Background color"]}}]	7	1
72	2022-07-03 10:02:08.52792+05:30	1	Labayk	2	[{"changed": {"fields": ["Max height", "Link color"]}}]	7	1
73	2022-07-03 10:02:22.11316+05:30	1	Labayk	2	[{"changed": {"fields": ["Max height"]}}]	7	1
74	2022-07-03 10:02:36.414971+05:30	1	Labayk	2	[{"changed": {"fields": ["Max height"]}}]	7	1
75	2022-07-03 10:07:49.042024+05:30	1	Labayk	2	[{"changed": {"fields": ["Logo", "Background color", "Background hover color"]}}]	7	1
76	2022-07-03 10:08:02.99883+05:30	1	Labayk	2	[{"changed": {"fields": ["Max height"]}}]	7	1
77	2022-07-03 10:08:17.275694+05:30	1	Labayk	2	[{"changed": {"fields": ["Max height"]}}]	7	1
78	2022-07-03 10:08:32.277574+05:30	1	Labayk	2	[{"changed": {"fields": ["Max height", "Visible"]}}]	7	1
79	2022-07-03 10:09:55.631968+05:30	1	Labayk	2	[{"changed": {"fields": ["Title", "Visible"]}}]	7	1
80	2022-07-03 15:02:10.44808+05:30	2	OrderItem object (2)	3		10	1
81	2022-07-03 15:02:10.464693+05:30	1	OrderItem object (1)	3		10	1
82	2022-07-03 15:02:21.858014+05:30	4	Order object (4)	3		11	1
83	2022-07-03 15:02:21.872892+05:30	3	Order object (3)	3		11	1
84	2022-07-03 15:02:21.873892+05:30	2	Order object (2)	3		11	1
85	2022-07-03 15:02:21.873892+05:30	1	Order object (1)	3		11	1
86	2022-07-03 15:06:21.515034+05:30	5	Order #5	3		11	1
87	2022-07-03 15:14:59.986513+05:30	6	Order #1	3		11	1
88	2022-07-03 15:31:48.792648+05:30	55	Yogurt Sauce	3		9	1
89	2022-07-03 15:32:22.779567+05:30	56	Yogurt Sauce	1	[{"added": {}}]	9	1
90	2022-07-03 15:49:47.226307+05:30	56	Yogurt Sauce	3		9	1
91	2022-07-03 15:50:25.236653+05:30	57	Yogurt Sauce	1	[{"added": {}}]	9	1
92	2022-07-03 16:07:48.244171+05:30	8	Drinks	2	[{"changed": {"fields": ["Image"]}}]	8	1
93	2022-07-03 16:09:47.899532+05:30	7	Falafel	2	[{"changed": {"fields": ["Image"]}}]	8	1
94	2022-07-03 16:10:24.854109+05:30	6	Grilled	2	[{"changed": {"fields": ["Image"]}}]	8	1
95	2022-07-03 16:10:49.826855+05:30	5	Rice meals	2	[{"changed": {"fields": ["Image"]}}]	8	1
96	2022-07-03 16:11:18.160769+05:30	4	Shawarma	2	[{"changed": {"fields": ["Image"]}}]	8	1
97	2022-07-03 16:12:16.061484+05:30	3	Soup	2	[{"changed": {"fields": ["Image"]}}]	8	1
98	2022-07-03 16:12:34.596208+05:30	2	Breakfast	2	[{"changed": {"fields": ["Image"]}}]	8	1
99	2022-07-03 16:12:47.274929+05:30	1	Appetizer and salad	2	[{"changed": {"fields": ["Image"]}}]	8	1
100	2022-07-03 16:19:40.161688+05:30	1	Appetizer and salad	2	[{"changed": {"fields": ["Rank"]}}]	8	1
101	2022-07-03 16:19:52.92343+05:30	2	Breakfast	2	[{"changed": {"fields": ["Rank"]}}]	8	1
102	2022-07-03 16:20:01.200757+05:30	3	Soup	2	[{"changed": {"fields": ["Rank"]}}]	8	1
103	2022-07-03 16:20:07.975728+05:30	4	Shawarma	2	[{"changed": {"fields": ["Rank"]}}]	8	1
104	2022-07-03 16:20:15.230233+05:30	5	Rice meals	2	[{"changed": {"fields": ["Rank"]}}]	8	1
105	2022-07-03 16:20:22.431862+05:30	6	Grilled	2	[{"changed": {"fields": ["Rank"]}}]	8	1
106	2022-07-03 16:20:29.451698+05:30	7	Falafel	2	[{"changed": {"fields": ["Rank"]}}]	8	1
107	2022-07-03 16:20:50.433225+05:30	8	Drinks	2	[{"changed": {"fields": ["Rank"]}}]	8	1
108	2022-07-03 16:21:41.768277+05:30	9	Additional	2	[{"changed": {"fields": ["Rank"]}}]	8	1
109	2022-07-03 16:21:48.102784+05:30	9	Additional	2	[]	8	1
110	2022-07-03 17:12:02.03441+05:30	9	Additional	2	[{"changed": {"fields": ["Description"]}}]	8	1
111	2022-07-03 17:12:48.180414+05:30	8	Drinks	2	[{"changed": {"fields": ["Description"]}}]	8	1
112	2022-07-03 17:13:29.787951+05:30	7	Falafel	2	[{"changed": {"fields": ["Description"]}}]	8	1
113	2022-07-03 17:14:04.296504+05:30	6	Grilled	2	[{"changed": {"fields": ["Description"]}}]	8	1
114	2022-07-03 17:14:47.179778+05:30	5	Rice meals	2	[{"changed": {"fields": ["Description"]}}]	8	1
115	2022-07-03 17:15:20.59667+05:30	4	Shawarma	2	[{"changed": {"fields": ["Description"]}}]	8	1
116	2022-07-03 17:16:27.920303+05:30	3	Soup	2	[{"changed": {"fields": ["Description"]}}]	8	1
117	2022-07-03 17:16:58.435674+05:30	2	Breakfast	2	[{"changed": {"fields": ["Description"]}}]	8	1
118	2022-07-03 17:17:27.746477+05:30	1	Appetizer and salad	2	[{"changed": {"fields": ["Description"]}}]	8	1
119	2022-07-03 22:01:33.770651+05:30	8	French Fries	2	[{"changed": {"fields": ["Quantity available"]}}]	9	1
120	2022-07-03 22:17:56.860744+05:30	8	Order #180	3		11	1
121	2022-07-03 22:19:38.483515+05:30	9	Order #480	3		11	1
122	2022-07-04 09:52:47.219668+05:30	12	Order #715	1	[{"added": {}}]	11	1
123	2022-07-04 09:53:45.082883+05:30	12	Order #717	2	[{"changed": {"fields": ["Order no"]}}]	11	1
124	2022-07-04 09:54:25.212252+05:30	15	OrderItem object (15)	1	[{"added": {}}]	10	1
125	2022-07-04 09:54:47.233679+05:30	15	OrderItem object (15)	2	[{"changed": {"fields": ["Order"]}}]	10	1
126	2022-07-04 10:04:46.163252+05:30	12	Order #717	3		11	1
127	2022-07-04 15:55:27.915538+05:30	16	Order #111	1	[{"added": {}}]	11	1
128	2022-07-04 15:55:40.989268+05:30	16	Order #111	2	[{"changed": {"fields": ["Total price"]}}]	11	1
129	2022-07-04 15:55:53.004479+05:30	16	Order #111	3		11	1
130	2022-07-18 18:45:01.942685+05:30	57	Yogurt Sauce	2	[]	9	1
131	2022-07-18 21:35:12.516697+05:30	20	Order #179	3		11	1
132	2022-07-18 21:37:39.353758+05:30	25	OrderItem object (25)	2	[{"changed": {"fields": ["Total price"]}}]	10	1
133	2022-07-18 21:37:51.938294+05:30	25	OrderItem object (25)	2	[{"changed": {"fields": ["Total price"]}}]	10	1
134	2022-07-19 14:28:01.223973+05:30	19	Order #647	2	[]	11	1
135	2022-07-19 14:28:13.233158+05:30	19	Order #647	2	[]	11	1
136	2022-07-19 14:28:21.168449+05:30	19	Order #647	2	[]	11	1
137	2022-07-20 20:26:32.641991+05:30	1	Kilogram	1	[{"added": {}}]	15	1
138	2022-07-20 20:26:50.987287+05:30	2	Gram	1	[{"added": {}}]	15	1
139	2022-07-20 20:27:11.920794+05:30	3	Liter	1	[{"added": {}}]	15	1
140	2022-07-20 20:27:31.566807+05:30	4	Milliliter	1	[{"added": {}}]	15	1
141	2022-07-20 20:27:56.522051+05:30	5	Piece	1	[{"added": {}}]	15	1
142	2022-07-20 20:44:08.830639+05:30	1	Egg	1	[{"added": {}}]	16	1
143	2022-07-20 20:45:01.31862+05:30	13	Fried Egg (Sunny-Side Up)	2	[{"changed": {"fields": ["Ingredients"]}}]	9	1
144	2022-07-20 20:46:11.128313+05:30	2	Cheese cube	1	[{"added": {}}]	16	1
145	2022-07-20 20:46:22.592602+05:30	14	Cheese Omelette	2	[{"changed": {"fields": ["Ingredients"]}}]	9	1
146	2022-07-20 22:03:40.249136+05:30	2	Cheese cube	3		16	1
147	2022-07-20 22:03:40.260693+05:30	1	Egg	3		16	1
148	2022-07-20 22:58:57.315097+05:30	3	Egg	1	[{"added": {}}]	16	1
149	2022-07-20 23:13:41.800344+05:30	4	Cheese cube	1	[{"added": {}}]	16	1
150	2022-07-20 23:14:01.739886+05:30	1	Cheese cube 1Piece	1	[{"added": {}}]	17	1
151	2022-07-20 23:18:53.633086+05:30	5	Egg	1	[{"added": {}}]	16	1
152	2022-07-20 23:19:17.803315+05:30	2	Egg (2 Piece)	1	[{"added": {}}]	17	1
153	2022-07-20 23:19:24.233311+05:30	14	Cheese Omelette	2	[{"changed": {"fields": ["Ingredients"]}}]	9	1
154	2022-07-20 23:20:46.170982+05:30	3	Egg (1 Piece)	1	[{"added": {}}]	17	1
155	2022-07-20 23:20:54.088251+05:30	13	Fried Egg (Sunny-Side Up)	2	[{"changed": {"fields": ["Ingredients"]}}]	9	1
156	2022-07-20 23:30:44.490608+05:30	6	Chicken	1	[{"added": {}}]	16	1
157	2022-07-20 23:36:04.234755+05:30	4	Chicken (300 Kilogram)	1	[{"added": {}}]	17	1
158	2022-07-20 23:36:12.32904+05:30	35	Chicken Wings	2	[{"changed": {"fields": ["Ingredients"]}}]	9	1
159	2022-07-21 10:09:36.88383+05:30	21	Order #473	3		11	1
160	2022-07-21 12:01:31.051324+05:30	22	Order #986	2	[{"changed": {"fields": ["Status"]}}]	11	1
161	2022-07-21 15:52:15.542093+05:30	6	Chicken	2	[{"changed": {"fields": ["Type"]}}]	16	1
162	2022-07-21 15:52:23.88563+05:30	5	Egg	2	[{"changed": {"fields": ["Type"]}}]	16	1
163	2022-07-21 18:53:56.675038+05:30	7	Fish	1	[{"added": {}}]	16	1
164	2022-07-21 19:16:40.992864+05:30	8	Cabbage	1	[{"added": {}}]	16	1
165	2022-07-21 19:37:47.120227+05:30	2	Egg (2 Piece)	3		17	1
166	2022-07-21 19:37:47.165119+05:30	1	Cheese cube (1 Piece)	3		17	1
167	2022-07-21 19:41:36.634974+05:30	5	Cheese cube (1 Piece)	1	[{"added": {}}]	17	1
168	2022-07-21 19:42:02.791253+05:30	14	Cheese Omelette	2	[{"changed": {"fields": ["Ingredients"]}}]	9	1
169	2022-07-22 15:48:03.76206+05:30	18	Order #431	2	[{"changed": {"fields": ["Status"]}}]	11	1
170	2022-07-22 15:48:18.018971+05:30	17	Order #290	2	[{"changed": {"fields": ["Status"]}}]	11	1
171	2022-07-23 14:31:57.364819+05:30	26	Order #213	3		11	1
172	2022-07-23 14:31:57.42026+05:30	25	Order #347	3		11	1
173	2022-07-23 14:31:57.423936+05:30	24	Order #438	3		11	1
174	2022-07-23 14:32:07.378602+05:30	6	Fattush	2	[{"changed": {"fields": ["Quantity available"]}}]	9	1
175	2022-07-23 14:43:18.747921+05:30	27	Order #634	3		11	1
176	2022-07-23 14:46:19.683693+05:30	28	Order #258	3		11	1
177	2022-07-23 14:49:01.541207+05:30	29	Order #385	3		11	1
178	2022-07-23 14:49:20.223457+05:30	14	Cheese Omelette	2	[{"changed": {"fields": ["Quantity available"]}}]	9	1
179	2022-07-23 14:57:56.742574+05:30	31	Order #338	3		11	1
180	2022-07-23 14:58:14.627817+05:30	35	Chicken Wings	2	[{"changed": {"fields": ["Quantity available"]}}]	9	1
181	2022-07-23 17:29:34.025323+05:30	35	Chicken Wings	2	[{"changed": {"fields": ["Quantity available"]}}]	9	1
182	2022-07-23 17:30:32.847961+05:30	34	Order #552	3		11	1
183	2022-07-23 17:30:32.893613+05:30	33	Order #834	3		11	1
184	2022-07-23 17:30:32.898557+05:30	32	Order #152	3		11	1
185	2022-07-23 17:54:06.077251+05:30	36	Order #669	2	[{"changed": {"fields": ["Status"]}}]	11	1
186	2022-07-23 17:56:31.56294+05:30	36	Order #669	3		11	1
187	2022-07-23 17:56:31.585306+05:30	35	Order #977	3		11	1
188	2022-07-23 17:56:31.587299+05:30	30	Order #682	3		11	1
189	2022-07-23 17:56:47.928502+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
190	2022-07-23 17:57:08.234766+05:30	35	Chicken Wings	2	[{"changed": {"fields": ["Quantity available"]}}]	9	1
191	2022-07-23 17:57:24.123445+05:30	14	Cheese Omelette	2	[{"changed": {"fields": ["Quantity available"]}}]	9	1
192	2022-07-23 17:58:52.743875+05:30	37	Order #506	2	[{"changed": {"fields": ["Status"]}}]	11	1
193	2022-07-23 18:04:31.687742+05:30	37	Order #506	2	[{"changed": {"fields": ["Status"]}}]	11	1
194	2022-07-23 18:04:46.044777+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
195	2022-07-23 18:05:06.103288+05:30	35	Chicken Wings	2	[{"changed": {"fields": ["Quantity available"]}}]	9	1
196	2022-07-23 18:05:27.404955+05:30	14	Cheese Omelette	2	[{"changed": {"fields": ["Quantity available"]}}]	9	1
197	2022-07-23 18:05:59.913587+05:30	35	Chicken Wings	2	[{"changed": {"fields": ["Quantity available"]}}]	9	1
198	2022-07-23 18:06:03.019294+05:30	14	Cheese Omelette	2	[{"changed": {"fields": ["Quantity available"]}}]	9	1
199	2022-07-23 18:06:59.270252+05:30	37	Order #506	2	[]	11	1
200	2022-07-23 18:09:36.464343+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
201	2022-07-23 18:09:46.728651+05:30	5	Egg	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
202	2022-07-23 18:09:55.12959+05:30	4	Cheese cube	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
203	2022-07-23 18:19:28.654936+05:30	37	Order #506	2	[{"changed": {"fields": ["Status"]}}]	11	1
204	2022-07-23 18:23:31.371096+05:30	37	Order #506	2	[{"changed": {"fields": ["Status"]}}]	11	1
205	2022-07-23 18:24:13.163973+05:30	37	Order #506	2	[{"changed": {"fields": ["Status"]}}]	11	1
206	2022-07-23 18:25:25.67322+05:30	37	Order #506	2	[{"changed": {"fields": ["Status"]}}]	11	1
207	2022-07-23 18:46:52.151478+05:30	38	Order #673	2	[{"changed": {"fields": ["Status"]}}]	11	1
208	2022-07-23 18:47:58.107388+05:30	38	Order #673	2	[]	11	1
209	2022-07-23 18:48:11.479985+05:30	38	Order #673	2	[{"changed": {"fields": ["Status"]}}]	11	1
210	2022-07-23 18:49:05.58812+05:30	38	Order #673	2	[{"changed": {"fields": ["Status"]}}]	11	1
211	2022-07-23 22:25:02.381572+05:30	6	Chicken	2	[{"changed": {"fields": ["Limit"]}}]	16	1
212	2022-07-23 22:25:16.819545+05:30	5	Egg	2	[{"changed": {"fields": ["Quantity available", "Limit"]}}]	16	1
213	2022-07-23 22:25:26.525676+05:30	4	Cheese cube	2	[{"changed": {"fields": ["Limit"]}}]	16	1
214	2022-07-23 22:25:45.132994+05:30	7	Fish	2	[{"changed": {"fields": ["Limit"]}}]	16	1
215	2022-07-23 22:25:55.537446+05:30	8	Cabbage	2	[{"changed": {"fields": ["Limit"]}}]	16	1
216	2022-07-23 23:03:18.296503+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
217	2022-07-23 23:08:31.299337+05:30	6	Chicken	2	[]	16	1
218	2022-07-23 23:10:07.792719+05:30	6	Chicken	2	[]	16	1
219	2022-07-23 23:10:54.302798+05:30	6	Chicken	2	[]	16	1
220	2022-07-23 23:21:39.481312+05:30	6	Chicken	2	[]	16	1
221	2022-07-23 23:22:46.330925+05:30	6	Chicken	2	[]	16	1
222	2022-07-23 23:28:15.386543+05:30	6	Chicken	2	[]	16	1
223	2022-07-23 23:35:57.900525+05:30	6	Chicken	2	[]	16	1
224	2022-07-23 23:43:55.008772+05:30	6	Chicken	2	[]	16	1
225	2022-07-23 23:46:47.505677+05:30	6	Chicken	2	[]	16	1
226	2022-07-23 23:47:18.591334+05:30	6	Chicken	2	[]	16	1
227	2022-07-23 23:51:20.079811+05:30	6	Chicken	2	[]	16	1
228	2022-07-23 23:52:01.872484+05:30	6	Chicken	2	[]	16	1
229	2022-07-23 23:52:52.172683+05:30	6	Chicken	2	[]	16	1
230	2022-07-23 23:53:09.527542+05:30	6	Chicken	2	[]	16	1
231	2022-07-23 23:54:13.056396+05:30	6	Chicken	2	[]	16	1
232	2022-07-23 23:54:48.728741+05:30	6	Chicken	2	[]	16	1
233	2022-07-24 10:28:19.342232+05:30	5	Egg	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
234	2022-07-24 10:29:01.513165+05:30	5	Egg	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
235	2022-07-24 10:53:37.144261+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
236	2022-07-24 11:04:39.904114+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
237	2022-07-24 11:06:42.813052+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
238	2022-07-24 11:07:18.012012+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
239	2022-07-24 11:09:15.803346+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
240	2022-07-24 11:11:45.828253+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
241	2022-07-24 11:11:58.540531+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
242	2022-07-24 11:22:02.906134+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
243	2022-07-24 11:22:20.467483+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
244	2022-07-24 11:22:37.84884+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
245	2022-07-24 11:22:50.017884+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
246	2022-07-24 11:26:41.063596+05:30	6	Chicken	2	[]	16	1
247	2022-07-24 11:27:06.414213+05:30	6	Chicken	2	[]	16	1
248	2022-07-24 11:45:01.902791+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
249	2022-07-24 11:45:26.715291+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
250	2022-07-24 11:48:25.491907+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
251	2022-07-24 11:48:36.814502+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
252	2022-07-24 11:57:21.834115+05:30	6	Chicken	2	[]	16	1
253	2022-07-24 11:58:11.257682+05:30	6	Chicken	2	[]	16	1
254	2022-07-24 12:02:04.681315+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
255	2022-07-24 12:02:17.303642+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
256	2022-07-24 12:02:41.530447+05:30	6	Chicken	2	[]	16	1
257	2022-07-24 12:02:57.061339+05:30	6	Chicken	2	[]	16	1
258	2022-07-24 12:03:03.800832+05:30	6	Chicken	2	[]	16	1
259	2022-07-24 12:03:18.801368+05:30	6	Chicken	2	[]	16	1
260	2022-07-24 12:03:58.380878+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
261	2022-07-24 12:04:11.161195+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
262	2022-07-24 12:04:24.974989+05:30	6	Chicken	2	[]	16	1
263	2022-07-24 12:11:51.754176+05:30	6	Chicken	2	[]	16	1
264	2022-07-24 12:12:02.060101+05:30	6	Chicken	2	[]	16	1
265	2022-07-24 12:30:01.355151+05:30	6	Chicken	2	[]	16	1
266	2022-07-24 12:31:38.113877+05:30	6	Chicken	2	[]	16	1
267	2022-07-24 12:41:18.421251+05:30	6	Chicken	2	[]	16	1
268	2022-07-24 12:42:20.902301+05:30	6	Chicken	2	[]	16	1
269	2022-07-24 12:42:49.578916+05:30	6	Chicken	2	[]	16	1
270	2022-07-24 12:44:32.789333+05:30	6	Chicken	2	[]	16	1
271	2022-07-24 13:04:31.445413+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
272	2022-07-24 13:24:51.668813+05:30	40	Order #778	2	[{"changed": {"fields": ["Status"]}}]	11	1
273	2022-07-24 13:41:35.848165+05:30	40	Order #778	2	[{"changed": {"fields": ["Status"]}}]	11	1
274	2022-07-24 13:42:13.20562+05:30	40	Order #778	2	[{"changed": {"fields": ["Status"]}}]	11	1
275	2022-07-24 13:43:07.828078+05:30	40	Order #778	2	[{"changed": {"fields": ["Status"]}}]	11	1
276	2022-07-24 13:51:42.871539+05:30	40	Order #778	2	[{"changed": {"fields": ["Status"]}}]	11	1
277	2022-07-24 13:52:33.576168+05:30	40	Order #778	2	[{"changed": {"fields": ["Status"]}}]	11	1
278	2022-07-24 13:54:09.207012+05:30	40	Order #778	2	[{"changed": {"fields": ["Status"]}}]	11	1
279	2022-07-24 13:54:47.022119+05:30	40	Order #778	2	[{"changed": {"fields": ["Status"]}}]	11	1
280	2022-07-24 14:54:12.797144+05:30	42	Order #963	3		11	1
281	2022-07-24 14:54:12.807181+05:30	41	Order #730	3		11	1
282	2022-07-24 14:54:12.809007+05:30	40	Order #778	3		11	1
283	2022-07-24 15:01:01.791967+05:30	43	Order #132	2	[{"changed": {"fields": ["Status"]}}]	11	1
284	2022-07-24 15:01:53.999856+05:30	6	Chicken	2	[{"changed": {"fields": ["Quantity available"]}}]	16	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	account	user
7	admin_interface	theme
8	management	category
9	management	fooditem
10	management	orderitem
11	management	order
12	webpush	group
13	webpush	pushinformation
14	webpush	subscriptioninfo
15	management	quantityunit
17	management	fooditemingredient
16	management	ingredient
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-07-01 17:54:26.574771+05:30
2	contenttypes	0002_remove_content_type_name	2022-07-01 17:54:26.616031+05:30
3	auth	0001_initial	2022-07-01 17:54:26.783073+05:30
4	auth	0002_alter_permission_name_max_length	2022-07-01 17:54:26.793006+05:30
5	auth	0003_alter_user_email_max_length	2022-07-01 17:54:26.80612+05:30
6	auth	0004_alter_user_username_opts	2022-07-01 17:54:26.816362+05:30
7	auth	0005_alter_user_last_login_null	2022-07-01 17:54:26.828342+05:30
8	auth	0006_require_contenttypes_0002	2022-07-01 17:54:26.833862+05:30
9	auth	0007_alter_validators_add_error_messages	2022-07-01 17:54:26.84555+05:30
10	auth	0008_alter_user_username_max_length	2022-07-01 17:54:26.85822+05:30
11	auth	0009_alter_user_last_name_max_length	2022-07-01 17:54:26.868549+05:30
12	auth	0010_alter_group_name_max_length	2022-07-01 17:54:26.898616+05:30
13	auth	0011_update_proxy_permissions	2022-07-01 17:54:26.911458+05:30
14	auth	0012_alter_user_first_name_max_length	2022-07-01 17:54:26.925337+05:30
15	account	0001_initial	2022-07-01 17:54:27.01417+05:30
16	admin	0001_initial	2022-07-01 17:54:27.06604+05:30
17	admin	0002_logentry_remove_auto_add	2022-07-01 17:54:27.088281+05:30
18	admin	0003_logentry_add_action_flag_choices	2022-07-01 17:54:27.10469+05:30
19	sessions	0001_initial	2022-07-01 17:54:27.129941+05:30
20	account	0002_remove_user_is_verified	2022-07-02 15:25:04.61743+05:30
21	admin_interface	0001_initial	2022-07-02 15:41:53.168258+05:30
22	admin_interface	0002_add_related_modal	2022-07-02 15:41:53.295901+05:30
23	admin_interface	0003_add_logo_color	2022-07-02 15:41:53.336894+05:30
24	admin_interface	0004_rename_title_color	2022-07-02 15:41:53.381475+05:30
25	admin_interface	0005_add_recent_actions_visible	2022-07-02 15:41:53.421231+05:30
26	admin_interface	0006_bytes_to_str	2022-07-02 15:41:53.554733+05:30
27	admin_interface	0007_add_favicon	2022-07-02 15:41:53.619316+05:30
28	admin_interface	0008_change_related_modal_background_opacity_type	2022-07-02 15:41:53.669908+05:30
29	admin_interface	0009_add_enviroment	2022-07-02 15:41:53.733417+05:30
30	admin_interface	0010_add_localization	2022-07-02 15:41:53.820181+05:30
31	admin_interface	0011_add_environment_options	2022-07-02 15:41:53.885357+05:30
32	admin_interface	0012_update_verbose_names	2022-07-02 15:41:53.906576+05:30
33	admin_interface	0013_add_related_modal_close_button	2022-07-02 15:41:53.924886+05:30
34	admin_interface	0014_name_unique	2022-07-02 15:41:53.951439+05:30
35	admin_interface	0015_add_language_chooser_active	2022-07-02 15:41:53.969455+05:30
36	admin_interface	0016_add_language_chooser_display	2022-07-02 15:41:53.984106+05:30
37	admin_interface	0017_change_list_filter_dropdown	2022-07-02 15:41:53.997128+05:30
38	admin_interface	0018_theme_list_filter_sticky	2022-07-02 15:41:54.00952+05:30
39	admin_interface	0019_add_form_sticky	2022-07-02 15:41:54.028198+05:30
40	admin_interface	0020_module_selected_colors	2022-07-02 15:41:54.0674+05:30
41	admin_interface	0021_file_extension_validator	2022-07-02 15:41:54.081732+05:30
42	admin_interface	0022_add_logo_max_width_and_height	2022-07-02 15:41:54.111135+05:30
43	admin_interface	0023_theme_foldable_apps	2022-07-02 15:41:54.125432+05:30
44	admin_interface	0024_remove_theme_css	2022-07-02 15:41:54.138268+05:30
45	management	0001_initial	2022-07-02 17:22:21.751031+05:30
46	management	0002_alter_category_options_category_slug_fooditem_slug	2022-07-02 17:31:14.340733+05:30
47	management	0003_alter_category_slug_alter_fooditem_slug	2022-07-02 17:33:58.707967+05:30
48	management	0004_alter_category_name_alter_category_slug_and_more	2022-07-02 17:37:37.440074+05:30
49	management	0005_remove_fooditem_description	2022-07-02 18:36:24.450137+05:30
50	management	0006_order_orderitem	2022-07-03 13:20:36.144866+05:30
51	management	0007_remove_orderitem_price	2022-07-03 13:23:47.940663+05:30
52	management	0008_order_order_no	2022-07-03 15:14:42.326414+05:30
53	management	0009_category_image	2022-07-03 16:05:59.742377+05:30
54	management	0010_category_created_at_fooditem_created_at	2022-07-03 16:18:19.102772+05:30
55	management	0011_category_rank	2022-07-03 16:19:24.873819+05:30
56	management	0012_alter_category_image	2022-07-03 16:21:25.594691+05:30
57	management	0013_category_description	2022-07-03 17:10:22.198847+05:30
58	management	0014_fooditem_quantity_available	2022-07-03 20:26:02.503025+05:30
59	management	0015_alter_fooditem_quantity_available	2022-07-03 23:14:30.669758+05:30
60	webpush	0001_initial	2022-07-04 13:17:38.267651+05:30
61	webpush	0002_auto_20190603_0005	2022-07-04 13:17:38.274647+05:30
62	webpush	0003_alter_group_id_alter_pushinformation_id_and_more	2022-07-14 11:01:59.100648+05:30
63	management	0016_quantityunit_ingredient_fooditem_ingredient	2022-07-20 20:16:22.28828+05:30
64	management	0017_rename_ingredient_fooditem_ingredients	2022-07-20 20:21:40.359054+05:30
65	management	0018_alter_quantityunit_options_fooditemingredient_and_more	2022-07-20 22:25:40.417088+05:30
66	management	0019_remove_fooditem_ingredients	2022-07-20 22:41:47.01698+05:30
67	management	0020_fooditem_ingredients	2022-07-20 22:42:08.718109+05:30
68	management	0019_rename_ingredient_inventory_and_more	2022-07-20 23:06:53.392816+05:30
69	management	0020_rename_inventory_ingredient	2022-07-20 23:09:50.922343+05:30
70	management	0019_alter_fooditemingredient_options	2022-07-20 23:10:24.702205+05:30
71	management	0020_alter_ingredient_options_fooditemingredient_unit_and_more	2022-07-20 23:34:44.317343+05:30
72	management	0021_orderitem_status	2022-07-20 23:43:01.959207+05:30
73	management	0022_remove_orderitem_status_order_status	2022-07-20 23:44:39.959591+05:30
74	management	0023_ingredient_type	2022-07-21 15:51:34.311899+05:30
75	management	0024_alter_fooditemingredient_quantity_and_more	2022-07-23 14:57:22.257031+05:30
76	management	0025_ingredient_limit	2022-07-23 22:24:10.620412+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
uqjaomvm9kmeqjgts6i0v5vy6aywemv5	.eJxVjDsOwjAQBe_iGln-xruU9JzB8meNA8iW4qRC3B0ipYD2zcx7MR-2tfpt0OLnzM5MstPvFkN6UNtBvod26zz1ti5z5LvCDzr4tWd6Xg7376CGUb-1AUVQJgokk0uoohYWo4pkDRackgJlpdMOjaYCUhhXjNaYwYqSsgP2_gDW7Dc4:1o7rXL:3JD7Juwxt16o3uQMtKIUSwRbbuHhbFAsHExCcxObaZ0	2022-07-17 10:18:47.860598+05:30
udjozqkztxkr2ohpxza5zuuhr7mk4w3q	.eJxVjDsOwjAQBe_iGln-xruU9JzB8meNA8iW4qRC3B0ipYD2zcx7MR-2tfpt0OLnzM5MstPvFkN6UNtBvod26zz1ti5z5LvCDzr4tWd6Xg7376CGUb-1AUVQJgokk0uoohYWo4pkDRackgJlpdMOjaYCUhhXjNaYwYqSsgP2_gDW7Dc4:1o8yd3:mCjllwXGdfa0KcknkZxZKZ00ccCXBH4P7NqVAlY7oe4	2022-07-20 12:05:17.738055+05:30
on6jjgyu2akey42wrwrt0q5h3igvjwk4	.eJxVjDsOwjAQBe_iGln-xruU9JzB8meNA8iW4qRC3B0ipYD2zcx7MR-2tfpt0OLnzM5MstPvFkN6UNtBvod26zz1ti5z5LvCDzr4tWd6Xg7376CGUb-1AUVQJgokk0uoohYWo4pkDRackgJlpdMOjaYCUhhXjNaYwYqSsgP2_gDW7Dc4:1oBsL4:yXT6E84_D5ZwCkD-IrhlBIR2i-HzokF8JBPFZ--5kkE	2022-07-28 11:58:42.618485+05:30
zlmiimfqploqeyxcz2cxri55l8u55gwr	.eJxVjDsOwjAQBe_iGln-xruU9JzB8meNA8iW4qRC3B0ipYD2zcx7MR-2tfpt0OLnzM5MstPvFkN6UNtBvod26zz1ti5z5LvCDzr4tWd6Xg7376CGUb-1AUVQJgokk0uoohYWo4pkDRackgJlpdMOjaYCUhhXjNaYwYqSsgP2_gDW7Dc4:1oCjEu:XN3gge3hGmTzRM7tmMI5XP0YaDlH6VOsNMZuZCqK8PI	2022-07-30 20:27:52.923947+05:30
yjadr89fx4lwmesdqlqz8d49odti38ou	.eJxVjDsOwjAQBe_iGln-xruU9JzB8meNA8iW4qRC3B0ipYD2zcx7MR-2tfpt0OLnzM5MstPvFkN6UNtBvod26zz1ti5z5LvCDzr4tWd6Xg7376CGUb-1AUVQJgokk0uoohYWo4pkDRackgJlpdMOjaYCUhhXjNaYwYqSsgP2_gDW7Dc4:1oDgfj:2nr0zfZzIBy8xZ-wWWrXYyTEIURDSuicyJShqq1XSSI	2022-08-02 11:55:31.157896+05:30
khbuo0rltocxxyar192d96ulieclyyzl	.eJxVjDsOwjAQBe_iGln-xruU9JzB8meNA8iW4qRC3B0ipYD2zcx7MR-2tfpt0OLnzM5MstPvFkN6UNtBvod26zz1ti5z5LvCDzr4tWd6Xg7376CGUb-1AUVQJgokk0uoohYWo4pkDRackgJlpdMOjaYCUhhXjNaYwYqSsgP2_gDW7Dc4:1oDjaD:HGTIeVOz4R_pGLH7Oa-MrTvnomT4NU379X7F-x2Tvxs	2022-08-02 15:02:01.120891+05:30
4tfvxogq3jq2nqtexc7ks23vcoysxlci	.eJxVjDsOwjAQBe_iGln-xruU9JzB8meNA8iW4qRC3B0ipYD2zcx7MR-2tfpt0OLnzM5MstPvFkN6UNtBvod26zz1ti5z5LvCDzr4tWd6Xg7376CGUb-1AUVQJgokk0uoohYWo4pkDRackgJlpdMOjaYCUhhXjNaYwYqSsgP2_gDW7Dc4:1oEOhy:_ZmoEMiqTZ7HsfAhhcsSkeeHOXk1BDazSK0gjQ2fYOE	2022-08-04 10:56:46.806907+05:30
\.


--
-- Data for Name: management_category; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.management_category (id, name, slug, image, created_at, rank, description) FROM stdin;
9	Additional	additional		2022-07-03 16:18:19.081761+05:30	9	Order extra rice, yogurt sauce etc.
8	Drinks	drinks	food-categories/drinks.jpg	2022-07-03 16:18:19.081761+05:30	8	From shakes to juices, order anything you like!
7	Falafel	falafel	food-categories/falafel.jpg	2022-07-03 16:18:19.081761+05:30	7	a deep-fried ball or patty-shaped fritter made from ground chickpeas, broad beans, or both.
6	Grilled	grilled	food-categories/grilled.jpg	2022-07-03 16:18:19.081761+05:30	6	Cooked over fire or hot coals, usually on a metal frame.
5	Rice meals	rice-meals	food-categories/rice-meals.jpg	2022-07-03 16:18:19.081761+05:30	5	Every combination of rice meals you can find out!
4	Shawarma	shawarma	food-categories/shawarma.jpg	2022-07-03 16:18:19.081761+05:30	4	A popular Levantine dish consisting of meat cut into thin slices, stacked in a cone-like shape.
3	Soup	soup	food-categories/soup.webp	2022-07-03 16:18:19.081761+05:30	3	A liquid food, generally served warm that is made by combining ingredients of meat or vegies.
2	Breakfast	breakfast	food-categories/breakfast.jpg	2022-07-03 16:18:19.081761+05:30	2	From light to heavy all kind of breakfast available
1	Appetizer and salad	appetizer-and-salad	food-categories/appetizer-and-salad.jpeg	2022-07-03 16:18:19.081761+05:30	1	A food or drink that stimulates the appetite and is usually served before a meal.
\.


--
-- Data for Name: management_fooditem; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.management_fooditem (id, name, price, image, category_id, slug, created_at, quantity_available) FROM stdin;
1	Hummus	100	food-items/appetizer-and-salad/hummus.jpg	1	hummus	2022-07-03 16:18:19.098768+05:30	5
2	Hummus Beirute	130	food-items/appetizer-and-salad/hummus-beirute.jpg	1	hummus-beirute	2022-07-03 16:18:19.098768+05:30	5
4	Yogurt With Cucumber	75	food-items/appetizer-and-salad/yogurt-with-cucumber.jpg	1	yogurt-with-cucumber	2022-07-03 16:18:19.098768+05:30	5
9	Ful Modomas With Tahina	120	food-items/breakfast/ful-modomas-with-tahina.jpg	2	ful-modomas-with-tahina	2022-07-03 16:18:19.098768+05:30	5
10	Ful Sudani	120	food-items/breakfast/ful-sudani.jpg	2	ful-sudani	2022-07-03 16:18:19.098768+05:30	5
11	Shakshuka	75	food-items/breakfast/shakshuka.jpg	2	shakshuka	2022-07-03 16:18:19.098768+05:30	5
12	Chicken Mughalgal	150	food-items/breakfast/chicken-mughalgal.jpg	2	chicken-mughalgal	2022-07-03 16:18:19.098768+05:30	5
16	Shawarma Sandwich	100	food-items/shawarma/shawarma-sandwich.jpg	4	shawarma-sandwich	2022-07-03 16:18:19.098768+05:30	5
17	Shawarma Rice	100	food-items/shawarma/shawarma-rice.jpg	4	shawarma-rice	2022-07-03 16:18:19.098768+05:30	5
18	Shawarma Arabic Plate	180	food-items/shawarma/shawarma-arabic-plate.jpg	4	shawarma-arabic-plate	2022-07-03 16:18:19.098768+05:30	5
19	Shawarma Meal	150	food-items/shawarma/shawarma-meal.webp	4	shawarma-meal	2022-07-03 16:18:19.098768+05:30	5
21	Biryani Beef	220	food-items/rice-meals/biryani-beef.jpg	5	biryani-beef	2022-07-03 16:18:19.098768+05:30	5
22	Kabsa Chicken	200	food-items/rice-meals/kabsa-chicken.jpg	5	kabsa-chicken	2022-07-03 16:18:19.098768+05:30	5
23	Kabsa Beef	220	food-items/rice-meals/kabsa-beef.jpg	5	kabsa-beef	2022-07-03 16:18:19.098768+05:30	5
24	Mandi Chicken	200	food-items/rice-meals/mandi-chicken.jpg	5	mandi-chicken	2022-07-03 16:18:19.098768+05:30	5
25	Mandi Beef	220	food-items/rice-meals/mandi-beef.jpeg	5	mandi-beef	2022-07-03 16:18:19.098768+05:30	5
27	Kabsa Fish	200	food-items/rice-meals/kabsa-fish.jpg	5	kabsa-fish	2022-07-03 16:18:19.098768+05:30	5
31	Chicken Kebab	180	food-items/grilled/chicken-kebab.webp	6	chicken-kebab	2022-07-03 16:18:19.098768+05:30	5
32	Eggplant Beef Kebab	200	food-items/grilled/eggplant-beef-kebab.jpg	6	eggplant-beef-kebab	2022-07-03 16:18:19.098768+05:30	5
33	Shish Tawook	220	food-items/grilled/shish-tawook.webp	6	shish-tawook	2022-07-03 16:18:19.098768+05:30	5
34	Beef Tikka	250	food-items/grilled/beef-tikka.jpg	6	beef-tikka	2022-07-03 16:18:19.098768+05:30	5
39	Black Tea (Medium)	100	food-items/drinks/black-tea-medium.jpg	8	black-tea-medium	2022-07-03 16:18:19.098768+05:30	5
41	Karak Tea (Medium)	100	food-items/drinks/karak-tea-medium.webp	8	karak-tea-medium	2022-07-03 16:18:19.098768+05:30	5
42	Karak Tea (Large)	150	food-items/drinks/karak-tea-large.webp	8	karak-tea-large	2022-07-03 16:18:19.098768+05:30	5
44	Soda In Can	50	food-items/drinks/soda-in-can.jpg	8	soda-in-can	2022-07-03 16:18:19.098768+05:30	5
45	Yogurt Shake	100	food-items/drinks/yogurt-shake.jpg	8	yogurt-shake	2022-07-03 16:18:19.098768+05:30	5
46	Mango Shake	100	food-items/drinks/mango-shake.jpg	8	mango-shake	2022-07-03 16:18:19.098768+05:30	5
49	Orange Juice	100	food-items/drinks/orange-juice.webp	8	orange-juice	2022-07-03 16:18:19.098768+05:30	5
50	Pineapple Juice	100	food-items/drinks/pineapple-juice.jpg	8	pineapple-juice	2022-07-03 16:18:19.098768+05:30	5
51	Mango Juice	100	food-items/drinks/mango-juice.jpg	8	mango-juice	2022-07-03 16:18:19.098768+05:30	5
53	Extra Rice (Solo)	50	food-items/additional/extra-rice-solo.jpg	9	extra-rice-solo	2022-07-03 16:18:19.098768+05:30	5
54	Extra Rice (Platter)	100	food-items/additional/extra-rice-platter.jpg	9	extra-rice-platter	2022-07-03 16:18:19.098768+05:30	5
8	French Fries	50	food-items/appetizer-and-salad/french-fries.jpg	1	french-fries	2022-07-03 16:18:19.098768+05:30	0
7	Arabic Salad	100	food-items/appetizer-and-salad/arabic-salad.jpeg	1	arabic-salad	2022-07-03 16:18:19.098768+05:30	4
5	Tabboulah	120	food-items/appetizer-and-salad/tabboulah.jpg	1	tabboulah	2022-07-03 16:18:19.098768+05:30	3
48	Avacado Shake	120	food-items/drinks/avacado-shake.jpg	8	avacado-shake	2022-07-03 16:18:19.098768+05:30	4
36	Tandoori	200	food-items/grilled/tandoori.jpg	6	tandoori	2022-07-03 16:18:19.098768+05:30	4
29	Mix Grilled	400	food-items/grilled/mix-grilled.jpg	6	mix-grilled	2022-07-03 16:18:19.098768+05:30	4
28	Fried Chicken Meal	150	food-items/rice-meals/fried-chicken-meal.webp	5	fried-chicken-meal	2022-07-03 16:18:19.098768+05:30	4
52	Khubz	20	food-items/additional/khubz.jpg	9	khubz	2022-07-03 16:18:19.098768+05:30	4
14	Cheese Omelette	75	food-items/breakfast/cheese-omelette.jpg	2	cheese-omelette	2022-07-03 16:18:19.098768+05:30	2
47	Banana Shake	100	food-items/drinks/banana-shake.jpg	8	banana-shake	2022-07-03 16:18:19.098768+05:30	1
43	Bottled Water	20	food-items/drinks/bottled-water.png	8	bottled-water	2022-07-03 16:18:19.098768+05:30	3
37	Falafel Plate	120	food-items/falafel/falafel-plate.jpg	7	falafel-plate	2022-07-03 16:18:19.098768+05:30	4
13	Fried Egg (Sunny-Side Up)	70	food-items/breakfast/fried-egg-sunny-side-up.jpg	2	fried-egg-sunny-side-up	2022-07-03 16:18:19.098768+05:30	4
15	Lintel Soup	70	food-items/soup/lintel-soup.jpg	3	lintel-soup	2022-07-03 16:18:19.098768+05:30	4
40	Black Tea (Large)	150	food-items/drinks/black-tea-large.jpg	8	black-tea-large	2022-07-03 16:18:19.098768+05:30	4
57	Yogurt Sauce	30	food-items/additional/yogurt-sauce_E1GnENP.webp	9	yogurt-sauce	2022-07-03 16:18:19.098768+05:30	5
35	Chicken Wings	200	food-items/grilled/chicken-wings.webp	6	chicken-wings	2022-07-03 16:18:19.098768+05:30	2
3	Moutabel	120	food-items/appetizer-and-salad/moutabel.jpg	1	moutabel	2022-07-03 16:18:19.098768+05:30	4
26	Biryani Fish	200	food-items/rice-meals/biryani-fish.webp	5	biryani-fish	2022-07-03 16:18:19.098768+05:30	4
30	Beef Kebab	200	food-items/grilled/beef-kebab.jpg	6	beef-kebab	2022-07-03 16:18:19.098768+05:30	4
38	Falafel Sandwich	70	food-items/falafel/falafel-sandwich.jpg	7	falafel-sandwich	2022-07-03 16:18:19.098768+05:30	4
20	Biryani Chicken	200	food-items/rice-meals/biryani-chicken.jpg	5	biryani-chicken	2022-07-03 16:18:19.098768+05:30	2
6	Fattush	120	food-items/appetizer-and-salad/fattush.jpeg	1	fattush	2022-07-03 16:18:19.098768+05:30	4
\.


--
-- Data for Name: management_fooditem_ingredients; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.management_fooditem_ingredients (id, fooditem_id, fooditemingredient_id) FROM stdin;
3	13	3
4	35	4
5	14	3
6	14	5
\.


--
-- Data for Name: management_fooditemingredient; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.management_fooditemingredient (id, quantity, created_at, ingredient_id, unit_id) FROM stdin;
3	1	2022-07-20 23:20:46.167994+05:30	5	5
4	300	2022-07-20 23:36:04.2324+05:30	6	2
5	1	2022-07-21 19:41:36.590647+05:30	4	5
\.


--
-- Data for Name: management_ingredient; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.management_ingredient (id, name, slug, quantity_available, created_at, unit_id, type, "limit") FROM stdin;
7	Fish	fish	3	2022-07-21 18:53:56.663005+05:30	1	Non-Veg	1
8	Cabbage	cabbage	500	2022-07-21 19:16:40.990891+05:30	2	Veg	300
5	Egg	egg	7	2022-07-20 23:18:53.632045+05:30	5	Non-Veg	5
4	Cheese cube	cheese-cube	7	2022-07-20 23:13:41.79828+05:30	5	Veg	5
6	Chicken	chicken	0.7	2022-07-20 23:30:44.48959+05:30	1	Non-Veg	1
\.


--
-- Data for Name: management_order; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.management_order (id, table_no, date, total_price, order_no, status) FROM stdin;
37	7	2022-07-23 17:57:54.834149+05:30	275	506	Cancelled
19	10	2022-07-04 17:40:49.112613+05:30	140	647	Pending
13	4	2022-07-04 11:08:10.234312+05:30	620	726	Completed
15	9	2022-07-04 11:45:35.560297+05:30	400	791	Completed
38	1	2022-07-23 18:26:19.982279+05:30	75	673	Completed
14	7	2022-07-04 11:38:51.094704+05:30	220	371	Cancelled
39	2	2022-07-23 23:17:06.976639+05:30	200	946	Pending
22	1	2022-07-21 12:00:46.356139+05:30	200	986	Pending
23	5	2022-07-21 12:20:59.207243+05:30	510	560	Completed
11	1	2022-07-03 22:31:07.122822+05:30	420	835	Cancelled
10	2	2022-06-10 22:28:51.655071+05:30	340	816	Completed
7	5	2022-05-11 15:16:16.865668+05:30	500	717	Completed
18	2	2022-07-04 17:32:15.298003+05:30	120	431	Pending
17	7	2022-07-04 17:31:17.090336+05:30	150	290	Pending
43	2	2022-07-24 14:58:25.76352+05:30	275	132	Pending
\.


--
-- Data for Name: management_orderitem; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.management_orderitem (id, quantity, total_price, food_item_id, order_id) FROM stdin;
7	1	100	1	7
8	2	400	30	7
11	1	100	7	10
12	2	240	5	10
13	1	120	48	11
14	3	300	47	11
16	1	400	29	13
17	1	200	20	13
18	1	20	52	13
19	1	120	6	14
20	1	100	47	14
21	1	200	36	15
22	1	200	20	15
23	1	150	28	17
24	1	120	37	18
26	1	70	15	19
25	1	70	13	19
28	1	200	26	22
29	1	200	30	23
30	1	70	38	23
31	1	200	20	23
32	2	40	43	23
47	1	75	14	37
48	1	200	35	37
49	1	75	14	38
50	1	200	35	39
54	1	75	14	43
55	1	200	35	43
\.


--
-- Data for Name: management_quantityunit; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.management_quantityunit (id, name, created_at) FROM stdin;
1	Kilogram	2022-07-20 20:26:32.639245+05:30
2	Gram	2022-07-20 20:26:50.986287+05:30
3	Liter	2022-07-20 20:27:11.917771+05:30
4	Milliliter	2022-07-20 20:27:31.565752+05:30
5	Piece	2022-07-20 20:27:56.52103+05:30
\.


--
-- Data for Name: webpush_group; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.webpush_group (id, name) FROM stdin;
1	all
2	admin
\.


--
-- Data for Name: webpush_pushinformation; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.webpush_pushinformation (id, group_id, subscription_id, user_id) FROM stdin;
16	2	13	1
17	\N	13	1
\.


--
-- Data for Name: webpush_subscriptioninfo; Type: TABLE DATA; Schema: public; Owner: rms_user
--

COPY public.webpush_subscriptioninfo (id, browser, endpoint, auth, p256dh) FROM stdin;
13	chrome	https://wns2-pn1p.notify.windows.com/w/?token=BQYAAABqryr928zEnpcLdXuyBrXJ6PS7P8KAMyCZdNRPF%2bad1zXBBS1R7sUaW8StDq37Kva66e07gOX%2fH0%2fImAvAFjzZFV%2fjRqGE94b4HqJLQXJ1InrRuCBnV3ChPiFrpttrp2MOtGJVyD%2f29LW3zsMXrBnSgX5AvyE%2ftlB7%2fRGt2PjSg08q%2fuvyJqOS%2f4oF%2bPKGV%2bBwsM9bMqs8XZAiZZ100GMfEtia5t3x%2fLdzeSuJSpnApACYp%2boTdtTtmJ%2bev%2b8MYxoJPDICv7BpMw2MtXpaBCC6aGNm%2bRk2ry2TEn874HueIlqcxG%2b7eyWDTx9W%2feKkD2Q%3d	dTVrkkcxYfsQqQQ_--Rkmw	BLYV1etBKZl6-qZRq-O-tdRNiZkAOT4NsDOtPuwwA4d9PWdIG7xPyLhxrVcAuX6FXDofNymkx2HegmgKHTM8UkU
\.


--
-- Name: account_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.account_user_groups_id_seq', 1, false);


--
-- Name: account_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.account_user_id_seq', 1, true);


--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.account_user_user_permissions_id_seq', 1, false);


--
-- Name: admin_interface_theme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.admin_interface_theme_id_seq', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 284, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 76, true);


--
-- Name: management_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.management_category_id_seq', 9, true);


--
-- Name: management_fooditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.management_fooditem_id_seq', 57, true);


--
-- Name: management_fooditem_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.management_fooditem_ingredients_id_seq', 6, true);


--
-- Name: management_fooditemingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.management_fooditemingredient_id_seq', 5, true);


--
-- Name: management_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.management_ingredient_id_seq', 8, true);


--
-- Name: management_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.management_order_id_seq', 43, true);


--
-- Name: management_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.management_orderitem_id_seq', 55, true);


--
-- Name: management_quantityunit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.management_quantityunit_id_seq', 5, true);


--
-- Name: webpush_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.webpush_group_id_seq', 2, true);


--
-- Name: webpush_pushinformation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.webpush_pushinformation_id_seq', 17, true);


--
-- Name: webpush_subscriptioninfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rms_user
--

SELECT pg_catalog.setval('public.webpush_subscriptioninfo_id_seq', 13, true);


--
-- Name: account_user account_user_email_key; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_email_key UNIQUE (email);


--
-- Name: account_user_groups account_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_pkey PRIMARY KEY (id);


--
-- Name: account_user_groups account_user_groups_user_id_group_id_4d09af3e_uniq; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_user_id_group_id_4d09af3e_uniq UNIQUE (user_id, group_id);


--
-- Name: account_user account_user_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_pkey PRIMARY KEY (id);


--
-- Name: account_user_user_permissions account_user_user_permis_user_id_permission_id_48bdd28b_uniq; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_permis_user_id_permission_id_48bdd28b_uniq UNIQUE (user_id, permission_id);


--
-- Name: account_user_user_permissions account_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_interface_theme admin_interface_theme_name_30bda70f_uniq; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.admin_interface_theme
    ADD CONSTRAINT admin_interface_theme_name_30bda70f_uniq UNIQUE (name);


--
-- Name: admin_interface_theme admin_interface_theme_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.admin_interface_theme
    ADD CONSTRAINT admin_interface_theme_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: management_category management_category_name_ea6cfdb5_uniq; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_category
    ADD CONSTRAINT management_category_name_ea6cfdb5_uniq UNIQUE (name);


--
-- Name: management_category management_category_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_category
    ADD CONSTRAINT management_category_pkey PRIMARY KEY (id);


--
-- Name: management_fooditem_ingredients management_fooditem_ingr_fooditem_id_fooditemingr_816a894a_uniq; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditem_ingredients
    ADD CONSTRAINT management_fooditem_ingr_fooditem_id_fooditemingr_816a894a_uniq UNIQUE (fooditem_id, fooditemingredient_id);


--
-- Name: management_fooditem_ingredients management_fooditem_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditem_ingredients
    ADD CONSTRAINT management_fooditem_ingredients_pkey PRIMARY KEY (id);


--
-- Name: management_fooditem management_fooditem_name_dcb29001_uniq; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditem
    ADD CONSTRAINT management_fooditem_name_dcb29001_uniq UNIQUE (name);


--
-- Name: management_fooditem management_fooditem_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditem
    ADD CONSTRAINT management_fooditem_pkey PRIMARY KEY (id);


--
-- Name: management_fooditemingredient management_fooditemingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditemingredient
    ADD CONSTRAINT management_fooditemingredient_pkey PRIMARY KEY (id);


--
-- Name: management_ingredient management_ingredient_name_key; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_ingredient
    ADD CONSTRAINT management_ingredient_name_key UNIQUE (name);


--
-- Name: management_ingredient management_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_ingredient
    ADD CONSTRAINT management_ingredient_pkey PRIMARY KEY (id);


--
-- Name: management_order management_order_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_order
    ADD CONSTRAINT management_order_pkey PRIMARY KEY (id);


--
-- Name: management_orderitem management_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_orderitem
    ADD CONSTRAINT management_orderitem_pkey PRIMARY KEY (id);


--
-- Name: management_quantityunit management_quantityunit_name_key; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_quantityunit
    ADD CONSTRAINT management_quantityunit_name_key UNIQUE (name);


--
-- Name: management_quantityunit management_quantityunit_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_quantityunit
    ADD CONSTRAINT management_quantityunit_pkey PRIMARY KEY (id);


--
-- Name: webpush_group webpush_group_name_key; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.webpush_group
    ADD CONSTRAINT webpush_group_name_key UNIQUE (name);


--
-- Name: webpush_group webpush_group_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.webpush_group
    ADD CONSTRAINT webpush_group_pkey PRIMARY KEY (id);


--
-- Name: webpush_pushinformation webpush_pushinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.webpush_pushinformation
    ADD CONSTRAINT webpush_pushinformation_pkey PRIMARY KEY (id);


--
-- Name: webpush_subscriptioninfo webpush_subscriptioninfo_pkey; Type: CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.webpush_subscriptioninfo
    ADD CONSTRAINT webpush_subscriptioninfo_pkey PRIMARY KEY (id);


--
-- Name: account_user_email_0bd7c421_like; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX account_user_email_0bd7c421_like ON public.account_user USING btree (email varchar_pattern_ops);


--
-- Name: account_user_groups_group_id_6c71f749; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX account_user_groups_group_id_6c71f749 ON public.account_user_groups USING btree (group_id);


--
-- Name: account_user_groups_user_id_14345e7b; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX account_user_groups_user_id_14345e7b ON public.account_user_groups USING btree (user_id);


--
-- Name: account_user_user_permissions_permission_id_66c44191; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX account_user_user_permissions_permission_id_66c44191 ON public.account_user_user_permissions USING btree (permission_id);


--
-- Name: account_user_user_permissions_user_id_cc42d270; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX account_user_user_permissions_user_id_cc42d270 ON public.account_user_user_permissions USING btree (user_id);


--
-- Name: admin_interface_theme_name_30bda70f_like; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX admin_interface_theme_name_30bda70f_like ON public.admin_interface_theme USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: management_category_name_ea6cfdb5_like; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_category_name_ea6cfdb5_like ON public.management_category USING btree (name varchar_pattern_ops);


--
-- Name: management_category_slug_8fd6e1fb; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_category_slug_8fd6e1fb ON public.management_category USING btree (slug);


--
-- Name: management_category_slug_8fd6e1fb_like; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_category_slug_8fd6e1fb_like ON public.management_category USING btree (slug varchar_pattern_ops);


--
-- Name: management_fooditem_category_id_38e02e50; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_fooditem_category_id_38e02e50 ON public.management_fooditem USING btree (category_id);


--
-- Name: management_fooditem_ingredients_fooditem_id_f78ff93b; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_fooditem_ingredients_fooditem_id_f78ff93b ON public.management_fooditem_ingredients USING btree (fooditem_id);


--
-- Name: management_fooditem_ingredients_fooditemingredient_id_e74c074e; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_fooditem_ingredients_fooditemingredient_id_e74c074e ON public.management_fooditem_ingredients USING btree (fooditemingredient_id);


--
-- Name: management_fooditem_name_dcb29001_like; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_fooditem_name_dcb29001_like ON public.management_fooditem USING btree (name varchar_pattern_ops);


--
-- Name: management_fooditem_slug_c8e57daa; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_fooditem_slug_c8e57daa ON public.management_fooditem USING btree (slug);


--
-- Name: management_fooditem_slug_c8e57daa_like; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_fooditem_slug_c8e57daa_like ON public.management_fooditem USING btree (slug varchar_pattern_ops);


--
-- Name: management_fooditemingredient_ingredient_id_e8d16bf2; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_fooditemingredient_ingredient_id_e8d16bf2 ON public.management_fooditemingredient USING btree (ingredient_id);


--
-- Name: management_fooditemingredient_unit_id_8278cb01; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_fooditemingredient_unit_id_8278cb01 ON public.management_fooditemingredient USING btree (unit_id);


--
-- Name: management_ingredient_name_b443b503_like; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_ingredient_name_b443b503_like ON public.management_ingredient USING btree (name varchar_pattern_ops);


--
-- Name: management_ingredient_slug_2b04c012; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_ingredient_slug_2b04c012 ON public.management_ingredient USING btree (slug);


--
-- Name: management_ingredient_slug_2b04c012_like; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_ingredient_slug_2b04c012_like ON public.management_ingredient USING btree (slug varchar_pattern_ops);


--
-- Name: management_ingredient_unit_id_56236b2e; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_ingredient_unit_id_56236b2e ON public.management_ingredient USING btree (unit_id);


--
-- Name: management_orderitem_food_item_id_281bb0e8; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_orderitem_food_item_id_281bb0e8 ON public.management_orderitem USING btree (food_item_id);


--
-- Name: management_orderitem_order_id_ec734169; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_orderitem_order_id_ec734169 ON public.management_orderitem USING btree (order_id);


--
-- Name: management_quantityunit_name_442995e7_like; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX management_quantityunit_name_442995e7_like ON public.management_quantityunit USING btree (name varchar_pattern_ops);


--
-- Name: webpush_group_name_55a9d24d_like; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX webpush_group_name_55a9d24d_like ON public.webpush_group USING btree (name varchar_pattern_ops);


--
-- Name: webpush_pushinformation_group_id_262dcc9a; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX webpush_pushinformation_group_id_262dcc9a ON public.webpush_pushinformation USING btree (group_id);


--
-- Name: webpush_pushinformation_subscription_id_7989aa34; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX webpush_pushinformation_subscription_id_7989aa34 ON public.webpush_pushinformation USING btree (subscription_id);


--
-- Name: webpush_pushinformation_user_id_5e083b7f; Type: INDEX; Schema: public; Owner: rms_user
--

CREATE INDEX webpush_pushinformation_user_id_5e083b7f ON public.webpush_pushinformation USING btree (user_id);


--
-- Name: account_user_groups account_user_groups_group_id_6c71f749_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_group_id_6c71f749_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_groups account_user_groups_user_id_14345e7b_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_user_id_14345e7b_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions account_user_user_pe_permission_id_66c44191_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_pe_permission_id_66c44191_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions account_user_user_pe_user_id_cc42d270_fk_account_u; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_pe_user_id_cc42d270_fk_account_u FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: management_fooditem_ingredients management_fooditem__fooditem_id_f78ff93b_fk_managemen; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditem_ingredients
    ADD CONSTRAINT management_fooditem__fooditem_id_f78ff93b_fk_managemen FOREIGN KEY (fooditem_id) REFERENCES public.management_fooditem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: management_fooditem_ingredients management_fooditem__fooditemingredient_i_e74c074e_fk_managemen; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditem_ingredients
    ADD CONSTRAINT management_fooditem__fooditemingredient_i_e74c074e_fk_managemen FOREIGN KEY (fooditemingredient_id) REFERENCES public.management_fooditemingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: management_fooditem management_fooditem_category_id_38e02e50_fk_managemen; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditem
    ADD CONSTRAINT management_fooditem_category_id_38e02e50_fk_managemen FOREIGN KEY (category_id) REFERENCES public.management_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: management_fooditemingredient management_fooditemi_ingredient_id_e8d16bf2_fk_managemen; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditemingredient
    ADD CONSTRAINT management_fooditemi_ingredient_id_e8d16bf2_fk_managemen FOREIGN KEY (ingredient_id) REFERENCES public.management_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: management_fooditemingredient management_fooditemi_unit_id_8278cb01_fk_managemen; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_fooditemingredient
    ADD CONSTRAINT management_fooditemi_unit_id_8278cb01_fk_managemen FOREIGN KEY (unit_id) REFERENCES public.management_quantityunit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: management_ingredient management_ingredien_unit_id_56236b2e_fk_managemen; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_ingredient
    ADD CONSTRAINT management_ingredien_unit_id_56236b2e_fk_managemen FOREIGN KEY (unit_id) REFERENCES public.management_quantityunit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: management_orderitem management_orderitem_food_item_id_281bb0e8_fk_managemen; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_orderitem
    ADD CONSTRAINT management_orderitem_food_item_id_281bb0e8_fk_managemen FOREIGN KEY (food_item_id) REFERENCES public.management_fooditem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: management_orderitem management_orderitem_order_id_ec734169_fk_management_order_id; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.management_orderitem
    ADD CONSTRAINT management_orderitem_order_id_ec734169_fk_management_order_id FOREIGN KEY (order_id) REFERENCES public.management_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webpush_pushinformation webpush_pushinformation_group_id_262dcc9a_fk; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.webpush_pushinformation
    ADD CONSTRAINT webpush_pushinformation_group_id_262dcc9a_fk FOREIGN KEY (group_id) REFERENCES public.webpush_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webpush_pushinformation webpush_pushinformation_subscription_id_7989aa34_fk; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.webpush_pushinformation
    ADD CONSTRAINT webpush_pushinformation_subscription_id_7989aa34_fk FOREIGN KEY (subscription_id) REFERENCES public.webpush_subscriptioninfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webpush_pushinformation webpush_pushinformation_user_id_5e083b7f_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rms_user
--

ALTER TABLE ONLY public.webpush_pushinformation
    ADD CONSTRAINT webpush_pushinformation_user_id_5e083b7f_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

