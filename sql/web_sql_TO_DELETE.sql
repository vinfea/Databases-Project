-- ALL VALUES ARE HARD CODED 
-- DELETE QUERIES MIGHT NOT WORK SINCE I ALREADY DELETED WHILE TESTING 

-- Show all the bookings for a customer, given their username -- 
SELECT br.booking_id, br.room_num, br.hotel_id, br.chain, br.is_renting, bd.date 
FROM booking_renting br
JOIN customer c ON br.customer_SSN = c.SSN 
JOIN booking_date bd ON bd.booking_id = br.booking_id AND bd.hotel_id = br.hotel_id AND bd.chain = br.chain 
WHERE c.username = 'nami'; -- password is mikan

-- Delete a booking given booking_id, hotel_id, and chain (the primary key)
DELETE FROM booking_renting
WHERE booking_id = '3' AND hotel_id = '1' AND chain = 'Grand Hotels';

-- Show all bookings for a hotel the employee works at, given their username
SELECT br.booking_id, br.room_num, br.hotel_id, br.chain, br.customer_SSN, br.is_renting, bd.date
FROM booking_renting br
JOIN employee e ON br.hotel_id = e.hotel_id AND br.chain = e.chain
JOIN booking_date bd ON bd.booking_id = br.booking_id AND bd.hotel_id = br.hotel_id AND bd.chain = br.chain
WHERE e.username = 'bbrown'; -- password is defaultpassword

-- Check in a customer as an employee from list of bookings
-- given booking_id, hotel_id, and chain (the primary key) 
UPDATE booking_renting
SET is_renting = 'renting'
WHERE booking_id = 13 AND hotel_id = 7 AND chain = 'Grand Hotels'; 

-- Update payment information given primary key (booking_id, hotel_id, chain)
-- and payment information
UPDATE booking_payment
SET cc_number = '1111222233334444', exp_date = '2024-02-12', ccv = '123'
WHERE booking_id = 13 AND hotel_id = 7 AND chain = 'Grand Hotels'; 




