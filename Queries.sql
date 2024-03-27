-- Queries -- 

-- Query to retrieve the average room price for each hotel: --
SELECT h.chain, AVG(r.price) AS average_price
FROM hotel h
JOIN room r ON h.hotel_id = r.hotel_id AND h.chain = r.chain
GROUP BY h.chain;

-- Retrieve the details of rooms with a price greater than $200 and capacity less than 4. --
SELECT *
FROM room
WHERE price > 200.00 AND capacity < 4;

-- AGGREGATION Query to find the total number of rooms in each hotel: --
SELECT chain, SUM(num_rooms) AS total_rooms
FROM hotel
GROUP BY chain;

-- NESTED query to retrieve the names of customers who have made bookings at hotels managed by employees named "John Doe". --
SELECT DISTINCT c.name
FROM customer c
JOIN booking_renting br ON c.SSN = br.customer_SSN
JOIN hotel h ON br.hotel_id = h.hotel_id AND br.chain = h.chain
JOIN employee e ON h.chain = e.chain AND h.manager_SSN = e.SSN
WHERE e.name = 'John Doe';