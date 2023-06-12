--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-12 17:04:27

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

ALTER TABLE ONLY e_commerce.venda_produto DROP CONSTRAINT venda_produto_cod_venda_fkey;
ALTER TABLE ONLY e_commerce.venda_produto DROP CONSTRAINT venda_produto_cod_produto_fkey;
ALTER TABLE ONLY e_commerce.venda DROP CONSTRAINT venda_cod_cliente_fkey;
ALTER TABLE ONLY e_commerce.telefone DROP CONSTRAINT telefone_fk;
ALTER TABLE ONLY e_commerce.produto DROP CONSTRAINT produto_cod_categoria_fkey;
ALTER TABLE ONLY e_commerce.endereco DROP CONSTRAINT endereco_fk;
ALTER TABLE ONLY e_commerce.cliente DROP CONSTRAINT cliente_fk;
ALTER TABLE ONLY e_commerce.venda_produto DROP CONSTRAINT venda_produto_pk;
ALTER TABLE ONLY e_commerce.venda DROP CONSTRAINT venda_pkey;
ALTER TABLE ONLY e_commerce.telefone DROP CONSTRAINT telefone_pkey;
ALTER TABLE ONLY e_commerce.produto DROP CONSTRAINT produto_pkey;
ALTER TABLE ONLY e_commerce.endereco DROP CONSTRAINT endereco_pkey;
ALTER TABLE ONLY e_commerce.cliente DROP CONSTRAINT cliente_pkey;
ALTER TABLE ONLY e_commerce.cidade DROP CONSTRAINT cidade_pkey;
ALTER TABLE ONLY e_commerce.categoria DROP CONSTRAINT categoria_pkey;
ALTER TABLE e_commerce.venda_produto ALTER COLUMN cod DROP DEFAULT;
ALTER TABLE e_commerce.venda ALTER COLUMN cod DROP DEFAULT;
ALTER TABLE e_commerce.telefone ALTER COLUMN cod DROP DEFAULT;
ALTER TABLE e_commerce.produto ALTER COLUMN cod DROP DEFAULT;
ALTER TABLE e_commerce.endereco ALTER COLUMN cod DROP DEFAULT;
ALTER TABLE e_commerce.cliente ALTER COLUMN cod DROP DEFAULT;
ALTER TABLE e_commerce.cidade ALTER COLUMN cod DROP DEFAULT;
ALTER TABLE e_commerce.categoria ALTER COLUMN cod DROP DEFAULT;
DROP SEQUENCE e_commerce.venda_produto_cod_seq;
DROP TABLE e_commerce.venda_produto;
DROP SEQUENCE e_commerce.venda_cod_seq;
DROP TABLE e_commerce.venda;
DROP SEQUENCE e_commerce.telefone_cod_seq;
DROP TABLE e_commerce.telefone;
DROP SEQUENCE e_commerce.produto_cod_seq;
DROP TABLE e_commerce.produto;
DROP SEQUENCE e_commerce.endereco_cod_seq;
DROP TABLE e_commerce.endereco;
DROP SEQUENCE e_commerce.cliente_cod_seq;
DROP TABLE e_commerce.cliente;
DROP SEQUENCE e_commerce.cidade_cod_seq;
DROP TABLE e_commerce.cidade;
DROP SEQUENCE e_commerce.categoria_cod_seq;
DROP TABLE e_commerce.categoria;
DROP SCHEMA e_commerce;
--
-- TOC entry 11 (class 2615 OID 17989)
-- Name: e_commerce; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA e_commerce;


ALTER SCHEMA e_commerce OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 286 (class 1259 OID 17991)
-- Name: categoria; Type: TABLE; Schema: e_commerce; Owner: postgres
--

CREATE TABLE e_commerce.categoria (
    cod integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE e_commerce.categoria OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 17990)
-- Name: categoria_cod_seq; Type: SEQUENCE; Schema: e_commerce; Owner: postgres
--

CREATE SEQUENCE e_commerce.categoria_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE e_commerce.categoria_cod_seq OWNER TO postgres;

--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 285
-- Name: categoria_cod_seq; Type: SEQUENCE OWNED BY; Schema: e_commerce; Owner: postgres
--

ALTER SEQUENCE e_commerce.categoria_cod_seq OWNED BY e_commerce.categoria.cod;


--
-- TOC entry 299 (class 1259 OID 18082)
-- Name: cidade; Type: TABLE; Schema: e_commerce; Owner: postgres
--

CREATE TABLE e_commerce.cidade (
    cod integer NOT NULL,
    nome character varying NOT NULL,
    uf character varying(2) NOT NULL
);


ALTER TABLE e_commerce.cidade OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 18081)
-- Name: cidade_cod_seq; Type: SEQUENCE; Schema: e_commerce; Owner: postgres
--

CREATE SEQUENCE e_commerce.cidade_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE e_commerce.cidade_cod_seq OWNER TO postgres;

--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 298
-- Name: cidade_cod_seq; Type: SEQUENCE OWNED BY; Schema: e_commerce; Owner: postgres
--

ALTER SEQUENCE e_commerce.cidade_cod_seq OWNED BY e_commerce.cidade.cod;


--
-- TOC entry 294 (class 1259 OID 18030)
-- Name: cliente; Type: TABLE; Schema: e_commerce; Owner: postgres
--

CREATE TABLE e_commerce.cliente (
    cod integer NOT NULL,
    nome character varying NOT NULL,
    cod_endereco integer NOT NULL,
    sexo character(1) NOT NULL,
    data_nasc date NOT NULL
);


ALTER TABLE e_commerce.cliente OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 18029)
-- Name: cliente_cod_seq; Type: SEQUENCE; Schema: e_commerce; Owner: postgres
--

CREATE SEQUENCE e_commerce.cliente_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE e_commerce.cliente_cod_seq OWNER TO postgres;

--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 293
-- Name: cliente_cod_seq; Type: SEQUENCE OWNED BY; Schema: e_commerce; Owner: postgres
--

ALTER SEQUENCE e_commerce.cliente_cod_seq OWNED BY e_commerce.cliente.cod;


--
-- TOC entry 292 (class 1259 OID 18021)
-- Name: endereco; Type: TABLE; Schema: e_commerce; Owner: postgres
--

CREATE TABLE e_commerce.endereco (
    cod integer NOT NULL,
    rua character varying(100) NOT NULL,
    bairro character varying NOT NULL,
    cod_cidade integer NOT NULL,
    cep character varying NOT NULL
);


ALTER TABLE e_commerce.endereco OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 18020)
-- Name: endereco_cod_seq; Type: SEQUENCE; Schema: e_commerce; Owner: postgres
--

CREATE SEQUENCE e_commerce.endereco_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE e_commerce.endereco_cod_seq OWNER TO postgres;

--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 291
-- Name: endereco_cod_seq; Type: SEQUENCE OWNED BY; Schema: e_commerce; Owner: postgres
--

ALTER SEQUENCE e_commerce.endereco_cod_seq OWNED BY e_commerce.endereco.cod;


--
-- TOC entry 288 (class 1259 OID 18000)
-- Name: produto; Type: TABLE; Schema: e_commerce; Owner: postgres
--

CREATE TABLE e_commerce.produto (
    cod integer NOT NULL,
    nome character varying NOT NULL,
    valor numeric(10,2) NOT NULL,
    estoque integer NOT NULL,
    cod_categoria integer NOT NULL
);


ALTER TABLE e_commerce.produto OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 17999)
-- Name: produto_cod_seq; Type: SEQUENCE; Schema: e_commerce; Owner: postgres
--

CREATE SEQUENCE e_commerce.produto_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE e_commerce.produto_cod_seq OWNER TO postgres;

--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 287
-- Name: produto_cod_seq; Type: SEQUENCE OWNED BY; Schema: e_commerce; Owner: postgres
--

ALTER SEQUENCE e_commerce.produto_cod_seq OWNED BY e_commerce.produto.cod;


--
-- TOC entry 290 (class 1259 OID 18014)
-- Name: telefone; Type: TABLE; Schema: e_commerce; Owner: postgres
--

CREATE TABLE e_commerce.telefone (
    cod integer NOT NULL,
    telefone character varying NOT NULL,
    cod_cliente integer NOT NULL
);


ALTER TABLE e_commerce.telefone OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 18013)
-- Name: telefone_cod_seq; Type: SEQUENCE; Schema: e_commerce; Owner: postgres
--

CREATE SEQUENCE e_commerce.telefone_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE e_commerce.telefone_cod_seq OWNER TO postgres;

--
-- TOC entry 3560 (class 0 OID 0)
-- Dependencies: 289
-- Name: telefone_cod_seq; Type: SEQUENCE OWNED BY; Schema: e_commerce; Owner: postgres
--

ALTER SEQUENCE e_commerce.telefone_cod_seq OWNED BY e_commerce.telefone.cod;


--
-- TOC entry 296 (class 1259 OID 18050)
-- Name: venda; Type: TABLE; Schema: e_commerce; Owner: postgres
--

CREATE TABLE e_commerce.venda (
    cod integer NOT NULL,
    data_venda date,
    cod_cliente integer
);


ALTER TABLE e_commerce.venda OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 18049)
-- Name: venda_cod_seq; Type: SEQUENCE; Schema: e_commerce; Owner: postgres
--

CREATE SEQUENCE e_commerce.venda_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE e_commerce.venda_cod_seq OWNER TO postgres;

--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 295
-- Name: venda_cod_seq; Type: SEQUENCE OWNED BY; Schema: e_commerce; Owner: postgres
--

ALTER SEQUENCE e_commerce.venda_cod_seq OWNED BY e_commerce.venda.cod;


--
-- TOC entry 297 (class 1259 OID 18061)
-- Name: venda_produto; Type: TABLE; Schema: e_commerce; Owner: postgres
--

CREATE TABLE e_commerce.venda_produto (
    cod_venda integer NOT NULL,
    cod_produto integer NOT NULL,
    quantidade integer NOT NULL,
    cod integer NOT NULL
);


ALTER TABLE e_commerce.venda_produto OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 18095)
-- Name: venda_produto_cod_seq; Type: SEQUENCE; Schema: e_commerce; Owner: postgres
--

CREATE SEQUENCE e_commerce.venda_produto_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE e_commerce.venda_produto_cod_seq OWNER TO postgres;

--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 300
-- Name: venda_produto_cod_seq; Type: SEQUENCE OWNED BY; Schema: e_commerce; Owner: postgres
--

ALTER SEQUENCE e_commerce.venda_produto_cod_seq OWNED BY e_commerce.venda_produto.cod;


--
-- TOC entry 3361 (class 2604 OID 17994)
-- Name: categoria cod; Type: DEFAULT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.categoria ALTER COLUMN cod SET DEFAULT nextval('e_commerce.categoria_cod_seq'::regclass);


--
-- TOC entry 3368 (class 2604 OID 18085)
-- Name: cidade cod; Type: DEFAULT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.cidade ALTER COLUMN cod SET DEFAULT nextval('e_commerce.cidade_cod_seq'::regclass);


--
-- TOC entry 3365 (class 2604 OID 18033)
-- Name: cliente cod; Type: DEFAULT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.cliente ALTER COLUMN cod SET DEFAULT nextval('e_commerce.cliente_cod_seq'::regclass);


--
-- TOC entry 3364 (class 2604 OID 18024)
-- Name: endereco cod; Type: DEFAULT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.endereco ALTER COLUMN cod SET DEFAULT nextval('e_commerce.endereco_cod_seq'::regclass);


--
-- TOC entry 3362 (class 2604 OID 18003)
-- Name: produto cod; Type: DEFAULT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.produto ALTER COLUMN cod SET DEFAULT nextval('e_commerce.produto_cod_seq'::regclass);


--
-- TOC entry 3363 (class 2604 OID 18017)
-- Name: telefone cod; Type: DEFAULT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.telefone ALTER COLUMN cod SET DEFAULT nextval('e_commerce.telefone_cod_seq'::regclass);


--
-- TOC entry 3366 (class 2604 OID 18053)
-- Name: venda cod; Type: DEFAULT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.venda ALTER COLUMN cod SET DEFAULT nextval('e_commerce.venda_cod_seq'::regclass);


--
-- TOC entry 3367 (class 2604 OID 18096)
-- Name: venda_produto cod; Type: DEFAULT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.venda_produto ALTER COLUMN cod SET DEFAULT nextval('e_commerce.venda_produto_cod_seq'::regclass);


--
-- TOC entry 3535 (class 0 OID 17991)
-- Dependencies: 286
-- Data for Name: categoria; Type: TABLE DATA; Schema: e_commerce; Owner: postgres
--

INSERT INTO e_commerce.categoria VALUES (1, 'Móveis');
INSERT INTO e_commerce.categoria VALUES (2, 'Ferramentas');
INSERT INTO e_commerce.categoria VALUES (3, 'Jardinagem');
INSERT INTO e_commerce.categoria VALUES (4, 'Eletrônicos');
INSERT INTO e_commerce.categoria VALUES (5, 'Moda');
INSERT INTO e_commerce.categoria VALUES (6, 'Esportes');
INSERT INTO e_commerce.categoria VALUES (7, 'Beleza');
INSERT INTO e_commerce.categoria VALUES (8, 'Brinquedos');
INSERT INTO e_commerce.categoria VALUES (9, 'Livros');
INSERT INTO e_commerce.categoria VALUES (10, 'Outros');


--
-- TOC entry 3548 (class 0 OID 18082)
-- Dependencies: 299
-- Data for Name: cidade; Type: TABLE DATA; Schema: e_commerce; Owner: postgres
--

INSERT INTO e_commerce.cidade VALUES (1, 'TUBARÃO', 'SC');
INSERT INTO e_commerce.cidade VALUES (2, 'LAGUNA', 'SC');
INSERT INTO e_commerce.cidade VALUES (3, 'SÃO PAULO', 'SP');
INSERT INTO e_commerce.cidade VALUES (4, 'FLORIANOPOLIS', 'SC');


--
-- TOC entry 3543 (class 0 OID 18030)
-- Dependencies: 294
-- Data for Name: cliente; Type: TABLE DATA; Schema: e_commerce; Owner: postgres
--

INSERT INTO e_commerce.cliente VALUES (1, 'João Silva', 2, 'M', '1990-01-15');
INSERT INTO e_commerce.cliente VALUES (2, 'Maria Souza', 1, 'F', '1985-07-25');


--
-- TOC entry 3541 (class 0 OID 18021)
-- Dependencies: 292
-- Data for Name: endereco; Type: TABLE DATA; Schema: e_commerce; Owner: postgres
--

INSERT INTO e_commerce.endereco VALUES (1, 'Rua A', 'Bairro X', 1, '88702-283');
INSERT INTO e_commerce.endereco VALUES (2, 'Rua B', 'Bairro Z', 2, '88700-332');


--
-- TOC entry 3537 (class 0 OID 18000)
-- Dependencies: 288
-- Data for Name: produto; Type: TABLE DATA; Schema: e_commerce; Owner: postgres
--

INSERT INTO e_commerce.produto VALUES (1, 'Cadeira', 100.00, 20, 1);
INSERT INTO e_commerce.produto VALUES (2, 'Martelo', 15.50, 15, 2);
INSERT INTO e_commerce.produto VALUES (3, 'Vaso', 30.00, 10, 3);
INSERT INTO e_commerce.produto VALUES (4, 'Smartphone', 800.00, 5, 4);
INSERT INTO e_commerce.produto VALUES (5, 'Camiseta', 25.00, 30, 5);
INSERT INTO e_commerce.produto VALUES (6, 'Bola', 10.00, 50, 6);


--
-- TOC entry 3539 (class 0 OID 18014)
-- Dependencies: 290
-- Data for Name: telefone; Type: TABLE DATA; Schema: e_commerce; Owner: postgres
--

INSERT INTO e_commerce.telefone VALUES (1, '48 996300443', 1);
INSERT INTO e_commerce.telefone VALUES (2, '48 992344323', 2);


--
-- TOC entry 3545 (class 0 OID 18050)
-- Dependencies: 296
-- Data for Name: venda; Type: TABLE DATA; Schema: e_commerce; Owner: postgres
--

INSERT INTO e_commerce.venda VALUES (1, '2023-06-01', 1);
INSERT INTO e_commerce.venda VALUES (2, '2023-06-05', 2);


--
-- TOC entry 3546 (class 0 OID 18061)
-- Dependencies: 297
-- Data for Name: venda_produto; Type: TABLE DATA; Schema: e_commerce; Owner: postgres
--

INSERT INTO e_commerce.venda_produto VALUES (1, 1, 3, 4);
INSERT INTO e_commerce.venda_produto VALUES (1, 2, 2, 5);
INSERT INTO e_commerce.venda_produto VALUES (2, 3, 1, 6);


--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 285
-- Name: categoria_cod_seq; Type: SEQUENCE SET; Schema: e_commerce; Owner: postgres
--

SELECT pg_catalog.setval('e_commerce.categoria_cod_seq', 1, false);


--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 298
-- Name: cidade_cod_seq; Type: SEQUENCE SET; Schema: e_commerce; Owner: postgres
--

SELECT pg_catalog.setval('e_commerce.cidade_cod_seq', 4, true);


--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 293
-- Name: cliente_cod_seq; Type: SEQUENCE SET; Schema: e_commerce; Owner: postgres
--

SELECT pg_catalog.setval('e_commerce.cliente_cod_seq', 1, false);


--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 291
-- Name: endereco_cod_seq; Type: SEQUENCE SET; Schema: e_commerce; Owner: postgres
--

SELECT pg_catalog.setval('e_commerce.endereco_cod_seq', 1, false);


--
-- TOC entry 3567 (class 0 OID 0)
-- Dependencies: 287
-- Name: produto_cod_seq; Type: SEQUENCE SET; Schema: e_commerce; Owner: postgres
--

SELECT pg_catalog.setval('e_commerce.produto_cod_seq', 1, false);


--
-- TOC entry 3568 (class 0 OID 0)
-- Dependencies: 289
-- Name: telefone_cod_seq; Type: SEQUENCE SET; Schema: e_commerce; Owner: postgres
--

SELECT pg_catalog.setval('e_commerce.telefone_cod_seq', 2, true);


--
-- TOC entry 3569 (class 0 OID 0)
-- Dependencies: 295
-- Name: venda_cod_seq; Type: SEQUENCE SET; Schema: e_commerce; Owner: postgres
--

SELECT pg_catalog.setval('e_commerce.venda_cod_seq', 2, true);


--
-- TOC entry 3570 (class 0 OID 0)
-- Dependencies: 300
-- Name: venda_produto_cod_seq; Type: SEQUENCE SET; Schema: e_commerce; Owner: postgres
--

SELECT pg_catalog.setval('e_commerce.venda_produto_cod_seq', 6, true);


--
-- TOC entry 3370 (class 2606 OID 17998)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (cod);


--
-- TOC entry 3384 (class 2606 OID 18089)
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (cod);


--
-- TOC entry 3378 (class 2606 OID 18037)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cod);


--
-- TOC entry 3376 (class 2606 OID 18028)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (cod);


--
-- TOC entry 3372 (class 2606 OID 18007)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (cod);


--
-- TOC entry 3374 (class 2606 OID 18019)
-- Name: telefone telefone_pkey; Type: CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.telefone
    ADD CONSTRAINT telefone_pkey PRIMARY KEY (cod);


--
-- TOC entry 3380 (class 2606 OID 18055)
-- Name: venda venda_pkey; Type: CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (cod);


--
-- TOC entry 3382 (class 2606 OID 18102)
-- Name: venda_produto venda_produto_pk; Type: CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.venda_produto
    ADD CONSTRAINT venda_produto_pk PRIMARY KEY (cod);


--
-- TOC entry 3388 (class 2606 OID 18076)
-- Name: cliente cliente_fk; Type: FK CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.cliente
    ADD CONSTRAINT cliente_fk FOREIGN KEY (cod_endereco) REFERENCES e_commerce.endereco(cod);


--
-- TOC entry 3387 (class 2606 OID 18090)
-- Name: endereco endereco_fk; Type: FK CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.endereco
    ADD CONSTRAINT endereco_fk FOREIGN KEY (cod_cidade) REFERENCES e_commerce.cidade(cod);


--
-- TOC entry 3385 (class 2606 OID 18008)
-- Name: produto produto_cod_categoria_fkey; Type: FK CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.produto
    ADD CONSTRAINT produto_cod_categoria_fkey FOREIGN KEY (cod_categoria) REFERENCES e_commerce.categoria(cod);


--
-- TOC entry 3386 (class 2606 OID 18103)
-- Name: telefone telefone_fk; Type: FK CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.telefone
    ADD CONSTRAINT telefone_fk FOREIGN KEY (cod_cliente) REFERENCES e_commerce.cliente(cod);


--
-- TOC entry 3389 (class 2606 OID 18056)
-- Name: venda venda_cod_cliente_fkey; Type: FK CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.venda
    ADD CONSTRAINT venda_cod_cliente_fkey FOREIGN KEY (cod_cliente) REFERENCES e_commerce.cliente(cod);


--
-- TOC entry 3390 (class 2606 OID 18071)
-- Name: venda_produto venda_produto_cod_produto_fkey; Type: FK CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.venda_produto
    ADD CONSTRAINT venda_produto_cod_produto_fkey FOREIGN KEY (cod_produto) REFERENCES e_commerce.produto(cod);


--
-- TOC entry 3391 (class 2606 OID 18066)
-- Name: venda_produto venda_produto_cod_venda_fkey; Type: FK CONSTRAINT; Schema: e_commerce; Owner: postgres
--

ALTER TABLE ONLY e_commerce.venda_produto
    ADD CONSTRAINT venda_produto_cod_venda_fkey FOREIGN KEY (cod_venda) REFERENCES e_commerce.venda(cod);


-- Completed on 2023-06-12 17:04:28

--
-- PostgreSQL database dump complete
--

