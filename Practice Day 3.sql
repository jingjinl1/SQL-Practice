/* 
Created by: Jingjin
Created Date: 12/11/2024
Description: JOINS
*/
SELECT 
   *
From 
   Invoice
INNER JOIN 
   Customer 
ON 
   Invoice.CustomerId = Customer.CustomerId;


 /*
 Uses alias in joined tabe, select relevant feild
 Description: display all the cutomers and the invoices that was genearted for them
 Join customer and invoice table, display customers first, last name, invoice id, invoice date and total
 */
 SELECT
    i.CustomerId,
    c.FirstName,
    c.LastName,
    i.InvoiceId,
    i.InvoiceDate,
    i.Total
 FROM
    Invoice AS i
 INNER JOIN
    Customer AS c
 ON
    i.CustomerId = c.CustomerId
 ORDER BY
    c.CustomerId;
	
	
/*
Different types of join:
INNER JOIN: only display the overlapping records between tables.
LEFT OUTER JOIN: Display all the records from the left table and only the matching records from the right table, unmatching ones will be NULL.
RIGHT OUTER JOIN: Display all the records from the right table and only the matching records from the left table, unmatching ones will be NULL.
*/

/*
Description: What employees are responsible for the 10 highest individual sales?
*/
SELECT
   e.EmployeeId,
   e.FirstName AS "Employee FirstName",
   e.LastName AS "Employee LastName",
   i.InvoiceId,
   i.CustomerId,
   c.FirstName AS "Customer FirstName",
   c.LastName AS "Customer LastName",
   c.SupportRepId,
   i.InvoiceDate,
   i.total
FROM Invoice AS i
INNER JOIN Customer AS c
ON i.CustomerId = c.CustomerId
INNER JOIN Employee AS e
ON c.SupportRepId = e.EmployeeId
ORDER BY i.total DESC
LIMIT 10;


SELECT
   e.EmployeeId,
   e.FirstName AS "Employee FirstName",
   e.LastName AS "Employee LastName",
   i.InvoiceId,
   i.CustomerId,
   c.FirstName AS "Customer FirstName",
   c.LastName AS "Customer LastName",
   c.SupportRepId,
   i.InvoiceDate,
   i.total
FROM Invoice AS i
LEFT OUTER JOIN Customer AS c
ON i.CustomerId = c.CustomerId
LEFT OUTER JOIN Employee AS e
ON c.SupportRepId = e.EmployeeId
ORDER BY i.total DESC
LIMIT 10;


/*
Types of functions:
   Aggregate: MIN(), MAX(), AUG(), COUNT(), SUM()
   String: 
      UPPER(): Display the field specified in the bracket in upper case
      LOWER(): Display the field specified in the bracket in lower case
      SUBSTR(Field,n,m): Display the field from n position and have m digits
	  LENGTH(): Count the length of the feild
	  INSTR(), LTRIM(), REPLACE(), TRIM()
   Date: 
      STRFTIME(): format the date
      'NOW', DATETIME(), DATE(), JULIANDAY(), TIME()
*/


/*
Concatenate
DESCRIPTION: CREATE A MAILING LIST FOR ALL CUSTOMERS
*/
SELECT
   c.CustomerId,
   c.FirstName,
   c.LastName,
   c.Address,
   c.FirstName||' '||c.LastName||' '||c.Address||','||c.City||' '||c.State||' '||c.PostalCode AS MailingAddress,
   LENGTH(c.PostalCode) AS PostalCode,
   SUBSTR(c.PostalCode,1,5) AS '5 Digit PostalCode',
   UPPER(c.FirstName) AS 'FirstName Upper Case',
   LOWER(c.LastName) AS 'LastName Lower Case'
FROM
   Customer AS c;
   
   
/*
Description: Calculate the age of each employee
*/
SELECT
   e.EmployeeId,
   e.FirstName,
   e.LastName,
   e.BirthDate,
   STRFTIME('%Y-%m-%d',e.BirthDate) AS 'FormatedBirthDate(Y-m-d)',
   STRFTIME('%Y-%m-%d','NOW') - STRFTIME('%Y-%m-%d',e.BirthDate) AS Age
FROM 
   Employee AS e;
   
 
 /*
 Description: Aggregate functions | What are our all time global sales
 Nesting Function: A function contained within another function
    ROUND(Function, num): round the return of the Function into num decimals
 */
SELECT
    SUM(i.total) AS 'Total Sales',
	AVG(i.total) AS 'Average Sales',
	ROUND(AVG(i.total),2) AS 'Average Sales Rounded',
	MAX(i.total) AS 'Maximum Sale',
	MIN(i.total) AS 'Minimum Sales',
	COUNT(*) AS 'Sales Acount'
FROM 
    Invoice AS i;
	
/*
Code Challenge:	
Selects custoers full name and trasnform their postal code into a standardized 5 digit format
*/
SELECT 
   c.FirstName||' '||c.LastName AS CustomerFullName,
   SUBSTR(c.PostalCode,1,5) AS StandardizedPostalCode
FROM Customer as c;
