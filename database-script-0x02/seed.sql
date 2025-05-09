-- seed.sql
-- ALX Airbnb Database Seeding
-- Task 3: Seed the Database with Sample Data
-- Populates tables with realistic data using dynamic UUIDs

USE alx_airbnb_database;

-- Generate and store UUIDs for Users
SET @user1_id = REPLACE(UUID(), '-', '');
SET @user2_id = REPLACE(UUID(), '-', '');
SET @user3_id = REPLACE(UUID(), '-', '');
SET @user4_id = REPLACE(UUID(), '-', '');
SET @user5_id = REPLACE(UUID(), '-', '');

-- Insert Users (5 users: 2 hosts, 2 guests, 1 admin)
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
(@user1_id, 'John', 'Wachira', 'john.wachira@example.com', 'hashed_pass1', '123-456-7890', 'host', '2025-01-01 10:00:00'),
(@user2_id, 'Miriam', 'Makeba', 'makeba.miriam@example.com', 'hashed_pass2', '234-567-8901', 'host', '2025-01-02 12:00:00'),
(@user3_id, 'Leo', 'Igwe', 'igwe.l@example.com', 'hashed_pass3', '345-678-9012', 'guest', '2025-01-03 14:00:00'),
(@user4_id, 'Stella', 'Saka', 'stella.s@example.com', 'hashed_pass4', '456-789-0123', 'guest', '2025-01-04 16:00:00'),
(@user5_id, 'Admin', 'User', 'admin@example.com', 'hashed_pass5', NULL, 'admin', '2025-01-05 18:00:00');

-- Generate and store UUIDs for Properties
SET @property1_id = REPLACE(UUID(), '-', '');
SET @property2_id = REPLACE(UUID(), '-', '');
SET @property3_id = REPLACE(UUID(), '-', '');
SET @property4_id = REPLACE(UUID(), '-', '');

-- Insert Properties (4 properties owned by hosts)
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
(@property1_id, @user1_id, 'Cozy Cottage', 'A charming cottage in the countryside.', 'Nairobi, Kenya', 75.00, '2025-01-10 09:00:00', '2025-01-10 09:00:00'),
(@property2_id, @user1_id, 'City Apartment', 'Modern apartment in downtown.', 'Lagos, Nigeria', 120.00, '2025-01-11 10:00:00', '2025-01-11 10:00:00'),
(@property3_id, @user2_id, 'Beach Villa', 'Luxurious villa by the ocean.', 'Cape Town, South Africa', 200.00, '2025-01-12 11:00:00', '2025-01-12 11:00:00'),
(@property4_id, @user2_id, 'Mountain Cabin', 'Rustic cabin in the mountains.', 'Accra, Ghana', 90.00, '2025-01-13 12:00:00', '2025-01-13 12:00:00');

-- Generate and store UUIDs for Bookings
SET @booking1_id = REPLACE(UUID(), '-', '');
SET @booking2_id = REPLACE(UUID(), '-', '');
SET @booking3_id = REPLACE(UUID(), '-', '');
SET @booking4_id = REPLACE(UUID(), '-', '');
SET @booking5_id = REPLACE(UUID(), '-', '');

-- Insert Bookings (5 bookings by guests for properties)
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
(@booking1_id, @property1_id, @user3_id, '2025-06-01', '2025-06-03', 150.00, 'confirmed', '2025-05-01 08:00:00'),
(@booking2_id, @property2_id, @user3_id, '2025-07-10', '2025-07-12', 240.00, 'pending', '2025-06-01 09:00:00'),
(@booking3_id, @property3_id, @user4_id, '2025-08-15', '2025-08-20', 1000.00, 'confirmed', '2025-07-01 10:00:00'),
(@booking4_id, @property4_id, @user4_id, '2025-09-01', '2025-09-04', 270.00, 'canceled', '2025-08-01 11:00:00'),
(@booking5_id, @property1_id, @user4_id, '2025-10-01', '2025-10-02', 75.00, 'confirmed', '2025-09-01 12:00:00');

-- Generate and store UUIDs for Payments
SET @payment1_id = REPLACE(UUID(), '-', '');
SET @payment2_id = REPLACE(UUID(), '-', '');
SET @payment3_id = REPLACE(UUID(), '-', '');
SET @payment4_id = REPLACE(UUID(), '-', '');
SET @payment5_id = REPLACE(UUID(), '-', '');
SET @payment6_id = REPLACE(UUID(), '-', '');

-- Insert Payments (6 payments for bookings)
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
(@payment1_id, @booking1_id, 150.00, '2025-05-02 09:00:00', 'credit_card'),
(@payment2_id, @booking2_id, 120.00, '2025-06-02 10:00:00', 'paypal'),
(@payment3_id, @booking2_id, 120.00, '2025-06-03 11:00:00', 'stripe'),
(@payment4_id, @booking3_id, 500.00, '2025-07-02 12:00:00', 'credit_card'),
(@payment5_id, @booking3_id, 500.00, '2025-07-03 13:00:00', 'paypal'),
(@payment6_id, @booking5_id, 75.00, '2025-09-02 14:00:00', 'stripe');

-- Generate and store UUIDs for Reviews
SET @review1_id = REPLACE(UUID(), '-', '');
SET @review2_id = REPLACE(UUID(), '-', '');
SET @review3_id = REPLACE(UUID(), '-', '');

-- Insert Reviews (3 reviews for properties by guests)
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
(@review1_id, @property1_id, @user3_id, 4, 'Lovely cottage, very cozy!', '2025-06-04 15:00:00'),
(@review2_id, @property3_id, @user4_id, 5, 'Amazing villa, perfect location!', '2025-08-21 16:00:00'),
(@review3_id, @property1_id, @user4_id, 3, 'Good stay, but could be cleaner.', '2025-10-03 17:00:00');

-- Generate and store UUIDs for Messages
SET @message1_id = REPLACE(UUID(), '-', '');
SET @message2_id = REPLACE(UUID(), '-', '');
SET @message3_id = REPLACE(UUID(), '-', '');

-- Insert Messages (3 messages between users)
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
(@message1_id, @user3_id, @user1_id, 'Is the cottage available for June?', '2025-05-01 18:00:00'),
(@message2_id, @user1_id, @user3_id, 'Yes, it’s available. Please book soon!', '2025-05-01 19:00:00'),
(@message3_id, @user4_id, @user2_id, 'Can I check in early for the villa?', '2025-07-01 20:00:00');
