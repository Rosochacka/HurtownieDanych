-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-19 19:46:08.894

-- tables
-- Table: client
CREATE TABLE client (
    id int  NOT NULL,
    nip char(10)  NOT NULL,
    name varchar(50)  NOT NULL,
    address varchar(100)  NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY  (id)
);

-- Table: fruit
CREATE TABLE fruit (
    id int  NOT NULL,
    name varchar(50)  NOT NULL,
    price decimal(10,2)  NOT NULL,
    category varchar(50)  NOT NULL,
    CONSTRAINT fruit_pk PRIMARY KEY  (id)
);

-- Table: order
CREATE TABLE "order" (
    id int  NOT NULL,
    total decimal(10,2)  NOT NULL,
    place varchar(50)  NOT NULL,
    amount decimal(10,2)  NOT NULL,
    order_date_id int  NOT NULL,
    client_id int  NOT NULL,
    fruit_id int  NOT NULL,
    CONSTRAINT order_pk PRIMARY KEY  (id)
);

-- Table: order_date
CREATE TABLE order_date (
    id int  NOT NULL,
    day int  NOT NULL,
    hour int  NOT NULL,
    month int  NOT NULL,
    CONSTRAINT order_date_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: entity_1_client (table: order)
ALTER TABLE "order" ADD CONSTRAINT entity_1_client
    FOREIGN KEY (client_id)
    REFERENCES client (id);

-- Reference: entity_1_fruit (table: order)
ALTER TABLE "order" ADD CONSTRAINT entity_1_fruit
    FOREIGN KEY (fruit_id)
    REFERENCES fruit (id);

-- Reference: entity_1_order_date (table: order)
ALTER TABLE "order" ADD CONSTRAINT entity_1_order_date
    FOREIGN KEY (order_date_id)
    REFERENCES order_date (id);

-- sequences
-- Sequence: client_seq
CREATE SEQUENCE client_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: fruit_seq
CREATE SEQUENCE fruit_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: order_date_seq
CREATE SEQUENCE order_date_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: order_seq
CREATE SEQUENCE order_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

