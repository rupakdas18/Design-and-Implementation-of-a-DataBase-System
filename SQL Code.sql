/*
Finnal Project DBMS by Rupak Kumar Das
Date 05/05/2021
Activity 2 (a), (c) (CS 4322: 50 pts. / CS 5322: 40 pts.): Implementation
*/

-- Creation of Walmart_Store table
CREATE TABLE Walmart_Store(Store_id int,
    location VARCHAR2(64),
    PRIMARY KEY (Store_id));
    
-- Creation of Provider table    
CREATE TABLE Provider(provider_name VARCHAR2(64),
    pro_address VARCHAR2(64),
    PRIMARY KEY (provider_name));
    
-- Creation of Client_info table      
CREATE TABLE Client_info(client_id int,
    client_name VARCHAR2(64),
    client_address VARCHAR2(64),
    client_phone VARCHAR2(64),
    is_vip_client VARCHAR2(64),
    birthday VARCHAR2(64),
    PRIMARY KEY (client_id));
    
-- Creation of Inventory table      
CREATE TABLE Inventory(product_id int,
    product_name VARCHAR2(64),
    quantity int,
    store_id int,
    PRIMARY KEY (product_id,store_id),
    FOREIGN KEY(store_id) REFERENCES Walmart_Store);

-- Creation of Employee_info table 
CREATE TABLE Employee_info(emp_id int,
    emp_name VARCHAR2(64),
    emp_address VARCHAR2(64),
    salary int,
    Store_id int,
    PRIMARY KEY (emp_id),
    FOREIGN KEY (Store_id)REFERENCES Walmart_Store);
    
-- Creation of Phones table   
CREATE TABLE Phones(emp_id int,
    phone VARCHAR2(64),
    PRIMARY KEY (emp_id,phone),
    FOREIGN KEY (emp_id)REFERENCES Employee_INFO);

-- Creation of Employee_type table  
CREATE TABLE Employee_type(emp_id int,
    emp_type VARCHAR2(64),
    PRIMARY KEY (emp_id,emp_type),
    FOREIGN KEY (emp_id)REFERENCES Employee_INFO);
    
-- Creation of Purchase table        
CREATE TABLE Purchase(purchase_id int,
    client_id int,
    pur_date DATE,
    amount int,
    emp_id int,
    PRIMARY KEY (purchase_id),
    FOREIGN KEY (emp_id)REFERENCES Employee_info,
    FOREIGN KEY (client_id)REFERENCES Client_info);
    
-- Creation of Purchase_list table    
CREATE TABLE Purchase_list(purchase_id int,
    product VARCHAR2(64),
    PRIMARY KEY (product,purchase_id),
    FOREIGN KEY (purchase_id)REFERENCES Purchase);
    
-- Creation of SUPPLIES table         
 CREATE TABLE SUPPLIES(product_id int,
    store_id int,
    provider_name VARCHAR2(64),
    PRIMARY KEY (product_id,provider_name),
    FOREIGN KEY (product_id,store_id)REFERENCES INVENTORY,
    FOREIGN KEY (provider_name)REFERENCES PROVIDER);     

-- Creation of Has table      
 CREATE TABLE Has(client_id int,
    store_id int,
    PRIMARY KEY (client_id,store_id),
    FOREIGN KEY (store_id)REFERENCES Walmart_Store,
    FOREIGN KEY (client_id)REFERENCES Client_INFO); 
    

-- Index creation
/*
Oracle SQL developer automatically crates Index for each table based on the
primary key. So, it didn't allow me to create indexes based on any primary key.
But I would like to create below indexes
*/

-- As employee table does not get update frequently and the size of this table
-- is huge, it will help to find the information of an employee quickly.
-- This is a primary dense index
CREATE INDEX emp_id_idx ON Employee_info(emp_id);

-- As walmart store table does not update frequently and its size can be huge,
-- an index is required for this table. This is a primary dense index

CREATE INDEX store_id_idx ON Walmart_store(store_id);

-- For the same reason as Employee_info table, it is also a good idea to create 
-- an index for phones table. This is a secondary index

CREATE INDEX phone_idx ON phones(phone);

/*
Data are inserted very frequently in Client_info, Inventory, Purchase,
Purchase_list, Supplies tables. So it is not a good idea to create an index
for those tables.
*/


-- Data Insertion

INSERT INTO WALMART_STORE VALUES(4001,'Duluth,MN');
INSERT INTO WALMART_STORE VALUES(4002,'Vermillion,SD');
INSERT INTO WALMART_STORE VALUES(4003,'Albany,NY');

INSERT INTO PROVIDER VALUES('Provider A','Duluth,MN');
INSERT INTO PROVIDER VALUES('Provider B','Vermillion,SD');
INSERT INTO PROVIDER VALUES('Provider C','Duluth,MN');
INSERT INTO PROVIDER VALUES('Provider D','Albany,NY');

INSERT INTO CLIENT_INFO VALUES(001,'Client 1','Duluth,MN','123456','YES','12,July');
INSERT INTO CLIENT_INFO VALUES(002,'Client 2','Vermillion,SD','234567','NO',NULL);
INSERT INTO CLIENT_INFO VALUES(003,'Client 3','Duluth,MN','456789','YES','9,February');
INSERT INTO CLIENT_INFO VALUES(004,'Client 4','Albany,NY','987436','NO',NULL);
INSERT INTO CLIENT_INFO VALUES(005,'Client 5','Duluth,MN','654678','YES','14,July');
INSERT INTO CLIENT_INFO VALUES(006,'Client 6','Vermillion,SD','342345','NO',NULL);
INSERT INTO CLIENT_INFO VALUES(007,'Client 7','Duluth,MN','897098','YES','32,June');
INSERT INTO CLIENT_INFO VALUES(008,'Client 8','Albany,NY','804519','NO',NULL);
INSERT INTO CLIENT_INFO VALUES(009,'Client 9','Duluth,MN','904376','YES','12,December');
INSERT INTO CLIENT_INFO VALUES(010,'Client 10','Vermillion,SD','378509','NO',NULL);
INSERT INTO CLIENT_INFO VALUES(011,'Client 11','Duluth,MN','127607','YES','3,June');
INSERT INTO CLIENT_INFO VALUES(012,'Client 12','Albany,NY','286490','NO',NULL);
INSERT INTO CLIENT_INFO VALUES(013,'Client 13','Duluth,MN','175387','YES','13,March');
INSERT INTO CLIENT_INFO VALUES(014,'Client 14','Vermillion,SD','543701','NO',NULL);
INSERT INTO CLIENT_INFO VALUES(015,'Client 15','Duluth,MN','457286','YES','17,July');
INSERT INTO CLIENT_INFO VALUES(016,'Client 16','Albany,NY','447734','NO',NULL);
INSERT INTO CLIENT_INFO VALUES(017,'Client 17','Duluth,MN','237795','YES','2,August');
INSERT INTO CLIENT_INFO VALUES(018,'Client 18','Vermillion,SD','212178','NO',NULL);
INSERT INTO CLIENT_INFO VALUES(019,'Client 19','Duluth,MN','800894','YES','5,September');
INSERT INTO CLIENT_INFO VALUES(020,'Client 20','Albany,NY','774533','NO',NULL);

INSERT INTO INVENTORY VALUES(123001,'Rice',100,4001);
INSERT INTO INVENTORY VALUES(123002,'Cake',76,4001);
INSERT INTO INVENTORY VALUES(123003,'Milk',30,4001);
INSERT INTO INVENTORY VALUES(123004,'Egg',123,4001);
INSERT INTO INVENTORY VALUES(123005,'Chicken',65,4001);
INSERT INTO INVENTORY VALUES(123006,'Cookies',119,4001);
INSERT INTO INVENTORY VALUES(123007,'Chips',79,4001);
INSERT INTO INVENTORY VALUES(123008,'Oil',53,4001);
INSERT INTO INVENTORY VALUES(123009,'Sugar',64,4001);
INSERT INTO INVENTORY VALUES(123010,'Salt',87,4001);
INSERT INTO INVENTORY VALUES(123011,'Card',32,4001);
INSERT INTO INVENTORY VALUES(123012,'Glass',65,4001);
INSERT INTO INVENTORY VALUES(123013,'Onion',100,4001);
INSERT INTO INVENTORY VALUES(123014,'Tomato',128,4001);
INSERT INTO INVENTORY VALUES(123015,'Ginger',43,4001);
INSERT INTO INVENTORY VALUES(123016,'Mix Vegtables',128,4001);
INSERT INTO INVENTORY VALUES(123017,'Bulb',54,4001);
INSERT INTO INVENTORY VALUES(123018,'T-shirt',87,4001);
INSERT INTO INVENTORY VALUES(123019,'Orange',45,4001);
INSERT INTO INVENTORY VALUES(123020,'Apple',30,4001);
INSERT INTO INVENTORY VALUES(123001,'Rice',145,4002);
INSERT INTO INVENTORY VALUES(123002,'Cake',176,4002);
INSERT INTO INVENTORY VALUES(123003,'Milk',130,4002);
INSERT INTO INVENTORY VALUES(123004,'Egg',233,4002);
INSERT INTO INVENTORY VALUES(123005,'Chicken',165,4002);
INSERT INTO INVENTORY VALUES(123006,'Cookies',323,4002);
INSERT INTO INVENTORY VALUES(123007,'Chips',56,4002);
INSERT INTO INVENTORY VALUES(123008,'Oil',53,4002);
INSERT INTO INVENTORY VALUES(123009,'Sugar',96,4002);
INSERT INTO INVENTORY VALUES(123010,'Salt',54,4002);
INSERT INTO INVENTORY VALUES(123011,'Card',32,4002);
INSERT INTO INVENTORY VALUES(123012,'Glass',24,4002);
INSERT INTO INVENTORY VALUES(123013,'Onion',109,4002);
INSERT INTO INVENTORY VALUES(123014,'Tomato',265,4002);
INSERT INTO INVENTORY VALUES(123015,'Ginger',60,4002);
INSERT INTO INVENTORY VALUES(123016,'Mix Vegtables',45,4002);
INSERT INTO INVENTORY VALUES(123017,'Bulb',87,4002);
INSERT INTO INVENTORY VALUES(123018,'T-shirt',56,4002);
INSERT INTO INVENTORY VALUES(123019,'Orange',32,4002);
INSERT INTO INVENTORY VALUES(123020,'Apple',98,4002);
INSERT INTO INVENTORY VALUES(123001,'Rice',234,4003);
INSERT INTO INVENTORY VALUES(123002,'Cake',76,4003);
INSERT INTO INVENTORY VALUES(123003,'Milk',243,4003);
INSERT INTO INVENTORY VALUES(123004,'Egg',233,4003);
INSERT INTO INVENTORY VALUES(123005,'Chicken',987,4003);
INSERT INTO INVENTORY VALUES(123006,'Cookies',675,4003);
INSERT INTO INVENTORY VALUES(123007,'Chips',987,4003);
INSERT INTO INVENTORY VALUES(123008,'Oil',345,4003);
INSERT INTO INVENTORY VALUES(123009,'Sugar',87,4003);
INSERT INTO INVENTORY VALUES(123010,'Salt',234,4003);
INSERT INTO INVENTORY VALUES(123011,'Card',98,4003);
INSERT INTO INVENTORY VALUES(123012,'Glass',78,4003);
INSERT INTO INVENTORY VALUES(123013,'Onion',735,4003);
INSERT INTO INVENTORY VALUES(123014,'Tomato',365,4003);
INSERT INTO INVENTORY VALUES(123015,'Ginger',160,4003);
INSERT INTO INVENTORY VALUES(123016,'Mix Vegtables',45,4003);
INSERT INTO INVENTORY VALUES(123017,'Bulb',87,4003);
INSERT INTO INVENTORY VALUES(123018,'T-shirt',56,4003);
INSERT INTO INVENTORY VALUES(123019,'Orange',32,4003);
INSERT INTO INVENTORY VALUES(123020,'Apple',98,4003);

INSERT INTO EMPLOYEE_INFO VALUES(1001,'Employee 1','Duluth,MN',60000,4001);
INSERT INTO EMPLOYEE_INFO VALUES(1002,'Employee 2','Duluth,MN',40000,4001);
INSERT INTO EMPLOYEE_INFO VALUES(1003,'Employee 2','Duluth,MN',23000,4001);
INSERT INTO EMPLOYEE_INFO VALUES(1004,'Employee 2','Duluth,MN',20000,4001);
INSERT INTO EMPLOYEE_INFO VALUES(1005,'Employee 3','Vermillion,SD',60000,4002);
INSERT INTO EMPLOYEE_INFO VALUES(1006,'Employee 4','Vermillion,SD',40000,4002);
INSERT INTO EMPLOYEE_INFO VALUES(1007,'Employee 4','Vermillion,SD',23000,4002);
INSERT INTO EMPLOYEE_INFO VALUES(1008,'Employee 4','Vermillion,SD',20000,4002);
INSERT INTO EMPLOYEE_INFO VALUES(1009,'Employee 2','Albany,NY',60000,4003);
INSERT INTO EMPLOYEE_INFO VALUES(1010,'Employee 2','Albany,NY',40000,4003);
INSERT INTO EMPLOYEE_INFO VALUES(1011,'Employee 2','Albany,NY',23000,4003);
INSERT INTO EMPLOYEE_INFO VALUES(1012,'Employee 2','Albany,NY',20000,4003);

INSERT INTO PHONES VALUES(1001,'234321'); 
INSERT INTO PHONES VALUES(1001,'765654');
INSERT INTO PHONES VALUES(1002,'876654'); 
INSERT INTO PHONES VALUES(1003,'654323');
INSERT INTO PHONES VALUES(1004,'453213'); 
INSERT INTO PHONES VALUES(1004,'443212');
INSERT INTO PHONES VALUES(1005,'565543'); 
INSERT INTO PHONES VALUES(1006,'990077');
INSERT INTO PHONES VALUES(1007,'552312'); 
INSERT INTO PHONES VALUES(1008,'5557643');
INSERT INTO PHONES VALUES(1008,'564442'); 
INSERT INTO PHONES VALUES(1009,'887666');
INSERT INTO PHONES VALUES(1009,'342221'); 
INSERT INTO PHONES VALUES(1010,'658812');
INSERT INTO PHONES VALUES(1011,'560987'); 
INSERT INTO PHONES VALUES(1012,'500087');

INSERT INTO employee_type VALUES(1001,'Manager');
INSERT INTO employee_type VALUES(1002,'Assistant Manager');
INSERT INTO employee_type VALUES(1003,'Cashier');
INSERT INTO employee_type VALUES(1004,'Cleaner');
INSERT INTO employee_type VALUES(1005,'Manager');
INSERT INTO employee_type VALUES(1006,'Assistant Manager');
INSERT INTO employee_type VALUES(1007,'Cashier');
INSERT INTO employee_type VALUES(1008,'Cleaner');
INSERT INTO employee_type VALUES(1009,'Manager');
INSERT INTO employee_type VALUES(1010,'Assistant Manager');
INSERT INTO employee_type VALUES(1011,'Cashier');
INSERT INTO employee_type VALUES(1012,'Cleaner');

INSERT INTO purchase VALUES(900001,001,'29-JAN-21',100.76,1003);
INSERT INTO purchase VALUES(900017,001,'12-FEB-21',78.56,1003);
INSERT INTO purchase VALUES(900034,003,'13-JAN-21',24.76,1003);
INSERT INTO purchase VALUES(900087,003,'22-JAN-21',101.44,1003);
INSERT INTO purchase VALUES(900094,005,'19-JAN-21',99.34,1003);
INSERT INTO purchase VALUES(900099,007,'4-JAN-21',87.01,1003);
INSERT INTO purchase VALUES(900107,009,'11-JAN-21',32.51,1003);
INSERT INTO purchase VALUES(900109,011,'4-FEB-21',43.65,1003);
INSERT INTO purchase VALUES(900111,013,'29-MAR-21',87.34,1003);
INSERT INTO purchase VALUES(900120,002,'6-JAN-21',44.99,1007);
INSERT INTO purchase VALUES(900138,002,'22-FEB-21',87.76,1007);
INSERT INTO purchase VALUES(900145,006,'29-MAR-21',231.43,1007);
INSERT INTO purchase VALUES(900166,010,'12-JAN-21',45.67,1007);
INSERT INTO purchase VALUES(900169,014,'2-JAN-21',213.67,1007);
INSERT INTO purchase VALUES(900177,018,'5-FEB-21',34.67,1007);
INSERT INTO purchase VALUES(900199,004,'30-JAN-21',123.76,1011);
INSERT INTO purchase VALUES(900211,008,'11-FEB-21',145.65,1011);
INSERT INTO purchase VALUES(900220,012,'22-MAR-21',49.65,1011);
INSERT INTO purchase VALUES(900223,016,'11-JAN-21',81.54,1011);
INSERT INTO purchase VALUES(900256,020,'7-JAN-21',169.65,1011);
INSERT INTO purchase VALUES(900299,020,'13-FEB-21',123.45,1011);
INSERT INTO purchase VALUES(900305,015,'7-JAN-21',176.85,1003);
INSERT INTO purchase VALUES(900308,017,'13-JAN-21',230.65,1003);
INSERT INTO purchase VALUES(900309,019,'22-JAN-21',97.60,1003);

INSERT INTO PURCHASE_LIST VALUES(900001,'Milk');
INSERT INTO PURCHASE_LIST VALUES(900001,'Rice');
INSERT INTO PURCHASE_LIST VALUES(900001,'Chicken');
INSERT INTO PURCHASE_LIST VALUES(900017,'Card');
INSERT INTO PURCHASE_LIST VALUES(900017,'Cookies');
INSERT INTO PURCHASE_LIST VALUES(900034,'Onion');
INSERT INTO PURCHASE_LIST VALUES(900034,'Rice');
INSERT INTO PURCHASE_LIST VALUES(900087,'Rice');
INSERT INTO PURCHASE_LIST VALUES(900094,'Chicken');
INSERT INTO PURCHASE_LIST VALUES(900094,'Rice');
INSERT INTO PURCHASE_LIST VALUES(900099,'Egg');
INSERT INTO PURCHASE_LIST VALUES(900099,'Sugar');
INSERT INTO PURCHASE_LIST VALUES(900099,'Salt');
INSERT INTO PURCHASE_LIST VALUES(900107,'Milk');
INSERT INTO PURCHASE_LIST VALUES(900109,'Cookies');
INSERT INTO PURCHASE_LIST VALUES(900109,'Chicken');
INSERT INTO PURCHASE_LIST VALUES(900111,'Oil');
INSERT INTO PURCHASE_LIST VALUES(900111,'Sugar');
INSERT INTO PURCHASE_LIST VALUES(900111,'Bulb');
INSERT INTO PURCHASE_LIST VALUES(900120,'T-shirt');
INSERT INTO PURCHASE_LIST VALUES(900120,'Bulb');
INSERT INTO PURCHASE_LIST VALUES(900138,'Sugar');
INSERT INTO PURCHASE_LIST VALUES(900138,'Tomato');
INSERT INTO PURCHASE_LIST VALUES(900138,'Cookies');
INSERT INTO PURCHASE_LIST VALUES(900145,'Glass');
INSERT INTO PURCHASE_LIST VALUES(900145,'bulb');
INSERT INTO PURCHASE_LIST VALUES(900166,'Apple');
INSERT INTO PURCHASE_LIST VALUES(900166,'Orange');
INSERT INTO PURCHASE_LIST VALUES(900169,'Mix Vegtables');
INSERT INTO PURCHASE_LIST VALUES(900169,'Egg');
INSERT INTO PURCHASE_LIST VALUES(900177,'Mix Vegtables');
INSERT INTO PURCHASE_LIST VALUES(900177,'Apple');
INSERT INTO PURCHASE_LIST VALUES(900199,'Cake');
INSERT INTO PURCHASE_LIST VALUES(900199,'Sugar');
INSERT INTO PURCHASE_LIST VALUES(900211,'Ginger');
INSERT INTO PURCHASE_LIST VALUES(900220,'Glass');
INSERT INTO PURCHASE_LIST VALUES(900223,'Chicken');
INSERT INTO PURCHASE_LIST VALUES(900223,'Tomato');
INSERT INTO PURCHASE_LIST VALUES(900256,'T-shirt');
INSERT INTO PURCHASE_LIST VALUES(900256,'Cookies');
INSERT INTO PURCHASE_LIST VALUES(900299,'Sugar');
INSERT INTO PURCHASE_LIST VALUES(900299,'T-shirt');
INSERT INTO PURCHASE_LIST VALUES(900299,'Oil');
INSERT INTO PURCHASE_LIST VALUES(900305,'Oil');
INSERT INTO PURCHASE_LIST VALUES(900305,'Chicken');
INSERT INTO PURCHASE_LIST VALUES(900308,'Glass');
INSERT INTO PURCHASE_LIST VALUES(900308,'Apple');
INSERT INTO PURCHASE_LIST VALUES(900309,'Oil');
INSERT INTO PURCHASE_LIST VALUES(900309,'Apple');

INSERT INTO SUPPLIES VALUES(123001,'4001','Provider A');
INSERT INTO SUPPLIES VALUES(123002,'4001','Provider A');
INSERT INTO SUPPLIES VALUES(123003,'4002','Provider A');
INSERT INTO SUPPLIES VALUES(123004,'4001','Provider A');
INSERT INTO SUPPLIES VALUES(123005,'4002','Provider A');
INSERT INTO SUPPLIES VALUES(123006,'4001','Provider A');
INSERT INTO SUPPLIES VALUES(123007,'4003','Provider A');
INSERT INTO SUPPLIES VALUES(123008,'4001','Provider A');
INSERT INTO SUPPLIES VALUES(123009,'4002','Provider A');
INSERT INTO SUPPLIES VALUES(123010,'4002','Provider A');
INSERT INTO SUPPLIES VALUES(123011,'4002','Provider B');
INSERT INTO SUPPLIES VALUES(123012,'4002','Provider B');
INSERT INTO SUPPLIES VALUES(123013,'4003','Provider B');
INSERT INTO SUPPLIES VALUES(123014,'4001','Provider B');
INSERT INTO SUPPLIES VALUES(123015,'4003','Provider B');
INSERT INTO SUPPLIES VALUES(123016,'4003','Provider B');
INSERT INTO SUPPLIES VALUES(123017,'4003','Provider B');
INSERT INTO SUPPLIES VALUES(123018,'4001','Provider B');
INSERT INTO SUPPLIES VALUES(123019,'4003','Provider B');
INSERT INTO SUPPLIES VALUES(123020,'4003','Provider B');
INSERT INTO SUPPLIES VALUES(123006,'4003','Provider C');
INSERT INTO SUPPLIES VALUES(123007,'4003','Provider C');
INSERT INTO SUPPLIES VALUES(123008,'4002','Provider C');
INSERT INTO SUPPLIES VALUES(123009,'4002','Provider C');
INSERT INTO SUPPLIES VALUES(123010,'4003','Provider C');
INSERT INTO SUPPLIES VALUES(123011,'4003','Provider C');
INSERT INTO SUPPLIES VALUES(123012,'4002','Provider C');
INSERT INTO SUPPLIES VALUES(123013,'4001','Provider C');
INSERT INTO SUPPLIES VALUES(123014,'4003','Provider C');
INSERT INTO SUPPLIES VALUES(123015,'4001','Provider C');
INSERT INTO SUPPLIES VALUES(123016,'4003','Provider C');
INSERT INTO SUPPLIES VALUES(123017,'4003','Provider C');
INSERT INTO SUPPLIES VALUES(123018,'4002','Provider C');
INSERT INTO SUPPLIES VALUES(123019,'4003','Provider C');
INSERT INTO SUPPLIES VALUES(123020,'4002','Provider C');

INSERT INTO HAS VALUES(001,4001);
INSERT INTO HAS VALUES(002,4001);
INSERT INTO HAS VALUES(003,4001);
INSERT INTO HAS VALUES(004,4001);
INSERT INTO HAS VALUES(005,4001);
INSERT INTO HAS VALUES(006,4001);
INSERT INTO HAS VALUES(007,4001);
INSERT INTO HAS VALUES(001,4002);
INSERT INTO HAS VALUES(008,4002);
INSERT INTO HAS VALUES(009,4002);
INSERT INTO HAS VALUES(010,4002);
INSERT INTO HAS VALUES(011,4002);
INSERT INTO HAS VALUES(012,4002);
INSERT INTO HAS VALUES(013,4002);
INSERT INTO HAS VALUES(014,4003);
INSERT INTO HAS VALUES(015,4003);
INSERT INTO HAS VALUES(016,4003);
INSERT INTO HAS VALUES(017,4003);
INSERT INTO HAS VALUES(018,4003);
INSERT INTO HAS VALUES(019,4003);
INSERT INTO HAS VALUES(020,4003);



---------- Quesry One -----------
SELECT DISTINCT product, p.client_id
FROM Purchase p INNER JOIN Purchase_list pl ON p.purchase_id=pl.purchase_id
WHERE p.client_id=2;


---------- Quesry two -----------
SELECT  client_name, store_id, totalcost
FROM (SELECT SUM(p.amount) AS totalcost,c.client_name, store_id,row_number() OVER (PARTITION BY store_id ORDER BY SUM(p.amount) DESC)
    FROM Purchase p JOIN HAS h ON p.client_id=h.client_id
    JOIN client_info c ON p.client_id=c.client_id 
    WHERE pur_date BETWEEN '01-JAN-2021' AND '30-JAN-2021'
    GROUP BY c.client_name,store_id
    ORDER BY (row_number() OVER (PARTITION BY store_id ORDER BY SUM(p.amount) DESC)),store_id)     
WHERE ROWNUM<=3;


