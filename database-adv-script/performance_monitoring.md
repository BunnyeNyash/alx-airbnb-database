# Task 6: Performance Monitoring Report

## Overview
This report covers Task 6 of the ALX Airbnb Database Module, focusing on checking and improving database speed. We tested three common queries with `EXPLAIN ANALYZE`, found slow parts, added new indexes, and made queries faster for a large `Booking` table.

## Initial Performance
- **Date-range bookings**: Fast due to partitioning, checked ~1000 rows in 2025.
- **User bookings**: Slow, checked many `Booking` rows for a user’s email.
- **Property payments**: Very slow, checked too many `Booking` rows for payments.

## Monitoring and Changes
- Used `EXPLAIN ANALYZE` to find slow queries.
- Added index on `User(email, user_id)` for faster user lookups.
- Added index on `Booking(property_id, booking_id)` for quicker payment joins.

## Post-Improvement Performance
- **Date-range bookings**: No change needed, already fast.
- **User bookings**: Much faster, checks fewer rows with new user index.
- **Property payments**: Faster, new booking index cuts row checks significantly.
