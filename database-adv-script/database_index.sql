-- database_index.sql
-- ALX Airbnb Database: Task 3 - Implement Indexes for Optimization
-- Creates indexes on high-usage columns in Booking and Property tables
-- Database: alx_airbnb_database
-- Tables: Booking, Property

USE alx_airbnb_database;

-- Index on Booking.user_id (used in JOINs and WHERE clauses)
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on Booking.start_date (used for date-range queries)
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Index on Property.name (used in GROUP BY)
CREATE INDEX idx_property_name ON Property(name);
