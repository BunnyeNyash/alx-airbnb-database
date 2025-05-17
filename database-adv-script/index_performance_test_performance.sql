-- index_performance_test_performance.sql
-- ALX Airbnb Database: Task 3 - Test Performance Before and After Indexing
-- Tests performance of queries using EXPLAIN before and after applying indexes
-- Database: alx_airbnb_database
-- Tables: User, Booking, Property

USE alx_airbnb_database;

-- --------------------------------------
-- Before Indexing: Run EXPLAIN on Queries
-- --------------------------------------

-- Query 1: Task 0 INNER JOIN (Tests User.user_id, Booking.user_id)
SELECT 'Query 1: INNER JOIN Before Indexing' AS description;
EXPLAIN SELECT b.booking_id, u.user_id, u.first_name, u.last_name, b.start_date, b.end_date
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;

-- Query 2: Task 1 Correlated Subquery (Tests User.user_id, Booking.user_id)
SELECT 'Query 2: Correlated Subquery Before Indexing' AS description;
EXPLAIN SELECT u.user_id, u.first_name, u.last_name
FROM User u
WHERE (SELECT COUNT(*) FROM Booking b WHERE b.user_id = u.user_id) > 3;

-- Query 3: Property Search (Tests Property.name)
SELECT 'Query 3: Property Search Before Indexing' AS description;
EXPLAIN SELECT p.property_id, p.name, p.location
FROM Property p
WHERE p.name = 'Cozy Cottage';

-- Query 4: Date-Range Query (Tests Booking.start_date)
SELECT 'Query 4: Date-Range Query Before Indexing' AS description;
EXPLAIN SELECT b.booking_id, b.start_date, b.total_price
FROM Booking b
WHERE b.start_date BETWEEN '2025-06-01' AND '2025-08-31';

-- --------------------------------------
-- Apply Indexes from database_index.sql
-- --------------------------------------
SELECT 'Applying Indexes' AS description;

CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_property_name ON Property(name);

-- Verify Indexes
SELECT 'Indexes on Booking' AS description;
SHOW INDEXES FROM Booking;
SELECT 'Indexes on Property' AS description;
SHOW INDEXES FROM Property;

-- --------------------------------------
-- After Indexing: Run EXPLAIN on Queries
-- --------------------------------------

-- Query 1: Task 0 INNER JOIN (Tests User.user_id, Booking.user_id)
SELECT 'Query 1: INNER JOIN After Indexing' AS description;
EXPLAIN SELECT b.booking_id, u.user_id, u.first_name, u.last_name, b.start_date, b.end_date
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;

-- Query 2: Task 1 Correlated Subquery (Tests User.user_id, Booking.user_id)
SELECT 'Query 2: Correlated Subquery After Indexing' AS description;
EXPLAIN SELECT u.user_id, u.first_name, u.last_name
FROM User u
WHERE (SELECT COUNT(*) FROM Booking b WHERE b.user_id = u.user_id) > 3;

-- Query 3: Property Search (Tests Property.name)
SELECT 'Query 3: Property Search After Indexing' AS description;
EXPLAIN SELECT p.property_id, p.name, p.location
FROM Property p
WHERE p.name = 'Cozy Cottage';

-- Query 4: Date-Range Query (Tests Booking.start_date)
SELECT 'Query 4: Date-Range Query After Indexing' AS description;
EXPLAIN SELECT b.booking_id, b.start_date, b.total_price
FROM Booking b
WHERE b.start_date BETWEEN '2025-06-01' AND '2025-08-31';


-- The SELECT 'Query 2: ...' AS description; lines act as headers, clearly separating each EXPLAIN result
-- description
-- Query 1: INNER JOIN Before Indexing
-- id | select_type | table | type | possible_keys | key  | key_len | ref  | rows | Extra
-- ...
-- description
-- Query 2: Correlated Subquery Before Indexing
-- id | select_type | table | type | possible_keys | key  | key_len | ref  | rows | Extra
-- ...
