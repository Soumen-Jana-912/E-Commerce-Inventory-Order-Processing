-- E-Commerce Inventory & Order Processing Database
-- Brainware University | DBMS (BTD50113)
-- Script 04: reports (Figures 3 to 8 of the report)

-- Figure 3: number of records in each table
SELECT 'suppliers' AS table_name, COUNT(*) AS total_rows FROM suppliers
UNION ALL SELECT 'customers',   COUNT(*) FROM customers
UNION ALL SELECT 'products',    COUNT(*) FROM products
UNION ALL SELECT 'orders',      COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL SELECT 'payments',    COUNT(*) FROM payments;

-- Figure 4: products with their suppliers
SELECT p.product_id, p.product_name, p.category, p.price, p.stock_qty, s.supplier_name
FROM products p JOIN suppliers s ON p.supplier_id = s.supplier_id
ORDER BY p.product_id;

-- Figure 5: order details using a four-table join
SELECT o.order_id, c.customer_name, p.product_name, i.quantity,
       p.price * i.quantity AS line_total
FROM orders o
JOIN customers c   ON o.customer_id = c.customer_id
JOIN order_items i ON o.order_id    = i.order_id
JOIN products p    ON i.product_id  = p.product_id
ORDER BY o.order_id;

-- Figure 6: order totals using GROUP BY
SELECT o.order_id, c.customer_name, o.status, SUM(p.price * i.quantity) AS order_total
FROM orders o
JOIN customers c   ON o.customer_id = c.customer_id
JOIN order_items i ON o.order_id    = i.order_id
JOIN products p    ON i.product_id  = p.product_id
GROUP BY o.order_id, c.customer_name, o.status
ORDER BY o.order_id;

-- Figure 7: revenue by product category
SELECT p.category, SUM(i.quantity) AS units_sold, SUM(p.price * i.quantity) AS revenue
FROM order_items i JOIN products p ON i.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Figure 8: low stock alert
SELECT product_id, product_name, stock_qty FROM products WHERE stock_qty < 10;
