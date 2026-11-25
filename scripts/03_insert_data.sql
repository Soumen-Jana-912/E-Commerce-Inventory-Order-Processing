-- E-Commerce Inventory & Order Processing Database
-- Brainware University | DBMS (BTD50113)
-- Script 03: insert the sample data (parent tables first)
-- Run this BEFORE creating the trigger (script 06), so the stock figures start as listed.

INSERT ALL
  INTO suppliers VALUES (1, 'TechWorld Distributors', 'Bengaluru')
  INTO suppliers VALUES (2, 'FitGear Suppliers', 'Mumbai')
  INTO suppliers VALUES (3, 'StyleHub Traders', 'Delhi')
  INTO suppliers VALUES (4, 'HomeEssentials Ltd', 'Chennai')
  INTO suppliers VALUES (5, 'BookNest Publishers', 'Kolkata')
SELECT 1 FROM dual;

INSERT ALL
  INTO customers VALUES (1, 'Rahul Sharma', 'rahul@mail.com', 'Kolkata')
  INTO customers VALUES (2, 'Priya Das', 'priya@mail.com', 'Delhi')
  INTO customers VALUES (3, 'Amit Roy', 'amit@mail.com', 'Mumbai')
  INTO customers VALUES (4, 'Sneha Paul', 'sneha@mail.com', 'Pune')
  INTO customers VALUES (5, 'Arjun Singh', 'arjun@mail.com', 'Chennai')
  INTO customers VALUES (6, 'Neha Gupta', 'neha@mail.com', 'Jaipur')
  INTO customers VALUES (7, 'Vikram Mehta', 'vikram@mail.com', 'Ahmedabad')
  INTO customers VALUES (8, 'Ananya Ghosh', 'ananya@mail.com', 'Kolkata')
  INTO customers VALUES (9, 'Rohit Verma', 'rohit@mail.com', 'Lucknow')
  INTO customers VALUES (10, 'Pooja Nair', 'pooja@mail.com', 'Kochi')
  INTO customers VALUES (11, 'Sourav Dey', 'sourav@mail.com', 'Howrah')
  INTO customers VALUES (12, 'Kavita Joshi', 'kavita@mail.com', 'Nagpur')
  INTO customers VALUES (13, 'Imran Ali', 'imran@mail.com', 'Hyderabad')
  INTO customers VALUES (14, 'Debasish Sen', 'debasish@mail.com', 'Siliguri')
  INTO customers VALUES (15, 'Meera Iyer', 'meera@mail.com', 'Bengaluru')
  INTO customers VALUES (16, 'Sanjay Kumar', 'sanjay@mail.com', 'Patna')
  INTO customers VALUES (17, 'Riya Bose', 'riya@mail.com', 'Kolkata')
  INTO customers VALUES (18, 'Aman Khan', 'aman@mail.com', 'Bhopal')
  INTO customers VALUES (19, 'Tanvi Shah', 'tanvi@mail.com', 'Surat')
  INTO customers VALUES (20, 'Karan Malhotra', 'karan@mail.com', 'Chandigarh')
SELECT 1 FROM dual;

INSERT ALL
  INTO products VALUES (1, 'Wireless Mouse', 'Electronics', 599, 50, 1)
  INTO products VALUES (2, 'Bluetooth Headphones', 'Electronics', 1999, 30, 1)
  INTO products VALUES (3, 'Running Shoes', 'Footwear', 2499, 20, 2)
  INTO products VALUES (4, 'Cotton T-Shirt', 'Clothing', 499, 100, 3)
  INTO products VALUES (5, 'Water Bottle', 'Home', 349, 8, 4)
  INTO products VALUES (6, 'Backpack', 'Accessories', 1299, 15, 3)
  INTO products VALUES (7, 'USB Keyboard', 'Electronics', 899, 40, 1)
  INTO products VALUES (8, 'Smart Watch', 'Electronics', 3999, 12, 1)
  INTO products VALUES (9, 'Yoga Mat', 'Fitness', 799, 25, 2)
  INTO products VALUES (10, 'Denim Jeans', 'Clothing', 1499, 60, 3)
  INTO products VALUES (11, 'Desk Lamp', 'Home', 649, 35, 4)
  INTO products VALUES (12, 'Power Bank', 'Electronics', 1299, 45, 1)
  INTO products VALUES (13, 'Sports Cap', 'Accessories', 299, 70, 2)
  INTO products VALUES (14, 'Notebook Pack', 'Stationery', 199, 200, 5)
  INTO products VALUES (15, 'Ceramic Mug', 'Home', 249, 9, 4)
  INTO products VALUES (16, 'Formal Shirt', 'Clothing', 1199, 40, 3)
  INTO products VALUES (17, 'Dumbbell Set', 'Fitness', 1899, 18, 2)
  INTO products VALUES (18, 'Phone Case', 'Accessories', 399, 90, 1)
  INTO products VALUES (19, 'SQL Basics Book', 'Books', 549, 6, 5)
  INTO products VALUES (20, 'Table Fan', 'Home', 1799, 14, 4)
SELECT 1 FROM dual;

INSERT ALL
  INTO orders VALUES (1, 1, TO_DATE('2026-10-05','YYYY-MM-DD'), 'Delivered')
  INTO orders VALUES (2, 2, TO_DATE('2026-10-08','YYYY-MM-DD'), 'Delivered')
  INTO orders VALUES (3, 3, TO_DATE('2026-10-12','YYYY-MM-DD'), 'Delivered')
  INTO orders VALUES (4, 4, TO_DATE('2026-10-15','YYYY-MM-DD'), 'Delivered')
  INTO orders VALUES (5, 5, TO_DATE('2026-10-18','YYYY-MM-DD'), 'Delivered')
  INTO orders VALUES (6, 6, TO_DATE('2026-10-22','YYYY-MM-DD'), 'Delivered')
  INTO orders VALUES (7, 7, TO_DATE('2026-10-25','YYYY-MM-DD'), 'Delivered')
  INTO orders VALUES (8, 8, TO_DATE('2026-10-28','YYYY-MM-DD'), 'Delivered')
  INTO orders VALUES (9, 9, TO_DATE('2026-11-01','YYYY-MM-DD'), 'Delivered')
  INTO orders VALUES (10, 10, TO_DATE('2026-11-03','YYYY-MM-DD'), 'Shipped')
  INTO orders VALUES (11, 11, TO_DATE('2026-11-05','YYYY-MM-DD'), 'Delivered')
  INTO orders VALUES (12, 12, TO_DATE('2026-11-07','YYYY-MM-DD'), 'Shipped')
  INTO orders VALUES (13, 13, TO_DATE('2026-11-09','YYYY-MM-DD'), 'Pending')
  INTO orders VALUES (14, 14, TO_DATE('2026-11-11','YYYY-MM-DD'), 'Pending')
  INTO orders VALUES (15, 15, TO_DATE('2026-11-13','YYYY-MM-DD'), 'Shipped')
  INTO orders VALUES (16, 16, TO_DATE('2026-11-15','YYYY-MM-DD'), 'Pending')
  INTO orders VALUES (17, 17, TO_DATE('2026-11-17','YYYY-MM-DD'), 'Cancelled')
  INTO orders VALUES (18, 18, TO_DATE('2026-11-19','YYYY-MM-DD'), 'Pending')
  INTO orders VALUES (19, 1, TO_DATE('2026-11-21','YYYY-MM-DD'), 'Pending')
  INTO orders VALUES (20, 2, TO_DATE('2026-11-23','YYYY-MM-DD'), 'Pending')
SELECT 1 FROM dual;

INSERT ALL
  INTO order_items VALUES (1, 1, 1, 2)
  INTO order_items VALUES (2, 1, 4, 2)
  INTO order_items VALUES (3, 2, 2, 1)
  INTO order_items VALUES (4, 3, 3, 1)
  INTO order_items VALUES (5, 3, 13, 2)
  INTO order_items VALUES (6, 4, 4, 3)
  INTO order_items VALUES (7, 5, 5, 2)
  INTO order_items VALUES (8, 6, 6, 1)
  INTO order_items VALUES (9, 6, 14, 3)
  INTO order_items VALUES (10, 7, 7, 1)
  INTO order_items VALUES (11, 8, 8, 1)
  INTO order_items VALUES (12, 9, 9, 2)
  INTO order_items VALUES (13, 9, 18, 1)
  INTO order_items VALUES (14, 10, 10, 1)
  INTO order_items VALUES (15, 11, 11, 2)
  INTO order_items VALUES (16, 12, 12, 1)
  INTO order_items VALUES (17, 12, 7, 1)
  INTO order_items VALUES (18, 13, 13, 4)
  INTO order_items VALUES (19, 14, 14, 5)
  INTO order_items VALUES (20, 15, 15, 3)
  INTO order_items VALUES (21, 16, 16, 1)
  INTO order_items VALUES (22, 17, 17, 1)
  INTO order_items VALUES (23, 18, 18, 2)
  INTO order_items VALUES (24, 19, 19, 1)
  INTO order_items VALUES (25, 20, 20, 1)
SELECT 1 FROM dual;

-- Payments: the amount is calculated from price x quantity, the method is chosen from the
-- order number, and the status follows the order status.
INSERT INTO payments (payment_id, order_id, amount, method, payment_date, pay_status)
SELECT o.order_id,
       o.order_id,
       SUM(p.price * i.quantity),
       CASE MOD(o.order_id, 4) WHEN 1 THEN 'UPI' WHEN 2 THEN 'Card' WHEN 3 THEN 'Net Banking' ELSE 'COD' END,
       o.order_date,
       CASE o.status WHEN 'Cancelled' THEN 'Refunded' WHEN 'Pending' THEN 'Unpaid' ELSE 'Paid' END
FROM orders o
JOIN order_items i ON o.order_id   = i.order_id
JOIN products p    ON i.product_id = p.product_id
GROUP BY o.order_id, o.order_date, o.status;

COMMIT;
