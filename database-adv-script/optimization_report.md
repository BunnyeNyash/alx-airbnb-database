# Task 4: Query Optimization Report

## Overview
This report summarizes the performance analysis and refactoring of a complex query for Task 4 of the ALX Airbnb Database Module. The initial query retrieved all bookings with user, property, and payment details. It's performance was analyzed using EXPLAIN, inefficiencies identified, and it was refactored to reduce execution time.


## Initial Query Performance
- Scanned ~5 rows in `Booking`.
- `Using filesort` for `ORDER BY start_date` due to non-covering index.
- Joins on `User`, `Property`, `Payment` are functional but not optimized for full query.

## Actions Taken for Optimization
- Added composite index `idx_booking_opt` on `Booking(start_date, user_id, property_id)`.
- Created index `idx_payment_booking_id` on `Payment(booking_id)` for join efficiency.
- Used `FORCE INDEX` to ensure optimal index usage.

## Performance after Optimization
- Eliminated `Using filesort` with `idx_booking_opt`.
- More efficient join planning due to composite indexing.
- Query execution remains around ~5 rows, but with faster access paths and reduced sorting overhead.
