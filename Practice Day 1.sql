/*
Created by: JJ
Created Date: 08/11/2024
Description: Display the fist, last names and emails of all customers; sort first name by ascending order and last name by descending order; limited to top 10 rows.
*/
SELECT
   FirstName AS 'Customer First Name',
   LastName AS 'Customer Last Name',
   Email
FROM
   Customer
ORDER BY
   FirstName ASC,
   LastName DESC
LIMIT 10;


/*
Code Challenge: Concise track pricing report
Dissplay Track Name and Price, sort by track name, limit to 20 rows.
*/
SELECT 
   t.Name AS "Track Name",
   t.UnitPrice AS Price
FROM 
   Track AS t
ORDER BY
   t.Name
LIMIT 20;

/*
Notes for Operator types that uses with WHERE:
Arithmetic:
   Add          +
   Subtract     -
   Multiply     *
   Divide       /
   Modulo       %
   
Comparison:
   Equal to              =
   Not Equal to          <>
   Greater than          >
   Less than             <
   Greater or Equal to   >=
   Less or Equal to      <=

Logical:
   AND
   OR
   IN
   LIKE
   BETWEEN
*/

/*
Description: Display record that customers have purchased 2 songs at 0.99 each
*/
SELECT 
   InvoiceDate,
   BillingAddress,
   BillingCity,
   Total
FROM
   Invoice
WHERE 
    Total = 1.98
ORDER BY
    InvoiceDate;


/*
Description: Display all the invoices that are between 1.98 and 5.
*/
SELECT 
   InvoiceDate,
   BillingAddress,
   BillingCity,
   Total
FROM
   Invoice
WHERE 
    Total BETWEEN 1.98 AND 5.00
ORDER BY
    InvoiceDate;


/*
Description: Display all the invoices that are equal to 1.98 or 3.96.
*/
SELECT 
   InvoiceDate,
   BillingAddress,
   BillingCity,
   Total
FROM
   Invoice
WHERE 
    Total IN (1.98, 3.96)
ORDER BY
    InvoiceDate;   


/*
Description: How many invoices were billed to the city of Brussels, Orlando, or Paris
*/
SELECT 
   InvoiceDate,
   BillingAddress,
   BillingCity,
   Total
FROM
   Invoice
WHERE 
    BillingCity IN ('Brussels', 'Orlando', 'Paris')
ORDER BY
    InvoiceDate; 


/*
Description: how many invoices were billed to the city that starts at B
Knowledge: the wild card symbol in SQL is %
*/
SELECT 
   InvoiceDate,
   BillingAddress,
   BillingCity,
   Total
FROM
   Invoice
WHERE 
    BillingCity LIKE 'B%'
ORDER BY
    InvoiceDate;