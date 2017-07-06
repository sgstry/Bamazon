CREATE TABLE products (
    item_id int(11) auto_increment,
    product_name varchar(255) NOT NULL,
    department_name varchar(255) NOT NULL,
    price double(11,2) NOT NULL,
    stock_quantity int(11) NOT NULL,
    PRIMARY KEY (item_id)
);

DROP TABLE products;

INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('iRobot Roomba 960 Wi-Fi Connected Robotic Vacuum Cleaner', 'Home, Garden & Tools', 683.40, 15);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('Honeywell Fresh Breeze Tower Fan', 'Home, Garden & Tools', 69.99, 25);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('Amazon Echo', 'Amazon Devices', 179.99, 15);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('Amazon Fire TV', 'Amazon Devices', 89.99, 10);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('Beats by Dr Dre Powerbeats 2 Wireless In-Ear Headphone', 'Electronics, Computers & Office', 159.00, 30);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('All-New Element 55-Inch 4K Ultra HD Smart LED TV', 'Electronics, Computers & Office', 649.99, 15);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('Protege by Cordoba C100M Full Size Classical Guitar', 'Movies, Music & Games', 131.98, 15);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('John Wick: Chapter 2', 'Movies, Music & Games', 19.96, 50);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('Fire 7 Tablet with Alexa', 'Amazon Devices', 49.99, 35);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('Zinus 12 Inch Deluxe Wood Platform Bed', 'Home, Garden & Tools', 157.30, 10);

UPDATE products SET price = 649.99 WHERE item_id = 4;


SELECT * FROM products;