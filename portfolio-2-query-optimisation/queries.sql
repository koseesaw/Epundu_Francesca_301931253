-- RetailConnect Nigeria
-- Portfolio 2: Query Processing and Optimisation

-- Query 1: Display all customers
SELECT * FROM customers;

-- Query 2: Find customers in Lagos
SELECT customer_id, full_name, email, city
FROM customers
WHERE city = 'Lagos';

-- Query 3: Find products with fewer than 100 units in stock
SELECT product_id, product_name, price, stock_quantity
FROM products
WHERE stock_quantity < 100
ORDER BY stock_quantity ASC;

-- Query 4: Display the most expensive products first
SELECT product_name, price
FROM products
ORDER BY price DESC;

-- Query 5: Show orders alongside customer names
SELECT o.order_id, c.full_name, o.order_date, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_id;

-- Query 6: Show each order's products, quantities and line totals
SELECT
    o.order_id,
    c.full_name,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS line_total
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id
ORDER BY o.order_id, p.product_name;

-- Query 7: Calculate the total value of each order
SELECT
    o.order_id,
    c.full_name,
    SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, c.full_name
ORDER BY order_total DESC;

-- Query 8: Count orders placed by each customer
SELECT
    c.full_name,
    COUNT(o.order_id) AS number_of_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY number_of_orders DESC, c.full_name;
