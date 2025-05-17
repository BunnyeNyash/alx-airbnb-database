# Advanced SQL: Complex Queries, Indexing, and Optimization

## Overview
This directory contains an implementation of the Unleashing Advanced Querying Power project, part of the ALX Airbnb Database Module. It's goal is to master complex queries, optimize performance, and apply indexing and partitioning to ensure scalability and efficiency. 

## Folder Structure
The repository is organized into the following directory and files:

```
alx-airbnb-database/
│
├── database-adv-script/
│   ├── joins_queries.sql                     # SQL for complex join queries (Task 0)
│   ├── subqueries.sql                        # SQL for subqueries (Task 1)
│   ├── aggregations_and_window_functions.sql # SQL for aggregations and window functions (Task 2)
│   ├── database_index.sql                    # SQL for creating indexes (Task 3)
│   ├── performance.sql                       # SQL for complex query optimization (Task 4)
│   ├── partitioning.sql                      # SQL for table partitioning (Task 5)
│   ├── index_performance.md                  # Indexing performance analysis (Task 3)
│   ├── optimization_report.md                # Query optimization report (Task 4)
│   ├── partition_performance.md              # Partitioning performance report (Task 5)
│   └── performance_monitoring.md             # Performance monitoring report (Task 6)
│
└── README.md                                 # Main project overview
```

## Tasks
The project is divided into the following tasks:
1. **Write Complex Queries with Joins** (Task 0):
   - **Objective**: Master SQL joins by writing queries with INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.
   - **Description**:
     - Write a query using an `INNER JOIN` to retrieve all bookings and the respective users who made those bookings.
     - Write a query using a `LEFT JOIN` to retrieve all properties and their reviews, including properties that have no reviews.
     - Write a query using a `FULL OUTER JOIN` to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
   - **Output**: `joins_queries.sql`, `README.md` in the `database-adv-script/` directory.

2. **Practice Subqueries** (Task 1):
   - **Objective**: Write correlated and non-correlated subqueries for advanced data analysis.
   - **Description**:
     - Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
     - Write a correlated subquery to find users who have made more than 3 bookings.
   - **Output**: `subqueries.sql`, `README.md` in the `database-adv-script/` directory.

3. **Apply Aggregations and Window Functions** (Task 2):
   - **Objective**: Use aggregation functions and window functions to analyze data.
   - **Description**:
     - Write a query to find the total number of bookings made by each user, using the `COUNT` function and `GROUP BY` clause.
     - Use a window function (`ROW_NUMBER, RANK`) to rank properties based on the total number of bookings they have received.
   - **Output**: `aggregations_and_window_functions.sql`, `README.md` in the `database-adv-script/` directory.

4. **Implement Indexes for Optimization** (Task 3):
   - **Objective**: Create indexes to improve query performance.
   - **Description**:
     - Identify high-usage columns in your `User, Booking`, and `Property` tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).
     - Write SQL `CREATE INDEX` commands to create appropriate indexes for those columns and save them on `database_index.sql`
     - Measure the query performance before and after adding indexes using `EXPLAIN` or `ANALYZE`.
   - **Output**: `database_index.sql`, `index_performance.md` in the `database-adv-script/` directory.

5. **Optimize Complex Queries** (Task 4):
   - **Objective**: Refactor complex queries to reduce execution time.
   - **Description**:
     - Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on `perfomance.sql`
     - Analyze the query’s performance using `EXPLAIN` and identify any inefficiencies.
     - Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.
   - **Output**: `performance.sql`, `optimization_report.md` in the `database-adv-script/` directory.

6. **Partitioning Large Tables** (Task 5):
   - **Objective**: Implement table partitioning to optimize large datasets.
   - **Description**:
     - Assume the `Booking` table is large and query performance is slow. Implement partitioning on the `Booking` table based on the `start_date` column. Save the query in a file `partitioning.sql`
     - Test the performance of queries on the partitioned table (e.g., fetching bookings by date range).
     - Write a brief report on the improvements you observed.
   - **Output**: `partitioning.sql`, `partition_performance.md` in the `database-adv-script/` directory.

7. **Monitor and Refine Database Performance** (Task 6):
   - **Objective**: Monitor query performance and refine schemas.
   - **Description**:
     - Use SQL commands like SHOW PROFILE or EXPLAIN ANALYZE to monitor the performance of a few of your frequently used queries.
     - Identify any bottlenecks and suggest changes (e.g., new indexes, schema adjustments).
     - Implement the changes and report the improvements.
   - **Output**: `performance_monitoring.md` in the `database-adv-script/` directory.
  
## Acknowledgments
This project is part of the ALX Software Engineering program, designed to provide hands-on experience with real-world database challenges.
