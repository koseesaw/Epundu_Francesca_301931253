RetailConnect Nigeria — Portfolio 3: Transactions and Concurrency

1. Introduction

This practical demonstrates how PostgreSQL handles transactions and concurrent database operations in the RetailConnect Nigeria case study.

The exercise focuses on inventory management, particularly how the database handles successful updates, cancelled operations, and simultaneous attempts by sales agents to update the same stock record.

A separate demonstration table named portfolio3_inventory_demo was created in the existing retailconnect database. This allowed the transaction and concurrency tests to be performed without changing the original customers, orders, order_items, or products tables.

2. Transaction Processing: COMMIT and ROLLBACK

Two transaction operations were demonstrated using the inventory demonstration table.

COMMIT: The initial stock quantity was four units. A transaction reduced the quantity by one, and COMMIT saved the change. The resulting stock quantity was three.

ROLLBACK: Another transaction attempted to reduce the stock by two units. ROLLBACK cancelled this operation, and the stock quantity remained at three.

These tests demonstrated how COMMIT permanently saves a transaction’s changes and ROLLBACK reverses uncommitted changes.

3. Transaction Isolation: REPEATABLE READ

The REPEATABLE READ isolation level was demonstrated using two separate PostgreSQL sessions.

The first session began a REPEATABLE READ transaction and retrieved a stock quantity of three. While that transaction remained open, the second session updated the stock quantity to two and committed the change.

The first session then queried the same record again and still returned three. This happened because REPEATABLE READ maintained a consistent snapshot for the first transaction.

After the first session committed, the second session showed the updated stock quantity of two.

This demonstrated how transaction isolation allows a transaction to work with a consistent view of data even when another session commits changes.

4. Concurrency Control: Row-Level Locking

A row-level locking test was performed to demonstrate how RetailConnect could prevent inventory overselling when multiple sales agents attempt to process orders simultaneously.

Before the test, the demonstration stock quantity was reset from two units to four units.

The first PostgreSQL session started a transaction and selected the inventory record using SELECT FOR UPDATE. This placed a lock on the selected row. The first session then attempted to reduce the stock by three units.

While the first transaction was still open, the second session attempted to reduce the same stock by three units. Its UPDATE statement remained waiting because the first session held the row lock.

After the first session committed, the second session continued. Its UPDATE affected zero rows because only one unit remained, which was insufficient for the requested sale of three units.

The second session then committed. The final stock quantity was one.

This demonstrated how PostgreSQL row-level locking and conditional updates can help prevent conflicting inventory operations and overselling.

5. Conclusion

The practical demonstrated important PostgreSQL transaction and concurrency features using a RetailConnect inventory scenario.

COMMIT saved successful changes, ROLLBACK cancelled an uncommitted operation, REPEATABLE READ maintained a consistent transaction snapshot, and row-level locking controlled simultaneous updates to the same inventory record.

These database mechanisms are important in a retail environment where multiple sales agents may process customer orders at the same time. They help maintain accurate stock information and reduce the risk of inconsistent inventory records.

6. Personal Reflection

This practical helped me understand transaction processing beyond simply writing SQL statements. At first, I found it difficult to understand why the second terminal remained waiting during the locking test. I later understood that the first transaction was holding a lock on the inventory record, preventing the second transaction from updating it until the lock was released. I also learned that transaction isolation and row-level locking solve different problems, and I would like to explore more complex concurrency scenarios in PostgreSQL.
