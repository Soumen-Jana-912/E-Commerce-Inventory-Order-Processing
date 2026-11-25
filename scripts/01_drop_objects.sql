-- E-Commerce Inventory & Order Processing Database
-- Brainware University | DBMS (BTD50113)
-- Script 01: drop old objects so the database can be rebuilt from nothing

BEGIN
  FOR v IN (SELECT view_name FROM user_views WHERE view_name = 'V_ORDER_SUMMARY') LOOP
    EXECUTE IMMEDIATE 'DROP VIEW ' || v.view_name;
  END LOOP;
  FOR p IN (SELECT object_name FROM user_objects WHERE object_type = 'PROCEDURE' AND object_name = 'UPDATE_ORDER_STATUS') LOOP
    EXECUTE IMMEDIATE 'DROP PROCEDURE ' || p.object_name;
  END LOOP;
  FOR t IN (SELECT table_name FROM user_tables
            WHERE table_name IN ('PAYMENTS','ORDER_ITEMS','ORDERS','PRODUCTS','CUSTOMERS','SUPPLIERS')) LOOP
    EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS';
  END LOOP;
END;
/
