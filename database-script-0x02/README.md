# Database Seeding (DML)

## Objective
This directory contains the SQL scripts for Task 3 of the ALX Airbnb Database project: seeding the database with sample data using Data Manipulation Language (DML). The scripts populate the database with realistic data to simulate an Airbnb-like application, as per the provided specification.

## Files
- **seed.sql**: Contains SQL `INSERT` statements to populate the User, Property, Booking, Payment, Review, and Message tables.
- **README.md**: This file, documenting the seeding process.

## Seeding Details
The `seed.sql` script populates the database with sample data reflecting real-world usage:
- **User**: 5 users (2 hosts, 2 guests, 1 admin) with unique emails, realistic names, and roles.
- **Property**: 4 properties owned by the 2 hosts, with varied locations (e.g., Nairobi, Lagos), prices, and descriptions.
- **Booking**: 5 bookings by guests for properties, with realistic dates, prices, and statuses (confirmed, pending, canceled).
- **Payment**: 6 payments for bookings, including multiple payments for some bookings, using different payment methods.
- **Review**: 3 reviews by guests for properties, with ratings (1–5) and comments.
- **Message**: 3 messages between users (e.g., guest to host about availability).


## Extra Info

- **Data Volume**: Includes sufficient records (5 users, 4 properties, 5 bookings, 6 payments, 3 reviews, 3 messages) to demonstrate functionality without overwhelming the database.

- **MySQL Compatibility**: Written in MySQL syntax, compatible with the schema.

