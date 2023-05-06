CREATE SCHEMA Sales;
USE Sales;
CREATE TABLE practice_sales (
    purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
    );
    
SELECT * FROM Sales.practice_sales;

CREATE TABLE items (
	item_code VARCHAR(255),
    item VARCHAR(255),
    unit_prie NUMERIC(10,2),
    company_id VARCHAR (255),
    PRIMARY KEY (item_code)
    );

CREATE TABLE companies (
company_id VARCHAR(255),
company_name VARCHAR (255),
headquarters_phone_number INT(12),
PRIMARY KEY (company_id)
);

DROP TABLE companies;

CREATE TABLE companies (
company_id VARCHAR(255),
company_name VARCHAR (255),
headquarters_phone_number INT,
PRIMARY KEY (company_id)
);

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR (255),
last_name VARCHAR (255),
number_of_complaints INT,
email_address VARCHAR (255)
);
RENAME TABLE practice_sales TO sales;
ALTER TABLE sales ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
ALTER TABLE sales DROP FOREIGN KEY sales_ibfk_1;
ALTER TABLE sales ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;
ALTER TABLE customer DROP INDEX email_address;
ALTER TABLE customers ADD UNIQUE KEY (email_address);

ALTER TABLE customers ADD COLUMN gender ENUM('M','F') AFTER last_name;
INSERT INTO customers VALUES ('1', 'John', 'Mackinley', 'M', 0, 'john.mckinley@365careers.com');
ALTER TABLE customer ALTER COLUMN number_of_complaints DROP DEFAULT;
ALTER TABLE customers CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;
INSERT INTO customers (customer_id, first_name, last_name, gender, email_address) VALUES  ('2', 'Peter', 'Fiagro', 'M', 'peter.fiagro@gmail.com');

SELECT * FROM customers;

ALTER TABLE companies MODIFY company_name VARCHAR (255) NULL;

ALTER TABLE companies MODIFY headquarters_phone_number VARCHAR(255) NULL;
ALTER TABLE companies CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;