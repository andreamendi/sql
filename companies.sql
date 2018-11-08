CREATE DATABASE components;
USE components;

CREATE TABLE companies(
	id int NOT NULL,
    name VARCHAR(45),
    PRIMARY KEY (id)
);

CREATE TABLE departments(
	id int AUTO_INCREMENT NOT NULL,
    name VARCHAR(45)NOT NULL,
    budget float(10,2)DEFAULT 1000.00,
    PRIMARY KEY (id)
);

CREATE TABLE employees(
    ssn VARCHAR(45)NOT NULL,
    salary FLOAT (3,2)NOT NULL,
    phone VARCHAR (45) NOT NULL,
    id_departments int,
    PRIMARY KEY (ssn),
    CONSTRAINT FK_EmployeesDepartments FOREIGN KEY (id_departments)
    	REFERENCES departments(id)
);

CREATE TABLE employees_children(
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(45) NOT NULL,
    age INT,
    ssn_employee int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ssn_employee) REFERENCES employees(ssn),
    CHECK (age >= 5 and age <=21)
);

#ALTER TABLE children ADD ssn int; #ADD COLUMN
ALTER TABLE children DROP COLUMN ssn;
ALTER TABLE employees MODIFY COLUMN ssn int; #MODIFY COLUMN


ALTER TABLE employees ADD name VARCHAR(45);
#ALTER TABLE employees CHANGE dname name VARCHAR(45); #MODIFY COLUMN

#DROP TABLE companies; #DROP COLUMN
#DROP TABLE employees; #DROP COLUMN
#DROP TABLE departments; #DROP COLUMN
#DROP TABLE children; #DROP COLUMN

#DROP DATABASE components;



INSERT INTO departments (name, budget) VALUES ("DEV",1550.00);
INSERT INTO departments (name, budget) VALUES ("Diseño",1550.00);
INSERT INTO departments (name, budget) VALUES ("Marketing",1550.00);
INSERT INTO departments (name, budget) VALUES ("Tech",1550.00);
INSERT INTO departments (name, budget) VALUES ("CosHapp",1550.00);



SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM employees_children;

SET SQL_SAFE_UPDATES = 0; #Deshabilitar delete and update constrain

ALTER TABLE employees MODIFY COLUMN salary Float(10,4); #MODIFY COLUMN


UPDATE departments SET name = "Recursos Humanos" WHERE id = 2;

INSERT INTO employees(ssn,salary,phone,id_departments,name)VALUES(1,599300.00,43182336,2,"Almudena Chavez");
INSERT INTO employees(ssn,salary,phone,id_departments,name)VALUES(2,753456.00,55431312,1,"Karla Cabañas");
INSERT INTO employees(ssn,salary,phone,id_departments,name)VALUES(3,599300.00,59012344,3,"Deni Olivales");
INSERT INTO employees(ssn,salary,phone,id_departments,name)VALUES(4,334523.00,43182336,4,"Samanta Cisneros");
INSERT INTO employees(ssn,salary,phone,id_departments,name)VALUES(5,443355.00,43182336,5,"Atzin Aquino");

UPDATE employees SET id_departments = 5 WHERE ssn = 5;


INSERT INTO employees_children(name,age,ssn_employee)VALUES("Emilia Chavez",3,1);
INSERT INTO employees_children(name,age,ssn_employee)VALUES("Sofia Cabañas",3,2);
INSERT INTO employees_children(name,age,ssn_employee)VALUES("Nez Olivales",4,3);
INSERT INTO employees_children(name,age,ssn_employee)VALUES("Emma Cisneros",1,4);
INSERT INTO employees_children(name,age,ssn_employee)VALUES("Aida Aquino",2,5);


SELECT employees_children.name, employees.salary FROM employees_children INNER JOIN
 employees ON employees_children.ssn_employee = employees.ssn WHERE employees_children.age>2;



