-- E-Commerce Inventory & Order Processing Database
-- Brainware University | DBMS (BTD50113)
-- Script 07 (optional): validation tests T11 to T15
-- Run these AFTER script 06. Every statement below is EXPECTED TO FAIL; a failed
-- statement changes nothing in the tables. Run them one at a time.

-- T11  negative price -> CHECK constraint on price (expected ORA-02290)
INSERT INTO products VALUES (21, 'Test Item', 'Test', -100, 10, 1);

-- T12  duplicate email -> UNIQUE constraint (expected ORA-00001)
INSERT INTO customers VALUES (21, 'Test User', 'rahul@mail.com', 'Kolkata');

-- T13  customer 99 does not exist -> FOREIGN KEY (expected ORA-02291)
INSERT INTO orders VALUES (21, 99, SYSDATE, 'Pending');

-- T14  quantity zero -> CHECK constraint on quantity (expected ORA-02290)
INSERT INTO order_items VALUES (27, 20, 1, 0);

-- T15  10 pieces of product 19 (only 6 in stock) -> trigger + CHECK on stock_qty (expected ORA-02290)
INSERT INTO order_items VALUES (28, 20, 19, 10);
SELECT product_id, product_name, stock_qty FROM products WHERE product_id = 19;   -- still 6
