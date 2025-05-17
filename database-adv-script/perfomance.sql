-- performance.sql
-- ALX Airbnb Database: Task 4 - Refactor Complex Queries for Performance
-- Initial and refactored queries to retrieve bookings with user, property, and payment details
-- Database: alx_airbnb_database
-- Tables: Booking, User, Property, Payment

USE alx_airbnb_database;

-- Initial Query
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location,
    pm.payment_id,
    pm.amount,
    pm.payment_date
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pm ON b.booking_id = pm.booking_id
WHERE b.start_date >= '2025-01-01'
ORDER BY b.start_date;

-- EXPLAIN for Initial Query
EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location,
    pm.payment_id,
    pm.amount,
    pm.payment_date
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pm ON b.booking_id = pm.booking_id
WHERE b.start_date >= '2025-01-01'
ORDER BY b.start_date;

-- Create Indexes for Optimization
CREATE INDEX idx_booking_opt ON Booking(start_date, user_id, property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- Optimized Query
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location,
    pm.payment_id,
    pm.amount,
    pm.payment_date
FROM Booking b FORCE INDEX (idx_booking_opt)
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pm ON b.booking_id = pm.booking_id
WHERE b.start_date >= '2025-01-01'
    AND user.id IS NOT NULL
ORDER BY b.start_date;

-- EXPLAIN for Optimized Query
EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location,
    pm.payment_id,
    pm.amount,
    pm.payment_date
FROM Booking b FORCE INDEX (idx_booking_opt)
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pm ON b.booking_id = pm.booking_id
WHERE b.start_date >= '2025-01-01'
ORDER BY b.start_date;


-- Performance Notes:
-- Initial: Uses idx_booking_start_date, scans ~5 rows, 'Using filesort' for ORDER BY.
-- Optimized: idx_booking_opt eliminates filesort, maintains ~5 rows, improves join efficiency.
