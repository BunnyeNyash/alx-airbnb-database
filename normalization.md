# Database Normalization

## Objective
This document outlines the normalization process for Task 1 of the ALX Airbnb Database project. The goal is to ensure the database schema is in the **Third Normal Form (3NF)** by reviewing the schema for redundancies or violations of normalization principles and making adjustments if necessary. The analysis confirms that the provided schema is already in 3NF, with no modifications required.

## Normalization Principles
Normalization organizes a database to eliminate redundancy and ensure data integrity. The schema must satisfy:
- **First Normal Form (1NF)**:
  - Attributes are atomic (no repeating groups or multi-valued attributes).
  - Each table has a primary key.
- **Second Normal Form (2NF)**:
  - Must be in 1NF.
  - All non-key attributes depend on the entire primary key (no partial dependencies).
- **Third Normal Form (3NF)**:
  - Must be in 2NF.
  - No transitive dependencies (non-key attributes depend only on the primary key, not other non-key attributes).

## Schema Analysis
The database consists of six tables: **User**, **Property**, **Booking**, **Payment**, **Review**, and **Message**.

The following constraints exist in the table:
- **User**: Unique constraint on `email`.
- **Property**: Foreign key constraint on `host_id`.
- **Booking**: Foreign key constraints on `property_id` and `user_id`; `status` restricted to ENUM values.
- **Payment**: Foreign key constraint on `booking_id`.
- **Review**: Foreign key constraints on `property_id` and `user_id`; `rating` restricted to 1–5.
- **Message**: Foreign key constraints on `sender_id` and `recipient_id`.

Each table is analyzed below to confirm compliance with 1NF, 2NF, and 3NF.

### 1. User Table
- **Attributes**: `user_id` (PK, UUID), `first_name` (VARCHAR, NOT NULL), `last_name` (VARCHAR, NOT NULL), `email` (VARCHAR, UNIQUE, NOT NULL), `password_hash` (VARCHAR, NOT NULL), `phone_number` (VARCHAR, NULL), `role` (ENUM: guest, host, admin, NOT NULL), `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- **1NF**:
  - All attributes are atomic (e.g., `email` is a single value, not a list).
  - Primary key: `user_id`.
  - No repeating groups.
  - **Satisfies 1NF**.
- **2NF**:
  - Primary key is `user_id` (single attribute).
  - All non-key attributes (`first_name`, `last_name`, `email`, etc.) depend on `user_id`.
  - No partial dependencies, as the key is not composite.
  - **Satisfies 2NF**.
- **3NF**:
  - No transitive dependencies: `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at` depend directly on `user_id`, not on each other.
  - The `UNIQUE` constraint on `email` is a design choice, not a normalization issue.
  - **Satisfies 3NF**.
- **Conclusion**: The User table is in 3NF.

### 2. Property Table
- **Attributes**: `property_id` (PK, UUID), `host_id` (FK, references User(user_id)), `name` (VARCHAR, NOT NULL), `description` (TEXT, NOT NULL), `location` (VARCHAR, NOT NULL), `pricepernight` (DECIMAL, NOT NULL), `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP), `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)
- **1NF**:
  - Attributes are atomic (e.g., `location` is a single VARCHAR).
  - Primary key: `property_id`.
  - No repeating groups.
  - **Satisfies 1NF**.
- **2NF**:
  - Primary key is `property_id` (single attribute).
  - All non-key attributes depend on `property_id`.
  - No partial dependencies.
  - **Satisfies 2NF**.
- **3NF**:
  - No transitive dependencies: `host_id`, `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at` depend on `property_id`.
  - `host_id` is a foreign key, not a transitive dependency.
  - **Satisfies 3NF**.
- **Conclusion**: The Property table is in 3NF.

### 3. Booking Table
- **Attributes**: `booking_id` (PK, UUID), `property_id` (FK, references Property(property_id)), `user_id` (FK, references User(user_id)), `start_date` (DATE, NOT NULL), `end_date` (DATE, NOT NULL), `total_price` (DECIMAL, NOT NULL), `status` (ENUM: pending, confirmed, canceled, NOT NULL), `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- **1NF**:
  - Attributes are atomic.
  - Primary key: `booking_id`.
  - No repeating groups.
  - **Satisfies 1NF**.
- **2NF**:
  - Primary key is `booking_id` (single attribute).
  - All non-key attributes depend on `booking_id`.
  - No partial dependencies.
  - **Satisfies 2NF**.
- **3NF**:
  - No transitive dependencies: `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at` depend on `booking_id`.
  - Note: `total_price` could theoretically be derived from `start_date`, `end_date`, and `pricepernight` (from Property). However, the specification treats `total_price` as a stored attribute, not a calculated one, so it depends on `booking_id` and is not a transitive dependency.
  - **Satisfies 3NF**.
- **Conclusion**: The Booking table is in 3NF.

### 4. Payment Table
- **Attributes**: `payment_id` (PK, UUID), `booking_id` (FK, references Booking(booking_id)), `amount` (DECIMAL, NOT NULL), `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP), `payment_method` (ENUM: credit_card, paypal, stripe, NOT NULL)
- **1NF**:
  - Attributes are atomic.
  - Primary key: `payment_id`.
  - No repeating groups.
  - **Satisfies 1NF**.
- **2NF**:
  - Primary key is `payment_id` (single attribute).
  - All non-key attributes depend on `payment_id`.
  - No partial dependencies.
  - **Satisfies 2NF**.
- **3NF**:
  - No transitive dependencies: `booking_id`, `amount`, `payment_date`, `payment_method` depend on `payment_id`.
  - **Satisfies 3NF**.
- **Conclusion**: The Payment table is in 3NF.

### 5. Review Table
- **Attributes**: `review_id` (PK, UUID), `property_id` (FK, references Property(property_id)), `user_id` (FK, references User(user_id)), `rating` (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL), `comment` (TEXT, NOT NULL), `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- **1NF**:
  - Attributes are atomic.
  - Primary key: `review_id`.
  - No repeating groups.
  - **Satisfies 1NF**.
- **2NF**:
  - Primary key is `review_id` (single attribute).
  - All non-key attributes depend on `review_id`.
  - No partial dependencies.
  - **Satisfies 2NF**.
- **3NF**:
  - No transitive dependencies: `property_id`, `user_id`, `rating`, `comment`, `created_at` depend on `review_id`.
  - **Satisfies 3NF**.
- **Conclusion**: The Review table is in 3NF.

### 6. Message Table
- **Attributes**: `message_id` (PK, UUID), `sender_id` (FK, references User(user_id)), `recipient_id` (FK, references User(user_id)), `message_body` (TEXT, NOT NULL), `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- **1NF**:
  - Attributes are atomic.
  - Primary key: `message_id`.
  - No repeating groups.
  - **Satisfies 1NF**.
- **2NF**:
  - Primary key is `message_id` (single attribute).
  - All non-key attributes depend on `message_id`.
  - No partial dependencies.
  - **Satisfies 2NF**.
- **3NF**:
  - No transitive dependencies: `sender_id`, `recipient_id`, `message_body`, `sent_at` depend on `message_id`.
  - **Satisfies 3NF**.
- **Conclusion**: The Message table is in 3NF.

## Redundancies and Violations
- **Redundancies**: No attributes are unnecessarily duplicated across tables. User details (e.g., `email`) are stored only in User, Property details (e.g., `pricepernight`) only in Property, etc. Foreign keys (`host_id`, `property_id`) link tables without redundant data storage.
- **Violations**:
  - No multi-valued attributes or repeating groups (1NF).
  - No partial dependencies, as all primary keys are single attributes (2NF).
  - No transitive dependencies, as non-key attributes depend on their primary keys (3NF).
- **Potential concerns**:
  - **Booking.total_price**: Treated as a stored attribute per the specification, not derived, so it does not introduce a transitive dependency.
  - **Property.location**: Stored as a single VARCHAR, which is atomic. Splitting into `city`, `state`, etc., is not required by the specification.

## Adjustments
The schema is **already in 3NF**, with no redundancies or normalization violations. All tables satisfy 1NF, 2NF, and 3NF, and the use of primary keys, foreign keys, and constraints ensures data integrity and efficiency. No adjustments to the schema are necessary.

## Conclusion
The database schema for the Airbnb-like application is fully normalized to 3NF. Each table was analyzed for compliance with 1NF, 2NF, and 3NF, and no violations were found. The design avoids redundancies through proper use of foreign keys and ensures all non-key attributes depend directly on their primary keys.
