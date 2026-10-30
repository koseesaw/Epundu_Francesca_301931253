ADVANCED DATABASE SYSTEMS – FINAL PROJECT REPORT

Project: RetailConnect Nigeria Database Portfolio
Student: Francesca Epundu
Student ID: 301931253
Course: MIT 8103 – Advanced Database Systems

GitHub: https://github.com/koseesaw/Epundu_Francesca_301931253

1. Case Study and Project Objective
RetailConnect Nigeria is a simulated retail distribution business that supplies products to retail shops across different cities in Nigeria. Its database requirements include managing customer information, product records, stock quantities, orders, and individual order items. The main operations include recording customer orders, tracking inventory, monitoring sales, and identifying products that need restocking.
The aim of this project was to design and implement a database that could support these operations while maintaining accurate and organised records. I also considered how future improvements, such as user roles and access permissions, could help protect information by ensuring that staff only access what they need for their responsibilities.

2. Portfolio Implementation and Findings
Portfolio 1 – Database Design and Modelling
I created the RetailConnect PostgreSQL database with four related tables: customers, products, orders, and order_items. I established primary-key and foreign-key relationships to connect customer records, orders, and the products included in each order. This provided a structured way to record transactions and identify individual items within each order.
Portfolio 2 – Query Processing and Optimisation
I wrote SQL queries, examined execution plans, and created an index to explore query optimisation. One finding was that PostgreSQL continued to use a sequential scan before and after the index was created. The test table contained only ten rows, so a sequential scan was reasonable for that small dataset. This helped me understand that creating an index does not automatically mean PostgreSQL will use it.
Portfolio 3 – Transactions and Concurrency
I tested transaction operations using COMMIT and ROLLBACK, as well as transaction isolation and row locking. During the row-locking exercise, the second session had to wait while the first session held the lock. After the first session committed its update, the second session updated zero rows because the remaining stock no longer met the update condition. This demonstrated how transaction control and locking help maintain consistent inventory records.
Portfolio 4 – NoSQL and Advanced Data Models
I used PostgreSQL JSONB to demonstrate document-oriented data storage. I inserted a JSON document and practised retrieving, filtering, and updating information within it. For example, I updated the customer’s city from Lagos to Enugu and checked the result. This exercise introduced me to working with JSON data through SQL commands. A separate MongoDB deployment was not implemented.
Portfolio 5 – Distributed and Cloud Databases
I explored distributed database concepts, including replication, sharding, availability, and consistency. I inspected PostgreSQL’s replication settings using wal_level, max_wal_senders, and pg_stat_replication. The replication settings showed that PostgreSQL was configured with a replication-capable WAL level and sender allowance, but the replication status query returned zero rows. This confirmed that no standby server was connected. The distributed architecture was therefore presented as a proposed design rather than a completed multi-server deployment.

3. Reflection and Conclusion
This project gave me practical experience in creating and managing a PostgreSQL database. I found database design the easiest part, while query optimisation, transaction management, and especially JSONB operations required more effort.
One of my biggest learning experiences was seeing how the tables and SQL commands worked together when I executed them in PostgreSQL through Ubuntu. I moved from simply learning what database commands meant to understanding how they affected actual records.
I also learned that database design is not only about storing information. It involves maintaining data accuracy, managing transactions, considering performance, and planning for availability and security. The project has given me a stronger practical foundation, and there are still areas I intend to develop further.

4. References
 a. PostgreSQL Global Development Group. PostgreSQL Documentation. https://www.postgresql.org/docs/
 b. Miva Open University. MIT 8103 – Advanced Database Systems course materials.

5. Declaration of AI Use

ChatGPT (OpenAI) was used as a learning and support tool to explain database concepts, review SQL commands, troubleshoot errors, and assist with organising the documentation. The practical exercises were carried out in my PostgreSQL environment, and I reviewed the commands and their outputs during implementation. I remain responsible for the submitted work and its contents.
