-- schema.sql
-- ALX Airbnb Database Schema
-- Task 2: Design Database Schema (DDL)
-- Creates tables, constraints, and indexes for the Airbnb-like database

CREATE DATABASE IF NOT EXISTS alx_airbnb_database;
USE alx_airbnb_database;

-- User Table
CREATE TABLE User (
    user_id CHAR(32) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index on email
CREATE INDEX idx_user_email ON User(email);

-- Property Table
CREATE TABLE Property (
    property_id CHAR(32) PRIMARY KEY,
    host_id CHAR(32) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(100) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES User(user_id)
);

-- Booking Table
CREATE TABLE Booking (
    booking_id CHAR(32) PRIMARY KEY,
    property_id CHAR(32) NOT NULL,
    user_id CHAR(32) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Index on property_id
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Payment Table
CREATE TABLE Payment (
    payment_id CHAR(32) PRIMARY KEY,
    booking_id CHAR(32) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

-- Index on booking_id
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- Review Table
CREATE TABLE Review (
    review_id CHAR(32) PRIMARY KEY,
    property_id CHAR(32) NOT NULL,
    user_id CHAR(32) NOT NULL,
    rating TINYINT CHECK (rating BETWEEN 1 AND 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Message Table
CREATE TABLE Message (
    message_id CHAR(32) PRIMARY KEY,
    sender_id CHAR(32) NOT NULL,
    recipient_id CHAR(32) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);
