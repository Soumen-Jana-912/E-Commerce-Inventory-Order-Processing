-- E-Commerce Inventory & Order Processing Database
-- Brainware University | DBMS (BTD50113)
-- Script 06: trigger and stored procedure, each followed by its test (Figures 10 to 13)
-- Run each PL/SQL block with the slash (/) on its own line after END;

-- Figure 10: trigger that reduces stock when an order item is added
CREATE OR REPLACE TRIGGER trg_reduce_stock
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
  UPDATE products
  SET stock_qty = stock_qty - :NEW.quantity
  WHERE product_id = :NEW.product_id;
END;
/

-- Figure 11: test the trigger (stock of product 3 goes from 20 to 18)
INSERT INTO order_items VALUES (26, 20, 3, 2);
SELECT product_id, product_name, stock_qty FROM products WHERE product_id = 3;

-- Figure 12: procedure that updates the status of an order
CREATE OR REPLACE PROCEDURE update_order_status (
  p_order_id IN NUMBER,
  p_status   IN VARCHAR2
) AS
BEGIN
  UPDATE orders SET status = p_status WHERE order_id = p_order_id;
  COMMIT;
END;
/

-- Figure 13: test the procedure (order 13 becomes Shipped)
BEGIN
  update_order_status(13, 'Shipped');
END;
/
SELECT order_id, status FROM orders WHERE order_id = 13;
