# alx-airbnb-database
## ALX Airbnb Database Project
### Overview
This repository contains the implementation of the ALX Airbnb Database Module, a comprehensive project focused on designing, normalizing, and implementing a relational database for an Airbnb-like application. The project simulates a production-level database system, emphasizing robust database design, normalization, schema creation, and data seeding to ensure scalability, efficiency, and real-world functionality.

### Project Structure
The repository is organized into the following directories and files:

```
  alx-airbnb-database/
│
├── ERD/
│   └── erd.png              # Diagram of the Entity-Relationship Diagram
│   └── requirements.md      # Details the requirements for the ERD task
│
├─ normalization.md        # Explains the normalization process to achieve the third normal form (3NF).
│
├── database-script-0x01/       # Database schema (DDL scripts)
│   ├── schema.sql              # SQL to create tables, constraints, indexes
│   └── README.md               # Documentation for schema structure and decisions
│
├── database-script-0x02/       # Data seeding (DML scripts)
│   ├── seed.sql                # SQL to insert sample data
│   └── README.md               # Explanation of sample data choices
│
└── README.md                   # Main project overview
```
 
### Tasks
The project is divided into the following tasks:

1. **Define Entities and Relationships in ER Diagram**:
   - Create an ER diagram visualizing entities (User, Property, Booking, Payment, Review, Message) and their relationships.
   - Tools: Draw.io or similar.
   - Output: ERD diagram and `requirements.md` in the `ERD/` directory.

2. **Normalize Your Database Design**:
   - Apply normalization principles to ensure the database is in 3NF.
   - Document the normalization steps in `normalization.md`.

3. **Design Database Schema (DDL)**:
   - Write SQL `CREATE TABLE` statements to define the schema, including primary keys, foreign keys, constraints, and indexes.
   - Output: `schema.sql` and `README.md` in the `database-script-0x01/` directory.

4. **Seed the Database with Sample Data**:
   - Write SQL `INSERT` statements to populate the database with realistic sample data.
   - Output: `seed.sql` and `README.md` in the `database-script-0x02/` directory.
### Acknowledgments
This project is part of the ALX Software Engineering program, designed to provide hands-on experience with real-world database challenges.
