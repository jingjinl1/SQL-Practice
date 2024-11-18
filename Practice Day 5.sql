/*
Created by: JJ
Created on: 18/11/2024
Description: Create VIEW and modify VIEW

To modify the view, right click the view that was created 
in the Database Structure and click 'modify view'

To delete the view: DROP VIEW VIEWNAME
Or right clcik the view in Database structure and click delet view
*/
CREATE VIEW V_AVGtotal AS
SELECT
  ROUND(AVG(i.total),2) AS AverageTotal 
FROM Invoice AS i;


/*
Description: VIEW and JOIN | Create a View to join the InvoiceLine and Track table
*/
CREATE VIEW V_InvoiceLine_Track AS
SELECT
  il.InvoiceId,
  il.Quantity,
  il.UnitPrice,
  t.Name AS TrackName,
  t.Composer,
  t.Milliseconds
FROM 
  InvoiceLine AS il
LEFT OUTER JOIN
  Track AS t
ON 
  il.TrackId = t.TrackId
ORDER BY
  t.Name;
  

/*
DML: INSERT DATA | Add an artist in the Artist table
*/
INSERT INTO
  Artist(Name)
VALUES('Test Insert')

/*
DML: UPDATE DATA | Change the name of the insterted Artist, remember to include where clause 
to specify the line id, otherwise the database will be updated into the set value for every row
*/
UPDATE
  Artist
SET 
  Name = 'Update Insert'
WHERE 
  ArtistId = 276
  
  
/*
DML: DELETE DATA | Delete the artist that was just created and modified
*/
DELETE FROM
  Artist
WHERE
  ArtistId = 276 
 
 
/*
Exam question 12: How many customers' last name starts with G
*/
SELECT 
  COUNT(c.LastName) AS 'Number of customers last name starts with G'
FROM
  Customer AS c
WHERE
  c.LastName LIKE "G%"
  
/*
Exam question 13: which track appears at the top of the Track table when sorted in descending order?
*/
SELECT
  t.Name
FROM
  Track AS t
ORDER BY 
  t.Name DESC
LIMIT 1

/*
Exam question 14: how many tracks in the WSDA music database do not have a composer listed?
*/
SELECT
  t.TrackId,
  t.Composer
FROM
  Track AS t
ORDER BY Composer DESC;

SELECT 
  COUNT(t.TrackId) AS "Number of tracks don't have a composer"
FROM
  Track AS t
WHERE 
  t.Composer = "unavailable";
  
/*
Exam question 17: how many invoices were billed to the city of Brussels?
*/
SELECT
  COUNT(i.InvoiceId) AS "Number of invoices billed at Brussels"
FROM
  Invoice AS i
WHERE
  i.BillingCity = "Brussels";
  

  
  

    



