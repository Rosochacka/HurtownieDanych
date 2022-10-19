-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-19 20:09:38.709

-- tables
-- Table: f_employee
CREATE TABLE f_employee (
    id int  NOT NULL,
    pesel varchar(11)  NOT NULL,
    address varchar(100)  NOT NULL,
    salary decimal(10,2)  NOT NULL,
    CONSTRAINT f_employee_pk PRIMARY KEY  (id)
);

-- Table: history
CREATE TABLE history (
    id int  NOT NULL,
    performance int  NOT NULL,
    employee_id int  NOT NULL,
    date date  NOT NULL,
    CONSTRAINT history_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: history_employee (table: history)
ALTER TABLE history ADD CONSTRAINT history_employee
    FOREIGN KEY (employee_id)
    REFERENCES f_employee (id);

-- End of file.

