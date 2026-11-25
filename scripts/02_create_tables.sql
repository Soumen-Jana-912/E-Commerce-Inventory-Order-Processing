-- E-Commerce Inventory & Order Processing Database
-- Brainware University | DBMS (BTD50113)
-- Script 02: create the six tables (parent tables first)

CREATE TABLE suppliers (
  supplier_id   NUMBER PRIMARY KEY,
  supplier_name VARCHAR2(60) NOT NULL,
  city          VARCHAR2(40)
);

CREATE TABLE customers (
  customer_id   NUMBER PRIMARY KEY,
  customer_name VARCHAR2(50) NOT NULL,
  email         VARCHAR2(80) UNIQUE,
  city          VARCHAR2(40)
);

CREATE TABLE products (
  product_id    NUMBER PRIMARY KEY,
  product_name  VARCHAR2(60) NOT NULL,
  category      VARCHAR2(40),
  price         NUMBER(10,2) CHECK (price > 0),
  stock_qty     NUMBER DEFAULT 0 CHECK (stock_qty >= 0),
  supplier_id   NUMBER REFERENCES suppliers(supplier_id)
);

CREATE TABLE orders (
  order_id      NUMBER PRIMARY KEY,
  customer_id   NUMBER REFERENCES customers(customer_id),
  order_date    DATE,
  status        VARCHAR2(20)
);

CREATE TABLE order_items (
  item_id       NUMBER PRIMARY KEY,
  order_id      NUMBER REFERENCES orders(order_id),
  product_id    NUMBER REFERENCES products(product_id),
  quantity      NUMBER CHECK (quantity > 0)
);

CREATE TABLE payments (
  payment_id    NUMBER PRIMARY KEY,
  order_id      NUMBER REFERENCES orders(order_id),
  amount        NUMBER(12,2),
  method        VARCHAR2(20),
  payment_date  DATE,
  pay_status    VARCHAR2(15)
);
