# ERD Requirements

## Objective
This document outlines the requirements and implementation details for Task 0 of the ALX Airbnb Database project: creating an Entity-Relationship Diagram (ERD) to visualize the database design for an Airbnb-like application.

## Database Specification Summary
The database consists of six entities with their attributes and relationships, as outlined below. The ERD reflects these entities, their attributes, primary and foreign keys, and the relationships between them.

### Entities and Attributes
1. **User**
   - `user_id`: Primary Key, UUID, Indexed
   - `first_name`: VARCHAR, NOT NULL
   - `last_name`: VARCHAR, NOT NULL
   - `email`: VARCHAR, UNIQUE, NOT NULL
   - `password_hash`: VARCHAR, NOT NULL
   - `phone_number`: VARCHAR, NULL
   - `role`: ENUM (guest, host, admin), NOT NULL
   - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

2. **Property**
   - `property_id`: Primary Key, UUID, Indexed
   - `host_id`: Foreign Key, references User(user_id)
   - `name`: VARCHAR, NOT NULL
   - `description`: TEXT, NOT NULL
   - `location`: VARCHAR, NOT NULL
   - `pricepernight`: DECIMAL, NOT NULL
   - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
   - `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

3. **Booking**
   - `booking_id`: Primary Key, UUID, Indexed
   - `property_id`: Foreign Key, references Property(property_id)
   - `user_id`: Foreign Key, references User(user_id)
   - `start_date`: DATE, NOT NULL
   - `end_date`: DATE, NOT NULL
   - `total_price`: DECIMAL, NOT NULL
   - `status`: ENUM (pending, confirmed, canceled), NOT NULL
   - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

4. **Payment**
   - `payment_id`: Primary Key, UUID, Indexed
   - `booking_id`: Foreign Key, references Booking(booking_id)
   - `amount`: DECIMAL, NOT NULL
   - `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
   - `payment_method`: ENUM (credit_card, paypal, stripe), NOT NULL

5. **Review**
   - `review_id`: Primary Key, UUID, Indexed
   - `property_id`: Foreign Key, references Property(property_id)
   - `user_id`: Foreign Key, references User(user_id)
   - `rating`: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
   - `comment`: TEXT, NOT NULL
   - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

6. **Message**
   - `message_id`: Primary Key, UUID, Indexed
   - `sender_id`: Foreign Key, references User(user_id)
   - `recipient_id`: Foreign Key, references User(user_id)
   - `message_body`: TEXT, NOT NULL
   - `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Relationships
All relationships in the database are **one-to-many (1:N)**, as determined by the foreign key constraints. No one-to-one or many-to-many relationships are present in the specification. The relationships are:
1. **User to Property**: One User (host) can own many Properties (via `host_id`).
2. **User to Booking**: One User (guest) can make many Bookings (via `user_id`).
3. **Property to Booking**: One Property can have many Bookings (via `property_id`).
4. **Booking to Payment**: One Booking can have many Payments (via `booking_id`).
5. **User to Review**: One User can write many Reviews (via `user_id`).
6. **Property to Review**: One Property can have many Reviews (via `property_id`).
7. **User to Message (Sender)**: One User can send many Messages (via `sender_id`).
8. **User to Message (Recipient)**: One User can receive many Messages (via `recipient_id`).


## ERD Implementation
The ERD was created using **Draw.io**, following industry best practices for clarity and precision.

### Notation
- **Crow's Foot Notation**: Used to represent relationships and cardinality.
  - **One**: one mandatory to many mandatory (e.g., User side of User to Property).
  - **Many**: Crow’s foot (e.g., Property side of User to Property).
- Relationships are labeled with verbs for clarity (e.g., “owns,” “makes,” “sends”).
- Primary keys are indicated in each entity.
- Foreign keys are indicated in the child entities (e.g., `host_id` in Property).

