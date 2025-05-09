# Database Schema (DDL)

## Objective
This directory contains the SQL scripts for Task 2 of the ALX Airbnb Database project: designing the database schema using Data Definition Language (DDL). The schema defines the structure for an Airbnb-like application, including tables, constraints, and indexes as per the provided specification.

## Files
- **schema.sql**: Contains SQL `CREATE TABLE` statements for the six entities (User, Property, Booking, Payment, Review, Message), along with primary keys, foreign keys, constraints, and indexes.
- **README.md**: This file, documenting the schema creation process.

## Schema Details
The schema is implemented in MySQL and includes the following entities:

1. **User**:
   - Primary Key: `user_id` (CHAR(32), UUID).
   - Constraints: `email` is UNIQUE and NOT NULL; `first_name`, `last_name`, `password_hash`, `role` are NOT NULL.
   - Index: On `email` for performance.
2. **Property**:
   - Primary Key: `property_id` (CHAR(32), UUID).
   - Foreign Key: `host_id` references `User(user_id)`, NOT NULL.
   - Constraints: `name`, `description`, `location`, `pricepernight` are NOT NULL.
3. **Booking**:
   - Primary Key: `booking_id` (CHAR(32), UUID).
   - Foreign Keys: `property_id` references `Property(property_id)`, `user_id` references `User(user_id)`, both NOT NULL.
   - Constraints: `start_date`, `end_date`, `total_price`, `status` are NOT NULL.
   - Index: On `property_id`.
4. **Payment**:
   - Primary Key: `payment_id` (CHAR(32), UUID).
   - Foreign Key: `booking_id` references `Booking(booking_id)`, NOT NULL.
   - Constraints: `amount`, `payment_method` are NOT NULL.
   - Index: On `booking_id`.
5. **Review**:
   - Primary Key: `review_id` (CHAR(32), UUID).
   - Foreign Keys: `property_id` references `Property(property_id)`, `user_id` references `User(user_id)`, both NOT NULL.
   - Constraints: `rating` (1–5), `comment` are NOT NULL.
6. **Message**:
   - Primary Key: `message_id` (CHAR(32), UUID).
   - Foreign Keys: `sender_id`, `recipient_id` reference `User(user_id)`, both NOT NULL.
   - Constraints: `message_body` is NOT NULL.

## Implementation Notes
- **Data Types**:
   - UUIDs are stored as `CHAR(32)` to accommodate UUID format, having gotten rid of the 4 hyphens (e.g., `123e4567e89b12d3a456426614174000`), hence (36 - 4 = 32).
   - `DECIMAL(10,2)` is used for monetary fields (`pricepernight`, `total_price`, `amount`).
- **Constraints**:
  - All foreign keys are `NOT NULL` to ensure data integrity (e.g., a Booking must have a User and Property).
- **Indexes**:
  - Added as specified: `email` (User), `property_id` (Booking), `booking_id` (Payment).
  - Primary keys are automatically indexed.
- **Normalization**:
  - The schema is in 3NF, as confirmed in Task 1 (see `normalization.md`).
- **Table Order**:
  - Tables are created in dependency order (User → Property → Booking → Payment, etc.) to satisfy foreign key constraints.

