/*

1.เรียกใช้ table
SELECT * FROM "name";
ex >>>
SELECT * FROM artist



2.เรียกใช้ข้อมูลจากตารางที่วเลือก
ex >>>
SELECT firstname FROM "customers";
SELECT firstname,lastname FROM "customers";




3.เปลี่ยนชื่อ attribute filde ด้วยการใช่ as 
ex >>>
SELECT
	firstname as customer_firstname,
	lastname  as customer_lastname 
FROM customers;




4.WHERE เป็นการกำหนดเงื่อนไขที่เจาะจงไปอีก 
ex >>> 
SELECT * FROM customers
WHERE customerID = 1;

SELECT firstname, lastname FROM customers
WHERE customserID = 4;

SELECT * FROM customers
WHERE Country = 'Canada'; 



5.ถ้าต้องการจะเรียงตาม table ที่ต้องการให้ใช้ order by
ex >>>
SELECT * FROM customers
WHERE Cuuntry = 'Canada' OR Country = 'USA'
ORDER BY CustomerID DESC;

DESC มาก >>> น้อย
ASC  น้อย >>> มาก



6.ถ้าต้องการกำจัดข้อมูลให้ใช้ LIMIT
ex >>>
SELECT * FROM customers
WHERE Country = 'Canada' or Country = 'USA'
ORDER BY CustomerID
LIMIT 3;




7.ถ้าต้องการเพิ่มข้อมูลลงไปใน table ต้องใช้ INSERT INTO จะมี  2 วิธี
ex1 (เพิ่มทุก attribute ลงใน table ) >>> 
INSERT INTO customers
VALUES (NULL,'weerakit','katepong',
'TSA','Bangkok','Ubon','SP','Thailand',34230,'0644567899',
'(+66)657843',"weerakirt@gmail.com",NULL);

ex2 (เพิ่มบาง attribute ลงใน table ) >>>
INSERT INTO customers (FirstName,LastName,Email)
VALUES("MELO","MELODY","MELODY@GMAIL.COM");




8. ต้องการ UPDATE ใช้ (UPDATE,SET,WHERE)
UPDATE ที่ตารางไหน
SET  ข้อมูลที่ต้องการเปลี่ยน
WHERE  ไปเปลี่ยนที่ตารางไหน

ex >>>
UPDATE customers
SET FirstName = "Tanapon"
WHERE CustomerId = 68;




9.ถ้าต้องการจะลบข้อมูลใช้ DELETE 
ex >>>
DELETE FROM customers
WHERE  FirstName = 'weerakit';



! Aggregate Function ใส่หลัง SELECT
! WHERE ใช้ไม่ได้กับ Aggregate Function

10. การนับใช้ count 
ex >>>
SELECT count(FirstName)
FROM customers
WHERE Country ='Brazil';




11. sum and  avg
ex >>>
SELECT sum(total)
FROM invoices;

SELECT avg(total)
FROM invoices;



12.  main and max
ex >>>
SELECT min(total)
FROM invoices;

SELECT max(total)
FROM invoices;



13. จัดกลุ่ม GROUP by ....
ex >>>
SELECT count(CustomerId),City
FROM customers
GROUP by City;

SELECT count(CustomerId) as Qrt, Country
FROM customers
GROUP by Country
HAVING Qrt >= 5

? เราใช้ WHERE ไม่ได้ เพราะข้อม฿ู,ผิดประเภท ต้องใช้เป็น HAVING
* การประยุกต์ใช้งาน
1000 มิลลิวินาที = 1วินาที
ุ60 วินาที = 60000 มิลลิวินาที
ุ60000 มิลลิวินาที = 1 นาที

SELECT AlbumId,sum(Milliseconds)/60000 as sum_minutes
FROM tracks
GROUP BY AlbumId
ORDER BY  sum_minutes DESC;

 ! ลำดับคำสั่งใน sql
	SELECT
	FROM
	WHERE
	GROUP BY
	HAVING
	ORDER BY
	LIMIT



14.คำสั่ง NOT คือเอาทุกตัวยกเว้นตัวมันเอง
ex >>> 
TODO เอาทุกตัวยกเว้น IT Staff

SELECT Title FROM employees
WHERE NOT Title = "IT Staff";



15.คำสั่ง IN สามารถใช้แทน OR 
ex >>>
SELECT CustomerId,FirstName,LastName,Country FROM customers
WHERE NOT Country in ("USA","Brazil","Sweden")
ORDER BY CustomerId ;



 16. การใช้ like ต้องใช้คู่กับ %
 ex >>>
 TODO หาคำที่ขึ้นต้นด้วย r ลงท้ายด้วย t
SELECT * FROM customers
WHERE FirstName like "r%t"

 TODO หาคำที่ขึ้นลงท้ายด้วย a
SELECT * FROM customers
WHERE FirstName like "%a"

 TODO หาคำที่ขึ้นต้นด้วย w
SELECT * FROM customers
WHERE FirstName like "w%"


17. ถ้าต้องการหาข้อมูลระหว่างใช้ BETWEEN
ex >>>
TODO ไม่ต้องการข้อมูลระหว่าง 10-35
SELECT * FROM customers
WHERE NOT CustomerId BETWEEN 10 and 35

TODO ไม่ต้องการข้อมูลระหว่าง 10-35 และ อยู่ใน Czech Republic,Brazil
SELECT * FROM customers
WHERE  CustomerId BETWEEN 1 and 35 
	   AND Country in ("Czech Republic","Brazil")
ORDER BY  Country



18. IS NULL = ดูข้อมูลที่ไม่ได้กรอก
ex >>>
SELECT * FROM customers
WHERE 
	Phone IS  NULL;


SELECT * FROM customers
WHERE 
	Phone IS NOT NULL;



19. การ join table (inner join, 
					right join , 
					left join , 
					full outer joint)
ex >>>
SELECT employees.EmployeeId, employees.FirstName, employees.LastName, employees.Title
,employees.FirstName as EmployerName, employees.LastName as EmployersLastname
FROM employees LEFT JOIN employees as employers
ON employees.ReportsTo = employers.EmployeeId




20. การใช้ case 
ex >>>
SELECT InvoiceId, total, 
CASE
WHEN total >= 10 THEN "AAA"
WHEN total <= 5 THEN "A"
WHEN total >10 THEN "AA"
ELSE "NONE"
END AS Result
FROM invoices
ORDER BY Result 
LIMIT 100


*/