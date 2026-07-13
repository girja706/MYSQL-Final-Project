use  smart_tourism_db;

-- 1  Business Requirement

-- The tourism Department wants to know how many bookings each hotel has received.
-- objective
-- Display total bookings for every hotel.
SELECT 
h.hotel_name,
COUNT(b.booking_id) AS
total_bookings
FROM hotels h
JOIN room_types rt
ON h.hotel_id = rt.hotel_id
JOIN bookings b
ON rt.room_type_id = b.room_type_id
GROUP BY h.hotel_id, h.hotel_name
ORDER BY total_bookings DESC;

-- 2 Business Requirement

-- Management offered by every hotel.

 -- Objective

-- Display average room price hotel-wise.


SELECT
    h.hotel_name,
    ROUND(AVG(rt.price_per_night),2) AS average_room_price
FROM hotels h
JOIN room_types rt
ON h.hotel_id = rt.hotel_id
GROUP BY h.hotel_id,h.hotel_name
ORDER BY average_room_price DESC;

-- 3 Business Requirement

 -- Budget travellers want to know the cheapest
 -- room available in every hotel.

 -- Objective

 -- Display minimum room price of each hotel.
SELECT
    h.hotel_name,
    MIN(rt.price_per_night) AS minimum_room_price
FROM hotels h
JOIN room_types rt
ON h.hotel_id=rt.hotel_id
GROUP BY h.hotel_id,h.hotel_name
ORDER BY minimum_room_price;

-- 4 Business Requirement

 -- Luxury travellers want to know the most expensive
 -- room offered by every hotel.

 -- Objective

 -- Display maximum room price hotel-wise.
SELECT
    h.hotel_name,
    MAX(rt.price_per_night) AS maximum_room_price
FROM hotels h
JOIN room_types rt
ON h.hotel_id=rt.hotel_id
GROUP BY h.hotel_id,h.hotel_name
ORDER BY maximum_room_price DESC;

-- 5  Business Requirement

 -- Management wants to know how many room types
 -- each hotel provides.

 -- Objective

 -- Display room type count for every hotel.
SELECT
    h.hotel_name,
    COUNT(rt.room_type_id) AS total_room_types
FROM hotels h
JOIN room_types rt
ON h.hotel_id=rt.hotel_id
GROUP BY h.hotel_id,h.hotel_name
ORDER BY total_room_types DESC;
 

-- question 2) *Business Requirement:*
-- Management wants to know where each hotel is located.

-- *Objective:*
-- Display hotel name, hotel type, rating, destination name, city, and state. 
 SELECT
    h.hotel_id,
    h.hotel_name,
    h.hotel_type,
    h.rating,
    d.destination_name,
    d.city,
    d.state
FROM hotels h
JOIN destinations d
ON h.destination_id = d.destination_id
ORDER BY d.state, d.city, h.hotel_name;


-- question 1
-- *Business Requirement:*
-- The Tourism Department wants to view complete booking details of every tourist.

-- *Objective:*
-- Display tourist name, hotel name, room type, check-in date, check-out date, and booking status.
 
SELECT
    t.full_name AS tourist_name,
    h.hotel_name,
    rt.room_type_name,
    b.check_in_date,
    b.check_out_date,
    b.booking_status
FROM tourists t
JOIN bookings b
    ON t.tourist_id = b.tourist_id
JOIN room_types rt
    ON b.room_type_id = rt.room_type_id
JOIN hotels h
    ON rt.hotel_id = h.hotel_id
ORDER BY t.full_name, b.check_in_date;

-- Question 3

-- *Business Requirement:*
-- Customers want to see all room types available in every hotel.

-- *Objective:*
-- Display hotel name, room type, price per night, and total rooms.


SELECT
    h.hotel_name,
    rt.room_type_name,
    rt.price_per_night,
    rt.total_rooms
FROM hotels h
JOIN room_types rt
    ON h.hotel_id = rt.hotel_id
ORDER BY h.hotel_name, rt.room_type_name;

 -- Question 4

-- *Business Requirement:*
-- Management wants a complete booking report.

-- *Objective:*
-- Display tourist name, destination, hotel, room type, booking status, check-in date, and check-out date.


SELECT
    t.full_name AS tourist_name,
    d.destination_name,
    h.hotel_name,
    rt.room_type_name,
    b.booking_status,
    b.check_in_date,
    b.check_out_date
FROM bookings b
JOIN tourists t
    ON b.tourist_id = t.tourist_id
JOIN room_types rt
    ON b.room_type_id = rt.room_type_id
JOIN hotels h
    ON rt.hotel_id = h.hotel_id
JOIN destinations d
    ON h.destination_id = d.destination_id
ORDER BY b.booking_id;

-- Question 5

-- *Business Requirement:*
-- Management wants to identify tourists who booked Deluxe rooms.

-- *Objective:*
-- Display tourist name, hotel name, room type, and booking date.

SELECT
    t.full_name AS tourist_name,
    h.hotel_name,
    rt.room_type_name,
    b.booking_date
FROM bookings b
JOIN tourists t
    ON b.tourist_id = t.tourist_id
JOIN room_types rt
    ON b.room_type_id = rt.room_type_id
JOIN hotels h
    ON rt.hotel_id = h.hotel_id
WHERE rt.room_type_name = 'Deluxe'
ORDER BY b.booking_date;

-- Question 6

-- *Business Requirement:*
-- Management wants to display all hotels, including hotels that currently have no room types configured.

-- *Objective:*
-- Display hotel name, room type, and price per night.


SELECT
    h.hotel_name,
    rt.room_type_name,
    rt.price_per_night
FROM hotels h
LEFT JOIN room_types rt
    ON h.hotel_id = rt.hotel_id
ORDER BY h.hotel_name;

-- Question 7

-- *Business Requirement:*
-- The Tourism Department wants to identify registered tourists who have never made a booking.

-- *Objective:*
-- Display tourist ID, tourist name, and city of tourists without any bookings.

SELECT
    t.tourist_id,
    t.full_name AS tourist_name,
    t.city
FROM tourists t
LEFT JOIN bookings b
    ON t.tourist_id = b.tourist_id
WHERE b.booking_id IS NULL
ORDER BY t.tourist_id;

-- Question 8

-- *Business Requirement:*
-- Management wants to know how many hotels are available at every destination.

-- *Objective:*
-- Display destination name and total number of hotels at each destination.

SELECT
    d.destination_name,
    COUNT(h.hotel_id) AS total_hotels
FROM destinations d
LEFT JOIN hotels h
    ON d.destination_id = h.destination_id
GROUP BY d.destination_id, d.destination_name
ORDER BY total_hotels DESC;

-- Question 9

-- *Business Requirement:*
-- Management wants to view complete booking history sorted by booking date.

-- *Objective:*
-- Display booking ID, tourist name, hotel name, room type, booking date, and booking status.

 SELECT
    b.booking_id,
    t.full_name AS tourist_name,
    h.hotel_name,
    rt.room_type_name,
    b.booking_date,
    b.booking_status
FROM bookings b
JOIN tourists t
    ON b.tourist_id = t.tourist_id
JOIN room_types rt
    ON b.room_type_id = rt.room_type_id
JOIN hotels h
    ON rt.hotel_id = h.hotel_id
ORDER BY b.booking_date;

-- Question 10

-- *Business Requirement:*
-- Management wants to know the latest booking made by every tourist.

-- *Objective:*
-- Display tourist name and their latest booking date.

SELECT
    t.full_name AS tourist_name,
    MAX(b.booking_date) AS latest_booking_date
FROM tourists t
JOIN bookings b
    ON t.tourist_id = b.tourist_id
GROUP BY t.tourist_id, t.full_name
ORDER BY latest_booking_date DESC;
 
 