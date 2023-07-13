SHOW TABLES;
CREATE TRIGGER order_total_amount AFTER INSERT ON order_products
FOR EACH ROW 
BEGIN
@sum = @sum + NEW.quantity*NEW.unit_price;
UPDATE orders SET price=@sum WHERE orders.order_id = order_products.order_id;
END;
truncate products;
SELECT stock*unit_price as TOTAL FROM products WHERE product_id=1;
use s26048;
select * FROM products;
ALTER TABLE products ADD COLUMN unit_price int AFTER stock;
-- select products.product_name, products.brand_name,categories.category_name  from products LEFT JOIN categories ON
--  products.category_id = categories.category_id;
--  SELECT accounts.customer_id, customers.first_name, customers.surname FROM accounts RIGHT JOIN customers ON 
--  accounts.customer_id = customers.customer_id;
-- ALTER TABLE transactions DROP COLUMN purchase_sale;
-- ALTER TABLE customers CHANGE COLUMN name first_name varchar(50) NOT NULL;
-- INSERT INTO categories (category_id, category_name) VALUES (2, 'akcesoria');
-- DELETE FROM orders where order_id BETWEEN 1 AND 20;
SET foreign_key_checks = 1;
-- DROP TABLE IF EXISTS categories, employees, order_products, orders, purchases,suppliers, transactions, accounts, customers, products,shippers;
-- DELETE FROM products WHERE product_id BETWEEN 1 AND 10;
-- SHOW CREATE TABLE products;
-- DROP TABLE cars, pogoda, samochody
-- START transaction;
rollback;


