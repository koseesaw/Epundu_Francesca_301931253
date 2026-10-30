-- RetailConnect Nigeria
-- Portfolio 3: Transactions and Concurrency

-- Create a dedicated inventory demonstration table.
CREATE TABLE IF NOT EXISTS portfolio3_inventory_demo (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    stock_quantity INTEGER NOT NULL CHECK (stock_quantity >= 0)
);

-- Reset demo inventory to four bags.
INSERT INTO portfolio3_inventory_demo
    (product_id, product_name, stock_quantity)
VALUES
    (1, 'RetailConnect Demo Rice', 4)
ON CONFLICT (product_id)
DO UPDATE SET
    product_name = EXCLUDED.product_name,
    stock_quantity = EXCLUDED.stock_quantity;

-- Example 1: COMMIT a successful transaction.
BEGIN;

UPDATE portfolio3_inventory_demo
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1 AND stock_quantity > 0;

COMMIT;

SELECT * FROM portfolio3_inventory_demo WHERE product_id = 1;
-- Expected stock: 3.

-- Example 2: ROLLBACK an uncommitted transaction.
BEGIN;

UPDATE portfolio3_inventory_demo
SET stock_quantity = stock_quantity - 2
WHERE product_id = 1;

ROLLBACK;

SELECT * FROM portfolio3_inventory_demo WHERE product_id = 1;
-- Expected stock remains 3.

-- Example 3: Transaction isolation.
-- Run Session A first, then Session B as described in the report.
-- Session A:
-- BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SELECT stock_quantity FROM portfolio3_inventory_demo WHERE product_id = 1;
--
-- Session B:
-- UPDATE portfolio3_inventory_demo SET stock_quantity = 2 WHERE product_id = 1;
--
-- Session A (run before committing Session A):
-- SELECT stock_quantity FROM portfolio3_inventory_demo WHERE product_id = 1;
-- The second read in Session A should show the same snapshot value.
-- Session A:
-- COMMIT;

-- Example 4: Concurrency control using row-level locking.
-- First reset the demo stock to four before this test:
-- UPDATE portfolio3_inventory_demo SET stock_quantity = 4 WHERE product_id = 1;
--
-- Session A:
-- BEGIN;
-- SELECT * FROM portfolio3_inventory_demo WHERE product_id = 1 FOR UPDATE;
-- UPDATE portfolio3_inventory_demo
-- SET stock_quantity = stock_quantity - 3
-- WHERE product_id = 1 AND stock_quantity >= 3;
--
-- Session B (while Session A is still open):
-- BEGIN;
-- UPDATE portfolio3_inventory_demo
-- SET stock_quantity = stock_quantity - 3
-- WHERE product_id = 1 AND stock_quantity >= 3;
--
-- Session A:
-- COMMIT;
--
-- Session B should finish with UPDATE 0 because only one bag remains.
-- Session B:
-- COMMIT;

-- Final verification after completing the concurrency test.
SELECT * FROM portfolio3_inventory_demo WHERE product_id = 1;
