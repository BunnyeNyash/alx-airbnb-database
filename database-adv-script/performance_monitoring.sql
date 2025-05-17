-- performance_monitoring.sql
-- ALX Airbnb Database: Task 6 - Monitor and Refine Database Performance
-- Analyzes frequent queries, identifies bottlenecks, and implements improvements
-- Database: alx_airbnb_database
-- Tables: Booking, User, Property, Payment


USE alx_airbnb_database;

-- Query 1: Get bookings within a specific date range
SELECT 
    booking_id,
    start_date,
    total_price
FROM Booking
WHERE start_date BETWEEN '2025-06-01' AND '2025-12-31';

-- Check performance of the first query
EXPLAIN ANALYZE
SELECT 
    booking_id,
    start_date,
    total_price
FROM Booking
WHERE start_date BETWEEN '2025-06-01' AND '2025-12-31';

-- Query 2: Retrieve bookings made by a specific user (by email)
SELECT 
    b.booking_id,
    b.start_date,
    u.first_name,
    u.last_name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE u.email = 'user1@example.com';

-- Analyze the second query performance
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    u.first_name,
    u.last_name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE u.email = 'user1@example.com';

-- Query 3: Get total payment amounts grouped by property
SELECT 
    p.property_id,
    p.name AS property_name,
    SUM(pm.amount) AS total_payments
FROM Property p
JOIN Booking b ON b.property_id = p.property_id
JOIN Payment pm ON pm.booking_id = b.booking_id
GROUP BY p.property_id, p.name;

-- Analyze the third query
EXPLAIN ANALYZE
SELECT 
    p.property_id,
    p.name AS property_name,
    SUM(pm.amount) AS total_payments
FROM Property p
JOIN Booking b ON b.property_id = p.property_id
JOIN Payment pm ON pm.booking_id = b.booking_id
GROUP BY p.property_id, p.name;

-- Improving performance with indexes
-- Index 1: Speeds up email lookups in the User table
CREATE INDEX idx_user_email_id ON User(email, user_id);

-- Index 2: Helps optimize joins between Booking and Property tables
CREATE INDEX idx_booking_property_booking ON Booking(property_id, booking_id);

-- Re-check Query 2 after indexing
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    u.first_name,
    u.last_name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE u.email = 'user1@example.com';

-- Re-check Query 3 after indexing
EXPLAIN ANALYZE
SELECT 
    p.property_id,
    p.name AS property_name,
    SUM(pm.amount) AS total_payments
FROM Property p
JOIN Booking b ON b.property_id = p.property_id
JOIN Payment pm ON pm.booking_id = b.booking_id
GROUP BY p.property_id, p.name;
