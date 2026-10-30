RetailConnect Nigeria: Database Design

1. About the Project

RetailConnect Nigeria is a simulated retail distribution company that supplies groceries and household goods to shops across Nigerian cities. The company needs a database to organise customer information, product details, and customer orders.

For this project, I created a PostgreSQL database with four tables: customers, products, orders, and order_items. The tables store customer details, product information, orders, and the products included in each order.

I separated the information into different tables so related records can be connected without storing everything in one large table.

2. Tables and Their Purpose

Table	Purpose
customers	Stores customer names, email addresses, and cities.
products	Stores product names, prices, and stock quantities.
orders	Stores order information, including the customer associated with an order.
order_items	Stores the products included in each order, their quantities, and their unit prices.

3. Primary Keys and Foreign Keys

Each table has a primary key that uniquely identifies its records:

* customers: customer_id
* products: product_id
* orders: order_id
* order_items: order_item_id

The foreign keys connect the tables:

* orders.customer_id references customers.customer_id.
* order_items.order_id references orders.order_id.
* order_items.product_id references products.product_id.

These relationships connect an order to the customer who placed it and connect each order item to its order and product. The foreign-key constraints prevent an order or order item from referencing a record that does not exist in the related table.

4. Constraints

The PostgreSQL schema includes several rules to help maintain valid data:

* Customer names and email addresses are required.
* Customer email addresses must be unique.
* Product prices cannot be negative.
* Product stock quantities cannot be negative.
* Order-item quantities must be greater than zero.
* Order-item unit prices cannot be negative.
* Primary keys uniquely identify records, while foreign keys maintain relationships between the tables.

These constraints help prevent invalid values and maintain consistency between related records.

5. Relationships Between Tables

One customer can place many orders, while each order is associated with one customer.

One order can contain many order items, while each order item belongs to one order.

One product can appear in many order items. The order_items table connects orders and products, allowing an order to contain several products without storing a list of products in one field.

6. Normalisation

I separated the data into four tables to reduce unnecessary repetition and make records easier to manage.

First Normal Form (1NF): Each field stores an individual value. Products in an order are recorded as separate rows in order_items instead of being stored as a list in one field.

Second Normal Form (2NF): Each table uses a single-column primary key. This avoids partial dependencies on part of a composite primary key.

Third Normal Form (3NF): Customer details are stored in customers, product details in products, and order information in orders. The other tables reference these records using IDs instead of repeatedly storing the same customer or product details.

The unit_price field in order_items is intentional. It records the price charged when an order item was created, so a later change to a product’s current price does not automatically change the historical order price.

7. Scope and Possible Improvements

The current database covers customers, products, orders, and order items. It does not include a separate payments table or sales-agents table. Payment tracking and sales-agent information could be added in the future if the system needs to manage those activities in more detail.
