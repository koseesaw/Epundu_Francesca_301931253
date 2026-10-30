-- RetailConnect Nigeria
-- Portfolio 4: Document-Oriented Data Model
-- PostgreSQL JSONB demonstration

-- Create a table for storing JSON documents.
CREATE TABLE IF NOT EXISTS retailconnect_documents (
    document_id INTEGER PRIMARY KEY,
    document_data JSONB NOT NULL
);

-- Insert a customer document with an embedded order.
INSERT INTO retailconnect_documents
(document_id, document_data)
VALUES
(1, '{
    "customer_id": 1,
    "full_name": "Adaeze Supermarket",
    "email": "adaeze.supermarket@example.com",
    "city": "Lagos",
    "orders": [
        {
            "order_id": 1,
            "status": "Paid",
            "items": [
                {
                    "product_name": "Premium Rice 50kg",
                    "quantity": 5,
                    "unit_price": 78000
                },
                {
                    "product_name": "Vegetable Oil 5L",
                    "quantity": 12,
                    "unit_price": 14500
                }
            ],
            "total": 564000
        }
    ]
}')
ON CONFLICT (document_id)
DO UPDATE SET document_data = EXCLUDED.document_data;

-- Query 1: Retrieve the complete customer document.
SELECT document_data
FROM retailconnect_documents
WHERE document_id = 1;

-- Query 2: Retrieve the customer's name and city.
SELECT
    document_data ->> 'full_name' AS customer_name,
    document_data ->> 'city' AS city
FROM retailconnect_documents;

-- Query 3: Find customers in Lagos.
SELECT document_data
FROM retailconnect_documents
WHERE document_data ->> 'city' = 'Lagos';

-- Query 4: Retrieve the embedded order status.
SELECT document_data -> 'orders' -> 0 ->> 'status' AS order_status
FROM retailconnect_documents;

-- Update: Change the customer's city.
UPDATE retailconnect_documents
SET document_data = jsonb_set(
    document_data,
    '{city}',
    '"Enugu"'
)
WHERE document_id = 1;

-- Verify the update.
SELECT document_data
FROM retailconnect_documents
WHERE document_id = 1;
