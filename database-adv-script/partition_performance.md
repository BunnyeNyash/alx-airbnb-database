# Task 5: Partitioning Performance Report

## Overview
This report explains how partitioning helped speed up queries for Task 5 of the ALX Airbnb Database Module. The `Booking` table, assumed to be large, was split by `start_date` to make date-range queries faster. `EXPLAIN` was used to check performance, found slow spots, and improved them with partitioning.

## Initial Performance
- The `Booking` table was large, so date-range queries were slow.
- Queries checked many rows (around 50,000), taking longer.

## Actions Taken for Partitioning
- Split the `Booking` table into parts by year (2023, 2024, 2025, future).
- Changed the table’s key to include `start_date`.
- Added indexes in `partition_test.sql` to keep queries fast.

## Performance after Partitioning
- Queries only check the 2025 part (around 1000 rows).
- Fewer rows make queries much faster.
- Works better for big tables with lots of bookings.
