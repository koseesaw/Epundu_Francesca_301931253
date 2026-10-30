RetailConnect Nigeria – Advanced Database Systems Portfolio

Project Overview

This project demonstrates the design and implementation of a database system for RetailConnect Nigeria, a simulated retail distribution business that supplies products to retail shops across different cities in Nigeria. The portfolio covers database design, query processing and optimisation, transaction management, document-oriented data modelling, and distributed and cloud database concepts.

Case Study

RetailConnect Nigeria requires a database system to manage customer information, product records, orders, order items, and stock information. The project uses PostgreSQL to demonstrate relational database design and implementation, SQL queries, indexing, transaction management, and JSONB document storage.

Portfolio Contents

Portfolio 1: Database Design and Modelling

Relational database schema
SQL table creation scripts
Primary keys and foreign-key relationships
Database design documentation
Portfolio 2: Query Processing and Optimisation

Sample data (sample_data.sql)
SQL queries
Query execution plans
Index creation and testing
Performance analysis
Portfolio 3: Transactions and Concurrency

Transaction examples
COMMIT and ROLLBACK
Transaction isolation
Row locking and concurrency control
Portfolio 4: NoSQL and Advanced Data Models

Document-oriented data modelling using PostgreSQL JSONB
JSON document insertion and retrieval
JSON field filtering and updating
Suitability and limitations analysis
Portfolio 5: Distributed and Cloud Databases

Proposed distributed PostgreSQL architecture
Replication concepts and configuration evidence
Sharding and partitioning discussion
Availability, consistency, and cloud deployment considerations
Technologies Used

PostgreSQL
SQL
PostgreSQL JSONB
Linux terminal
Git and GitHub
How to Run

Requires PostgreSQL on Linux.

If the database has not already been created, run:

sudo -u postgres psql -c "CREATE DATABASE retailconnect;"

Run Portfolio 1 first, because later portfolios use its tables.

Portfolio Run Evidence 1 sudo -u postgres psql -d retailconnect -f portfolio-1-database-design/retailconnect.sql Table listings using \dt and table structures using \d 2 Run sample_data.sql, then queries.sql from the Portfolio 2 folder Query results and before-and-after EXPLAIN plans 3 Run transactions_concurrency.sql from the Portfolio 3 folder. Isolation and locking tests require two terminals, as explained in the SQL file comments. Transaction and concurrency screenshots 4 sudo -u postgres psql -d retailconnect -f portfolio-4-nosql/retailconnect_jsonb.sql jsonb-output.txt and execution screenshot 5 Review the distributed database discussion and inspect PostgreSQL replication settings. replication-settings.txt

Each portfolio folder contains its corresponding SQL scripts, explanation documents, and available evidence files.

Implementation Notes

The relational database and SQL exercises were implemented using PostgreSQL.

Portfolio 4 demonstrates document-oriented storage through PostgreSQL JSONB.

Portfolio 5 presents a proposed distributed database architecture. The replication settings were inspected, but a separate standby server was not configured or tested.

AI Use Declaration

ChatGPT (OpenAI) was used as an AI learning and support tool during this project. It assisted with understanding database concepts, planning the portfolio sections, drafting and reviewing SQL examples, explaining errors, and improving the project documentation. The SQL scripts were executed in the PostgreSQL environment, and their outputs were reviewed to check the implementation. Transaction behaviour, query results, JSONB operations, and replication settings were examined during the practical exercise. The final project was reviewed and adjusted based on the actual implementation results. AI-generated suggestions were treated as learning assistance and were not assumed to be correct without checking them.

Conclusion

This project demonstrates practical database design, SQL implementation, query optimisation, transaction management, document-oriented data modelling, and distributed database concepts using the RetailConnect Nigeria case study.

GITHUB PROFILE My Github Profile, containing my project work and technical learning activities, is available at:

https://github.com/koseesaw/Epundu_Francesca_301931253
