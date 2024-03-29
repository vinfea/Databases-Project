

--index for average price query, which groups the rooms by chain and calculates the average price
-- this index increases efficiency of the query by allowing MYSQL to perform query and find chain and price values without scanning the entire table
--this index is also useful for nested query, speeding the efficiency of finding the average price at each hotel
CREATE INDEX idx_hotel_chain_price_room ON room(hotel_id, chain, price);

--this index improves the speed of the join operation done in the nested query, which contains a multtide of join operations
CREATE INDEX idx_booking_renting_join ON booking_renting(room_num, hotel_id, chain, customer_SSN);

--index for the employee lookup query, which is based on the employee's name
-- decreases the time complexity of the query from O(n) to O(log(n)), as it will not longer be a sequential search
CREATE INDEX idx_chain_name_employee ON employee(chain, name);

--index for the hotel table, which groups the hotels by chain
CREATE INDEX idx_chain_hotel ON hotel(chain);
