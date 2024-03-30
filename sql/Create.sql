-- DDL Statements to create the DB Schema --

CREATE TABLE hotel_chain (
	name VARCHAR(20),
    num_hotels INT,
    PRIMARY KEY (name)
);

CREATE TABLE central_address (
	chain VARCHAR(20),
    address VARCHAR(50),
    CONSTRAINT PK_central_address PRIMARY KEY (chain, address)
);

ALTER TABLE central_address
ADD FOREIGN KEY (chain) REFERENCES hotel_chain(name)
ON DELETE CASCADE;

CREATE TABLE chain_email (
	chain VARCHAR(20),
    email VARCHAR(40),
    CONSTRAINT PK_chain_email PRIMARY KEY (chain, email)
);

ALTER TABLE chain_email
ADD FOREIGN KEY (chain) REFERENCES hotel_chain(name)
ON DELETE CASCADE; 

CREATE TABLE chain_phone_num (
	chain VARCHAR(20),
    phone_num VARCHAR(20),
    CONSTRAINT PK_chain_phone_num PRIMARY KEY (chain, phone_num)
);

ALTER TABLE chain_phone_num
ADD FOREIGN KEY (chain) REFERENCES hotel_chain(name)
ON DELETE CASCADE;

CREATE TABLE hotel (
	hotel_id INT,
    chain VARCHAR(20),
    num_rooms INT,
    address VARCHAR(50),
    email VARCHAR(40),
    rating INT,
    manager_SSN VARCHAR(9),
    CONSTRAINT PK_hotel PRIMARY KEY (hotel_id, chain),
    CONSTRAINT rating CHECK (rating BETWEEN 1 AND 5)
);

ALTER TABLE hotel
ADD FOREIGN KEY (chain) REFERENCES hotel_chain(name)
ON DELETE CASCADE; 

CREATE TABLE hotel_phone (
	hotel_id INT,
    chain VARCHAR(20),
    phone_num VARCHAR(20),
    CONSTRAINT PK_hotel_phone PRIMARY KEY (hotel_id, chain, phone_num)
);

ALTER TABLE hotel_phone
ADD CONSTRAINT FK_hotel_phone
FOREIGN KEY (hotel_id, chain) REFERENCES hotel(hotel_id, chain)
ON DELETE CASCADE;

CREATE TABLE room (
	room_num INT,
    hotel_id INT,
    chain VARCHAR(20),
    price DECIMAL(6, 2),
    capacity INT,
    view ENUM('mountainside', 'oceanside'),
    extendible BOOLEAN,
    CONSTRAINT PK_room PRIMARY KEY (room_num, hotel_id, chain),
    CONSTRAINT capacity CHECK (capacity BETWEEN 1 AND 5)
);

ALTER TABLE room
ADD CONSTRAINT FK_room
FOREIGN KEY (hotel_id, chain) REFERENCES hotel(hotel_id, chain)
ON DELETE CASCADE;

CREATE TABLE amenity (
	room_num INT,
    hotel_id INT,
    chain VARCHAR(20),
    amenity VARCHAR(25),
    CONSTRAINT PK_amenity PRIMARY KEY (room_num, hotel_id, chain, amenity)
);

ALTER TABLE amenity
ADD CONSTRAINT FK_amenity
FOREIGN KEY (room_num, hotel_id, chain) REFERENCES room(room_num, hotel_id, chain)
ON DELETE CASCADE; 

CREATE TABLE damage (
	room_num INT,
    hotel_id INT,
    chain VARCHAR(20),
    damage VARCHAR(50),
    CONSTRAINT PK_damage PRIMARY KEY (room_num, hotel_id, chain, damage)
);

ALTER TABLE damage
ADD CONSTRAINT FK_damage
FOREIGN KEY (room_num, hotel_id, chain) REFERENCES room(room_num, hotel_id, chain)
ON DELETE CASCADE; 

CREATE TABLE employee (
	SSN VARCHAR(9),
    name VARCHAR(25),
    address VARCHAR(50),
    hotel_id INT,
    chain VARCHAR(20),
    PRIMARY KEY (SSN)
);

ALTER TABLE employee 
ADD CONSTRAINT FK_employee
FOREIGN KEY (hotel_id, chain) REFERENCES hotel(hotel_id, chain)
ON DELETE SET NULL; 

ALTER TABLE hotel
ADD FOREIGN KEY (manager_SSN) REFERENCES employee(SSN)
ON DELETE SET NULL; 

CREATE TABLE employee_role (
	employee_SSN VARCHAR(9),
    role VARCHAR(15),
    CONSTRAINT PK_employee_role PRIMARY KEY (employee_SSN, role)
);

ALTER TABLE employee_role
ADD FOREIGN KEY (employee_SSN) REFERENCES employee(SSN)
ON DELETE CASCADE; 

CREATE TABLE customer (
	SSN VARCHAR(9),
    name VARCHAR(25),
    address VARCHAR(50),
    registration_date DATE,
    PRIMARY KEY (SSN)
);

CREATE TABLE booking_renting (
	booking_id INT,
	room_num INT,
    hotel_id INT,
	chain VARCHAR(20),
    customer_SSN VARCHAR(9),
    is_renting ENUM('active', 'renting', 'cancelled', 'archived'),
    CONSTRAINT PK_booking_renting PRIMARY KEY(booking_id, hotel_id, chain)
);

ALTER TABLE booking_renting
ADD FOREIGN KEY (room_num) REFERENCES room(room_num)
ON DELETE SET NULL; 

ALTER TABLE booking_renting
ADD CONSTRAINT FK_booking_renting_hotel
FOREIGN KEY (hotel_id, chain) REFERENCES hotel(hotel_id, chain) 
ON DELETE CASCADE; 

ALTER TABLE booking_renting
ADD FOREIGN KEY (customer_SSN) REFERENCES customer(SSN)
ON DELETE SET NULL; 

CREATE TABLE booking_date (
	booking_id INT,
	hotel_id INT,
    chain VARCHAR(20),
    date DATE,
    CONSTRAINT PK_booking_date PRIMARY KEY (booking_id, hotel_id, chain, date)
);

ALTER TABLE booking_date
ADD CONSTRAINT FK_booking_date
FOREIGN KEY (booking_id, hotel_id, chain) REFERENCES booking_renting(booking_id, hotel_id, chain)
ON DELETE CASCADE; 









