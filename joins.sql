CREATE DATABASE joins;
USE joins;

CREATE TABLE salesmans(
	salesman_id int NOT NULL,
    name VARCHAR(45) NOT NULL,
    commission FLOAT NOT NULL,
    city varchar(45) Not Null,
    PRIMARY KEY (salesman_id)
);

CREATE TABLE customers(
	customer_id int NOT NULL,
    cust_name VARCHAR(45) NOT NULL,
    salesman_id int NOT NULL,
    grade int NOT NULL,
    city varchar(45) NOT NULL,
    CONSTRAINT FK_SalesmanCustomers FOREIGN KEY (salesman_id)
    	REFERENCES salesmans(salesman_id),
    PRIMARY KEY (customer_id)
);

CREATE TABLE orders(
	com_id int NOT NULL,
    com_name VARCHAR(45) NOT NULL,
    customer_id int NOT NULL,
    salesman_id int NOT NULL,
    CONSTRAINT FK_SalesmanOrders FOREIGN KEY (salesman_id)
    	REFERENCES salesmans(salesman_id),
	CONSTRAINT FK_CustomersOrders FOREIGN KEY (customer_id)
    	REFERENCES customers(customer_id),
	PRIMARY KEY (ord_no)
);

drop table orders;

CREATE TABLE company_mast (
	com_id INT,
    com_name VARCHAR(45),
    PRIMARY KEY (com_id)
);

CREATE TABLE item_mast (
	pro_id INT,
    pro_name VARCHAR(45),
    pro_price INT,
    pro_com INT,
    PRIMARY KEY (pro_id),
    FOREIGN KEY (pro_com) REFERENCES company_mast(com_id)
);

CREATE TABLE emp_department (
	dpt_code INT,
    dpt_name VARCHAR(45),
    dpt_allotment INT,
    PRIMARY KEY (dpt_code)
);

CREATE TABLE emp_details (
	emp_id INT,
    emp_fname VARCHAR(45),
    emp_lname VARCHAR(45),
    emp_dept INT,
    PRIMARY KEY (emp_id),
    FOREIGN KEY (emp_dept) REFERENCES emp_department(dpt_code)
);


INSERT INTO salesmans (salesman_id,name,city,commission) VALUES (5001,"James Hoog","New York",0.15);
INSERT INTO salesmans (salesman_id,name,city,commission) VALUES (5002,"Nail Knite","Paris",0.13);
INSERT INTO salesmans (salesman_id,name,city,commission) VALUES (5005,"Pit Alex","London",0.11);
INSERT INTO salesmans (salesman_id,name,city,commission) VALUES (5006,"Mc Lyon","Paris",0.14);
INSERT INTO salesmans (salesman_id,name,city,commission) VALUES (5003,"Lauson Hen"," ",0.12);
INSERT INTO salesmans (salesman_id,name,city,commission) VALUES (5007,"Paul Adam","Rome",0.13);

SELECT * FROM salesmans;

INSERT INTO customers (customer_id,cust_name,grade,city,salesman_id) VALUES (3002,"Nick Rimando",100,"New York",5001);
INSERT INTO customers (customer_id,cust_name,grade,city,salesman_id) VALUES (3005,"Brad Guzan",200,"California",5002);
INSERT INTO customers (customer_id,cust_name,grade,city,salesman_id) VALUES (3001,"Fabian Johns",0,"London",5005);
INSERT INTO customers (customer_id,cust_name,grade,city,salesman_id) VALUES (3001,"Fabian Johns",300,"Paris",5006);
INSERT INTO customers (customer_id,cust_name,grade,city,salesman_id) VALUES (3004,"Brad Davis",200,"New York",5001);
INSERT INTO customers (customer_id,cust_name,grade,city,salesman_id) VALUES (3007,"Geoff Camero",100,"Berlin",5003);
INSERT INTO customers (customer_id,cust_name,grade,city,salesman_id) VALUES (3009,"Julian Green",300,"London",5002);
INSERT INTO customers (customer_id,cust_name,grade,city,salesman_id) VALUES (3003,"Jozy Altidor",200,"Moscow",5007);

SELECT * FROM customers;


INSERT INTO orders (ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES (70001,150.5,'2012-10-05',3005,5002);
INSERT INTO orders (ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES (70009,270.65,'2012-09-10',3001,5005);
INSERT INTO orders (ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES (70002,65.26,'2012-10-05',3002,5001);
INSERT INTO orders (ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES (70004,110.5,'2012-08-17',3009,5003);
INSERT INTO orders (ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES (70007,948.5,'2012-09-10',3005,5002);
INSERT INTO orders (ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES (70005,2400.6,'2012-07-27',3007,5001);
INSERT INTO orders (ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES (70008,5760.0,'2012-09-10',3002,5001);
INSERT INTO orders (ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES (70010,1983.43,'2012-10-10',3004,5006);
INSERT INTO orders (ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES (70003,2480.4,'2012-10-10',3009,5003);
INSERT INTO orders (ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES (70012,250.45,'2012-06-27',3008,5002);
INSERT INTO orders (ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES (70011,75.29,'2012-08-17',3003,5007);
INSERT INTO orders (ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES (70013,3045.6,'2012-04-25',3002,5001);

SELECT * FROM orders;

ALTER TABLE orders MODIFY COLUMN purch_amt float(6,3); #MODIFY COLUMN

INSERT INTO company_mast (com_id, com_name) VALUE (11, "Samsung");
INSERT INTO company_mast (com_id, com_name) VALUE (12, "iBall");
INSERT INTO company_mast (com_id, com_name) VALUE (13, "Epsion");
INSERT INTO company_mast (com_id, com_name) VALUE (14, "Zebronics");
INSERT INTO company_mast (com_id, com_name) VALUE (15, "Asus");
INSERT INTO company_mast (com_id, com_name) VALUE (16, "Frontech");

SELECT * FROM company_mast;

INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) VALUE (101, "Mother Board", 3200, 15);
INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) VALUE (102, "Key Board", 450, 16);
INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) VALUE (103, "ZIP drive", 250, 14);
INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) VALUE (104, "Speaker", 550, 16);
INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) VALUE (105, "Monitor", 5000, 11);
INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) VALUE (106, "DVD drive", 900, 12);
INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) VALUE (107, "CD drive", 800, 12);
INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) VALUE (108, "Printer", 2600, 13);
INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) VALUE (109, "Refill cartridge", 350, 13);
INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) VALUE (110, "Mouse", 250, 12);

SELECT * FROM item_mast;

INSERT INTO emp_department (dpt_code,dpt_name,dpt_allotment) VALUE ( 57, "IT", 65000);
INSERT INTO emp_department (dpt_code,dpt_name,dpt_allotment) VALUE ( 63, "Finance", 15000);
INSERT INTO emp_department (dpt_code,dpt_name,dpt_allotment) VALUE ( 47, "HR", 24000);
INSERT INTO emp_department (dpt_code,dpt_name,dpt_allotment) VALUE ( 27, "RD", 55000);
INSERT INTO emp_department (dpt_code,dpt_name,dpt_allotment) VALUE ( 89, "QC", 75000);

SELECT * FROM emp_department;

INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 127323, "Michale", "Robbin",57);
INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 526689, "Carlos", "Snares",63);
INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 843795, "Enric", "Dosio", 57);
INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 328717, "Jhon", "Snares", 63);
INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 444527, "Joseph", "Dosni", 47);
INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 659831, "Zanifer", "Emily", 47);
INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 847674, "Kuleswar", "Sitaraman", 57);
INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 748681, "Henrey", "Gabriel", 47);
INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 555935, "Alex", "Manuel", 57);
INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 539569, "George", "Mardy", 27);
INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 733843, "Mario", "Saule", 63);
INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 631548, "Alan", "Snappy", 27);
INSERT INTO emp_details (emp_id, emp_fname, emp_lname, emp_dept) VALUE ( 839139, "Maria", "Foster", 57);

SELECT * FROM emp_details;

#DROP DATABASE joins;


#3
# Write a SQL statement to know which salesman are working for which customer. 

SELECT customers.cust_name as "customers", salesmans.name as "salesmans" FROM customers INNER JOIN salesmans ON customers.salesman_id = salesmans.salesman_id;


#8
# Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own

SELECT customers.customer_id as "ID customers", salesmans.salesman_id as "ID salesmans" FROM customers INNER JOIN salesmans ON 
customers.salesman_id = salesmans.salesman_id ORDER BY customers.salesman_id, salesmans.salesman_id ASC;


#12 
# Write a SQL statement to make a list in ascending order for the salesmen who works either for 
# one or more customer or not yet join under any of the customers. 

SELECT salesmans.salesman_id as "ID salesmans", customers.customer_id as "ID customers" FROM salesmans RIGHT JOIN customers ON 
salesmans.salesman_id = customers.salesman_id  ORDER BY salesmans.salesman_id DESC;


#17. 
# Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman 
# will appear for all customer and vice versa.

SELECT * FROM customers, salesmans;


#18. 
# Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman 
# will appear for all customer and vice versa for that customer who belongs to a city.

SELECT * FROM customers, salesmans WHERE customers.city = salesmans.city;


#23. 
# Write a SQL query to display the average price of items of each company, showing the name of the company. 

SELECT AVG(pro_price), company_mast.com_name FROM item_mast INNER JOIN company_mast ON item_mast.pro_com = company_mast.com_id GROUP BY company_mast.com_name;


#28. 
# Write a query in SQL to find the first name and last name of employees working for departments with a budget more than Rs. 50000. 

SELECT emp_details.emp_fname, emp_details.emp_lname FROM emp_details INNER JOIN emp_department ON emp_details.emp_dept = emp_department.dpt_code WHERE emp_department.dpt_allotment >= 50000;







