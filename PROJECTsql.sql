DROP TABLE EMPLOYEE;
CREATE TABLE EMPLOYEE
( 
   E_ID INT PRIMARY KEY,
   E_NAME VARCHAR(20),
   E_SAL INT,
   E_MAIL VARCHAR(20),
   E_DOB DATE,
   S_ID INT
);
CREATE TABLE "STORE"
(
   S_ID INT PRIMARY KEY,
   S_LOCATION VARCHAR(20),
   M_ID INT,
   FOREIGN KEY (M_ID) REFERENCES EMPLOYEE(E_ID)
);
ALTER TABLE EMPLOYEE
ADD FOREIGN KEY (S_ID) REFERENCES "STORE"(S_ID);

CREATE TABLE EMP_PHN
(
E_ID INT,
E_PHN VARCHAR(20),
PRIMARY KEY(E_PHN,E_ID),
FOREIGN KEY (E_ID) REFERENCES EMPLOYEE(E_ID)
 );
 DROP TABLE EMP_PHN;
 CREATE TABLE CATEGORY
 (
 CAT_ID INT PRIMARY KEY,
 CAT_NAME VARCHAR(20)
 );
 CREATE TABLE ITEMS
 (
 I_ID INT PRIMARY KEY,
 I_NAME VARCHAR(20),
 I_PRICE INT,
 CAT_ID INT,
 FOREIGN KEY (CAT_ID) REFERENCES CATEGORY(CAT_ID)
 );
 CREATE TABLE SUPPLIERS
 (
 SUP_ID INT PRIMARY KEY,
 SUP_NAME VARCHAR(20)
 );
 CREATE TABLE SUPPLIES
 (
 SUP_ID INT ,
 I_ID INT,
 PRIMARY KEY(SUP_ID,I_ID),
 FOREIGN KEY(SUP_ID) REFERENCES SUPPLIERS(SUP_ID),
 FOREIGN KEY(I_ID) REFERENCES ITEMS(I_ID)
 );
 CREATE TABLE CONTAINS
 (
 S_ID INT ,
 I_ID INT,
 PRIMARY KEY(S_ID,I_ID),
 FOREIGN KEY(S_ID) REFERENCES "STORE"(S_ID),
 FOREIGN KEY(I_ID) REFERENCES ITEMS(I_ID)
 );
 CREATE TABLE CUSTOMER
 (
 C_ID INT PRIMARY KEY,
 C_NAME VARCHAR(20),
 C_MAIL VARCHAR(20)
 );
 CREATE TABLE C_PHN
 (
  C_ID INT ,
 C_NUM INT,
 PRIMARY KEY(C_ID,C_NUM),
 FOREIGN KEY (C_ID) REFERENCES CUSTOMER(C_ID)
 );
-- DROP TABLE COUPON
 CREATE TABLE COUPON
 (
 COUPON_NUM INT,
 C_ID INT,
 C_OFFER INT,
 C_EXPIRY DATE,
 PRIMARY KEY(COUPON_NUM,C_ID),
 FOREIGN KEY (C_ID) REFERENCES CUSTOMER(C_ID)
 );
 CREATE TABLE BOUGHT
 (
 C_ID INT,
 I_ID INT,
 FINAL_PRICE INT,
 QUANTITY INT,
 PRIMARY KEY(C_ID,I_ID),
 FOREIGN KEY (C_ID) REFERENCES CUSTOMER(C_ID),
 FOREIGN KEY (I_ID) REFERENCES ITEMS(I_ID)
 );
 CREATE TABLE PAYMENT
 (
 BILL_NO INT,
 C_ID INT,
 P_MOP VARCHAR(20),
 P_AMT INT,
 BILLING_TIME TIMESTAMP,
 E_ID INT,
 PRIMARY KEY(BILL_NO,C_ID),
 FOREIGN KEY(C_ID) REFERENCES CUSTOMER(C_ID),
 FOREIGN KEY(E_ID) REFERENCES EMPLOYEE(E_ID)
 );
 
DESC EMPLOYEE;
DESC EMP_PHN;
DESC STORE;
DESC CATEGORY;
DESC SUPPLIERS;
DESC ITEMS;
DESC SUPPLIES;
DESC CONTAINS;
DESC CUSTOMER;
DESC C_PHN;
DESC COUPON;
DESC BOUGHT;
DESC PAYMENT;

SELECT * FROM STORE;

INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (1, 'John', 50000, 'john@email.com', '01-01-1990', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (2, 'Sarah', 55000, 'sarah@email.com', '02-02-1991', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (3, 'Mike', 60000, 'mike@email.com', '03-03-1992', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (4, 'Emily', 65000, 'emily@email.com', '04-04-1993', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (5, 'David', 70000, 'david@email.com', '05-05-1994', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (6, 'Jessica', 75000, 'jessica@email.com', '06-06-1995', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (7, 'Mark', 80000, 'mark@email.com', '07-07-1996', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (8, 'Linda', 85000, 'linda@email.com', '08-08-1997', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (9, 'Brian', 90000, 'brian@email.com', '09-09-1997', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (10, 'Emma', 95000, 'emma@email.com', '10-10-1999', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (11, 'Kevin', 100000, 'kevin@email.com', '11-11-2000', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (12, 'Olivia', 105000, 'olivia@email.com', '12-12-2001', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (13, 'Jacob', 110000, 'jacob@email.com', '01-01-2002', NULL);
INSERT INTO employee (E_ID, E_NAME, E_SAL, E_MAIL, E_DOB, S_ID) VALUES (14, 'Avery', 115000, 'avery@email.com', '02-02-2003', NULL);
 DELETE  FROM EMPLOYEE;
 SELECT * FROM EMPLOYEE;
 
 INSERT INTO store (S_ID, S_LOCATION, M_ID) VALUES (1, 'New York', 1);
   INSERT INTO store (S_ID, S_LOCATION, M_ID) VALUES   (2, 'Los Angeles', 2);
  INSERT INTO store (S_ID, S_LOCATION, M_ID) VALUES    (3, 'Chicago', 3);
  SELECT * FROM STORE;
 
UPDATE  EMPLOYEE SET S_ID=1 WHERE E_ID IN (1,4,7);
UPDATE  EMPLOYEE SET S_ID=2 WHERE E_ID IN (2,5,8);
UPDATE  EMPLOYEE SET S_ID=3 WHERE E_ID IN (3,6,9,10);

INSERT INTO emp_phn (E_ID, E_PHN) VALUES (1, '123-456-7890');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (1, '987-654-3210');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (2, '555-555-5555');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (2, '111-111-1111');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (2, '222-222-2222');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (3, '333-333-3333');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (3, '444-444-4444');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (4, '555-555-5555');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (5, '666-666-6666');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (5, '777-777-7777');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (6, '888-888-8888');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (7, '999-999-9999');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (7, '111-222-3333');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (7, '444-555-6666');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (8, '777-777-7777');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (8, '888-888-8888');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (8, '999-999-9999');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (9, '111-111-1111');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (9, '222-222-2222');
INSERT INTO emp_phn (E_ID, E_PHN) VALUES (10, '333-333-3333');
SELECT * FROM EMP_PHN;

INSERT INTO suppliers (sup_id, sup_name) VALUES (1, 'Supplier A');
INSERT INTO suppliers (sup_id, sup_name) VALUES (2, 'Supplier B');
INSERT INTO suppliers (sup_id, sup_name) VALUES (3, 'Supplier C');
INSERT INTO suppliers (sup_id, sup_name) VALUES (4, 'Supplier D');
INSERT INTO suppliers (sup_id, sup_name) VALUES (5, 'Supplier E');
INSERT INTO suppliers (sup_id, sup_name) VALUES (6, 'Supplier F');
SELECT * FROM SUPPLIERS;

INSERT INTO category (cat_id, cat_name) VALUES (1, 'Category A');
INSERT INTO category (cat_id, cat_name) VALUES (2, 'Category B');
INSERT INTO category (cat_id, cat_name) VALUES (3, 'Category C');
INSERT INTO category (cat_id, cat_name) VALUES (4, 'Category D');
INSERT INTO category (cat_id, cat_name) VALUES (5, 'Category E');
SELECT * FROM CATEGORY;
DESC CATEGORY;

INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (1, 'Item A', 10, 1);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (2, 'Item B', 20, 2);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (3, 'Item C', 5, 3);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (4, 'Item D', 15, 4);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (5, 'Item E', 8, 5);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (6, 'Item F', 12, 1);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (7, 'Item G', 7, 2);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (8, 'Item H', 25, 3);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (9, 'Item I', 18, 4);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (10, 'Item J', 14, 5);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (11, 'Item K', 22, 1);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (12, 'Item L', 30, 2);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (13, 'Item M', 16, 3);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (14, 'Item N', 11, 4);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (15, 'Item O', 20, 5);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (16, 'Item P', 15, 1);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (17, 'Item Q', 12, 2);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (18, 'Item R', 28, 3);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (19, 'Item S', 32, 4);
INSERT INTO items (i_id, i_name, i_price, cat_id) VALUES (20, 'Item T', 19, 5);
SELECT * FROM ITEMS;
DESC ITEMS;


INSERT INTO supplies (i_id, sup_id) VALUES (1, 1);
INSERT INTO supplies (i_id, sup_id) VALUES (2, 1);
INSERT INTO supplies (i_id, sup_id) VALUES (3, 1);
INSERT INTO supplies (i_id, sup_id) VALUES (4, 2);
INSERT INTO supplies (i_id, sup_id) VALUES (5, 2);
INSERT INTO supplies (i_id, sup_id) VALUES (6, 2);
INSERT INTO supplies (i_id, sup_id) VALUES (7, 3);
INSERT INTO supplies (i_id, sup_id) VALUES (8, 3);
INSERT INTO supplies (i_id, sup_id) VALUES (9, 3);
INSERT INTO supplies (i_id, sup_id) VALUES (10, 4);
INSERT INTO supplies (i_id, sup_id) VALUES (11, 4);
INSERT INTO supplies (i_id, sup_id) VALUES (12, 4);
INSERT INTO supplies (i_id, sup_id) VALUES (13, 5);
INSERT INTO supplies (i_id, sup_id) VALUES (14, 5);
INSERT INTO supplies (i_id, sup_id) VALUES (15, 5);
INSERT INTO supplies (i_id, sup_id) VALUES (16, 6);
INSERT INTO supplies (i_id, sup_id) VALUES (17, 6);
INSERT INTO supplies (i_id, sup_id) VALUES (18, 6);
INSERT INTO supplies (i_id, sup_id) VALUES (19, 6);
INSERT INTO supplies (i_id, sup_id) VALUES (20, 6);

SELECT * FROM SUPPLIES;
DESC SUPPLIES;
delete from supplies;

INSERT INTO customer (c_id, c_name, c_mail) VALUES (1, 'John Smith', 'john@gmail.com');
INSERT INTO customer (c_id, c_name, c_mail) VALUES (2, 'Emily Brown', 'brown@gmail.com');
INSERT INTO customer (c_id, c_name, c_mail) VALUES (3, 'Jacob Lee', 'lee@gmail.com');
INSERT INTO customer (c_id, c_name, c_mail) VALUES (4, 'Sophie Davis', 'sop.gmail.com');
INSERT INTO customer (c_id, c_name, c_mail) VALUES (5, 'William Johnson', 'johnson@gmail.com');
INSERT INTO customer (c_id, c_name, c_mail) VALUES (6, 'Olivia Taylor', 'taylor@gmail.com');
INSERT INTO customer (c_id, c_name, c_mail) VALUES (7, 'Ethan Wilson', 'wilson@gmail.com');
select * from customer;


INSERT INTO coupon  VALUES (1, 1,5, '31-12-2023');
INSERT INTO coupon  VALUES (2, 2,6, '15-06-2024');
INSERT INTO coupon  VALUES (3, 3,7, '30-09-2023');
INSERT INTO coupon  VALUES (4, 4,8, '31-12-2024');
INSERT INTO coupon  VALUES (5, 5,9, '31-03-2025');
INSERT INTO coupon  VALUES (6, 6,10, '31-12-2023');
INSERT INTO coupon  VALUES (7, 7,11, '30-06-2024');
select * from coupon;
delete from coupon;
DESC COUPON;


INSERT INTO C_PHN (c_id, c_num) VALUES (1, '1234567890');
INSERT INTO C_PHN (c_id, c_num) VALUES (1, '9876543210');
INSERT INTO C_PHN (c_id, c_num) VALUES (2, '5555555555');
INSERT INTO C_PHN (c_id, c_num) VALUES (3, '1111111111');
INSERT INTO C_PHN (c_id, c_num) VALUES (4, '9999999999');
INSERT INTO C_PHN (c_id, c_num) VALUES (5, '7777777777');
INSERT INTO C_PHN (c_id, c_num) VALUES (6, '8888888888');
INSERT INTO C_PHN (c_id, c_num) VALUES (7, '5553331234');
INSERT INTO C_PHN (c_id, c_num) VALUES (5, '5554444321');
INSERT INTO C_PHN (c_id, c_num) VALUES (2, '5556665678');
SELECT * FROM C_PHN;




INSERT INTO contains (s_id, i_id) VALUES (1, 1);
INSERT INTO contains (s_id, i_id) VALUES (1, 2);
INSERT INTO contains (s_id, i_id) VALUES (1, 3);
INSERT INTO contains (s_id, i_id) VALUES (1, 4);
INSERT INTO contains (s_id, i_id) VALUES (1, 5);
INSERT INTO contains (s_id, i_id) VALUES (1, 6);
INSERT INTO contains (s_id, i_id) VALUES (1, 7);
INSERT INTO contains (s_id, i_id) VALUES (2, 8);
INSERT INTO contains (s_id, i_id) VALUES (2, 9);
INSERT INTO contains (s_id, i_id) VALUES (2, 10);
INSERT INTO contains (s_id, i_id) VALUES (2, 11);
INSERT INTO contains (s_id, i_id) VALUES (2, 12);
INSERT INTO contains (s_id, i_id) VALUES (2, 13);
INSERT INTO contains (s_id, i_id) VALUES (2, 14);
INSERT INTO contains (s_id, i_id) VALUES (3, 15);
INSERT INTO contains (s_id, i_id) VALUES (3, 16);
INSERT INTO contains (s_id, i_id) VALUES (3, 17);
INSERT INTO contains (s_id, i_id) VALUES (3, 18);
INSERT INTO contains (s_id, i_id) VALUES (3, 19);
INSERT INTO contains (s_id, i_id) VALUES (3, 20);
SELECT * FROM CONTAINS;
DELETE FROM CONTAINS;
DESC CONTAINS;

--CREATE TRIGGER COST_CAL
--BEFORE INSERT
--ON BOUGHT
--FOR EACH ROW
--DECLARE
--IND_PRICE INT;
--BEGIN
--SELECT ITEMS.I_PRICE INTO IND_PRICE  FROM ITEMS WHERE ITEMS.I_ID=:NEW.I_ID;
--:NEW.FINAL_PRICE:=:NEW.QUANTITY*IND_PRICE;
--END;
--/

DELETE  FROM  BOUGHT;
INSERT INTO  BOUGHT VALUES(1,1,20,2);
INSERT INTO  BOUGHT VALUES(1,2,20,1);
INSERT INTO  BOUGHT VALUES(1,3,15,3);
INSERT INTO  BOUGHT VALUES(2,8,50,2);
INSERT INTO  BOUGHT VALUES(2,9,18,1);
INSERT INTO  BOUGHT VALUES(2,10,42,3);
INSERT INTO  BOUGHT VALUES(3,15,40,2);
INSERT INTO  BOUGHT VALUES(3,16,15,1);
INSERT INTO  BOUGHT VALUES(3,17,36,3);
INSERT INTO  BOUGHT VALUES(4,18,140,5);
INSERT INTO  BOUGHT VALUES(4,19,64,2);
INSERT INTO  BOUGHT VALUES(5,4,60,4);
INSERT INTO  BOUGHT VALUES(6,11,44,2);
INSERT INTO  BOUGHT VALUES(7,20,19,1);
SELECT * FROM BOUGHT;

DESC BOUGHT;

--SELECT BOUGHT.C_ID,SUM(BOUGHT.FINAL_PRICE)  FROM BOUGHT GROUP BY BOUGHT.C_ID ORDER BY C_ID ASC;

--CREATE TRIGGER PAMT
--BEFORE INSERT
--ON PAYMENT
--FOR EACH ROW
--DECLARE
--DISCOUNT INT;
--B_DISCOUNT INT;
--BEGIN
--SELECT COUPON.C_OFFER INTO DISCOUNT  FROM COUPON WHERE :NEW.C_ID=COUPON.C_ID;
--SELECT ABC INTO B_DISCOUNT FROM 
--(SELECT BOUGHT.C_ID as dup_id,SUM(BOUGHT.FINAL_PRICE) AS  ABC
--FROM BOUGHT 
--GROUP BY BOUGHT.C_ID ORDER BY C_ID ASC)DT
--WHERE :NEW.C_ID=DT.dup_id;
--:NEW.P_AMT:=B_DISCOUNT-DISCOUNT;
--END;
--/
insert into payment values (1,1,'cash',50,TO_TIMESTAMP( '03-11-2001 03:22:10'),7);
insert into payment values (2,2,'card',104,TO_TIMESTAMP( '04-12-2001 04:20:11'),5);
insert into payment values (3,3,'cash',84,TO_TIMESTAMP( '05-01-2004 06:22:33'),10);
insert into payment values (4,4,'cash',196,TO_TIMESTAMP( '06-11-2006 03:18:10'),10);
insert into payment values (5,5,'cash',51,TO_TIMESTAMP( '05-04-2001 06:29:10'),7);
insert into payment values (6,6,'cash',34,TO_TIMESTAMP( '03-11-2001 03:22:10'),10);
insert into payment values (7,7,'cash',8,TO_TIMESTAMP( '03-06-2001 03:11:10'),10);
select * from payment;
DESC PAYMENT;


SELECT BOUGHT.C_ID as dup_id,SUM(BOUGHT.FINAL_PRICE) AS  ABC
FROM BOUGHT 
GROUP BY BOUGHT.C_ID ORDER BY C_ID ASC;
delete from payment;

select distinct s_id,c_id from store natural join (select * from bought natural join contains);

--Q1
--Write a query to find the revenue of store with store id 1.
select sum(p_amt) as revenue from payment  natural join 
(select distinct s_id,c_id from store natural join (select * from bought natural join contains)where s_id=1)x ;
 --Q2
 --write a query to find the supplier names who supplied the bought by customer 3.
select sup_name from suppliers 
natural join
  (select distinct sup_id from supplies 
      natural join  
     (select c_id,i_id from bought where c_id=3)x
   )y ;
--Q3
--write a query to select  the phone number of the employee who billed the purchases of customers who went to store 1
select E_phn from EMP_phn where e_id in ( select e_id from payment where (c_id,3) in ( select distinct s_id,c_id from store natural join (select * from bought natural join contains))); 

--q4
--write a query to select the name of the employee who billed the maximum number of transactions;
select e_name from employee natural join(
select e_id from(
select e_id,count(*) as no_of_billed from 
(select e_id from payment)
group by e_id
order by no_of_billed desc)x
fetch first 1 row only)y;
--q5
--list the name of the manager of store with max revenue;
select e_name from employee where e_id in(
select m_id from store where s_id in(
select s_id 
from 
(select c_id,sum(p_amt)as total from payment group by c_id)
natural join
(select distinct s_id,c_id from store natural join (select * from bought natural join contains))
order by total desc
fetch first 1 row only));

