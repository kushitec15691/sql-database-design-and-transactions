-----TASK 1: Create the sequence 'my_seq' to generate the value for next tasks----
CREATE SEQUENCE my_seq 
	START WITH 1 
	INCREMENT BY 1;

-----TASK 2: Create the tables, constraints----

-- Create table CUSTOMER
CREATE TABLE CUSTOMER(
	cust_id 	VARCHAR2(10), 
    username 	VARCHAR2(20) NOT NULL, 
    passwd 		VARCHAR2(20) NOT NULL, 
    first_name 	VARCHAR2(20) NOT NULL, 
    last_name 	VARCHAR2(20) NOT NULL, 
    credit_type VARCHAR2(20) NOT NULL, 
    phone 		NUMBER,
	CONSTRAINT customer_cust_id_pk PRIMARY KEY (cust_id),
	CONSTRAINT customer_username_uq UNIQUE (username),
	CONSTRAINT customer_credit_type_ck CHECK (credit_type IN ('high', 'average', 'low')));

-- Create table CUST_ORDER
CREATE TABLE CUST_ORDER(
	ord_id 		NUMBER DEFAULT my_seq.NEXTVAL,
	cust_id 	VARCHAR2(10) NOT NULL,
	order_date 	DATE DEFAULT SYSDATE NOT NULL,
	CONSTRAINT cust_order_ord_id_pk PRIMARY KEY (ord_id),
	CONSTRAINT cust_order_cust_id_fk FOREIGN KEY(cust_id) REFERENCES CUSTOMER(cust_id));
	
-- Create table PROD_GROUP
CREATE TABLE PROD_GROUP(
	group_id 	VARCHAR2(20),
	group_name 	VARCHAR2(50) NOT NULL,
	CONSTRAINT prod_group_group_id_pk PRIMARY KEY (group_id));
	
-- Create table PRODUCT
CREATE TABLE PRODUCT(
	prod_id 	VARCHAR2(20),
	group_id 	VARCHAR2(20) NOT NULL,
	prod_name 	VARCHAR2(100) NOT NULL,
	price 		NUMBER NOT NULL,
	CONSTRAINT product_prod_id_pk PRIMARY KEY (prod_id),
	CONSTRAINT	product_group_id_fk FOREIGN KEY(group_id) REFERENCES PROD_GROUP(group_id));

-- Create table PROD_PICT
CREATE TABLE PROD_PICT(
	pict_id 	VARCHAR2(20),
	prod_id 	VARCHAR2(20) NOT NULL,
	file_type 	VARCHAR2(20) NOT NULL,
	width 		NUMBER NOT NULL,
	height 		NUMBER NOT NULL,
	path 		VARCHAR2(200) NOT NULL,
	CONSTRAINT prod_pict_pict_id_pk PRIMARY KEY (pict_id),
	CONSTRAINT prod_pict_prod_id_fk FOREIGN KEY(prod_id) REFERENCES PRODUCT(prod_id),
	CONSTRAINT prod_pict_file_type_ck CHECK(file_type IN('gif','jpg')));

-- Create table CART
CREATE TABLE CART(
	row_id 		NUMBER DEFAULT my_seq.NEXTVAL,
	ord_id 		NUMBER NOT NULL,
	prod_id 	VARCHAR2(20) NOT NULL,
	quantity 	NUMBER NOT NULL,
	CONSTRAINT cart_row_id_pk PRIMARY KEY (row_id),
	CONSTRAINT cart_ord_id_fk FOREIGN KEY(ord_id) REFERENCES CUST_ORDER(ord_id),
	CONSTRAINT cart_prod_id_fk FOREIGN KEY(prod_id) REFERENCES PRODUCT(prod_id));
-- CART contains some dependent constraints (that depend on other tables) so create CART last


----TASK 3: Insert data for the table CUSTOMER----
--INSERT INTO CUSTOMER (cust_id, username, passwd, first_name, last_name, credit_type, phone)
INSERT INTO CUSTOMER
	VALUES ('DUV24001', 'h20vivna', '123456789', 'Vivian', 'Nankya', 'high', 0700106493);
INSERT INTO CUSTOMER	
	VALUES ('DUV24002', 'v24kucha', '246813579', 'Kushmi', 'Chandrasena', 'high', 0739853624);
INSERT INTO CUSTOMER
	VALUES ('DUV24003', 'v24huyph', '11022020', 'Huy', 'Pham', 'average', 0722168083);

----TASK 4: Insert data for the table PROD_GROUP----
INSERT INTO PROD_GROUP
	VALUES ('CAT001','Bakery');
INSERT INTO PROD_GROUP
	VALUES ('CAT002','Dairy');

----TASK 5: Insert data for the table PRODUCT----
INSERT INTO PRODUCT
	VALUES ('PROD123','CAT001','White Bread', 23.00);
INSERT INTO PRODUCT
	VALUES ('PROD456','CAT002','Greek Yogurt', 35.00);

----TASK 6: Insert/Generate data for the table CUST_ORDER----
-- Create the order and match with the customer first
INSERT INTO CUST_ORDER (ord_id, cust_id) 
    VALUES (my_seq.NEXTVAL, 'DUV24001');
	
-- Create the order and products bought by adding the info into CART
INSERT INTO CART (ord_id, prod_id, quantity)
	VALUES ((SELECT MAX(ord_id) FROM CUST_ORDER WHERE cust_id = 'DUV24001'),'PROD123',3);
	-- Select the highest ord_id to select the most recent transacion before inserting to CART

INSERT INTO CART (ord_id, prod_id, quantity)
	VALUES ((SELECT MAX(ord_id) FROM CUST_ORDER WHERE cust_id = 'DUV24001'),'PROD456',5);

----TASK 7: Update the price on all products----
UPDATE PRODUCT
    SET price = price * 1.12;

----TASK 8: Update the phone number----
UPDATE CUSTOMER
    SET phone = 0722168038 
    WHERE cust_id = 'DUV24003';
--Change the phone no of user DUV24003 from '0722168083' to '0722168038' 

----TASK 9: Delete all rows from the CUST_ORDER----
DELETE FROM CUST_ORDER;

-- It fails due to FK from the CART table refers to ord_id (PK) in CUST_ORDER
-- In this case, we must delete all data in CART, or delete the constraint FK 
-- before deleting the rows in CUST_ORDER
	
	



	

