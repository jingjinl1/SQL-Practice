/*
Description: How many invoices were billed on 2010-05-22 00:00:00?
*/
SELECT
    InvoiceDate,
    BillingAddress,
    BillingCity,
    Total
FROM
    Invoice
WHERE
    InvoiceDate = '2010-05-22 00:00:00'
/* the where clause is also equivalent to:
WHERE
    DATE(InvoiceDate) = '2010-05-22'
*/
ORDER BY
    InvoiceDate;


/*
Description: Get all invoices billed after 2010-05-22 and have a total of less than 3.00
*/
SELECT
    InvoiceDate,
    BillingAddress,
    BillingCity,
    Total
FROM
    Invoice
WHERE
    DATE(InvoiceDate) > '2010-05-22' AND Total < 3.00
ORDER BY
    InvoiceDate;


/*
Description: Get all invoices billed to the city starting with P or starts with D
*/
SELECT
    InvoiceDate,
    BillingAddress,
    BillingCity,
    Total
FROM
    Invoice
WHERE
    BillingCity LIKE 'P%' OR BillingCity LIKE 'D%'
ORDER BY
    InvoiceDate;


/*
Description: Get all invoices that are greater than 1.98 from any cities whose names start with P or D
*/
SELECT
    InvoiceDate,
    BillingAddress,
    BillingCity,
    Total
FROM
    Invoice
WHERE
    Total > 1.98 AND (BillingCity LIKE 'P%' OR BillingCity LIKE 'D%')
ORDER BY
    InvoiceDate;


/*
Introducing the CASE END
WSDA Music Sales Goal: They want as many customers as possible to spend between $7.00 and $15.00

Sales Categories:
Baseline Purchase -  Between $0.99 and $1.99
Low Purchase - Between $2.00 and $6.99
Target Purchase - Between $7.00 and $15.00
Top Performer - Above $15.00
*/
SELECT
    InvoiceDate,
    BillingAddress,
    BillingCity,
    Total,

    CASE
    WHEN Total < 2.00 THEN 'Baseline Purchase'
    WHEN Total BETWEEN 2.00 AND 6.99 THEN 'Low Purchase'
    WHEN Total BETWEEN 7.00 AND 15.00 THEN 'Target Purchase'
    ELSE 'Top Performer'
    END AS PurchaseType
FROM
    Invoice
WHERE 
    PurchaseType = 'Top Performer'
ORDER BY
    InvoiceDate;


/*
Code challenge: Categorize tracks by price
*/
SELECT 
   t.Name AS "Track Name",
   t.Composer,
   t.UnitPrice AS Price,
   
   CASE
   WHEN t.UnitPrice < 1.00 THEN 'Budget'
   WHEN t.UnitPrice BETWEEN 1.00 AND 1.49 THEN 'Regular'
   WHEN t.UnitPrice BETWEEN 1.50 AND 1.99 THEN 'Premium'
   ELSE 'Exclusive'
   END AS PriceCategory

FROM Track AS t
ORDER BY
   t.UnitPrice ASC;