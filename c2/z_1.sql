-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-19 18:43:37.422

-- tables
-- Table: client
CREATE TABLE client (
    id int  NOT NULL,
    phone varchar(15)  NOT NULL,
    address varchar(100)  NOT NULL,
    name varchar(50)  NOT NULL,
    surname varchar(50)  NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY  (id)
);

-- Table: order
CREATE TABLE "order" (
    id int  NOT NULL,
    order_date date  NOT NULL,
    supplier_id int  NOT NULL,
    product_id int  NOT NULL,
    client_id int  NOT NULL,
    CONSTRAINT order_pk PRIMARY KEY  (id)
);

-- Table: product
CREATE TABLE product (
    id int  NOT NULL,
    publisher varchar(50)  NOT NULL,
    isbn varchar(13)  NOT NULL,
    title varchar(50)  NOT NULL,
    author varchar(100)  NOT NULL,
    number_of_pages int  NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY  (id)
);

-- Table: supplier
CREATE TABLE supplier (
    id int  NOT NULL,
    nip char(10)  NOT NULL,
    address varchar(100)  NOT NULL,
    Name varchar(50)  NOT NULL,
    CONSTRAINT supplier_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: order_client (table: order)
ALTER TABLE "order" ADD CONSTRAINT order_client
    FOREIGN KEY (client_id)
    REFERENCES client (id);

-- Reference: order_product (table: order)
ALTER TABLE "order" ADD CONSTRAINT order_product
    FOREIGN KEY (product_id)
    REFERENCES product (id);

-- Reference: order_supplier (table: order)
ALTER TABLE "order" ADD CONSTRAINT order_supplier
    FOREIGN KEY (supplier_id)
    REFERENCES supplier (id);

-- End of file.

