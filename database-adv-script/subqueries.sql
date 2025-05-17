-- subqueries.sql
-- ALX Airbnb Database: Task 1 - Practice Subqueries
-- Contains SQL queries using non-correlated and correlated subqueries
-- Database: alx_airbnb_database
-- Tables: Property, Review, User, Booking

USE alx_airbnb_database;

-- Query 1: Non-correlated subquery to find properties with average rating > 4.0
SELECT 
    p.property_id,
    p.name AS property_name,
FROM Property p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM Review r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);

-- Query 2: Correlated subquery to find users with more than 3 bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
FROM User u
WHERE (
    SELECT COUNT(*)
    FROM Booking b
    WHERE b.user_id = u.user_id
) > 3;
