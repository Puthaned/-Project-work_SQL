DROP TABLE EMPPOSITION CASCADE CONSTRAINTS;
DROP TABLE BRANCHS CASCADE CONSTRAINTS;
DROP TABLE ESALARY CASCADE CONSTRAINTS;
DROP TABLE PROTYPE CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE PROMOTION CASCADE CONSTRAINTS;
DROP TABLE EMP CASCADE CONSTRAINTS;
DROP TABLE CUSTOMERS CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;

DROP TABLE EmployeeList01 CASCADE CONSTRAINTS;
Drop view EmployeeList01;
  
  SELECT * FROM Procedure EmployeeShow01;
  
SELECT * FROM EmployeeList01;
SELECT * FROM CustomerView1;
SELECT * FROM BRANCHS;
SELECT * FROM CUSTOMERS;
SELECT * FROM EMP;
SELECT * FROM EMPPOSITION;
SELECT * FROM ESALARY;
SELECT * FROM ORDERDETAIL;
SELECT * FROM ORDERS;
SELECT * FROM PRODUCT;
SELECT * FROM PROTYPE;
SELECT * FROM PROMOTION;


CREATE TABLE EMPPOSITION (
       EMPPOSTID                CHAR(4) NOT NULL,
       EMPPOSTDESC              VARCHAR2(30),
       CONSTRAINT EMPPOSITION_PK       PRIMARY KEY (EMPPOSTID));


CREATE TABLE BRANCHS (
       BRANCHID                 CHAR(3) NOT NULL,
       BRANCHSIZE               VARCHAR2(25),
       BADDR                    VARCHAR2(80),
       ZIPCODE                CHAR(5),
       TEL                      CHAR(10),
       CONSTRAINT BRANCHS_PK       PRIMARY KEY (BRANCHID));


CREATE TABLE ESALARY (
       BRANCHID                 CHAR(3) NOT NULL,
       EMPPOSTID                CHAR(4) NOT NULL,
       SALARY                   NUMBER(5),
       CONSTRAINT ESALARY_PK       PRIMARY KEY (BRANCHID, EMPPOSTID), 
       CONSTRAINT ESALARY_FK1       FOREIGN KEY  (EMPPOSTID) REFERENCES EMPPOSITION (EMPPOSTID), 
       CONSTRAINT ESALARY_FK2       FOREIGN KEY  (BRANCHID) REFERENCES BRANCHS(BRANCHID));


CREATE TABLE PROTYPE (
    PROTYPEID        CHAR(3),
    PROTYPEDESC        VARCHAR2(150),
    CONSTRAINT PROTYPE_PK PRIMARY KEY (PROTYPEID));


CREATE TABLE PRODUCT (
       PID                        CHAR(4) NOT NULL,
       PROTYPEID                CHAR(3),
       PNAME                    VARCHAR2(200),
       WEIGHTPERPACK               VARCHAR2(100),
       DESPRO                     VARCHAR2(120),
       UNITPRICE                NUMBER(4),
       UNITCOST                 NUMBER(4),
       QOH                      NUMBER(4),
       CONSTRAINT PKPRODUCT_PK       PRIMARY KEY (PID), 
       CONSTRAINT PKPRODUCT_FK       FOREIGN KEY  (PROTYPEID) REFERENCES PROTYPE (PROTYPEID));


CREATE TABLE PROMOTION (
       PROMOTIONID              CHAR(5) NOT NULL,
       PID                    CHAR(4),
       STARTDATE                DATE,
       ENDDATE                  DATE,
       DISCOUNT                 NUMBER(3,2),
       CONSTRAINT PROMOTION_PK       PRIMARY KEY (PROMOTIONID), 
       CONSTRAINT PROMOTION_FK       FOREIGN KEY  (PID) REFERENCES PRODUCT (PID));


CREATE TABLE EMP (
       EMPID                    CHAR(5) NOT NULL,
       EMPPOSTID                CHAR(4),
       BRANCHID                 CHAR(3),
       EMPFNAME                 VARCHAR2(80),
       EMPLNAME                 VARCHAR2(80),
       EADDR                  VARCHAR2(100),
       ZIPCODE                  CHAR(5),
       TEL                    CHAR(10),
       BIRTHDATE                DATE,
       STARTDATE             DATE,
       CONSTRAINT EMP_PK       PRIMARY KEY (EMPID), 
       CONSTRAINT EMP_FK1       FOREIGN KEY  (EMPPOSTID) REFERENCES EMPPOSITION (EMPPOSTID), 
       CONSTRAINT EMP_FK2       FOREIGN KEY  (BRANCHID) REFERENCES BRANCHS (BRANCHID));


CREATE TABLE CUSTOMERS (
       CUSTID                   CHAR(5) NOT NULL,
       BRANCHID                 CHAR(3),
       EMPID                    CHAR(5),
       CUSTFNAME                VARCHAR2(50),
       CUSTLNAME                VARCHAR2(50),
       CADDR                    VARCHAR2(80),
       ZIPCODE                CHAR(5),
       TEL                   CHAR(10),
       BIRTHDATE                DATE,
       REGISTERDATE             DATE,
       CONSTRAINT CUSTOMER_PK       PRIMARY KEY (CUSTID), 
       CONSTRAINT CUSTOMER_FK1       FOREIGN KEY  (BRANCHID) REFERENCES BRANCHS (BRANCHID), 
       CONSTRAINT CUSTOMER_FK2       FOREIGN KEY  (EMPID) REFERENCES EMP (EMPID));


CREATE TABLE ORDERS (
       ORDERID                  CHAR(4) NOT NULL,
       EMPID                    CHAR(5),
       BRANCHID                 CHAR(3),
       CUSTID                   CHAR(5),
       ORDERDATE                DATE,
       SHIPDATE                 DATE,
       TOTALPRICE                NUMBER(6),
       CONSTRAINT ORDERS_PK       PRIMARY KEY (ORDERID), 
       CONSTRAINT ORDERS_FK1       FOREIGN KEY  (EMPID) REFERENCES EMP, 
       CONSTRAINT ORDERS_FK2       FOREIGN KEY  (BRANCHID) REFERENCES BRANCHS (BRANCHID), 
       CONSTRAINT ORDERS_FK3       FOREIGN KEY  (CUSTID) REFERENCES CUSTOMERS (CUSTID));


CREATE TABLE ORDERDETAIL (
       ORDERDETAILID              CHAR(4) NOT NULL,
       PID                    CHAR(4),
       ORDERID                  CHAR(4),
       QTY                      NUMBER(4),
       CONSTRAINT ORDERDETAIL_PK      PRIMARY KEY (ORDERDETAILID), 
       CONSTRAINT ORDERDETAIL_FK1       FOREIGN KEY  (PID) REFERENCES PRODUCT (PID), 
       CONSTRAINT ORDERDETAIL_FK2       FOREIGN KEY  (ORDERID) REFERENCES ORDERS (ORDERID));
	   


Insert into empposition values ('EP01','Branch Manager');
Insert into empposition values ('EP02','Sales Manager');
Insert into empposition values ('EP03','Customers Service Manager');
Insert into empposition values ('EP04','Accountant');
Insert into empposition values ('EP05','Sales Man');


INSERT into PROTYPE VALUES ('T01','ประเภทอาหารสุนัข');
INSERT into PROTYPE VALUES ('T02','ประเภทอาหารแมว');
INSERT into PROTYPE VALUES ('T03','ประเภทอาหารปลา');


Insert into branchs values ('B01','ใหญ่','เขตบางนา กรุงเทพ','10150','02-2112342');
Insert into branchs values ('B02','กลาง','อ.ขุนตาล เชียงราย','57340','053-632186');
Insert into branchs values ('B03','เล็ก','อ.เมือง อำนาจเจริญ','37000','045-502586');


Insert into esalary values ('B01','EP01',25000);
Insert into esalary values ('B02','EP01',18000);
Insert into esalary values ('B03','EP01',18000);
Insert into esalary values ('B01','EP02',18000);
Insert into esalary values ('B02','EP02',15000);
Insert into esalary values ('B03','EP02',15000);
Insert into esalary values ('B01','EP03',14000);
Insert into esalary values ('B02','EP03',12000);
Insert into esalary values ('B03','EP03',12000);
Insert into esalary values ('B01','EP04',19000);
Insert into esalary values ('B02','EP04',15000);
Insert into esalary values ('B03','EP04',15000);
Insert into esalary values ('B01','EP05',15000);
Insert into esalary values ('B02','EP05',12000);
Insert into esalary values ('B03','EP05',12000);


INSERT into PRODUCT VALUES ('PD01','T01','อาหารสุนัข Royal Canin Mini Sterilised','2 kg','อาหารสนัขขนาดเล็ก',630,600,100);
INSERT into PRODUCT VALUES ('PD02','T01','อาหารสุนัข Nature s Gift สูตรเนื้อจิงโจ้','100 g','อาหารสนัขขนาดกลาง',114,100,200);
INSERT into PRODUCT VALUES ('PD03','T01','อาหารสุนัข รสไก่ผสมผัก Bistro Gonta','60 g','อาหารสนัขขนาดเล็ก',65,60,350);
INSERT into PRODUCT VALUES ('PD04','T01','อาหารสุนัข สูตรลูกสุนัข Royal Canin X-SMALL','5.5 g','อาหารสนัขขนาดกลาง',250,200,230);
INSERT into PRODUCT VALUES ('PD05','T01','อาหารลูกสุนัข และแม่สุนัข อาหารกระป๋อง','195 g','อาหารสนัขขนาดใหญ่',75,70,1000);
INSERT into PRODUCT VALUES ('PD06','T02','ขนมแมว Beaphar Catnip Bits สอดไส้ด้วย Cat nip','50 g','อาหารแมวขนาดเล็ก',80,70,120);
INSERT into PRODUCT VALUES ('PD07','T02','ขนมแมว Beaphar Vit Bits สอดไส้ด้วยวิตามินและทอรีน','60 g','อาหารแมวขนาดเล็ก',80,70,340);
INSERT into PRODUCT VALUES ('PD08','T02','ขนมแมว Malt Bites สอดไส้ครีม รสมอลต์','35 g','อาหารแมวขนาดกลาง',80,70,120);
INSERT into PRODUCT VALUES ('PD09','T02','อาหารแมว Royal Canin Exigent35','2 kg','อาหารแมวขนาดเล็ก',680,650,124);
INSERT into PRODUCT VALUES ('PD10','T02','อาหารแมว รสไก่ Chicken with Pilchards','100 g','อาหารแมวขนาดใหญ่',114,100,345);
INSERT into PRODUCT VALUES ('PD11','T03','อาหารปลากินพืช เม็ดเล็ก','1 kg','อาหารปลาเล็ก',340,300,123);
INSERT into PRODUCT VALUES ('PD12','T03','อาหารปลา Sakura สำหรับปลาขนาดเล็ก','500 g','อาหารปลาขนาดเล็ก',120,100,442);
INSERT into PRODUCT VALUES ('PD13','T03','อาหารปลา Sakura สำหรับปลาขนาดใหญ่','500 g','อาหารปลาขนาดเล็ก',150,120,435);
INSERT into PRODUCT VALUES ('PD14','T03','อาหารปลา Sakura สำหรับปลาขนาดกลาง่','500 g','อาหารปลาขนาดกลาง',170,140,120);
INSERT into PRODUCT VALUES ('PD15','T03','อาหารปลา Sakura สำหรับปลาขนาดเล็ก','1000 g','อาหารปลาขนาดเล็ก',200,180,124);


Insert into PROMOTION values ('PRO01','PD05',to_date('05/02/2011','DD/MM/YYYY'),to_date('18/08/2011','DD/MM/YYYY'),0.10);  
Insert into PROMOTION values ('PRO02','PD10',to_date('08/05/2011','DD/MM/YYYY'),to_date('22/09/2011','DD/MM/YYYY'),0.20);   
Insert into PROMOTION values ('PRO03','PD14',to_date('02/07/2011','DD/MM/YYYY'),to_date('10/12/2011','DD/MM/YYYY'),0.20); 
Insert into PROMOTION values ('PRO04','PD01',to_date('05/02/2011','DD/MM/YYYY'),to_date('18/08/2011','DD/MM/YYYY'),0.15);  
Insert into PROMOTION values ('PRO05','PD09',to_date('06/06/2012','DD/MM/YYYY'),to_date('18/08/2012','DD/MM/YYYY'),0.15);  


Insert into EMP values ('EMP01','EP01','B01','วันวิสาข์','ละครขวา','23 อ.เมือง สมุทรปราการ','10280','0825788195',to_date('11/05/1961','DD/MM/YYYY'),to_date('21/06/1995','DD/MM/YYYY'));
Insert into EMP values ('EMP02','EP01','B02','กีรติ','แสงอีง่อง','51 อ.บ้านฉาง จ.ระยอง','21200','0895762726',to_date('21/02/1964','DD/MM/YYYY'),to_date('11/05/1989','DD/MM/YYYY'));
Insert into EMP values ('EMP03','EP01','B03','ชาติ','บุญโชติ','1/12 อ.เมือง ชลบุรี','20000','0844698920',to_date('15/04/1969','DD/MM/YYYY'),to_date('19/07/1999','DD/MM/YYYY'));
Insert into EMP values ('EMP04','EP02','B01','ณัฐวิภา','มณีโชติ','128 อ.วังจันทร์ จ. ระยอง','21200','0851473239',to_date('7/01/1956','DD/MM/YYYY'),to_date('5/01/1972','DD/MM/YYYY'));
Insert into EMP values ('EMP05','EP02','B02','ศิริรัตน์','ชคัตตรัย','177 อ.เมือง จ. ระยอง','21200','0811123201',to_date('5/10/1941','DD/MM/YYYY'),to_date('9/11/1995','DD/MM/YYYY'));
Insert into EMP values ('EMP06','EP02','B03','ทิพย์สุดา','วงศ์คำดี','128 อ.เมือง ชลบุรี','20000','0842028886',to_date('21/07/1942','DD/MM/YYYY'),to_date('3/04/1986','DD/MM/YYYY'));
Insert into EMP values ('EMP07','EP03','B01','วัฒน์','จอกแก้ว','17/122 อ.เมือง จ.ปัตตานี','94000','0830873304',to_date('21/02/1964','DD/MM/YYYY'),to_date('2/03/1997','DD/MM/YYYY'));
Insert into EMP values ('EMP08','EP03','B02','ปริญญา ','ปุริจันทร์','117 บางกะปิ  กรุงเทพฯ','10400','0897237459',to_date('9/10/1975','DD/MM/YYYY'),to_date('14/07/1971','DD/MM/YYYY'));
Insert into EMP values ('EMP09','EP03','B03','ภัทราพร','ศรีสุภาพ','17/55 อ.เมือง ชลบุรี','20000','0856125938',to_date('14/02/1893','DD/MM/YYYY'),to_date('19/12/1964','DD/MM/YYYY'));
Insert into EMP values ('EMP10','EP04','B01','นาฎลดา','วงศ์บาตร','21/11 อ.บ้านฉาง จ. ระยอง','21200','0812004565',to_date('18/05/1892','DD/MM/YYYY'),to_date('7/09/1988','DD/MM/YYYY'));
Insert into EMP values ('EMP11','EP04','B01','ไกรลาศ','จักรเมธากุล','88/411 บางซื่อ กรุงเทพฯ','10160','0870157722',to_date('1/04/1891','DD/MM/YYYY'),to_date('12/05/2005','DD/MM/YYYY'));
Insert into EMP values ('EMP12','EP04','B02','ภาณุวัฒน์','ไชยเม็ง','2/41 เขตประเวศ  กรุงเทพฯ','10250','0844453840',to_date('12/10/1972','DD/MM/YYYY'),to_date('21/01/2006','DD/MM/YYYY'));
Insert into EMP values ('EMP13','EP04','B03','ธนู','ชลุยรัตน์','78/21 อ.นาคู จ.กาฬสินธุ์','46160','0835255477',to_date('7/06/1984','DD/MM/YYYY'),to_date('14/10/1998','DD/MM/YYYY'));
Insert into EMP values ('EMP14','EP05','B01','วัชรี ','ดวงทำมา','6/11 อ.เมือง ชลบุรี','20000','0861195663',to_date('15/08/1994','DD/MM/YYYY'),to_date('8/02/2007','DD/MM/YYYY'));
Insert into EMP values ('EMP15','EP05','B01','สุดารัตน์','พิมพ์ศรี','32/71 อ.นามน จ.กาฬสินธุ์','46230','0815331092',to_date('8/09/1982','DD/MM/YYYY'),to_date('10/12/2008','DD/MM/YYYY'));
Insert into EMP values ('EMP16','EP05','B01','สราวุธ','ต่างโอฐ','25/7 อ.เกาะจันทร์ ชลบุรี','20240','0851164436',to_date('25/02/1975','DD/MM/YYYY'),to_date('17/04/2006','DD/MM/YYYY'));
Insert into EMP values ('EMP17','EP05','B02','ฤทธิชัย','พันสาย','6/23 อ.ลำลูกกา จ.ปทุมธานี','12150','0895723744',to_date('14/03/1969','DD/MM/YYYY'),to_date('17/11/2008','DD/MM/YYYY'));
Insert into EMP values ('EMP18','EP05','B02','วิมล','แว่นไธสง','123/122 อ.เมือง ขอนแก่น','40000','0826664621',to_date('20/07/1959','DD/MM/YYYY'),to_date('14/05/2005','DD/MM/YYYY'));
Insert into EMP values ('EMP19','EP05','B03','อุไรวรรณ','ฉายาวงศ์','175 อ.เมือง บุรีรัมย์','31000','0846775547',to_date('15/10/1949','DD/MM/YYYY'),to_date('19/04/2011','DD/MM/YYYY'));
Insert into EMP values ('EMP20','EP05','B03','เอกชัย','วงษ์หอม','573 อ.ลี้  ลำพูน','51110','0872713221',to_date('14/06/1919','DD/MM/YYYY'),to_date('26/01/2011','DD/MM/YYYY'));



Insert into CUSTOMERS values ('CUS01','B01','EMP14','รนภา','เรืองรุ่ง','22/3 อ.ปากคาด จ.หนองคาย','43190','0812964977',to_date('12/05/1912','DD/MM/YYYY'),to_date('11/05/2009','DD/MM/YYYY'));
Insert into CUSTOMERS values ('CUS02','B01','EMP14','นินทร','สุดหล้า','12 เขตธนบุรี กรุงเทพฯ','10600','086537147',to_date('16/10/1921','DD/MM/YYYY'),to_date('15/08/2008','DD/MM/YYYY'));
Insert into CUSTOMERS values ('CUS03','B01','EMP15','พินิดา','เดชชา','11/35 อ.ศรีวิไล จ.หนองคาย','43210','080359626',to_date('14/04/1925','DD/MM/YYYY'),to_date('20/01/2010','DD/MM/YYYY'));
Insert into CUSTOMERS values ('CUS04','B01','EMP15','วรรณา','ศรีชา','21 อ.ดอยหลวง จ.เชียงราย','57110','0875004767',to_date('1/05/1927','DD/MM/YYYY'),to_date('18/02/2003','DD/MM/YYYY'));
Insert into CUSTOMERS values ('CUS05','B01','EMP16','จิรายุส','ไพบูลย์','311 อ.บ้านแพ้ว จ.สมุทรสาคร','74120','0857876428',to_date('12/12/1919','DD/MM/YYYY'),to_date('19/09/2002','DD/MM/YYYY'));
Insert into CUSTOMERS values ('CUS06','B02','EMP17','วัชชัย ','พลศรี','10 อ.เทิง  จ.เชียงราย','57000','0894713670',to_date('23/08/1911','DD/MM/YYYY'),to_date('2/07/2000','DD/MM/YYYY'));
Insert into CUSTOMERS values ('CUS07','B02','EMP18','ยุวดี ','ไชยศิริ','112 อ.จอมทอง  จ.เชียงใหม่','50160','0874457675',to_date('10/12/1910','DD/MM/YYYY'),to_date('8/08/2005','DD/MM/YYYY'));
Insert into CUSTOMERS values ('CUS08','B02','EMP17','สุฤทัย','จำเริญ','544 อ.ภูซาง จ.พะเยา','56110','0810555395',to_date('20/05/1951','DD/MM/YYYY'),to_date('24/05/2001','DD/MM/YYYY'));
Insert into CUSTOMERS values ('CUS09','B03','EMP19','ณัฐพล','แก้วก้า','252 อ.แม่ใจ  จ.พะเยา','43160','0847578554',to_date('18/03/1921','DD/MM/YYYY'),to_date('10/06/2002','DD/MM/YYYY'));
Insert into CUSTOMERS values ('CUS10','B03','EMP20','สุภาพร','ไชยนิจ','14/8 อ.เวียงป่าเป้า จ.เชียงราย','57170','0891247589',to_date('11/10/1926','DD/MM/YYYY'),to_date('17/02/2007','DD/MM/YYYY'));


Insert into ORDERS values ('OD01','EMP14','B01','CUS01',to_date('10/02/2011','DD/MM/YYYY'),to_date('20/02/2011','DD/MM/YYYY'),121950);
Insert into ORDERS values ('OD02','EMP14','B01','CUS02',to_date('15/02/2011','DD/MM/YYYY'),to_date('20/02/2011','DD/MM/YYYY'),118000);
Insert into ORDERS values ('OD03','EMP15','B01','CUS03',to_date('12/03/2011','DD/MM/YYYY'),to_date('22/03/2011','DD/MM/YYYY'),20000);
Insert into ORDERS values ('OD04','EMP15','B01','CUS04',to_date('2/04/2011','DD/MM/YYYY'),to_date('15/04/2011','DD/MM/YYYY'),45000);
Insert into ORDERS values ('OD05','EMP16','B01','CUS05',to_date('1/05/2011','DD/MM/YYYY'),to_date('9/05/2011','DD/MM/YYYY'),6000);
Insert into ORDERS values ('OD06','EMP17','B02','CUS06',to_date('8/05/2011','DD/MM/YYYY'),to_date('15/05/2011','DD/MM/YYYY'),22800);
Insert into ORDERS values ('OD07','EMP18','B02','CUS07',to_date('11/05/2011','DD/MM/YYYY'),to_date('18/05/2011','DD/MM/YYYY'),128300);
Insert into ORDERS values ('OD08','EMP17','B02','CUS08',to_date('25/05/2011','DD/MM/YYYY'),to_date('29/05/2011','DD/MM/YYYY'),125700);
Insert into ORDERS values ('OD09','EMP19','B03','CUS09',to_date('10/08/2011','DD/MM/YYYY'),to_date('20/08/2011','DD/MM/YYYY'),102000);
Insert into ORDERS values ('OD10','EMP20','B03','CUS10',to_date('19/08/2011','DD/MM/YYYY'),to_date('24/08/2011','DD/MM/YYYY'),49000);
Insert into ORDERS values ('OD11','EMP18','B02','CUS01',to_date('5/06/2011','DD/MM/YYYY'),to_date('15/06/2011','DD/MM/YYYY'),124200);
Insert into ORDERS values ('OD12','EMP15','B01','CUS02',to_date('12/06/2011','DD/MM/YYYY'),to_date('18/06/2011','DD/MM/YYYY'),20000);
Insert into ORDERS values ('OD13','EMP20','B03','CUS03',to_date('28/07/2011','DD/MM/YYYY'),to_date('10/08/2011','DD/MM/YYYY'),145000);
Insert into ORDERS values ('OD14','EMP16','B01','CUS04',to_date('18/10/2011','DD/MM/YYYY'),to_date('24/10/2011','DD/MM/YYYY'),33100);
Insert into ORDERS values ('OD15','EMP18','B02','CUS05',to_date('12/11/2011','DD/MM/YYYY'),to_date('22/11/2011','DD/MM/YYYY'),84000);
Insert into ORDERS values ('OD16','EMP16','B01','CUS06',to_date('10/10/2011','DD/MM/YYYY'),to_date('18/10/2011','DD/MM/YYYY'),343000);
Insert into ORDERS values ('OD17','EMP15','B01','CUS07',to_date('12/08/2011','DD/MM/YYYY'),to_date('20/08/2011','DD/MM/YYYY'),45600);
Insert into ORDERS values ('OD18','EMP19','B03','CUS08',to_date('12/10/2011','DD/MM/YYYY'),to_date('20/10/2011','DD/MM/YYYY'),16250);
Insert into ORDERS values ('OD19','EMP14','B01','CUS09',to_date('20/11/2011','DD/MM/YYYY'),to_date('26/11/2011','DD/MM/YYYY'),229600);
Insert into ORDERS values ('OD20','EMP17','B02','CUS10',to_date('25/11/2011','DD/MM/YYYY'),to_date('3/12/2011','DD/MM/YYYY'),158000);


Insert into ORDERDETAIL values ('DD01','PD01','OD01',140);     
Insert into ORDERDETAIL values ('DD02','PD05','OD01',250);  
Insert into ORDERDETAIL values ('DD03','PD13','OD01',100);  
Insert into ORDERDETAIL values ('DD04','PD07','OD02',125); 
Insert into ORDERDETAIL values ('DD05','PD11','OD02',200);  
Insert into ORDERDETAIL values ('DD06','PD15','OD02',200);  
Insert into ORDERDETAIL values ('DD07','PD06','OD03',250);  
Insert into ORDERDETAIL values ('DD08','PD04','OD04',180); 
Insert into ORDERDETAIL values ('DD09','PD12','OD05',50);
Insert into ORDERDETAIL values ('DD10','PD10','OD06',200); 
Insert into ORDERDETAIL values ('DD11','PD02','OD07',150);  
Insert into ORDERDETAIL values ('DD12','PD08','OD07',200); 
Insert into ORDERDETAIL values ('DD13','PD11','OD07',280);  
Insert into ORDERDETAIL values ('DD14','PD09','OD08',180);    
Insert into ORDERDETAIL values ('DD15','PD13','OD08',22); 
Insert into ORDERDETAIL values ('DD16','PD14','OD09',600); 
Insert into ORDERDETAIL values ('DD17','PD03','OD10',200);  
Insert into ORDERDETAIL values ('DD18','PD12','OD10',300); 
Insert into ORDERDETAIL values ('DD19','PD05','OD11',400);  
Insert into ORDERDETAIL values ('DD20','PD10','OD11',300); 
Insert into ORDERDETAIL values ('DD21','PD15','OD11',300); 
Insert into ORDERDETAIL values ('DD22','PD07','OD12',250);  
Insert into ORDERDETAIL values ('DD23','PD05','OD13',500);  
Insert into ORDERDETAIL values ('DD24','PD12','OD13',400); 
Insert into ORDERDETAIL values ('DD25','PD14','OD13',350);  
Insert into ORDERDETAIL values ('DD26','PD02','OD14',150);   
Insert into ORDERDETAIL values ('DD27','PD07','OD14',200);  
Insert into ORDERDETAIL values ('DD28','PD12','OD15',350);  
Insert into ORDERDETAIL values ('DD29','PD13','OD15',280); 
Insert into ORDERDETAIL values ('DD30','PD04','OD16',800);  
Insert into ORDERDETAIL values ('DD31','PD08','OD16',300);  
Insert into ORDERDETAIL values ('DD32','PD11','OD16',350);  
Insert into ORDERDETAIL values ('DD33','PD10','OD17',400);  
Insert into ORDERDETAIL values ('DD34','PD03','OD18',250); 
Insert into ORDERDETAIL values ('DD35','PD01','OD19',200); 
Insert into ORDERDETAIL values ('DD36','PD08','OD19',20);  
Insert into ORDERDETAIL values ('DD37','PD11','OD19',300);
Insert into ORDERDETAIL values ('DD38','PD04','OD20',250);  
Insert into ORDERDETAIL values ('DD39','PD06','OD20',300);  
Insert into ORDERDETAIL values ('DD40','PD09','OD20',50);  
Insert into ORDERDETAIL values ('DD41','PD13','OD20',250);

set linesize 400;

4.1
CREATE VIEW CustomerView1 AS
SELECT CUSTID,CUSTFNAME,CUSTLNAME,Customers.TEL,Customers.BRANCHID,Branchs.Baddr
FROM Customers,Branchs
WHERE Customers.Branchid = Branchs.Branchid
GROUP BY CUSTID,CUSTFNAME,CUSTLNAME,Customers.TEL,Customers.BRANCHID,Branchs.Baddr
ORDER BY Custid;

4.2
CREATE VIEW EmployeeList01
AS 
SELECT EMP.EMPID,EMPFNAME,EMPLNAME,ORDERID,TOTALPRICE,ORDERDATE,BRANCHSIZE
FROM EMP,ORDERS,BRANCHS 
WHERE EMP.EMPID = ORDERS.EMPID AND EMP.BRANCHID = BRANCHs.BRANCHID AND BRANCHSIZE = 'ใหญ่' AND TOTALPRICE > 120000
ORDER BY EMPFNAME;

4.3
DECLARE
    vempid EMP.EMPID%TYPE;
    vempfname EMP.EMPFNAME%TYPE;
    vemplname EMP.EMPLNAME%TYPE;
    veaddr EMP.EADDR%TYPE;
    vzipcode EMP.ZIPCODE%TYPE;
BEGIN
    SELECT EMPID,EMPFNAME,EMPLNAME,EADDR,ZIPCODE 
    INTO vempid,vempfname,vemplname,veaddr,vzipcode
    FROM EMP
    WHERE EMPFNAME = 'นาฎลดา';
    DBMS_OUTPUT.PUT_LINE('EMPID: '||vempid);
    DBMS_OUTPUT.PUT_LINE('FNAME: '||vempfname);
    DBMS_OUTPUT.PUT_LINE('LNAME: '||vemplname);
    DBMS_OUTPUT.PUT_LINE('ADDR: '||veaddr);
    DBMS_OUTPUT.PUT_LINE('ZIPCODE: '||vzipcode);
END;
/

4.4
CREATE or REPLACE PROCEDURE OrderCustList01
IS
    vcustid CUSTOMERS.CUSTID%TYPE;
    vcustfname CUSTOMERS.CUSTFNAME%TYPE;
    vcustlname CUSTOMERS.CUSTLNAME%TYPE;
    vcaddr CUSTOMERS.CADDR%TYPE;
    vbirthdate CUSTOMERS.BIRTHDATE%TYPE;
    CURSOR S1 IS SELECT CUSTID,CUSTFNAME,CUSTLNAME,CADDR,BIRTHDATE from CUSTOMERS
    ORDER BY REGISTERDATE;
BEGIN
    OPEN S1;
    FOR i in 1..5 LOOP
        FETCH S1 into vcustid,vcustfname,vcustlname,vcaddr,vbirthdate;
        DBMS_OUTPUT.PUT_LINE('=====================');
        DBMS_OUTPUT.PUT_LINE('ID: '||vcustid);
        DBMS_OUTPUT.PUT_LINE('FNAME: '||vcustfname);
        DBMS_OUTPUT.PUT_LINE('LNAME: '||vcustlname);
        DBMS_OUTPUT.PUT_LINE('ADDR: '||vcaddr);
        DBMS_OUTPUT.PUT_LINE('BirthDate: '||vbirthdate);
    EXIT WHEN(S1%rowcount>=5) OR S1%notfound;
    END Loop;
    CLOSE S1;
END;
/
4.5
DECLARE
    vorderid ORDERS.ORDERID%TYPE;
    vorderdate ORDERS.ORDERDATE%TYPE;
    vtotalprice ORDERS.TOTALPRICE%TYPE;
    vcustid    ORDERS.CUSTID%TYPE;
    vcustfname CUSTOMERS.CUSTFNAME%TYPE;
    vcustlname CUSTOMERS.CUSTLNAME%TYPE;
    vbranchsize BRANCHS.BRANCHSIZE%TYPE;
    vpoint number(8);
    CURSOR S1 IS SELECT ORDERID,ORDERDATE,TOTALPRICE,CUSTID from ORDERS ORDER BY ORDERID;
BEGIN
    OPEN S1;
    vpoint :=0;
    FOR i in 1..7 LOOP
        FETCH S1 into vorderid,vorderdate,vtotalprice,vcustid;
        SELECT CUSTFNAME,CUSTLNAME,BRANCHSIZE 
        into vcustfname,vcustlname,vbranchsize 
        FROM CUSTOMERS,BRANCHS 
        WHERE CUSTOMERS.BRANCHID = BRANCHS.BRANCHID and vcustid = CUSTOMERS.CUSTID;
        DBMS_OUTPUT.PUT_LINE('=====================');
        DBMS_OUTPUT.PUT_LINE('orderID: '||vorderid);
        DBMS_OUTPUT.PUT_LINE('orderDATE: '||vorderdate);
        DBMS_OUTPUT.PUT_LINE('totalprice: '||vtotalprice);
        DBMS_OUTPUT.PUT_LINE('FANME: '||vcustfname||' LNAME'||vcustlname);
        DBMS_OUTPUT.PUT_LINE('BRANCHSIZE: '||vbranchsize);
        vpoint := vtotalprice * 0.15;
        DBMS_OUTPUT.PUT_LINE('point: '||vpoint);
        IF vpoint > 15000 THEN
                dbms_output.put_line('5 star');
            ELSIF vpoint >= 7000 AND vpoint <= 14999 THEN
                dbms_output.put_line('4 star');
            ELSIF vpoint >= 4000 AND vpoint <= 6999 THEN
                dbms_output.put_line('3 star');
            ELSIF vpoint >= 1000 AND vpoint <= 3999 THEN
                dbms_output.put_line('2 star');
            ELSIF vpoint < 1000 THEN
                dbms_output.put_line('1 star');
            END IF;
    EXIT WHEN(S1%rowcount>=7) OR S1%notfound;
    END Loop;
    CLOSE S1;
END;
/

4.5.1
CREATE OR REPLACE PROCEDURE CalMemberType01(vpoint Number)
IS
BEGIN
    IF vpoint > 15000 THEN
        dbms_output.put_line('5 star');
    ELSIF vpoint >= 7000 AND vpoint <= 14999 THEN
        dbms_output.put_line('4 star');
    ELSIF vpoint >= 4000 AND vpoint <= 6999 THEN
        dbms_output.put_line('3 star');
    ELSIF vpoint >= 1000 AND vpoint <= 3999 THEN
        dbms_output.put_line('2 star');
    ELSIF vpoint < 1000 THEN
        dbms_output.put_line('1 star');
    END IF;
END;
/
==============
CREATE or REPLACE PROCEDURE SaleList02
IS
    vorderid ORDERS.ORDERID%TYPE;
    vorderdate ORDERS.ORDERDATE%TYPE;
    vtotalprice ORDERS.TOTALPRICE%TYPE;
    vcustid    ORDERS.CUSTID%TYPE;
    vcustfname CUSTOMERS.CUSTFNAME%TYPE;
    vcustlname CUSTOMERS.CUSTLNAME%TYPE;
    vbranchsize BRANCHS.BRANCHSIZE%TYPE;
    vpoint number(8);
    CURSOR S1 IS SELECT ORDERID,ORDERDATE,TOTALPRICE,CUSTID from ORDERS ORDER BY ORDERID;
BEGIN
    OPEN S1;
    vpoint :=0;
    FOR i in 1..7 LOOP
        FETCH S1 into vorderid,vorderdate,vtotalprice,vcustid;
        SELECT CUSTFNAME,CUSTLNAME,BRANCHSIZE 
        into vcustfname,vcustlname,vbranchsize 
        FROM CUSTOMERS,BRANCHS 
        WHERE CUSTOMERS.BRANCHID = BRANCHS.BRANCHID and vcustid = CUSTOMERS.CUSTID;
        DBMS_OUTPUT.PUT_LINE('=====================');
        DBMS_OUTPUT.PUT_LINE('orderID: '||vorderid);
        DBMS_OUTPUT.PUT_LINE('orderDATE: '||vorderdate);
        DBMS_OUTPUT.PUT_LINE('totalprice: '||vtotalprice);
        DBMS_OUTPUT.PUT_LINE('FANME: '||vcustfname||' LNAME'||vcustlname);
        DBMS_OUTPUT.PUT_LINE('BRANCHSIZE: '||vbranchsize);
        vpoint := vtotalprice * 0.15;
        DBMS_OUTPUT.PUT_LINE('point: '||vpoint);
        CalMemberType01(vpoint);
    EXIT WHEN(S1%rowcount>=7) OR S1%notfound;
    END Loop;
    CLOSE S1;
END;
/
	   
