/*
Created by: JJ
created on: 15/11/2024
Description: GROUP BY | What are the average invoice totals by city for 
only the city starts with L?
*/
SELECT
  i.BillingCity,
  ROUND(AVG(i.total),2) AS AverageTotal
FROM Invoice AS i
WHERE
  i.BillingCity LIKE 'L%'
GROUP BY
  i.BillingCity
ORDER BY
  i.BillingCity;
  
  
/*
What are the average invoice totals by each city 
and filter the average to over $5.00, 
and only display the city that starts with B
*/
SELECT
i.BillingCity AS 'BillingCity Starts with B',
ROUND(AVG(i.total),2) AS 'Average total greater than 5'
FROM
  Invoice as i
WHERE
  i.BillingCity LIKE 'B%'
GROUP BY
  i.BillingCity
HAVING
  AVG(i.total) > 5
ORDER BY
  i.BillingCity;
  
  
/*
Description: Multiple Grouping | What are the average invoice totals by Country and by city
*/
SELECT
  i.BillingCountry,
  i.BillingCity,
  ROUND(AVG(i.total),2) AS 'Average Total'
FROM 
  Invoice as i
GROUP BY
  i.BillingCountry,
  i.BillingCity
ORDER BY
  i.BillingCountry;

  
/*
Code challenge: Calculate Average Spend per City
Results: Should have 2 colmns, City and AverageSpending;
         Average spending should be rounded to 2 decimals;
         Order by city name ASC
*/   
SELECT 
  i.BillingCity AS City,
  ROUND(AVG(i.total),2) AS AverageSpending
FROM 
  Invoice AS i
GROUP BY
  i.BillingCity
ORDER BY 
  i.BillingCity;
  
  
/*
Description: Sub queries | Display all invoices that are below average
*/
SELECT
  i.InvoiceId,
  i.InvoiceDate,
  i.BillingAddress,
  i.BillingCity,
  i.total
FROM 
  Invoice AS i
WHERE
  i.total < 
    (SELECT AVG(i.total) FROM Invoice AS i)
ORDER BY
  i.total DESC;
  
  
/*
Sub queries within SELECT | display the average total for each city and have an extra 
column to display the golabal average sale next to the city average for comparison
*/
SELECT
  i.BillingCity,
  ROUND(AVG(i.total),2) AS CityAverage,
  (SELECT ROUND(AVG(total),2) FROM Invoice) AS GloableAverage
FROM 
  Invoice AS i
GROUP BY
  i.BillingCity
ORDER BY
  i.BillingCity;
  
  
/*
Sub queries without aggregate functions | Display all the invoices that has invoice date 
after invoice id 251
*/
SELECT
  i.InvoiceId,
  i.InvoiceDate,
  i.BillingAddress,
  i.BillingCity,
  i.total
FROM 
  Invoice AS i
WHERE
  i.InvoiceDate >
  (SELECT 
    i.InvoiceDate
   FROM
     Invoice AS i
   WHERE 
     i.InvoiceId = 251)
ORDER BY
  i.InvoiceDate
  
  
/*
Return multiple rows with subqueries | Find out all the invoices that are issued at the same time 
with invoiceID 251,252,254
*/
SELECT
  i.InvoiceId,
  i.InvoiceDate,
  i.BillingAddress,
  i.BillingCity,
  i.total
FROM
  Invoice AS i
WHERE
  i.InvoiceDate IN
  (SELECT
    i.InvoiceDate
   FROM
    Invoice AS i
   WHERE
    i.InvoiceId IN (251,252,254))
ORDER BY
  i.InvoiceDate;
  
  
/*
DISTINCTINCT | Find out what tracks are not selling
*/
SELECT
  t.TrackId,
  t.Name,
  t.Composer,
  t.GenreId,
  t.UnitPrice
FROM
  Track AS t
WHERE 
  t.TrackId NOT IN
  (
   SELECT 
     DISTINCT il.TrackId
   FROM
     InvoiceLine AS il
  );
	 
/*
Code Chllenge: Uncovering Unpopular Reacks
Result: Return the track that have never been sold
        4 Columns: Track ID, Track Name, Composer, Genre
        Order by Track Name ASCE
*/
SELECT 
  t.TrackId AS "Track ID",
  t.Name AS "Track Name",
  t.Composer,
  g.Name AS Genre
FROM 
  Track AS t
LEFT OUTER JOIN
  Genre AS g
ON
  t.GenreId = g.GenreId
WHERE
  t.TrackId NOT IN
  (
    SELECT
      DISTINCT li.TrackId
    FROM
      InvoiceLine AS li
  )
ORDER BY
  t.Name;