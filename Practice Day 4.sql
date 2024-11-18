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