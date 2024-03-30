-- number of available rooms per area 
CREATE VIEW available_rooms_per_city AS
SELECT
    get_city_from_address(h.address) AS city,
    COUNT(r.room_num) AS available_rooms_count
FROM
    room r
JOIN
    hotel h ON r.hotel_id = h.hotel_id AND r.chain = h.chain
LEFT JOIN
    booking_renting br ON r.room_num = br.room_num AND r.hotel_id = br.hotel_id AND r.chain = br.chain
WHERE
    br.booking_id IS NULL OR br.is_renting = 'cancelled' OR br.is_renting = 'archived'
GROUP BY
    city;


-- aggregate the capacity of rooms in each hotel
CREATE VIEW aggregated_room_capacity AS
SELECT chain, hotel_id, SUM(capacity) AS total_capacity
FROM room
GROUP BY chain, hotel_id;
