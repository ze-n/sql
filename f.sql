

-- -- ///////////////////////////////////////////////////////////////////////////////////////
-- -- /////////////This code will create user senku with passowrd 1234  /////////////////////
-- -- ///////////////////////////////////////////////////////////////////////////////////////

-- CREATE USER 'senku'@'localhost' IDENTIFIED BY "1234";




-- -- ///////////////////////////////////////////////////////////////////////////////////////
-- -- ///////////////This code will create a database called shop////////////////////////////
-- -- ///////////////////////////////////////////////////////////////////////////////////////
-- -- CREATE DATABASE shop;




-- -- ///////////////////////////////////////////////////////////////////////////////////////
-- -- ///////// This code will grant all privileges to senku on all tables and databases ////
-- -- ///////////////////////////////////////////////////////////////////////////////////////

-- GRANT ALL ON *.* TO 'senku'@'localhost';




-- -- ///////////////////////////////////////////////////////////////////////////////////////
-- -- //This code will revoke all privileges from senku on all tables and databases  ////////
-- -- ///////////////////////////////////////////////////////////////////////////////////////

-- revoke ALL ON *.* FROM 'senku'@'localhost';


-- -- ///////////////////////////////////////////////////////////////////////////////////////
-- -- ///////////// This code list all users and hosts column from mysql.user table  ////////
-- -- ///////////////////////////////////////////////////////////////////////////////////////

-- SELECT User , Host FROM mysql.user;


-- -- ///////////////////////////////////////////////////////////////////////////////////////
-- -- /////////////This code will delete users //////////////////////////////////////////////
-- -- ///////////////////////////////////////////////////////////////////////////////////////

-- DROP USER 'senku'@'localhost';


-- You can add comments about the user while creating user using the COMMENT clause 

CREATE USER 'zoro'@'localhost' COMMENT 'some information';

-- TO SEE User, Host and comments

SELECT * FROM INFORMATION_SCHEMA.USER_ATTRIBUTES
WHERE User = "zoro" AND Host = "localhost";


-- ALTER USER 
-- CHANGE USER zoro@localhost password
ALTER USER "zoro"@"localhost" IDENTIFIED BY "12";

-- Expire clause
-- create user sasuke@localhost 
-- such that he need to reset his password evertime he login

CREATE USER 'sasuke'@'localhost'
IDENTIFIED BY '123'
PASSWORD EXPIRE;

-- create user naruto@localhost such that
-- he need to reset his password every 30 days
-- and if he enter his password incorrect 2 times
-- his account gets locked for 3 days

CREATE USER 'naruto'@'localhost'
IDENTIFIED BY "123"
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 2
PASSWORD_LOCK_TIME 3;



-- LOCK AND UNLOCK USER

-- unlock user naruto@localhost account
ALTER USER 'naruto'@'localhost' ACCOUNT UNLOCK;

-- lock user naruto@localhost account
ALTER USER 'naruto'@'localhost' ACCOUNT LOCK;



-- ///////////////////////////////////////////////////////////////////////////////////////
-- ///////////// Drop connected or active users //////////////////////////////////////////
-- ///////////////////////////////////////////////////////////////////////////////////////


-- 1 -> ////// Find connection id for unwanted users /////////////////////////////////////

-- SHOW PROCESSLIST;

-- 2 -> /// Use this id with Kill command to kill the process ///////////////////////////
-- -> ///// This is the syntax --------->  KILL id_number //////////////////////////////;


-- KILL ;

-- 3 -> // Now drop the user /////////////////////////////////////////////////////////////
-- /////// This is the syntax --> DROP USER 'username'@'host'; ///////////////////////////





-- ----> CREATE TABLE
-- CREATE TABLE customers(id INT, customer_fname VARCHAR(30), customer_lname VARCHAR(30) );

-- ----> INSERT VALUES IN TABLE
-- INSERT INTO customers() VALUES(1,"Senku","Ishigami"),
                            --   (2,"Shoyo","Hinata");

-- INSERT INTO customers(customer_fname,id) VALUES("Naruto",3),
--                                                ("Sasuke",4),
--                                                ("Shino",5);

-- ----> SELECT COMMAND
-- SELECT id, customer_fname FROM customers;
-- SELECT * FROM customers WHERE id>2;
-- SELECT * FROM customers WHERE customer_lname IS NULL;


-- ----> CREATING NEW TABLE TO MAKE EXAMPLES MORE FUN

-- CREATE TABLE employee(id INT, fname VARCHAR(30), lname VARCHAR(30), age INT, gender VARCHAR(10), salary INT);

-- INSERT INTO employee 
-- VALUES(1,"Zenitsu","Agatsuma",21,"Male",30000),
--       (2,"Nezuko","Kamado",19,"Female",25000),
--       (3,"Tanjiro","Kamado",21,"Male",30000),
--       (4,"Inosuke","Hashibira",20,"Male",40000),
--       (5,"Kyojuro","Rengoku",23,"Male",100000),
--       (6,"Tengen","Uzui",35,"Male",70000),
--       (7,"Giyutom","Tomioka",25,"Male",70000),
--       (8,"Shinobu","Kocho",23,"Female",100000);


-- SELECT * FROM employee;
-- SELECT * FROM employee WHERE age = 23 AND gender = "Female";
-- SELECT * FROM employee WHERE salary>=30000 AND salary <= 40000;
-- SELECT * FROM employee WHERE (age = 23 AND gender = "Male") OR (age < 21 AND salary <= 40000);
-- SELECT * FROM employee WHERE id = 1 OR id =3 OR id = 6;

-- SELECT * FROM employee WHERE id IN(1,3,6);
-- SELECT * FROM employee WHERE salary BETWEEN 30000 AND 40000;

-- ----> ORDER BY keyword
-- SELECT * FROM employee ORDER BY salary DESC;
-- SELECT * FROM employee ORDER BY salary DESC,id DESC;

-- ----> LIMIT keyword
-- SELECT * FROM employee LIMIT 4;
-- SELECT * FROM employee ORDER BY salary DESC LIMIT 3 ;

-- ----> MIN() and MAX()
-- SELECT MIN(salary) FROM employee;
-- SELECT MAX(salary) FROM employee;


-- ----> COUNT() AVG() SUM()
-- SELECT COUNT(id) FROM employee;
-- --> AS keyword to create aliases
-- SELECT SUM(salary) AS total_money_paid FROM employee;
-- SELECT COUNT(id) AS total_employee , AVG(salary) AS average_salary FROM employee;


-- ----> using LIKE operator

-- SELECT fname, lname FROM employee WHERE fname LIKE "_e%";

-- ----> create new table from already existing table

-- CREATE TABLE employee1 AS SELECT * FROM employee where id =1000;

-- ----> create table from already existing table with values
-- CREATE TABLE employee2 AS SELECT * FROM employee;

-- ----> create table from selected attributes of already existing table

-- CREATE TABLE salary AS SELECT id,fname,salary FROM employee; 

-- ----> update command
-- UPDATE salary SET fname = "Shikamaru",salary = 120000 WHERE fname = "Tengen";

-- UPDATE salary SET salary = 45000 WHERE salary <=30000;

-- ----> creating table for arithmatic operations

-- CREATE TABLE arith(num1 INT , num2 INT, result DOUBLE);
-- INSERT INTO arith(num1,num2) 
-- VALUES(12,14),
--       (112,221),
--       (1231,23),
--       (123,221);

-- UPDATE arith 
-- SET result = num1 + num2;

-- UPDATE arith
-- SET result = num1 - num2;

-- UPDATE arith
-- SET result = num1 * num2;

-- UPDATE arith 
-- SET result = num1/num2;


-- ----> Relational operator

-- SELECT * FROM salary;
-- SELECT * FROM salary WHERE salary < 70000;
-- SELECT * FROM salary WHERE salary > 70000;
-- SELECT * FROM salary WHERE salary <= 70000;
-- SELECT * FROM salary WHERE salary >= 70000;
-- SELECT * FROM salary WHERE salary = 70000;
-- SELECT * FROM salary WHERE salary != 70000;





-- ----> Creating table for logical operators

-- CREATE TABLE customers(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(40), state VARCHAR(40), score INT);
-- INSERT INTO customers(name,state,score)
--                values("Senku","Himachal",10001),
--                      ("Light","Assam",2323),
--                      ("Shoyo","Himachal",23),
--                      ("Ryuk","Assam",123),
--                      ("Zenitsu","Himachal",5424),
--                      ("Doflamingo","Punjab",12323),
--                      ("Naruto","Assam",2323),
--                      ("Zenitsu","Assam",1000),
--                      ("Light","Himachal",12);



-- ----> AND OR NOT 
-- SELECT * FROM customers WHERE score > 500 AND score < 6000;
-- SELECT * FROM customers WHERE state = "Himachal" OR state = "Assam";
-- SELECT * FROM customers WHERE NOT (state = "Himachal" OR state = "Assam");



-- ----> Special Operators

-- ----> BETWEEN IN IS LIKE

-- ----> IN BETWEEN LIKE
-- SELECT * FROM customers WHERE score BETWEEN 500 AND 6000;
-- SELECT * FROM customers WHERE state IN("Himachal","Assam");



-- ----> LIKE operator

--  SELECT * FROM customers WHERE name LIKE "s%";
--  SELECT * FROM customers WHERE state LIKE "H_m%";










-- ----> Creating table for IS 
-- CREATE TABLE emp(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(20), state VARCHAR(30)); 
-- INSERT INTO emp(name,state)
-- VALUES("Senku","Himachal"),
--       ("Shoyo",NULL),
--       ("Zenitsu","Goa"),
--       ("Ryuk",NULL),
--       ("Doflamingo","Punjab");

-- ----> Used IS operator 
-- SELECT * FROM emp WHERE state IS NULL;
-- SELECT * FROM emp WHERE state IS NOT NULL;







-- ----> Altering structure of table

-- ----> Rename a table

-- RENAME TABLE emp TO top_emp;

-- ALTER TABLE top_emp 
-- RENAME emp;

-- ----> Add column to table

-- ALTER TABLE emp
-- ADD COLUMN salary INT DEFAULT 10000;


-- ---->  drop column from table
-- ALTER TABLE emp
-- DROP COLUMN salary;

-- ----> drop primary key
-- ALTER TABLE emp
-- DROP PRIMARY KEY;

-- ----> Modify column using modify

-- ALTER TABLE emp
-- MODIFY COLUMN id VARCHAR(20) PRIMARY KEY;

-- ----> modify column using change
-- ALTER TABLE emp
-- CHANGE id id INT AUTO_INCREMENT;


-- ----> rename column using rename column
-- ALTER TABLE emp
-- RENAME COLUMN id TO emp_id;


-- ----> rename column using change
-- -- ALTER TABLE emp
-- -- CHANGE emp_id id INT AUTO_INCREMENT;



-- -- ----> DELETE command
-- -- DELETE FROM emp WHERE id = 3; 


-- -- ----> DROP TABLE
--  DROP TABLE employee1;


-- ----> Table for string functions
-- CREATE TABLE books(book_id INT PRIMARY KEY AUTO_INCREMENT,title VARCHAR(50),author_fname VARCHAR(30), author_lname VARCHAR(30),publishing_year INT,pages INT, stock_quantity INT);

--  INSERT INTO books(title,author_fname,author_lname,publishing_year,pages,stock_quantity)
--  VALUES
--  ("The monk and his monkey","Hinata","Shoyo",2012,300,13),
--  ("Life of a coder","Senku","Ishigami",2011,250,8),
--  ("The moon light","Ken","Kaneki",2008,190,12),
--  ("Saint or satan","Itachi","Uchiha",2001,321,3),
--  ("Give up on your dreams","Levi","Ackerman",1993,121,9),
--  ("News channels controlling the world","Vladimir","Putin",2021,13,2),
--  ("The information Era","Naruto","Uzumaki",1998,129,12),
--  ("Dream the world you want to fight for","Sasuke","Uchiha",1997,141,9);


-- SELECT CONCAT(title," by ",author_fname," ",author_lname) AS description FROM books;
-- SELECT CONCAT_WS(" ",title,"by",author_fname,author_lname) AS description FROM books;
-- SELECT SUBSTR(title,1,10) AS title FROM books;
-- SELECT CONCAT(SUBSTR(title,1,8),"...") As title , author_fname, pages, stock_quantity FROM books;
-- SELECT REPLACE(title,"The","This") AS title, author_fname, stock_quantity FROM books;
-- SELECT REVERSE(title) AS title_in_alian_language FROM books;
-- SELECT title,CHAR_LENGTH(title) AS title_length FROM books;
-- SELECT UPPER(title) AS title FROM books;
-- SELECT LOWER(title) AS title FROM books;


-- ----> Mysql Constraints
 
-- --> NOT NULL CONSTRAINT
-- ---> USING CREATE TABLE

-- CREATE TABLE employee1(emp_id INT NOT NULL, name VARCHAR(20), salary INT);

-- --> USING ALTER COMMAND

-- ALTER TABLE employee1
-- MODIFY COLUMN emp_id INT NOT NULL;

-- --> UNIQUE CONSTRAINT
-- ALTER TABLE employee1
-- MODIFY COLUMN emp_id INT NOT NULL UNIQUE;

-- --> To see all constraints of a table
-- SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE 
-- FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
-- WHERE TABLE_NAME = "employee1";




-- --> CHECK CONSTRAINT

-- ALTER TABLE employee1
-- MODIFY COLUMN salary INT CHECK(salary>=30000);

-- ALTER TABLE employee1
-- ADD CONSTRAINT CHECK(salary>=40000);

-- --> DROP A CONSTRAINT
-- ALTER TABLE employee1
-- DROP CONSTRAINT employee1_chk_1;

-- --> GIVING NAME TO CONSTRAINT
-- ALTER TABLE employee1
-- ADD CONSTRAINT chk_salary CHECK(salary>=40000);


-- --> DEFAULT CONSTRAINT
-- ALTER TABLE employee1
-- ALTER COLUMN name SET DEFAULT "UNNAMED";

-- --> DROP DEFAULT 
-- ALTER TABLE employee1
-- ALTER COLUMN name DROP DEFAULT;




-- --> just adding some values to employee1 

-- INSERT INTO employee1
-- VALUES(1,"Senku",60000),
-- (2,"Shoyo",120612),
-- (3,"Zoro",120063);

-- --> creating indexes

-- CREATE INDEX idx_name
-- ON employee1(name);

-- --> displaying all indexes for employee1

-- SHOW INDEXES FROM employee1;



-- ----> PRIMARY KEY CONSTRAINT

-- ALTER TABLE employee1
-- ADD PRIMARY KEY(emp_id);

-- ----> DROPING PRIMARY KEY CONSTRAINT

-- ALTER TABLE employee1
-- DROP PRIMARY KEY;








-- ----> ADDING FOREIGN KEY


CREATE TABLE departments( dep_id INT PRIMARY KEY AUTO_INCREMENT, 
                         state VARCHAR(40)

);

CREATE TABLE emp1(   emp_id INT AUTO_INCREMENT PRIMARY KEY,
                     name VARCHAR(40),
                     dep_id INT,
                     CONSTRAINT fk_EmpDepartment 
                     FOREIGN KEY(dep_id) REFERENCES departments(dep_id) );




-- -----> DROP FOREIGN KEY
ALTER TABLE emp1
DROP FOREIGN KEY Fk_EmpDepartment;


-- ----> ADDING FOREIGN KEY

ALTER TABLE emp1
ADD CONSTRAINT fk_EmpDepartment
FOREIGN KEY(dep_id) REFERENCES departments(dep_id);


-- ----> ADDING SOME DATA TO TABLES

INSERT INTO departments(state)
VALUES
("Himachal"),
("Punjab"),
("Delhi"),
("Assam");

INSERT INTO emp1(name,dep_id)
VALUES
("Shoyo",1),
("Senku",3),
("Zoro",4),
("Zenitsu",1),
("Naruto",4);


-- ----> CROSS JOIN

SELECT * FROM emp1 CROSS JOIN departments;

-- ----> USING WHERE CLAUSE WITH CROSS JOIN

SELECT * FROM emp1 CROSS JOIN departments 
WHERE emp1.dep_id = departments.dep_id;

-- ----> INNER JOIN

SELECT * FROM emp1 INNER JOIN departments
ON emp1.dep_id = departments.dep_id ;

-- ----> USING WHERE CLAUSE WITH INNER JOIN

SELECT emp_id, name, departments.dep_id, state
FROM emp1 INNER JOIN departments
ON emp1.dep_id = departments.dep_id
WHERE departments.dep_id = 1;

-- ----> LEFT JOIN

SELECT * FROM departments LEFT JOIN emp1
ON emp1.dep_id = departments.dep_id;

-- ----> USING WHERE CLAUSE WTIH LEFT JOIN

SELECT departments.dep_id , state 
FROM departments LEFT JOIN emp1
ON emp1.dep_id = departments.dep_id 
WHERE emp_id IS NULL;

-- ----> RIGHT JOIN

SELECT * FROM emp1 RIGHT JOIN departments
ON emp1.dep_id = departments.dep_id;

-- ----> USING WHERE CLAUSE WITH RIGHT JOIN

SELECT departments.dep_id , state 
FROM emp1 RIGHT JOIN departments 
ON emp1.dep_id = departments.dep_id
WHERE emp_id IS NULL;

-- --> CREATING TABLE FOR SELF JOIN

    CREATE TABLE emp2(  emp_id INT PRIMARY KEY,
                        name VARCHAR(30), 
                        manager_id INT);

    INSERT INTO emp2
    VALUES
    (1,"Senku",2),
    (2,"Shoyo",NULL),
    (3,"Zenitsu",1),
    (4,"Zoro",3),
    (5,"Naruto",1);

-- ----> SELF JOIN

SELECT e1.name AS employee, e2.name AS manager 
FROM emp2 e1 , emp2 e2
WHERE e1.manager_id= e2.emp_id;

-- ----> SELF JOIN USING LEFT JOIN

SELECT e1.name AS employee, e2.name AS manager 
FROM emp2 e1 LEFT JOIN emp2 e2
ON e1.manager_id = e2.emp_id;