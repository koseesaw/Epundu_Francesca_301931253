# Portfolio 4: NoSQL and Advanced Data Models

## 1. Introduction

This exercise demonstrates a document-oriented data model for RetailConnect Nigeria using PostgreSQL JSONB. The model stores customer information and related order details in a structured JSON document.

The aim is to demonstrate how flexible, nested data can be stored, retrieved, filtered, and updated.

## 2. Document Structure

The `retailconnect_documents` table contains a JSONB column named `document_data`. Each document stores customer information, including the customer's ID, full name, email address, city, and embedded order details.

The embedded order information includes the order ID, status, products, quantities, unit prices, and total cost.

This structure allows related customer and order information to be stored together in one document.

## 3. Implementation and Queries

The implementation demonstrates how to:

- Create a table for storing JSON documents using PostgreSQL JSONB.
- Insert a customer document containing nested order information.
- Retrieve a complete customer document.
- Extract individual fields such as customer name and city.
- Filter customers by city.
- Retrieve information from embedded order arrays.
- Update a value within a JSON document using the `jsonb_set()` function.

**Implementation evidence:** `jsonb-output.txt` shows the script running, with the city changing from Lagos to Enugu after the update. Screenshot: `p4-jsonb-output.png`.

## 4. Suitability for RetailConnect Nigeria

A document-oriented structure is useful when customer records contain related information that may vary between customers. For example, customers may have different numbers of orders and different products within each order.

JSONB provides flexibility when storing this type of nested information. It also supports querying individual fields without requiring every attribute to be stored in a separate relational column.

For RetailConnect Nigeria, this approach can be useful for customer profiles, order histories, and other information with flexible structures.

## 5. Limitations

This exercise uses PostgreSQL JSONB rather than a separate NoSQL database. PostgreSQL remains a relational database management system, but JSONB provides document-storage capabilities.

Unlike the relational tables in Portfolio 1, the JSON document has no foreign keys or CHECK constraints. Product names and prices are copied into each order, so a change to a product is not updated automatically. For this reason, payments and stock updates stay in the relational tables, as in Portfolio 3.

MongoDB would be considered if the system grew and needed to scale across many servers.

## 6. Design Choice

I chose PostgreSQL JSONB because I could demonstrate document-oriented data modelling within my existing PostgreSQL environment without needing a separate database installation.

I initially considered using MongoDB, but it was not successfully installed in my environment. PostgreSQL JSONB provided a practical way to complete the document-modelling exercise while demonstrating how JSON documents are stored and queried.

## 7. Personal Reflection

This exercise helped me understand how document-oriented data modelling differs from traditional relational database modelling.

I found it challenging to understand how nested JSON data is stored and how individual values can be retrieved and updated. I learned how PostgreSQL JSONB supports flexible document storage and how functions such as `jsonb_set()` can modify document values.

I would like to understand more about how dedicated NoSQL databases such as MongoDB handle document storage and scaling across multiple servers.

## 8. Conclusion

The exercise demonstrates how RetailConnect Nigeria can store and retrieve flexible, nested customer and order information using PostgreSQL JSONB.

It also highlights the benefits and limitations of document-oriented data modelling and shows why relational tables may remain more suitable for data that requires strong relationships and integrity constraints.
