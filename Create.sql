-- DDL Statements to create the DB Schema --

CREATE TABLE hotel_chain (
	name VARCHAR(20),
    num_hotels INT,
    PRIMARY KEY (name)
);

CREATE TABLE central_addresses (
	chain VARCHAR(20),
    address VARCHAR(50),
    CONSTRAINT PK_central_addresses PRIMARY KEY (chain, address)
);

ALTER TABLE central_addresses 
ADD FOREIGN KEY (chain)
REFERENCES hotel_chain(name)
ON DELETE CASCADE;

CREATE TABLE chain_emails (
	chain VARCHAR(20),
    email VARCHAR(25),
    CONSTRAINT PK_chain_emails PRIMARY KEY (chain, email)
);

ALTER TABLE chain_emails 
ADD FOREIGN KEY (chain)
REFERENCES hotel_chain(name)
ON DELETE CASCADE; 

CREATE TABLE chain_phone_nums (
	chain VARCHAR(20),
    phone_num VARCHAR(15),
    CONSTRAINT PK_chain_phone_nums PRIMARY KEY (chain, phone_num)
);

ALTER TABLE chain_phone_nums
ADD FOREIGN KEY (chain)
REFERENCES hotel_chain(name)
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
ADD FOREIGN KEY (chain)
REFERENCES hotel_chain(name)
ON DELETE CASCADE; 

-- ADD Foreign Key to Employee table for manager_SSN -- 










