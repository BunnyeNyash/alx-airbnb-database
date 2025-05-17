-- aggregations_and_window_functions.sql
-- ALX Airbnb Database: Task 2 - Apply Aggregations and Window Functions
-- Contains SQL queries using COUNT, GROUP BY, and RANK window function
-- Database: alx_airbnb_database
-- Tables: User, Booking, Property

USE alx_airbnb_database;

-- Query 1: Total number of bookings made by each user using COUNT and GROUP BY
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS booking_count
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY booking_count DESC, u.user_id;

-- Query 2: Rank properties based on total number of bookings using RANK
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    COUNT(b.booking_id) AS booking_count,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name, p.location
ORDER BY booking_rank, p.property_id;
