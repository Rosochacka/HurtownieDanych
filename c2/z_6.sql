-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-19 20:52:54.651

-- tables
-- Table: brand
CREATE TABLE brand (
    id int  NOT NULL,
    name varchar(50)  NOT NULL,
    CONSTRAINT brand_pk PRIMARY KEY  (id)
);

-- Table: date
CREATE TABLE date (
    id int  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    year int  NOT NULL,
    CONSTRAINT date_pk PRIMARY KEY  (id)
);

-- Table: f_state
CREATE TABLE f_state (
    id int  NOT NULL,
    quantity int  NOT NULL,
    product_id int  NOT NULL,
    warehouse_id int  NOT NULL,
    date_id int  NOT NULL,
    CONSTRAINT f_state_pk PRIMARY KEY  (id)
);

-- Table: product
CREATE TABLE product (
    id int  NOT NULL,
    name int  NOT NULL,
    brand_id int  NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY  (id)
);

-- Table: warehouse
CREATE TABLE warehouse (
    id int  NOT NULL,
    address varchar(100)  NOT NULL,
    country varchar(50)  NOT NULL,
    CONSTRAINT warehouse_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: f_warehouse_date (table: f_state)
ALTER TABLE f_state ADD CONSTRAINT f_warehouse_date
    FOREIGN KEY (date_id)
    REFERENCES date (id);

-- Reference: f_warehouse_product (table: f_state)
ALTER TABLE f_state ADD CONSTRAINT f_warehouse_product
    FOREIGN KEY (product_id)
    REFERENCES product (id);

-- Reference: f_warehouse_warehouse (table: f_state)
ALTER TABLE f_state ADD CONSTRAINT f_warehouse_warehouse
    FOREIGN KEY (warehouse_id)
    REFERENCES warehouse (id);

-- Reference: product_brand (table: product)
ALTER TABLE product ADD CONSTRAINT product_brand
    FOREIGN KEY (brand_id)
    REFERENCES brand (id);

-- End of file.

