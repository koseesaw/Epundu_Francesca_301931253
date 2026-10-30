-- RetailConnect Nigeria
-- Portfolio 2: Realistic sample data for query processing and optimisation
BEGIN;
-- 1. Customers: retail shops supplied by RetailConnect
INSERT INTO customers (full_name, email, city) VALUES
('Adaeze Supermarket', 'adaeze.supermarket@francesca.com', 'Lagos'),
('Bello Family Stores', 'bello.stores@francesca.com', 'Kano'),
('Chika Wholesale Mart', 'chika.wholesale@francesca.com', 'Enugu'),
('Damilola Convenience Store', 'damilola.store@francesca.com', 'Ibadan'),
('Emeka Daily Needs', 'emeka.dailyneeds@francesca.com', 'Port Harcourt'),
('Fatima General Merchants', 'fatima.merchants@francesca.com', 'Abuja'),
('Gracefield Mini Mart', 'gracefield.minimart@francesca.com', 'Benin City'),
('Hassan Trading Stores', 'hassan.trading@francesca.com', 'Kaduna');
-- 2. Products: grocery and household goods
INSERT INTO products (product_name, price, stock_quantity) VALUES
('Premium Rice 50kg', 78000.00, 120),
('Long Grain Rice 25kg', 41500.00, 85),
('Vegetable Oil 5L', 14500.00, 160),
('Tomato Paste Carton', 28500.00, 75),
('Detergent Powder 1kg', 2200.00, 300),
('Bathing Soap Carton', 18500.00, 95),
('Instant Noodles Carton', 12500.00, 210),
('Sugar 50kg', 92000.00, 40),
('Milk Powder Carton', 36500.00, 65),
('Bottled Water Pack', 3200.00, 250);
-- 3. Orders: one order for each selected customer
INSERT INTO orders (customer_id)
SELECT customer_id
FROM customers
WHERE email IN (
    'adaeze.supermarket@francesca.com',
    'bello.stores@francesca.com',
    'chika.wholesale@francesca.com',
    'damilola.store@francesca.com',
    'emeka.dailyneeds@francesca.com',
    'fatima.merchants@francesca.com'
);
-- 4. Order items: multiple products can belong to one order
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
SELECT o.order_id, p.product_id, v.quantity, p.price
FROM (
    VALUES
    ('adaeze.supermarket@francesca.com', 'Premium Rice 50kg', 5),
    ('adaeze.supermarket@francesca.com', 'Vegetable Oil 5L', 12),
    ('adaeze.supermarket@francesca.com', 'Detergent Powder 1kg', 30),
    ('bello.stores@francesca.com', 'Long Grain Rice 25kg', 8),
    ('bello.stores@francesca.com', 'Instant Noodles Carton', 15),
    ('chika.wholesale@francesca.com', 'Sugar 50kg', 3),
    ('chika.wholesale@francesca.com', 'Tomato Paste Carton', 10),
    ('damilola.store@francesca.com', 'Bathing Soap Carton', 6),
    ('damilola.store@francesca.com', 'Bottled Water Pack', 20),
    ('emeka.dailyneeds@francesca.com', 'Milk Powder Carton', 4),
    ('emeka.dailyneeds@francesca.com', 'Vegetable Oil 5L', 5),
    ('fatima.merchants@francesca.com', 'Premium Rice 50kg', 2),
    ('fatima.merchants@francesca.com', 'Instant Noodles Carton', 10)
) AS v(customer_email, product_name, quantity)
JOIN customers c ON c.email = v.customer_email
JOIN orders o ON o.customer_id = c.customer_id
JOIN products p ON p.product_name = v.product_name;
COMMIT;
