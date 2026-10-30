RetailConnect Nigeria — Query Performance Analysis

1. Objective

The purpose of this exercise was to examine how PostgreSQL processes queries and investigate whether indexing could improve query performance.

2. Query tested

SELECT *
FROM products
WHERE stock_quantity < 100;

This query retrieves products whose available stock is below 100 units.

3. Execution plan findings

The EXPLAIN output showed a sequential scan on the products table both before and after creating an index on stock_quantity.

A sequential scan means PostgreSQL checks the table’s rows to identify those matching the condition. The products table contains only 10 sample records, so scanning the table is inexpensive.

4. Indexing and optimisation

The following index was created:

CREATE INDEX IF NOT EXISTS idx_products_stock_quantity
ON products(stock_quantity);

The index provides PostgreSQL with another way to locate products based on their stock quantity. However, creating an index does not guarantee that PostgreSQL will use it for every query.

In this test, PostgreSQL continued to choose a sequential scan. This is reasonable for a small table because using an index may cost more than scanning the available rows.

5. Conclusion

The exercise demonstrated how to inspect query execution plans and create an index in PostgreSQL. The results show that query optimisation depends on factors such as table size, data distribution, and the estimated cost of each execution strategy.

A larger dataset and actual execution-time measurements would be needed to evaluate the index’s performance benefits more thoroughly.
