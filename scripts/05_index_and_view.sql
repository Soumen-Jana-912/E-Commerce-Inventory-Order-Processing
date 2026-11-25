-- E-Commerce Inventory & Order Processing Database
-- Brainware University | DBMS (BTD50113)
-- Script 05: index and view

CREATE INDEX idx_orders_customer ON orders(customer_id);

CREATE OR REPLACE VIEW v_order_summary AS
SELECT o.order_id, c.customer_name, o.order_date, o.status,
       SUM(p.price * i.quantity) AS order_total
FROM orders o
JOIN customers c   ON o.customer_id = c.customer_id
JOIN order_items i ON o.order_id    = i.order_id
JOIN products p    ON i.product_id  = p.product_id
GROUP BY o.order_id, c.customer_name, o.order_date, o.status;

-- Figure 9: order summary view
SELECT * FROM v_order_summary ORDER BY order_id;
