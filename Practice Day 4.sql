/*
Created by: JJ
created on: 15/11/2024
Description: GRROUP BY | W the average invoice totals by city
*/
SELECT
  i.BillingCity,
  ROUND(AVG(i.total),2) AS AverageTotal
FROM Invoice AS i
GROUP BY
  i.BillingCity
ORDER BY
  i.BillingCity
