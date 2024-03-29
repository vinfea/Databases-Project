--number of available rooms per area (no city field to actually filter this properly)
CREATE VIEW available_rooms_per_city AS
SELECT r.chain AS hotel_chain, r.address AS city, COUNT(*) AS num_available_rooms
FROM room r
LEFT JOIN booking_renting br ON r.room_num = br.room_num AND r.hotel_id = br.hotel_id AND r.chain = br.chain
WHERE (br.booking_id IS NULL OR br.is_renting IN ('cancelled', 'archived'))
GROUP BY r.chain, r.address;

--aggregate the capacity of rooms in each hotel
CREATE VIEW aggregated_room_capacity AS
SELECT chain, hotel_id, SUM(capacity) AS total_capacity
FROM room
GROUP BY chain, hotel_id;


