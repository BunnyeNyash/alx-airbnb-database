-- partitioning.sql
-- ALX Airbnb Database: Task 5 - Partitioning the Booking Table
-- Implements RANGE partitioning on Booking table by start_date
-- Database: alx_airbnb_database
-- Table: Booking

USE alx_airbnb_database;

-- Drop existing Booking table (backup data first in production)
DROP TABLE IF EXISTS Booking;

-- Create Booking table with RANGE partitioning by start_date
CREATE TABLE Booking (
    booking_id UUID NOT NULL,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    total_price DECIMAL(10, 2),
    PRIMARY KEY (booking_id, start_date),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);
