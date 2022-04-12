

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






















-- ----> Altering structure of table

-- ----> Rename a table
-- RENAME arith TO maaath;





 