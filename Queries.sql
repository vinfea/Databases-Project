-- Queries -- 

-- Query to retrieve the average price of rooms for each hotel chain --
SELECT chain, AVG(price) AS average_price
FROM room
GROUP BY chain;

-- Query to retrieve the names of customers --
-- who have made bookings at hotels managed by employees named "Lorelai Gilmore" --
SELECT DISTINCT c.name
FROM customer c
JOIN booking_renting br ON c.SSN = br.customer_SSN
JOIN hotel h ON br.hotel_id = h.hotel_id AND br.chain = h.chain
JOIN employee e ON h.chain = e.chain AND h.manager_SSN = e.SSN
WHERE e.name = 'Lorelai Gilmore';

-- AGGREGATION Query to find the total number of rooms in each hotel --
SELECT chain, SUM(num_rooms) AS total_rooms
FROM hotel
GROUP BY chain;

-- NESTED Query to find names and addresses of customers --
-- who have booked rooms with a price higher than the average price of rooms in their respective hotels --
SELECT c.name, c.address
FROM customer c
JOIN booking_renting br ON c.SSN = br.customer_SSN
JOIN room r ON br.room_num = r.room_num AND br.hotel_id = r.hotel_id AND br.chain = r.chain
WHERE r.price > (
    SELECT AVG(price)
    FROM room
    WHERE hotel_id = r.hotel_id AND chain = r.chain
);








