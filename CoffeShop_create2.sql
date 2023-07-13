-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-06-20 05:58:18.074

-- tables
-- Table: accounts
CREATE TABLE accounts (
    account_id int NOT NULL AUTO_INCREMENT,
    customer_id int NOT NULL,
    account_name varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    CONSTRAINT accounts_pk PRIMARY KEY (account_id)
);

-- Table: categories
CREATE TABLE categories (
    category_id int NOT NULL AUTO_INCREMENT,
    category_name varchar(50) NOT NULL,
    CONSTRAINT categories_pk PRIMARY KEY (category_id)
);

-- Table: customers
CREATE TABLE customers (
    customer_id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    phone varchar(12) NOT NULL,
    card_number varchar(20) NOT NULL,
    adress varchar(50) NOT NULL,
    postal_code varchar(50) NOT NULL,
    CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

-- Table: employees
CREATE TABLE employees (
    employe_id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    phone int NOT NULL,
    adress varchar(50) NOT NULL,
    pay int NOT NULL,
    CONSTRAINT employees_pk PRIMARY KEY (employe_id)
);

-- Table: order_products
CREATE TABLE order_products (
    product_id int NOT NULL AUTO_INCREMENT,
    order_id int NOT NULL,
    quantity int NOT NULL,
    price int NOT NULL,
    CONSTRAINT order_products_pk PRIMARY KEY (product_id)
);

-- Table: orders
CREATE TABLE orders (
    order_id int NOT NULL AUTO_INCREMENT,
    account_id int NOT NULL,
    order_date date NOT NULL,
    price int NOT NULL,
    employee_id int NOT NULL,
    shipper_id int NOT NULL,
    shipped_date date NOT NULL,
    ship_adress varchar(50) NOT NULL,
    ship_postal_code varchar(50) NOT NULL,
    ship_city varchar(50) NOT NULL,
    transaction_id int NOT NULL,
    CONSTRAINT orders_pk PRIMARY KEY (order_id)
);

-- Table: products
CREATE TABLE products (
    product_id int NOT NULL AUTO_INCREMENT,
    product_name int NOT NULL,
    brand_id int NOT NULL,
    category_id int NOT NULL,
    stock int NOT NULL,
    CONSTRAINT products_pk PRIMARY KEY (product_id)
);

-- Table: purchases
CREATE TABLE purchases (
    purchase_id int NOT NULL AUTO_INCREMENT,
    product_id int NOT NULL,
    quanitity int NOT NULL,
    price int NOT NULL,
    supplier_id int NOT NULL,
    CONSTRAINT purchases_pk PRIMARY KEY (purchase_id)
);

-- Table: shippers
CREATE TABLE shippers (
    shipper_id int NOT NULL AUTO_INCREMENT,
    company_name varchar(50) NOT NULL,
    phone varchar(12) NOT NULL,
    CONSTRAINT shippers_pk PRIMARY KEY (shipper_id)
);

-- Table: suppliers
CREATE TABLE suppliers (
    supplier_id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    phone int NOT NULL,
    adress varchar(50) NOT NULL,
    CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id)
);

-- Table: transactions
CREATE TABLE transactions (
    transaction_id int NOT NULL AUTO_INCREMENT,
    date date NOT NULL,
    purchase_sale varchar(50) NOT NULL,
    CONSTRAINT transactions_pk PRIMARY KEY (transaction_id)
);

-- foreign keys
-- Reference: Accounts_Customers (table: accounts)
ALTER TABLE accounts ADD CONSTRAINT Accounts_Customers FOREIGN KEY Accounts_Customers (customer_id)
    REFERENCES customers (customer_id);

-- Reference: Orders_Accounts (table: orders)
ALTER TABLE orders ADD CONSTRAINT Orders_Accounts FOREIGN KEY Orders_Accounts (account_id)
    REFERENCES accounts (account_id);

-- Reference: Orders_employees (table: orders)
ALTER TABLE orders ADD CONSTRAINT Orders_employees FOREIGN KEY Orders_employees (employee_id)
    REFERENCES employees (employe_id);

-- Reference: Orders_order_items (table: order_products)
ALTER TABLE order_products ADD CONSTRAINT Orders_order_items FOREIGN KEY Orders_order_items (order_id)
    REFERENCES orders (order_id);

-- Reference: order_items_products (table: order_products)
ALTER TABLE order_products ADD CONSTRAINT order_items_products FOREIGN KEY order_items_products (product_id)
    REFERENCES products (product_id);

-- Reference: orders_transactions (table: orders)
ALTER TABLE orders ADD CONSTRAINT orders_transactions FOREIGN KEY orders_transactions (transaction_id)
    REFERENCES transactions (transaction_id);

-- Reference: products_categories (table: products)
ALTER TABLE products ADD CONSTRAINT products_categories FOREIGN KEY products_categories (category_id)
    REFERENCES categories (category_id);

-- Reference: products_purchases (table: purchases)
ALTER TABLE purchases ADD CONSTRAINT products_purchases FOREIGN KEY products_purchases (product_id)
    REFERENCES products (product_id);

-- Reference: purchases_suppliers (table: purchases)
ALTER TABLE purchases ADD CONSTRAINT purchases_suppliers FOREIGN KEY purchases_suppliers (supplier_id)
    REFERENCES suppliers (supplier_id);

-- Reference: shippers_orders (table: orders)
ALTER TABLE orders ADD CONSTRAINT shippers_orders FOREIGN KEY shippers_orders (shipper_id)
    REFERENCES shippers (shipper_id);

-- End of file.

