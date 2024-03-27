-- Database Population -- 

-- Populate hotel_chain table
INSERT INTO hotel_chain (name, num_hotels) VALUES
('Grand Hotels', 8),
('Royal Resorts', 10),
('Ritz-Carlton', 20),
('Independence Inn', 12),
('Dragonfly Inn', 9);

-- Populate central_address table
INSERT INTO central_address (chain, address) VALUES
('Grand Hotels', '123 Main St, New York, USA'),
('Grand Hotels', '456 Elm St, Los Angeles, USA'),
('Royal Resorts', '789 Oak St, Miami, USA'),
('Royal Resorts', '101 Pine St, Orlando, USA'),
('Ritz-Carlton', '111 Broadway, Chicago, USA'),
('Ritz-Carlton', '222 Market St, San Francisco, USA'),
('Independence Inn', '333 Maple St, Boston, USA'),
('Independence Inn', '444 Cedar St, Philadelphia, USA'),
('Dragonfly Inn', '555 Willow St, Seattle, USA'),
('Dragonfly Inn', '666 Birch St, Denver, USA');

-- Populate chain_email table
INSERT INTO chain_email (chain, email) VALUES
('Grand Hotels', 'info@grandhotels.com'),
('Grand Hotels', 'reservations@grandhotels.com'),
('Royal Resorts', 'info@royalresorts.com'),
('Royal Resorts', 'reservations@royalresorts.com'),
('Ritz-Carlton', 'info@ritzcarlton.com'),
('Ritz-Carlton', 'reservations@ritzcarlton.com'),
('Independence Inn', 'info@independenceinn.com'),
('Independence Inn', 'reservations@independenceinn.com'),
('Dragonfly Inn', 'info@dragonflyinn.com'),
('Dragonfly Inn', 'reservations@dragonflyinn.com');

-- Populate chain_phone_num table
INSERT INTO chain_phone_num (chain, phone_num) VALUES
('Grand Hotels', '+1 (123) 456-7890'),
('Grand Hotels', '+1 (234) 567-8901'),
('Royal Resorts', '+1 (345) 678-9012'),
('Royal Resorts', '+1 (456) 789-0123'),
('Ritz-Carlton', '+1 (567) 890-1234'),
('Ritz-Carlton', '+1 (678) 901-2345'),
('Independence Inn', '+1 (789) 012-3456'),
('Independence Inn', '+1 (890) 123-4567'),
('Dragonfly Inn', '+1 (901) 234-5678'),
('Dragonfly Inn', '+1 (012) 345-6789');

-- Populate hotel table 
INSERT INTO hotel (hotel_id, chain, num_rooms, address, email, rating, manager_SSN) VALUES
-- Grand Hotels
(1, 'Grand Hotels', 25, '123 Park Ave, Miami, USA', 'contact1@grandhotels.com', 4, NULL),
(2, 'Grand Hotels', 20, '456 Lake St, Miami, USA', 'contact2@grandhotels.com', 3, NULL),
(3, 'Grand Hotels', 15, '789 River Rd, Las Vegas, USA', 'contact3@grandhotels.com', 5, NULL),
(4, 'Grand Hotels', 30, '101 Ocean Dr, San Francisco, USA', 'contact4@grandhotels.com', 4, NULL),
(5, 'Grand Hotels', 12, '111 Forest Ln, Orlando, USA', 'contact5@grandhotels.com', 2, NULL),
(6, 'Grand Hotels', 18, '222 Hill St, New York, USA', 'contact6@grandhotels.com', 5, NULL),
(7, 'Grand Hotels', 22, '333 Mountain View, Denver, USA', 'contact7@grandhotels.com', 3, NULL),
(8, 'Grand Hotels', 27, '444 Valley Blvd, Seattle, USA', 'contact8@grandhotels.com', 4, NULL),

-- Royal Resorts
(1, 'Royal Resorts', 28, '123 Beach Ave, Miami, USA', 'contact1@royalresorts.com', 5, NULL),
(2, 'Royal Resorts', 16, '456 Bay St, Chicago, USA', 'contact2@royalresorts.com', 3, NULL),
(3, 'Royal Resorts', 23, '789 Cove Rd, Chicago, USA', 'contact3@royalresorts.com', 4, NULL),
(4, 'Royal Resorts', 19, '101 Harbor Dr, San Francisco, USA', 'contact4@royalresorts.com', 2, NULL),
(5, 'Royal Resorts', 26, '111 Lagoon Ln, Orlando, USA', 'contact5@royalresorts.com', 5, NULL),
(6, 'Royal Resorts', 17, '222 Reef Rd, New York, USA', 'contact6@royalresorts.com', 4, NULL),
(7, 'Royal Resorts', 21, '333 Shoreline, Denver, USA', 'contact7@royalresorts.com', 3, NULL),
(8, 'Royal Resorts', 14, '444 Wave St, Seattle, USA', 'contact8@royalresorts.com', 1, NULL),

-- Ritz-Carlton
(1, 'Ritz-Carlton', 29, '123 Luxury Blvd, Miami, USA', 'contact1@ritzcarlton.com', 4, NULL),
(2, 'Ritz-Carlton', 18, '456 Elegance St, Chicago, USA', 'contact2@ritzcarlton.com', 3, NULL),
(3, 'Ritz-Carlton', 27, '789 Prestige Rd, Las Vegas, USA', 'contact3@ritzcarlton.com', 5, NULL),
(4, 'Ritz-Carlton', 22, '101 Luxury Dr, Las Vegas, USA', 'contact4@ritzcarlton.com', 4, NULL),
(5, 'Ritz-Carlton', 16, '111 Elegance Ave, Orlando, USA', 'contact5@ritzcarlton.com', 2, NULL),
(6, 'Ritz-Carlton', 25, '222 Prestige Blvd, New York, USA', 'contact6@ritzcarlton.com', 5, NULL),
(7, 'Ritz-Carlton', 20, '333 Opulence Rd, Denver, USA', 'contact7@ritzcarlton.com', 3, NULL),
(8, 'Ritz-Carlton', 24, '444 Elegance Dr, Seattle, USA', 'contact8@ritzcarlton.com', 4, NULL),

-- Independence Inn
(1, 'Independence Inn', 25, '123 Liberty Ave, Boston, USA', 'contact1@independenceinn.com', 4, NULL),
(2, 'Independence Inn', 20, '456 Patriot St, Boston, USA', 'contact2@independenceinn.com', 3, NULL),
(3, 'Independence Inn', 15, '789 Freedom Rd, Washington D.C., USA', 'contact3@independenceinn.com', 5, NULL),
(4, 'Independence Inn', 30, '101 Revolution Dr, Baltimore, USA', 'contact4@independenceinn.com', 4, NULL),
(5, 'Independence Inn', 12, '111 Democracy Ln, Richmond, USA', 'contact5@independenceinn.com', 2, NULL),
(6, 'Independence Inn', 18, '222 Liberty Square, New York, USA', 'contact6@independenceinn.com', 5, NULL),
(7, 'Independence Inn', 22, '333 Equality Rd, Philadelphia, USA', 'contact7@independenceinn.com', 3, NULL),
(8, 'Independence Inn', 27, '444 Liberty Blvd, Boston, USA', 'contact8@independenceinn.com', 4, NULL),

-- Dragonfly Inn
(1, 'Dragonfly Inn', 28, '123 Meadow Ln, Stars Hollow, USA', 'contact1@dragonflyinn.com', 5, NULL),
(2, 'Dragonfly Inn', 16, '456 Maple St, Hartford, USA', 'contact2@dragonflyinn.com', 3, NULL),
(3, 'Dragonfly Inn', 23, '789 Riverfront Dr, Stars Hollow, USA', 'contact3@dragonflyinn.com', 4, NULL),
(4, 'Dragonfly Inn', 19, '101 Lakeside Dr, Woodbury, USA', 'contact4@dragonflyinn.com', 2, NULL),
(5, 'Dragonfly Inn', 26, '111 Forest Ave, New Haven, USA', 'contact5@dragonflyinn.com', 5, NULL),
(6, 'Dragonfly Inn', 17, '222 Lakeview Dr, Hartford, USA', 'contact6@dragonflyinn.com', 4, NULL),
(7, 'Dragonfly Inn', 21, '333 Mountain Rd, Mystic, USA', 'contact7@dragonflyinn.com', 3, NULL),
(8, 'Dragonfly Inn', 14, '444 Parkside Ave, Stars Hollow, USA', 'contact8@dragonflyinn.com', 1, NULL);

-- Populate hotel_phone table
INSERT INTO hotel_phone (hotel_id, chain, phone_num) VALUES
-- Grand Hotels
(1, 'Grand Hotels', '+1 (123) 456-7890'),
(1, 'Grand Hotels', '+1 (234) 567-8901'),
(2, 'Grand Hotels', '+1 (345) 678-9012'),
(3, 'Grand Hotels', '+1 (456) 789-0123'),
(4, 'Grand Hotels', '+1 (567) 890-1234'),
(5, 'Grand Hotels', '+1 (678) 901-2345'),
(6, 'Grand Hotels', '+1 (789) 012-3456'),
(7, 'Grand Hotels', '+1 (890) 123-4567'),
(8, 'Grand Hotels', '+1 (901) 234-5678'),

-- Royal Resorts
(1, 'Royal Resorts', '+1 (012) 345-6789'),
(1, 'Royal Resorts', '+1 (987) 654-3210'),
(2, 'Royal Resorts', '+1 (234) 567-8901'),
(3, 'Royal Resorts', '+1 (345) 678-9012'),
(4, 'Royal Resorts', '+1 (456) 789-0123'),
(5, 'Royal Resorts', '+1 (567) 890-1234'),
(6, 'Royal Resorts', '+1 (678) 901-2345'),
(7, 'Royal Resorts', '+1 (789) 012-3456'),
(8, 'Royal Resorts', '+1 (890) 123-4567'),

-- Ritz-Carlton
(1, 'Ritz-Carlton', '+1 (901) 234-5678'),
(1, 'Ritz-Carlton', '+1 (210) 987-6543'),
(2, 'Ritz-Carlton', '+1 (321) 098-7654'),
(3, 'Ritz-Carlton', '+1 (432) 109-8765'),
(4, 'Ritz-Carlton', '+1 (543) 210-9876'),
(5, 'Ritz-Carlton', '+1 (654) 321-0987'),
(6, 'Ritz-Carlton', '+1 (765) 432-1098'),
(7, 'Ritz-Carlton', '+1 (876) 543-2109'),
(8, 'Ritz-Carlton', '+1 (987) 654-3210'),

-- Independence Inn
(1, 'Independence Inn', '+1 (876) 543-2109'),
(1, 'Independence Inn', '+1 (876) 503-2108'),
(2, 'Independence Inn', '+1 (765) 432-1098'),
(3, 'Independence Inn', '+1 (654) 321-0987'),
(4, 'Independence Inn', '+1 (543) 210-9876'),
(5, 'Independence Inn', '+1 (432) 109-8765'),
(6, 'Independence Inn', '+1 (321) 098-7654'),
(7, 'Independence Inn', '+1 (210) 987-6543'),
(8, 'Independence Inn', '+1 (109) 876-5432'),

-- Dragonfly Inn
(1, 'Dragonfly Inn', '+1 (123) 456-7890'),
(1, 'Dragonfly Inn', '+1 (123) 455-7899'),
(2, 'Dragonfly Inn', '+1 (234) 567-8901'),
(3, 'Dragonfly Inn', '+1 (345) 678-9012'),
(4, 'Dragonfly Inn', '+1 (456) 789-0123'),
(5, 'Dragonfly Inn', '+1 (567) 890-1234'),
(6, 'Dragonfly Inn', '+1 (678) 901-2345'),
(7, 'Dragonfly Inn', '+1 (789) 012-3456'),
(8, 'Dragonfly Inn', '+1 (890) 123-4567');

-- Populate room table 

-- Grand Hotels --
INSERT INTO room (room_num, hotel_id, chain, price, capacity, view, extendible) VALUES
-- Rooms with different capacities for hotel_id = 1
(1, 1, 'Grand Hotels', 120.00, 1, 'oceanside', TRUE),
(2, 1, 'Grand Hotels', 140.00, 2, 'mountainside', FALSE),
(3, 1, 'Grand Hotels', 160.00, 3, 'oceanside', TRUE),
(4, 1, 'Grand Hotels', 180.00, 4, 'mountainside', FALSE),
(5, 1, 'Grand Hotels', 200.00, 5, 'oceanside', TRUE),

-- Rooms with different capacities for hotel_id = 2
(1, 2, 'Grand Hotels', 130.00, 1, 'mountainside', TRUE),
(2, 2, 'Grand Hotels', 150.00, 2, 'oceanside', FALSE),
(3, 2, 'Grand Hotels', 170.00, 3, 'mountainside', TRUE),
(4, 2, 'Grand Hotels', 190.00, 4, 'oceanside', FALSE),
(5, 2, 'Grand Hotels', 210.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 3
(1, 3, 'Grand Hotels', 140.00, 1, 'oceanside', FALSE),
(2, 3, 'Grand Hotels', 160.00, 2, 'mountainside', TRUE),
(3, 3, 'Grand Hotels', 180.00, 3, 'oceanside', FALSE),
(4, 3, 'Grand Hotels', 200.00, 4, 'mountainside', TRUE),
(5, 3, 'Grand Hotels', 220.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 4
(1, 4, 'Grand Hotels', 150.00, 1, 'mountainside', TRUE),
(2, 4, 'Grand Hotels', 170.00, 2, 'oceanside', FALSE),
(3, 4, 'Grand Hotels', 190.00, 3, 'mountainside', TRUE),
(4, 4, 'Grand Hotels', 210.00, 4, 'oceanside', FALSE),
(5, 4, 'Grand Hotels', 230.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 5
(1, 5, 'Grand Hotels', 160.00, 1, 'oceanside', FALSE),
(2, 5, 'Grand Hotels', 180.00, 2, 'mountainside', TRUE),
(3, 5, 'Grand Hotels', 200.00, 3, 'oceanside', FALSE),
(4, 5, 'Grand Hotels', 220.00, 4, 'mountainside', TRUE),
(5, 5, 'Grand Hotels', 240.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 6
(1, 6, 'Grand Hotels', 170.00, 1, 'mountainside', TRUE),
(2, 6, 'Grand Hotels', 190.00, 2, 'oceanside', FALSE),
(3, 6, 'Grand Hotels', 210.00, 3, 'mountainside', TRUE),
(4, 6, 'Grand Hotels', 230.00, 4, 'oceanside', FALSE),
(5, 6, 'Grand Hotels', 250.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 7
(1, 7, 'Grand Hotels', 180.00, 1, 'oceanside', FALSE),
(2, 7, 'Grand Hotels', 200.00, 2, 'mountainside', TRUE),
(3, 7, 'Grand Hotels', 220.00, 3, 'oceanside', FALSE),
(4, 7, 'Grand Hotels', 240.00, 4, 'mountainside', TRUE),
(5, 7, 'Grand Hotels', 260.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 8
(1, 8, 'Grand Hotels', 190.00, 1, 'mountainside', TRUE),
(2, 8, 'Grand Hotels', 210.00, 2, 'oceanside', FALSE),
(3, 8, 'Grand Hotels', 230.00, 3, 'mountainside', TRUE),
(4, 8, 'Grand Hotels', 250.00, 4, 'oceanside', FALSE),
(5, 8, 'Grand Hotels', 270.00, 5, 'mountainside', TRUE);

-- Royal Resorts --
INSERT INTO room (room_num, hotel_id, chain, price, capacity, view, extendible) VALUES
-- Rooms with different capacities for hotel_id = 1
(1, 1, 'Royal Resorts', 120.00, 1, 'oceanside', TRUE),
(2, 1, 'Royal Resorts', 140.00, 2, 'mountainside', FALSE),
(3, 1, 'Royal Resorts', 160.00, 3, 'oceanside', TRUE),
(4, 1, 'Royal Resorts', 180.00, 4, 'mountainside', FALSE),
(5, 1, 'Royal Resorts', 200.00, 5, 'oceanside', TRUE),

-- Rooms with different capacities for hotel_id = 2
(1, 2, 'Royal Resorts', 130.00, 1, 'mountainside', TRUE),
(2, 2, 'Royal Resorts', 150.00, 2, 'oceanside', FALSE),
(3, 2, 'Royal Resorts', 170.00, 3, 'mountainside', TRUE),
(4, 2, 'Royal Resorts', 190.00, 4, 'oceanside', FALSE),
(5, 2, 'Royal Resorts', 210.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 3
(1, 3, 'Royal Resorts', 140.00, 1, 'oceanside', FALSE),
(2, 3, 'Royal Resorts', 160.00, 2, 'mountainside', TRUE),
(3, 3, 'Royal Resorts', 180.00, 3, 'oceanside', FALSE),
(4, 3, 'Royal Resorts', 200.00, 4, 'mountainside', TRUE),
(5, 3, 'Royal Resorts', 220.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 4
(1, 4, 'Royal Resorts', 150.00, 1, 'mountainside', TRUE),
(2, 4, 'Royal Resorts', 170.00, 2, 'oceanside', FALSE),
(3, 4, 'Royal Resorts', 190.00, 3, 'mountainside', TRUE),
(4, 4, 'Royal Resorts', 210.00, 4, 'oceanside', FALSE),
(5, 4, 'Royal Resorts', 230.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 5
(1, 5, 'Royal Resorts', 160.00, 1, 'oceanside', FALSE),
(2, 5, 'Royal Resorts', 180.00, 2, 'mountainside', TRUE),
(3, 5, 'Royal Resorts', 200.00, 3, 'oceanside', FALSE),
(4, 5, 'Royal Resorts', 220.00, 4, 'mountainside', TRUE),
(5, 5, 'Royal Resorts', 240.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 6
(1, 6, 'Royal Resorts', 170.00, 1, 'mountainside', TRUE),
(2, 6, 'Royal Resorts', 190.00, 2, 'oceanside', FALSE),
(3, 6, 'Royal Resorts', 210.00, 3, 'mountainside', TRUE),
(4, 6, 'Royal Resorts', 230.00, 4, 'oceanside', FALSE),
(5, 6, 'Royal Resorts', 250.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 7
(1, 7, 'Royal Resorts', 180.00, 1, 'oceanside', FALSE),
(2, 7, 'Royal Resorts', 200.00, 2, 'mountainside', TRUE),
(3, 7, 'Royal Resorts', 220.00, 3, 'oceanside', FALSE),
(4, 7, 'Royal Resorts', 240.00, 4, 'mountainside', TRUE),
(5, 7, 'Royal Resorts', 260.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 8
(1, 8, 'Royal Resorts', 190.00, 1, 'mountainside', TRUE),
(2, 8, 'Royal Resorts', 210.00, 2, 'oceanside', FALSE),
(3, 8, 'Royal Resorts', 230.00, 3, 'mountainside', TRUE),
(4, 8, 'Royal Resorts', 250.00, 4, 'oceanside', FALSE),
(5, 8, 'Royal Resorts', 270.00, 5, 'mountainside', TRUE);

-- Ritz-Carlton -- 
INSERT INTO room (room_num, hotel_id, chain, price, capacity, view, extendible) VALUES
-- Rooms with different capacities for hotel_id = 1
(1, 1, 'Ritz-Carlton', 1000.00, 1, 'oceanside', TRUE),
(2, 1, 'Ritz-Carlton', 1500.00, 2, 'mountainside', FALSE),
(3, 1, 'Ritz-Carlton', 2000.00, 3, 'oceanside', TRUE),
(4, 1, 'Ritz-Carlton', 2500.00, 4, 'mountainside', FALSE),
(5, 1, 'Ritz-Carlton', 3000.00, 5, 'oceanside', TRUE),

-- Rooms with different capacities for hotel_id = 2
(1, 2, 'Ritz-Carlton', 1100.00, 1, 'mountainside', TRUE),
(2, 2, 'Ritz-Carlton', 1600.00, 2, 'oceanside', FALSE),
(3, 2, 'Ritz-Carlton', 2100.00, 3, 'mountainside', TRUE),
(4, 2, 'Ritz-Carlton', 2600.00, 4, 'oceanside', FALSE),
(5, 2, 'Ritz-Carlton', 3100.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 3
(1, 3, 'Ritz-Carlton', 1200.00, 1, 'oceanside', FALSE),
(2, 3, 'Ritz-Carlton', 1700.00, 2, 'mountainside', TRUE),
(3, 3, 'Ritz-Carlton', 2200.00, 3, 'oceanside', FALSE),
(4, 3, 'Ritz-Carlton', 2700.00, 4, 'mountainside', TRUE),
(5, 3, 'Ritz-Carlton', 3200.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 4
(1, 4, 'Ritz-Carlton', 1300.00, 1, 'mountainside', TRUE),
(2, 4, 'Ritz-Carlton', 1800.00, 2, 'oceanside', FALSE),
(3, 4, 'Ritz-Carlton', 2300.00, 3, 'mountainside', TRUE),
(4, 4, 'Ritz-Carlton', 2800.00, 4, 'oceanside', FALSE),
(5, 4, 'Ritz-Carlton', 3300.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 5
(1, 5, 'Ritz-Carlton', 1400.00, 1, 'oceanside', FALSE),
(2, 5, 'Ritz-Carlton', 1900.00, 2, 'mountainside', TRUE),
(3, 5, 'Ritz-Carlton', 2400.00, 3, 'oceanside', FALSE),
(4, 5, 'Ritz-Carlton', 2900.00, 4, 'mountainside', TRUE),
(5, 5, 'Ritz-Carlton', 3400.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 6
(1, 6, 'Ritz-Carlton', 1500.00, 1, 'mountainside', TRUE),
(2, 6, 'Ritz-Carlton', 2000.00, 2, 'oceanside', FALSE),
(3, 6, 'Ritz-Carlton', 2500.00, 3, 'mountainside', TRUE),
(4, 6, 'Ritz-Carlton', 3000.00, 4, 'oceanside', FALSE),
(5, 6, 'Ritz-Carlton', 3500.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 7
(1, 7, 'Ritz-Carlton', 1600.00, 1, 'oceanside', FALSE),
(2, 7, 'Ritz-Carlton', 2100.00, 2, 'mountainside', TRUE),
(3, 7, 'Ritz-Carlton', 2600.00, 3, 'oceanside', FALSE),
(4, 7, 'Ritz-Carlton', 3100.00, 4, 'mountainside', TRUE),
(5, 7, 'Ritz-Carlton', 3600.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 8
(1, 8, 'Ritz-Carlton', 1700.00, 1, 'mountainside', TRUE),
(2, 8, 'Ritz-Carlton', 2200.00, 2, 'oceanside', FALSE),
(3, 8, 'Ritz-Carlton', 2700.00, 3, 'mountainside', TRUE),
(4, 8, 'Ritz-Carlton', 3200.00, 4, 'oceanside', FALSE),
(5, 8, 'Ritz-Carlton', 3700.00, 5, 'mountainside', TRUE);

-- Independence Inn
INSERT INTO room (room_num, hotel_id, chain, price, capacity, view, extendible) VALUES
-- Rooms with different capacities for hotel_id = 1
(1, 1, 'Independence Inn', 80.00, 1, 'oceanside', TRUE),
(2, 1, 'Independence Inn', 100.00, 2, 'mountainside', FALSE),
(3, 1, 'Independence Inn', 120.00, 3, 'oceanside', TRUE),
(4, 1, 'Independence Inn', 140.00, 4, 'mountainside', FALSE),
(5, 1, 'Independence Inn', 160.00, 5, 'oceanside', TRUE),

-- Rooms with different capacities for hotel_id = 2
(1, 2, 'Independence Inn', 90.00, 1, 'mountainside', TRUE),
(2, 2, 'Independence Inn', 110.00, 2, 'oceanside', FALSE),
(3, 2, 'Independence Inn', 130.00, 3, 'mountainside', TRUE),
(4, 2, 'Independence Inn', 150.00, 4, 'oceanside', FALSE),
(5, 2, 'Independence Inn', 170.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 3
(1, 3, 'Independence Inn', 100.00, 1, 'oceanside', FALSE),
(2, 3, 'Independence Inn', 120.00, 2, 'mountainside', TRUE),
(3, 3, 'Independence Inn', 140.00, 3, 'oceanside', FALSE),
(4, 3, 'Independence Inn', 160.00, 4, 'mountainside', TRUE),
(5, 3, 'Independence Inn', 180.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 4
(1, 4, 'Independence Inn', 110.00, 1, 'mountainside', TRUE),
(2, 4, 'Independence Inn', 130.00, 2, 'oceanside', FALSE),
(3, 4, 'Independence Inn', 150.00, 3, 'mountainside', TRUE),
(4, 4, 'Independence Inn', 170.00, 4, 'oceanside', FALSE),
(5, 4, 'Independence Inn', 190.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 5
(1, 5, 'Independence Inn', 120.00, 1, 'oceanside', FALSE),
(2, 5, 'Independence Inn', 140.00, 2, 'mountainside', TRUE),
(3, 5, 'Independence Inn', 160.00, 3, 'oceanside', FALSE),
(4, 5, 'Independence Inn', 180.00, 4, 'mountainside', TRUE),
(5, 5, 'Independence Inn', 200.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 6
(1, 6, 'Independence Inn', 130.00, 1, 'mountainside', TRUE),
(2, 6, 'Independence Inn', 150.00, 2, 'oceanside', FALSE),
(3, 6, 'Independence Inn', 170.00, 3, 'mountainside', TRUE),
(4, 6, 'Independence Inn', 190.00, 4, 'oceanside', FALSE),
(5, 6, 'Independence Inn', 210.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 7
(1, 7, 'Independence Inn', 140.00, 1, 'oceanside', FALSE),
(2, 7, 'Independence Inn', 160.00, 2, 'mountainside', TRUE),
(3, 7, 'Independence Inn', 180.00, 3, 'oceanside', FALSE),
(4, 7, 'Independence Inn', 200.00, 4, 'mountainside', TRUE),
(5, 7, 'Independence Inn', 220.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 8
(1, 8, 'Independence Inn', 150.00, 1, 'mountainside', TRUE),
(2, 8, 'Independence Inn', 170.00, 2, 'oceanside', FALSE),
(3, 8, 'Independence Inn', 190.00, 3, 'mountainside', TRUE),
(4, 8, 'Independence Inn', 210.00, 4, 'oceanside', FALSE),
(5, 8, 'Independence Inn', 230.00, 5, 'mountainside', TRUE);

-- Dragonfly Inn
INSERT INTO room (room_num, hotel_id, chain, price, capacity, view, extendible) VALUES
-- Rooms with different capacities for hotel_id = 1
(1, 1, 'Dragonfly Inn', 80.00, 1, 'oceanside', TRUE),
(2, 1, 'Dragonfly Inn', 100.00, 2, 'mountainside', FALSE),
(3, 1, 'Dragonfly Inn', 120.00, 3, 'oceanside', TRUE),
(4, 1, 'Dragonfly Inn', 140.00, 4, 'mountainside', FALSE),
(5, 1, 'Dragonfly Inn', 160.00, 5, 'oceanside', TRUE),

-- Rooms with different capacities for hotel_id = 2
(1, 2, 'Dragonfly Inn', 90.00, 1, 'mountainside', TRUE),
(2, 2, 'Dragonfly Inn', 110.00, 2, 'oceanside', FALSE),
(3, 2, 'Dragonfly Inn', 130.00, 3, 'mountainside', TRUE),
(4, 2, 'Dragonfly Inn', 150.00, 4, 'oceanside', FALSE),
(5, 2, 'Dragonfly Inn', 170.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 3
(1, 3, 'Dragonfly Inn', 100.00, 1, 'oceanside', FALSE),
(2, 3, 'Dragonfly Inn', 120.00, 2, 'mountainside', TRUE),
(3, 3, 'Dragonfly Inn', 140.00, 3, 'oceanside', FALSE),
(4, 3, 'Dragonfly Inn', 160.00, 4, 'mountainside', TRUE),
(5, 3, 'Dragonfly Inn', 180.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 4
(1, 4, 'Dragonfly Inn', 110.00, 1, 'mountainside', TRUE),
(2, 4, 'Dragonfly Inn', 130.00, 2, 'oceanside', FALSE),
(3, 4, 'Dragonfly Inn', 150.00, 3, 'mountainside', TRUE),
(4, 4, 'Dragonfly Inn', 170.00, 4, 'oceanside', FALSE),
(5, 4, 'Dragonfly Inn', 190.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 5
(1, 5, 'Dragonfly Inn', 120.00, 1, 'oceanside', FALSE),
(2, 5, 'Dragonfly Inn', 140.00, 2, 'mountainside', TRUE),
(3, 5, 'Dragonfly Inn', 160.00, 3, 'oceanside', FALSE),
(4, 5, 'Dragonfly Inn', 180.00, 4, 'mountainside', TRUE),
(5, 5, 'Dragonfly Inn', 200.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 6
(1, 6, 'Dragonfly Inn', 130.00, 1, 'mountainside', TRUE),
(2, 6, 'Dragonfly Inn', 150.00, 2, 'oceanside', FALSE),
(3, 6, 'Dragonfly Inn', 170.00, 3, 'mountainside', TRUE),
(4, 6, 'Dragonfly Inn', 190.00, 4, 'oceanside', FALSE),
(5, 6, 'Dragonfly Inn', 210.00, 5, 'mountainside', TRUE),

-- Rooms with different capacities for hotel_id = 7
(1, 7, 'Dragonfly Inn', 140.00, 1, 'oceanside', FALSE),
(2, 7, 'Dragonfly Inn', 160.00, 2, 'mountainside', TRUE),
(3, 7, 'Dragonfly Inn', 180.00, 3, 'oceanside', FALSE),
(4, 7, 'Dragonfly Inn', 200.00, 4, 'mountainside', TRUE),
(5, 7, 'Dragonfly Inn', 220.00, 5, 'oceanside', FALSE),

-- Rooms with different capacities for hotel_id = 8
(1, 8, 'Dragonfly Inn', 150.00, 1, 'mountainside', TRUE),
(2, 8, 'Dragonfly Inn', 170.00, 2, 'oceanside', FALSE),
(3, 8, 'Dragonfly Inn', 190.00, 3, 'mountainside', TRUE),
(4, 8, 'Dragonfly Inn', 210.00, 4, 'oceanside', FALSE),
(5, 8, 'Dragonfly Inn', 230.00, 5, 'mountainside', TRUE);

-- Populate amenity table
INSERT INTO amenity (room_num, hotel_id, chain, amenity) VALUES
-- Amenities for Grand Hotels
(3, 1, 'Grand Hotels', 'TV'),
(2, 2, 'Grand Hotels', 'WiFi'),
(5, 3, 'Grand Hotels', 'Balcony'),
(1, 4, 'Grand Hotels', 'Minibar'),
(4, 5, 'Grand Hotels', 'Room Safe'),
(3, 6, 'Grand Hotels', 'Gym Access'),
(5, 7, 'Grand Hotels', 'Sauna'),
(1, 8, 'Grand Hotels', 'Fitness Center'),

-- Amenities for Royal Resorts
(4, 1, 'Royal Resorts', 'Heated Bath'),
(3, 2, 'Royal Resorts', 'Gym Access'),
(1, 3, 'Royal Resorts', 'Sauna'),
(5, 4, 'Royal Resorts', 'Fitness Center'),
(2, 5, 'Royal Resorts', 'Concierge Service'),
(4, 6, 'Royal Resorts', 'Pool Access'),
(1, 7, 'Royal Resorts', 'Hot Tub'),
(3, 8, 'Royal Resorts', 'Spa Access'),

-- Amenities for Ritz-Carlton
(2, 1, 'Ritz-Carlton', 'Mini Bar'),
(5, 2, 'Ritz-Carlton', 'Jacuzzi'),
(4, 3, 'Ritz-Carlton', 'Fireplace'),
(1, 4, 'Ritz-Carlton', 'Spa Access'),
(3, 5, 'Ritz-Carlton', 'Tea/Coffee Maker'),
(1, 6, 'Ritz-Carlton', 'Concierge Service'),
(2, 7, 'Ritz-Carlton', 'Room Service'),
(5, 8, 'Ritz-Carlton', 'Shuttle Service'),

-- Amenities for Independence Inn
(1, 1, 'Independence Inn', 'Coffee Maker'),
(4, 2, 'Independence Inn', 'Room Service'),
(3, 3, 'Independence Inn', 'Free Breakfast'),
(2, 4, 'Independence Inn', 'Shuttle Service'),
(5, 5, 'Independence Inn', 'Work Desk'),
(4, 6, 'Independence Inn', 'Valet Parking'),
(1, 7, 'Independence Inn', 'Airport Transfer'),
(3, 8, 'Independence Inn', 'Bellboy Service'),

-- Amenities for Dragonfly Inn
(5, 1, 'Dragonfly Inn', 'Air Conditioning'),
(2, 2, 'Dragonfly Inn', 'Pool Access'),
(1, 3, 'Dragonfly Inn', 'Work Desk'),
(3, 4, 'Dragonfly Inn', 'Tea/Coffee Maker'),
(4, 5, 'Dragonfly Inn', 'Spa Access'),
(1, 6, 'Dragonfly Inn', 'Room Safe'),
(3, 7, 'Dragonfly Inn', 'Concierge Service'),
(2, 8, 'Dragonfly Inn', 'Fitness Center');

-- Populate damage table
INSERT INTO damage (room_num, hotel_id, chain, damage) VALUES
-- Damage records for Grand Hotels
(3, 1, 'Grand Hotels', 'Broken Mirror'),
(2, 2, 'Grand Hotels', 'Stained Carpet'),
(5, 3, 'Grand Hotels', 'Cracked Window'),
(1, 4, 'Grand Hotels', 'Water Leak'),
(4, 5, 'Grand Hotels', 'Scratched Furniture'),
(3, 6, 'Grand Hotels', 'Torn Curtains'),
(5, 7, 'Grand Hotels', 'Damaged Bed Frame'),
(1, 8, 'Grand Hotels', 'Broken Light Fixture'),

-- Damage records for Royal Resorts
(4, 1, 'Royal Resorts', 'Damaged Wallpaper'),
(3, 2, 'Royal Resorts', 'Broken Chair'),
(1, 3, 'Royal Resorts', 'Stained Bedding'),
(5, 4, 'Royal Resorts', 'Chipped Paint'),
(2, 5, 'Royal Resorts', 'Cracked Tile'),
(4, 6, 'Royal Resorts', 'Torn Upholstery'),
(1, 7, 'Royal Resorts', 'Scratched Door'),
(3, 8, 'Royal Resorts', 'Water Damage'),

-- Damage records for Independence Inn
(1, 1, 'Independence Inn', 'Leaking Faucet'),
(4, 2, 'Independence Inn', 'Stained Walls'),
(3, 3, 'Independence Inn', 'Broken Drawer'),
(2, 4, 'Independence Inn', 'Damaged Lamp'),
(5, 5, 'Independence Inn', 'Torn Pillow'),
(4, 6, 'Independence Inn', 'Cracked Mirror'),
(1, 7, 'Independence Inn', 'Chipped Table'),
(3, 8, 'Independence Inn', 'Worn Carpet'),

-- Damage records for Dragonfly Inn
(5, 1, 'Dragonfly Inn', 'Damaged Vanity'),
(2, 2, 'Dragonfly Inn', 'Broken Window Lock'),
(1, 3, 'Dragonfly Inn', 'Scratched Desk'),
(3, 4, 'Dragonfly Inn', 'Stained Chair'),
(4, 5, 'Dragonfly Inn', 'Torn Drapes'),
(1, 6, 'Dragonfly Inn', 'Cracked Lampshade'),
(3, 7, 'Dragonfly Inn', 'Burn Mark on Carpet'),
(2, 8, 'Dragonfly Inn', 'Damaged Door Frame');

-- Populate employee table
INSERT INTO employee (SSN, name, address, hotel_id, chain) VALUES
-- Employees for Grand Hotels
('111111111', 'Emma Smith', '123 Main Street, New York, USA', 1, 'Grand Hotels'),
('222222222', 'Oliver Johnson', '456 Oak Avenue, Los Angeles, USA', 1, 'Grand Hotels'),
('333333333', 'Sophia Brown', '789 Pine Street, Chicago, USA', 2, 'Grand Hotels'),
('444444444', 'William Lee', '101 Elm Street, Miami, USA', 2, 'Grand Hotels'),
('555555555', 'Lucas Taylor', '456 Maple Avenue, San Francisco, USA', 3, 'Grand Hotels'),
('666666666', 'Isabella Smith', '789 Cedar Street, Seattle, USA', 3, 'Grand Hotels'),
('777777777', 'Ella Davis', '123 Oak Street, Boston, USA', 4, 'Grand Hotels'),
('888888888', 'Liam Johnson', '456 Walnut Street, Houston, USA', 4, 'Grand Hotels'),
('999999999', 'Chloe Miller', '789 Birch Street, Philadelphia, USA', 5, 'Grand Hotels'),
('123456789', 'Lucas Wilson', '101 Cedar Street, Phoenix, USA', 5, 'Grand Hotels'),
('234567890', 'Natalie Moore', '123 Main Street, Denver, USA', 6, 'Grand Hotels'),
('345678901', 'Ella Taylor', '456 Oak Avenue, Detroit, USA', 6, 'Grand Hotels'),
('456789012', 'Dylan Johnson', '789 Pine Street, Baltimore, USA', 7, 'Grand Hotels'),
('567890123', 'Brooklyn Brown', '101 Elm Street, San Antonio, USA', 7, 'Grand Hotels'),
('678901234', 'Leah Davis', '123 Maple Avenue, San Diego, USA', 8, 'Grand Hotels'),
('789012345', 'Zoe Wilson', '456 Cedar Street, Dallas, USA', 8, 'Grand Hotels'),

-- Employees for Royal Resorts
('111111112', 'David Miller', '123 Main Street, Las Vegas, USA', 1, 'Royal Resorts'),
('222222223', 'Anna Wilson', '456 Oak Avenue, Orlando, USA', 1, 'Royal Resorts'),
('333333334', 'Ryan Moore', '789 Pine Street, Atlanta, USA', 2, 'Royal Resorts'),
('444444445', 'Sophia Taylor', '101 Elm Street, Austin, USA', 2, 'Royal Resorts'),
('555555556', 'Grace Smith', '456 Maple Avenue, Nashville, USA', 3, 'Royal Resorts'),
('666666667', 'Daniel Johnson', '789 Cedar Street, Portland, USA', 3, 'Royal Resorts'),
('777777778', 'Mia Williams', '123 Oak Street, Charlotte, USA', 4, 'Royal Resorts'),
('888888889', 'Ethan Jones', '456 Walnut Street, Honolulu, USA', 4, 'Royal Resorts'),
('999999990', 'Chloe Brown', '789 Birch Street, Tampa, USA', 5, 'Royal Resorts'),
('123456780', 'Lucas Davis', '101 Cedar Street, Pittsburgh, USA', 5, 'Royal Resorts'),
('234567891', 'Natalie Miller', '123 Main Street, Minneapolis, USA', 6, 'Royal Resorts'),
('345678902', 'Ella Wilson', '456 Oak Avenue, Kansas City, USA', 6, 'Royal Resorts'),
('456789013', 'Dylan Moore', '789 Pine Street, Sacramento, USA', 7, 'Royal Resorts'),
('567890124', 'Brooklyn Taylor', '101 Elm Street, Salt Lake City, USA', 7, 'Royal Resorts'),
('678901235', 'Leah Smith', '123 Maple Avenue, Honolulu, USA', 8, 'Royal Resorts'),
('789012346', 'Zoe Johnson', '456 Cedar Street, Memphis, USA', 8, 'Royal Resorts'),

-- Employees for Ritz-Carlton 
('111111113', 'Soma Yukihira', '123 Main Street, Vancouver, Canada', 1, 'Ritz-Carlton'),
('222222224', 'Megumi Tadokoro', '456 Oak Avenue, Toronto, Canada', 1, 'Ritz-Carlton'),
('333333335', 'Ryo Kurokiba', '789 Pine Street, Montreal, Canada', 2, 'Ritz-Carlton'),
('444444446', 'Alice Nakiri', '101 Elm Street, Ottawa, Canada', 2, 'Ritz-Carlton'),
('555555557', 'Erina Nakiri', '456 Maple Avenue, Calgary, Canada', 3, 'Ritz-Carlton'),
('666666668', 'Takumi Aldini', '789 Cedar Street, Edmonton, Canada', 3, 'Ritz-Carlton'),
('777777779', 'Hisako Arato', '123 Oak Street, Winnipeg, Canada', 4, 'Ritz-Carlton'),
('888888880', 'Akira Hayama', '456 Walnut Street, Quebec City, Canada', 4, 'Ritz-Carlton'),
('999999991', 'Jun Shiomi', '789 Birch Street, Halifax, Canada', 5, 'Ritz-Carlton'),
('123456781', 'Nene Kinokuni', '101 Cedar Street, Hamilton, Canada', 5, 'Ritz-Carlton'),
('234567892', 'Ikumi Mito', '123 Main Street, London, UK', 6, 'Ritz-Carlton'),
('345678903', 'Isami Aldini', '456 Oak Avenue, Manchester, UK', 6, 'Ritz-Carlton'),
('456789014', 'Yuki Yoshino', '789 Pine Street, Birmingham, UK', 7, 'Ritz-Carlton'),
('567890125', 'Roland Chapelle', '101 Elm Street, Glasgow, UK', 7, 'Ritz-Carlton'),
('678901236', 'Kojiro Shinomiya', '123 Maple Avenue, Liverpool, UK', 8, 'Ritz-Carlton'),
('789012347', 'Rindou Kobayashi', '456 Cedar Street, Dublin, Ireland', 8, 'Ritz-Carlton'),

-- Employees for Independence Inn
('111111115', 'John Doe', '123 Main Street, Independence, USA', 1, 'Independence Inn'),
('222222226', 'Jane Smith', '456 Oak Avenue, Liberty, USA', 1, 'Independence Inn'),
('333333337', 'Michael Johnson', '789 Pine Street, Freedom, USA', 2, 'Independence Inn'),
('444444448', 'Emily Brown', '101 Elm Street, Liberty, USA', 2, 'Independence Inn'),
('555555559', 'Jessica Taylor', '456 Maple Avenue, Patriot, USA', 3, 'Independence Inn'),
('666666670', 'Andrew Wilson', '789 Cedar Street, Liberty, USA', 3, 'Independence Inn'),
('777777771', 'Michelle Davis', '123 Oak Street, Freedom, USA', 4, 'Independence Inn'),
('888888882', 'Chris Lee', '456 Walnut Street, Independence, USA', 4, 'Independence Inn'),
('999999993', 'Amanda Miller', '789 Birch Street, Liberty, USA', 5, 'Independence Inn'),
('123456783', 'Brian Wilson', '101 Cedar Street, Patriot, USA', 5, 'Independence Inn'),
('234567894', 'Stephanie Moore', '123 Main Street, Freedom, USA', 6, 'Independence Inn'),
('345678905', 'Daniel Taylor', '456 Oak Avenue, Liberty, USA', 6, 'Independence Inn'),
('456789016', 'Jessica Brown', '789 Pine Street, Independence, USA', 7, 'Independence Inn'),
('567890127', 'Michael Johnson', '101 Elm Street, Patriot, USA', 7, 'Independence Inn'),
('678901238', 'Sarah Davis', '123 Maple Avenue, Freedom, USA', 8, 'Independence Inn'),
('789012349', 'Ryan Wilson', '456 Cedar Street, Liberty, USA', 8, 'Independence Inn'), 

-- Employees for Dragonfly Inn 
('111111114', 'Lorelai Gilmore', '123 Main Street, Stars Hollow, USA', 1, 'Dragonfly Inn'),
('222222225', 'Rory Gilmore', '456 Oak Avenue, Hartford, USA', 1, 'Dragonfly Inn'),
('333333336', 'Luke Danes', '789 Pine Street, Woodbury, USA', 2, 'Dragonfly Inn'),
('444444447', 'Sookie St. James', '101 Elm Street, Hartford, USA', 2, 'Dragonfly Inn'),
('555555558', 'Lane Kim', '456 Maple Avenue, Washington, USA', 3, 'Dragonfly Inn'),
('666666669', 'Michel Gerard', '789 Cedar Street, Woodbury, USA', 3, 'Dragonfly Inn'),
('777777770', 'Emily Gilmore', '123 Oak Street, Hartford, USA', 4, 'Dragonfly Inn'),
('888888881', 'Paris Geller', '456 Walnut Street, Stars Hollow, USA', 4, 'Dragonfly Inn'),
('999999992', 'Richard Gilmore', '789 Birch Street, Washington, USA', 5, 'Dragonfly Inn'),
('123456782', 'Dean Forester', '101 Cedar Street, Woodbury, USA', 5, 'Dragonfly Inn'),
('234567893', 'Jess Mariano', '123 Main Street, Hartford, USA', 6, 'Dragonfly Inn'),
('345678904', 'Logan Huntzberger', '456 Oak Avenue, Stars Hollow, USA', 6, 'Dragonfly Inn'),
('456789015', 'Christopher Hayden', '789 Pine Street, Washington, USA', 7, 'Dragonfly Inn'),
('567890126', 'Taylor Doose', '101 Elm Street, Woodbury, USA', 7, 'Dragonfly Inn'),
('678901237', 'Miss Patty', '123 Maple Avenue, Hartford, USA', 8, 'Dragonfly Inn'),
('789012348', 'Babette Dell', '456 Cedar Street, Stars Hollow, USA', 8, 'Dragonfly Inn');

UPDATE hotel h
SET manager_SSN = (
    SELECT SSN
    FROM employee e
    WHERE h.chain = e.chain -- An employee can manage multiple hotels of the same chain
    LIMIT 1
)
WHERE manager_SSN IS NULL;

-- Populate employee_role table

-- Employee roles for Grand Hotels
INSERT INTO employee_role (employee_SSN, role) VALUES
-- Emma Smith
('111111111', 'Concierge'),
('111111111', 'Housekeeping'),
-- Oliver Johnson
('222222222', 'Bellboy'),
('222222222', 'Receptionist'),
-- Sophia Brown
('333333333', 'Housekeeping'),
('333333333', 'Concierge'),
-- William Lee
('444444444', 'Receptionist'),
('444444444', 'Bellboy'),
-- Lucas Taylor
('555555555', 'Housekeeping'),
('555555555', 'Concierge'),
-- Isabella Smith
('666666666', 'Concierge'),
('666666666', 'Housekeeping'),
-- Ella Davis
('777777777', 'Bellboy'),
('777777777', 'Housekeeping'),
-- Liam Johnson
('888888888', 'Concierge'),
('888888888', 'Bellboy'),
-- Chloe Miller
('999999999', 'Receptionist'),
('999999999', 'Housekeeping'),
-- Lucas Wilson
('123456789', 'Housekeeping'),
('123456789', 'Concierge'),
-- Natalie Moore
('234567890', 'Bellboy'),
('234567890', 'Receptionist'),
-- Ella Taylor
('345678901', 'Receptionist'),
('345678901', 'Bellboy'),
-- Dylan Johnson
('456789012', 'Housekeeping'),
('456789012', 'Concierge'),
-- Brooklyn Brown
('567890123', 'Concierge'),
('567890123', 'Housekeeping'),
-- Leah Davis
('678901234', 'Bellboy'),
('678901234', 'Receptionist'),
-- Zoe Wilson
('789012345', 'Concierge'),
('789012345', 'Housekeeping');

-- Employee roles for Ritz-Carlton
INSERT INTO employee_role (employee_SSN, role) VALUES
-- Soma Yukihira
('111111113', 'Head Chef'),
('111111113', 'Chef'),
-- Megumi Tadokoro
('222222224', 'Head Chef'),
('222222224', 'Chef'),
-- Ryo Kurokiba
('333333335', 'Head Chef'),
('333333335', 'Chef'),
-- Alice Nakiri
('444444446', 'Head Chef'),
('444444446', 'Chef'),
-- Erina Nakiri
('555555557', 'Head Chef'),
('555555557', 'Chef'),
-- Takumi Aldini
('666666668', 'Head Chef'),
('666666668', 'Chef'),
-- Hisako Arato
('777777779', 'Head Chef'),
('777777779', 'Chef'),
-- Akira Hayama
('888888880', 'Head Chef'),
('888888880', 'Chef'),
-- Jun Shiomi
('999999991', 'Head Chef'),
('999999991', 'Chef'),
-- Nene Kinokuni
('123456781', 'Head Chef'),
('123456781', 'Chef'),
-- Ikumi Mito
('234567892', 'Head Chef'),
('234567892', 'Chef'),
-- Isami Aldini
('345678903', 'Head Chef'),
('345678903', 'Chef'),
-- Yuki Yoshino
('456789014', 'Head Chef'),
('456789014', 'Chef'),
-- Roland Chapelle
('567890125', 'Head Chef'),
('567890125', 'Chef'),
-- Kojiro Shinomiya
('678901236', 'Head Chef'),
('678901236', 'Chef'),
-- Rindou Kobayashi
('789012347', 'Head Chef'),
('789012347', 'Chef');
    
-- Populate customer table
INSERT INTO customer (SSN, name, address, registration_date) VALUES
('123456789', 'Monkey D. Luffy', '123 East Blue Street, Foosha Village', '2014-05-20'),
('234567890', 'Roronoa Zoro', '456 Shimotsuki Village, East Blue', '2015-08-12'),
('345678901', 'Nami', '789 Cocoyasi Village, East Blue', '2016-03-28'),
('456789012', 'Usopp', '101 Syrup Village, East Blue', '2017-11-05'),
('567890123', 'Sanji Vinsmoke', '123 Baratie, East Blue', '2018-07-19'),
('678901234', 'Tony Tony Chopper', '456 Drum Island, North Blue', '2019-02-14'),
('789012345', 'Nico Robin', '789 Ohara Island, West Blue', '2020-09-30'),
('890123456', 'Franky', '101 Water 7, West Blue', '2021-06-24'),
('901234567', 'Brook', '123 Florian Triangle', '2022-04-17'),
('012345678', 'Jinbe', '456 Fish-Man Island', '2023-01-01'),
('098765432', 'Ichigo Kurosaki', '123 Karakura Town, Human World', '2014-07-08'),
('987654321', 'Rukia Kuchiki', '456 Soul Society', '2015-10-15'),
('876543210', 'Renji Abarai', '789 Rukongai, Soul Society', '2016-05-29'),
('765432109', 'Orihime Inoue', '101 Karakura Town, Human World', '2017-12-03'),
('654321098', 'Yasutora Sado', '123 Naruki City, Human World', '2018-08-21'),
('543210987', 'Uryu Ishida', '456 Karakura Town, Human World', '2019-03-14'),
('432109876', 'Rangiku Matsumoto', '789 Soul Society', '2020-11-09'),
('321098765', 'Toshiro Hitsugaya', '101 Soul Society', '2021-07-26'),
('210987654', 'Byakuya Kuchiki', '123 Soul Society', '2022-05-10'),
('109876543', 'Kenpachi Zaraki', '456 Soul Society', '2023-02-22'),
('001234567', 'Naruto Uzumaki', '123 Hidden Leaf Village, Land of Fire', '2014-10-11'),
('002345678', 'Sasuke Uchiha', '456 Hidden Leaf Village, Land of Fire', '2015-09-06'),
('003456789', 'Sakura Haruno', '789 Hidden Leaf Village, Land of Fire', '2016-04-23'),
('004567890', 'Kakashi Hatake', '101 Hidden Leaf Village, Land of Fire', '2017-11-17'),
('005678901', 'Shikamaru Nara', '123 Hidden Leaf Village, Land of Fire', '2018-06-09'),
('006789012', 'Choji Akimichi', '456 Hidden Leaf Village, Land of Fire', '2019-03-04'),
('007890123', 'Ino Yamanaka', '789 Hidden Leaf Village, Land of Fire', '2020-12-28'),
('008901234', 'Neji Hyuga', '101 Hidden Leaf Village, Land of Fire', '2021-10-20'),
('009012345', 'Rock Lee', '123 Hidden Leaf Village, Land of Fire', '2022-08-14'),
('100123456', 'Tenten', '456 Hidden Leaf Village, Land of Fire', '2023-05-07');

-- Populate booking_renting table 
INSERT INTO booking_renting (booking_id, room_num, hotel_id, chain, customer_SSN, is_renting) VALUES
-- Grand Hotels
(1, 2, 1, 'Grand Hotels', '345678901', 'active'),
(2, 4, 1, 'Grand Hotels', '456789012', 'active'),
(3, 1, 2, 'Grand Hotels', '567890123', 'active'),
(4, 3, 2, 'Grand Hotels', '678901234', 'active'),
(5, 5, 3, 'Grand Hotels', '789012345', 'active'),
(6, 2, 3, 'Grand Hotels', '890123456', 'active'),
(7, 4, 4, 'Grand Hotels', '901234567', 'active'),
(8, 1, 4, 'Grand Hotels', '012345678', 'active'),
(9, 3, 5, 'Grand Hotels', '098765432', 'active'),
(10, 5, 5, 'Grand Hotels', '987654321', 'active'),
(11, 2, 6, 'Grand Hotels', '876543210', 'active'),
(12, 4, 6, 'Grand Hotels', '765432109', 'active'),
(13, 1, 7, 'Grand Hotels', '654321098', 'active'),
(14, 3, 7, 'Grand Hotels', '543210987', 'active'),
(15, 5, 8, 'Grand Hotels', '432109876', 'active'),
(16, 2, 8, 'Grand Hotels', '321098765', 'active'),

-- Royal Resorts
(1, 4, 1, 'Royal Resorts', '210987654', 'active'),
(2, 1, 1, 'Royal Resorts', '109876543', 'active'),
(3, 3, 2, 'Royal Resorts', '001234567', 'active'),
(4, 5, 2, 'Royal Resorts', '002345678', 'active'),
(5, 2, 3, 'Royal Resorts', '003456789', 'active'),
(6, 4, 3, 'Royal Resorts', '004567890', 'active'),
(7, 1, 4, 'Royal Resorts', '005678901', 'active'),
(8, 3, 4, 'Royal Resorts', '006789012', 'active'),
(9, 5, 5, 'Royal Resorts', '007890123', 'active'),
(10, 2, 5, 'Royal Resorts', '008901234', 'active'),
(11, 4, 6, 'Royal Resorts', '009012345', 'active'),
(12, 1, 6, 'Royal Resorts', '100123456', 'active'),
(13, 3, 7, 'Royal Resorts', '123456789', 'active'),
(14, 5, 7, 'Royal Resorts', '234567890', 'active'),
(15, 2, 8, 'Royal Resorts', '345678901', 'active'),
(16, 4, 8, 'Royal Resorts', '456789012', 'active'),

-- Ritz-Carlton
(1, 2, 1, 'Ritz-Carlton', '345678901', 'active'),
(2, 4, 1, 'Ritz-Carlton', '456789012', 'active'),
(3, 1, 2, 'Ritz-Carlton', '567890123', 'active'),
(4, 3, 2, 'Ritz-Carlton', '678901234', 'active'),
(5, 5, 3, 'Ritz-Carlton', '789012345', 'active'),
(6, 2, 3, 'Ritz-Carlton', '890123456', 'active'),
(7, 4, 4, 'Ritz-Carlton', '901234567', 'active'),
(8, 1, 4, 'Ritz-Carlton', '012345678', 'active'),
(9, 3, 5, 'Ritz-Carlton', '098765432', 'active'),
(10, 5, 5, 'Ritz-Carlton', '987654321', 'active'),
(11, 2, 6, 'Ritz-Carlton', '876543210', 'active'),
(12, 4, 6, 'Ritz-Carlton', '765432109', 'active'),
(13, 1, 7, 'Ritz-Carlton', '654321098', 'active'),
(14, 3, 7, 'Ritz-Carlton', '543210987', 'active'),
(15, 5, 8, 'Ritz-Carlton', '432109876', 'active'),
(16, 2, 8, 'Ritz-Carlton', '321098765', 'active'),

-- Independence Inn
(1, 4, 1, 'Independence Inn', '210987654', 'active'),
(2, 1, 1, 'Independence Inn', '109876543', 'active'),
(3, 3, 2, 'Independence Inn', '001234567', 'active'),
(4, 5, 2, 'Independence Inn', '002345678', 'active'),
(5, 2, 3, 'Independence Inn', '003456789', 'active'),
(6, 4, 3, 'Independence Inn', '004567890', 'active'),
(7, 1, 4, 'Independence Inn', '005678901', 'active'),
(8, 3, 4, 'Independence Inn', '006789012', 'active'),
(9, 5, 5, 'Independence Inn', '007890123', 'active'),
(10, 2, 5, 'Independence Inn', '008901234', 'active'),
(11, 4, 6, 'Independence Inn', '009012345', 'active'),
(12, 1, 6, 'Independence Inn', '100123456', 'active'),
(13, 3, 7, 'Independence Inn', '123456789', 'active'),
(14, 5, 7, 'Independence Inn', '234567890', 'active'),
(15, 2, 8, 'Independence Inn', '345678901', 'active'),
(16, 4, 8, 'Independence Inn', '456789012', 'active'),

-- Dragonfly Inn
(1, 1, 1, 'Dragonfly Inn', '543210987', 'active'),
(2, 3, 1, 'Dragonfly Inn', '432109876', 'active'),
(3, 5, 2, 'Dragonfly Inn', '321098765', 'active'),
(4, 2, 2, 'Dragonfly Inn', '210987654', 'active'),
(5, 4, 3, 'Dragonfly Inn', '109876543', 'active'),
(6, 1, 3, 'Dragonfly Inn', '001234567', 'active'),
(7, 3, 4, 'Dragonfly Inn', '002345678', 'active'),
(8, 5, 4, 'Dragonfly Inn', '003456789', 'active'),
(9, 2, 5, 'Dragonfly Inn', '004567890', 'active'),
(10, 4, 5, 'Dragonfly Inn', '005678901', 'active'),
(11, 1, 6, 'Dragonfly Inn', '006789012', 'active'),
(12, 3, 6, 'Dragonfly Inn', '007890123', 'active'),
(13, 5, 7, 'Dragonfly Inn', '008901234', 'active'),
(14, 2, 7, 'Dragonfly Inn', '009012345', 'active'),
(15, 4, 8, 'Dragonfly Inn', '100123456', 'active'),
(16, 1, 8, 'Dragonfly Inn', '123456789', 'active');

-- Populate booking_date table 

-- Grand Hotels
INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(1, 1, 'Grand Hotels', '2022-01-01'),
(1, 1, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(2, 1, 'Grand Hotels', '2022-01-01'),
(2, 1, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(3, 2, 'Grand Hotels', '2022-01-01'),
(3, 2, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(4, 2, 'Grand Hotels', '2022-01-01'),
(4, 2, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(5, 3, 'Grand Hotels', '2022-01-01'),
(5, 3, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(6, 3, 'Grand Hotels', '2022-01-01'),
(6, 3, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(7, 4, 'Grand Hotels', '2022-01-01'),
(7, 4, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(8, 4, 'Grand Hotels', '2022-01-01'),
(8, 4, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(9, 5, 'Grand Hotels', '2022-01-01'),
(9, 5, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(10, 5, 'Grand Hotels', '2022-01-01'),
(10, 5, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(11, 6, 'Grand Hotels', '2022-01-01'),
(11, 6, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(12, 6, 'Grand Hotels', '2022-01-01'),
(12, 6, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(13, 7, 'Grand Hotels', '2022-01-01'),
(13, 7, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(14, 7, 'Grand Hotels', '2022-01-01'),
(14, 7, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(15, 8, 'Grand Hotels', '2022-01-01'),
(15, 8, 'Grand Hotels', '2022-01-02');

INSERT INTO booking_date (booking_id, hotel_id, chain, date) VALUES
(16, 8, 'Grand Hotels', '2022-01-01'),
(16, 8, 'Grand Hotels', '2022-01-02');
