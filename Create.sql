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
    email VARCHAR(25),
    CONSTRAINT PK_chain_email PRIMARY KEY (chain, email)
);

ALTER TABLE chain_email
ADD FOREIGN KEY (chain) REFERENCES hotel_chain(name)
ON DELETE CASCADE; 

CREATE TABLE chain_phone_num (
	chain VARCHAR(20),
    phone_num VARCHAR(15),
    CONSTRAINT PK_chain_phone_num PRIMARY KEY (chain, phone_num)
);

ALTER TABLE chain_phone_num
ADD FOREIGN KEY (chain) REFERENCES hotel_chain(name)
ON DELETE CASCADE;

CREATE TABLE hotel (
	hotel_id INT AUTO_INCREMENT,
    chain VARCHAR(20),
    num_rooms INT,
    address VARCHAR(50),
    email VARCHAR(25),
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
    phone_num VARCHAR(15),
    CONSTRAINT PK_hotel_phone PRIMARY KEY (hotel_id, chain, phone_num)
);

ALTER TABLE hotel_phone
ADD CONSTRAINT FK_hotel_phone
FOREIGN KEY (hotel_id, chain) REFERENCES hotel(hotel_id, chain)
ON DELETE CASCADE;

CREATE TABLE room (
	room_num INT AUTO_INCREMENT,
    hotel_id INT,
    chain VARCHAR(20),
    price DECIMAL(6, 2),
    capacity INT,
    view ENUM('mountainside', 'oceanside'),
    extendible BOOLEAN,
    CONSTRAINT PK_room PRIMARY KEY (room_num, hotel_id, chain),
    CONSTRAINT capacity CHECK (capacity BETWEEN 1 AND 4)
);

ALTER TABLE room
ADD CONSTRAINT FK_room
FOREIGN KEY (hotel_id, chain) REFERENCES hotel(hotel_id, chain)
ON DELETE CASCADE;

CREATE TABLE amenity (
	room_num INT,
    hotel_id INT,
    chain VARCHAR(20),
    amenity VARCHAR(15),
    CONSTRAINT PK_amenity FOREIGN KEY (room_num, hotel_id, chain) REFERENCES room (room_num, hotel_id, chain) 
    ON DELETE CASCADE
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
	booking_id INT AUTO_INCREMENT,
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

-- Populate hotel_chain table
INSERT INTO hotel_chain (name, num_hotels) VALUES
('Grand Hotels', 8),
('Royal Resorts', 10),
('Golden Palaces', 8),
('Silver Suites', 12),
('Diamond Inns', 9);

-- Populate central_address table
INSERT INTO central_address (chain, address) VALUES
('Grand Hotels', '123 Grand Avenue, New York, USA'),
('Royal Resorts', '456 Royal Street, London, UK'),
('Golden Palaces', '789 Gold Road, Paris, France'),
('Silver Suites', '101 Silver Boulevard, Tokyo, Japan'),
('Diamond Inns', '202 Diamond Drive, Sydney, Australia');

-- Populate chain_email table
INSERT INTO chain_email (chain, email) VALUES
('Grand Hotels', 'info@grandhotels.com'),
('Royal Resorts', 'info@royalresorts.com'),
('Golden Palaces', 'info@goldenpalaces.com'),
('Silver Suites', 'info@silversuites.com'),
('Diamond Inns', 'info@diamondinns.com');

-- Populate chain_phone_num table
INSERT INTO chain_phone_num (chain, phone_num) VALUES
('Grand Hotels', '+1 1234567890'),
('Royal Resorts', '+44 2012345678'),
('Golden Palaces', '+33 198765432'),
('Silver Suites', '+81 312345678'),
('Diamond Inns', '+61 298765432');

-- Populate hotel table
INSERT INTO hotel (hotel_id, chain, num_rooms, address, email, rating, manager_SSN) VALUES
(1, 'Grand Hotels', 50, '123 Grand Avenue, New York, USA', 'hotel1@grandhotels.com', 4, NULL),
(2, 'Grand Hotels', 40, '456 Royal Street, London, UK', 'hotel2@grandhotels.com', 3, NULL),
(3, 'Royal Resorts', 60, '789 Gold Road, Paris, France', 'hotel1@royalresorts.com', 5, NULL),
(4, 'Royal Resorts', 55, '101 Silver Boulevard, Tokyo, Japan', 'hotel2@royalresorts.com', 4, NULL),
(5, 'Golden Palaces', 45, '202 Diamond Drive, Sydney, Australia', 'hotel1@goldenpalaces.com', 3, NULL),
(6, 'Grand Hotels', 45, '222 Royal Avenue, New York, USA', 'hotel3@grandhotels.com', 4, NULL);

-- Populate employee table
INSERT INTO employee (SSN, name, address, hotel_id, chain) VALUES
('123456789', 'John Doe', '123 Grand Avenue, New York, USA', (SELECT hotel_id FROM hotel WHERE chain = 'Grand Hotels' AND address = '123 Grand Avenue, New York, USA'), 'Grand Hotels'),
('234567890', 'Jane Smith', '456 Royal Street, London, UK', (SELECT hotel_id FROM hotel WHERE chain = 'Grand Hotels' AND address = '456 Royal Street, London, UK'), 'Grand Hotels'),
('345678901', 'David Johnson', '789 Gold Road, Paris, France', (SELECT hotel_id FROM hotel WHERE chain = 'Royal Resorts' AND address = '789 Gold Road, Paris, France'), 'Royal Resorts'),
('456789012', 'Mary Brown', '101 Silver Boulevard, Tokyo, Japan', (SELECT hotel_id FROM hotel WHERE chain = 'Royal Resorts' AND address = '101 Silver Boulevard, Tokyo, Japan'), 'Royal Resorts'),
('567890123', 'Michael Lee', '202 Diamond Drive, Sydney, Australia', (SELECT hotel_id FROM hotel WHERE chain = 'Golden Palaces'), 'Golden Palaces');

UPDATE hotel h
SET manager_SSN = (
    SELECT SSN
    FROM employee e
    WHERE h.chain = e.chain
    LIMIT 1
)
WHERE manager_SSN IS NULL;

-- Populate employee_role table
INSERT INTO employee_role (employee_SSN, role) VALUES
('123456789', 'Manager'),
('234567890', 'Front Desk'),
('345678901', 'Manager'),
('456789012', 'Housekeeping'),
('567890123', 'Maintenance');

-- Populate hotel_phone table
INSERT INTO hotel_phone (hotel_id, chain, phone_num) VALUES
(1, 'Grand Hotels', '+1 1234567890'),
(1, 'Grand Hotels', '+1 2345678901'),
(2, 'Grand Hotels', '+44 2012345678'),
(3, 'Royal Resorts', '+33 198765432'),
(4, 'Royal Resorts', '+81 312345678'),
(5, 'Golden Palaces', '+61 298765432');

-- Populate room table
INSERT INTO room (hotel_id, chain, price, capacity, view, extendible) VALUES
(1, 'Grand Hotels', 100.00, 2, 'mountainside', TRUE),
(1, 'Grand Hotels', 150.00, 3, 'oceanside', TRUE),
(1, 'Grand Hotels', 200.00, 4, 'mountainside', FALSE),
(1, 'Grand Hotels', 250.00, 1, 'oceanside', FALSE),
(1, 'Grand Hotels', 300.00, 3, 'mountainside', TRUE),
(2, 'Grand Hotels', 120.00, 2, 'oceanside', FALSE),
(3, 'Royal Resorts', 180.00, 3, 'oceanside', TRUE),
(3, 'Royal Resorts', 220.00, 4, 'mountainside', TRUE),
(3, 'Royal Resorts', 250.00, 1, 'oceanside', FALSE),
(3, 'Royal Resorts', 280.00, 2, 'mountainside', FALSE),
(5, 'Golden Palaces', 200.00, 3, 'oceanside', TRUE),
(5, 'Golden Palaces', 220.00, 4, 'mountainside', TRUE),
(5, 'Golden Palaces', 240.00, 3, 'oceanside', FALSE),
(5, 'Golden Palaces', 260.00, 2, 'mountainside', FALSE),
(6, 'Grand Hotels', 130.00, 2, 'mountainside', TRUE),
(6, 'Grand Hotels', 160.00, 3, 'oceanside', TRUE),
(6, 'Grand Hotels', 180.00, 4, 'mountainside', FALSE),
(6, 'Grand Hotels', 200.00, 1, 'oceanside', FALSE),
(6, 'Grand Hotels', 220.00, 3, 'mountainside', TRUE);

-- Populate customer table
INSERT INTO customer (SSN, name, address, registration_date) VALUES
('111111111', 'Alice Johnson', '123 Main Street, Anytown, USA', '2024-03-15'),
('222222222', 'Bob Smith', '456 Elm Street, Springfield, USA', '2024-03-18'),
('333333333', 'Charlie Brown', '789 Oak Street, Lakeside, USA', '2024-03-20');

-- Populate amenity table
INSERT INTO amenity (room_num, hotel_id, chain, amenity) VALUES
(118, 1, 'Grand Hotels', 'Wi-Fi'),
(118, 1, 'Grand Hotels', 'TV'),
(119, 1, 'Grand Hotels', 'Mini Fridge'),
(119, 1, 'Grand Hotels', 'Balcony'),
(123, 2, 'Grand Hotels', 'AC'),
(125, 3, 'Royal Resorts', 'Swimming Pool'),
(126, 3, 'Royal Resorts', 'Gym'),
(124, 3, 'Royal Resorts', 'Room Service'),
(127, 3, 'Royal Resorts', 'Free Breakfast');

-- Populate damage table
INSERT INTO damage (room_num, hotel_id, chain, damage) VALUES
(118, 1, 'Grand Hotels', 'Broken Chair'),
(119, 1, 'Grand Hotels', 'Stained Carpet'),
(119, 1, 'Grand Hotels', 'Leaking Faucet'),
(123, 2, 'Grand Hotels', 'Cracked Mirror'),
(124, 3, 'Royal Resorts', 'Chipped Paint'),
(126, 3, 'Royal Resorts', 'Scratched Table');

-- Populate booking_renting table (You need to provide sample data for bookings)
INSERT INTO booking_renting (room_num, hotel_id, chain, customer_SSN, is_renting) VALUES
(118, 1, 'Grand Hotels', '111111111', 'active'),
(119, 1, 'Grand Hotels', '222222222', 'active'),
(120, 1, 'Grand Hotels', '333333333', 'active'),
(123, 2, 'Grand Hotels', '111111111', 'active'),
(124, 3, 'Royal Resorts', '333333333', 'active'),
(126, 3, 'Royal Resorts', '111111111', 'active');

-- Populate booking_date table (You need to provide sample data for booking dates)
INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(57, 1, 'Grand Hotels', '2024-03-27'),
(58, 1, 'Grand Hotels', '2024-04-05'),
(59, 1, 'Grand Hotels', '2024-04-10'),
(60, 2, 'Grand Hotels', '2024-04-15'),
(61, 3, 'Royal Resorts', '2024-04-25'),
(62, 3, 'Royal Resorts', '2024-05-01');
