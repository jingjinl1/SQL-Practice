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
      SUBSTR(Field,n,m): Display the field from n position to m position 
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
   c.FirstName || ' ' || c.LastName || ' ' || c.Address || ',' || c.City || ' ' || c.State || ' ' || c.PostalCode AS MailingAddress,
   LENGTH(c.PostalCode) AS PostalCode,
   SUBSTR(c.PostalCode,1,5) AS '5 Digit PostalCode',
   UPPER(c.FirstName) AS 'FirstName Upper Case',
   LOWER(c.LastName) AS 'LastName Lower Case'
FROM
   Customer AS c
   
   
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
   Employee AS e