-- joins_queries.sql
-- ALX Airbnb Database: Task 0 - Complex Queries with Joins
-- Contains SQL queries using INNER JOIN, LEFT JOIN, and FULL OUTER JOIN
-- Database: alx_airbnb_database
-- Tables: User, Booking, Property, Review

USE alx_airbnb_database;

-- Query 1: INNER JOIN to retrieve all bookings and their respective users
SELECT 
    b.booking_id,
    u.user_id,
    u.first_name,
    u.last_name,
    b.start_date,
    b.end_date
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;


-- Query 2: LEFT JOIN to retrieve all properties and their reviews, including properties with no reviews

SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    r.review_id,
    r.rating,
    r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id
ORDER BY p.property_id, r.created_at;


-- Query 3: FULL OUTER JOIN to retrieve all users and all bookings, including users without bookings
-- Note: MySQL does not support FULL OUTER JOIN, so we emulate it using LEFT JOIN UNION RIGHT JOIN
-- For databases supporting FULL OUTER JOIN (e.g., PostgreSQL), use the commented query below
/*
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM User u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
*/

-- Emulated FULL OUTER JOIN for MySQL
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id
UNION
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM User u
RIGHT JOIN Booking b ON u.user_id = b.user_id;
