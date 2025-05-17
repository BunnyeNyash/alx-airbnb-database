-- partition_test.sql
-- ALX Airbnb Database: Task 5 - Test Partitioned Booking Table
-- Recreates indexes and tests performance with date-range query
-- Database: alx_airbnb_database
-- Table: Booking


-- Recreate existing indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_opt ON Booking(start_date, user_id, property_id);

-- Test Query: Fetch bookings by date range
SELECT 
    booking_id,
    start_date,
    total_price
FROM Booking
WHERE start_date BETWEEN '2025-06-01' AND '2025-12-31';

-- EXPLAIN the test query to analyze performance
EXPLAIN
SELECT 
    booking_id,
    start_date,
    total_price
FROM Booking
WHERE start_date BETWEEN '2025-06-01' AND '2025-12-31';
