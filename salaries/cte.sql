WITH melo AS (

	SELECT 
		 Customer.CustomerId
		, Customer.FirstName 
		, Customer.LastName 
		, COUNT(DISTINCT Genre.GenreId) AS nmb_genres
	FROM InvoiceLine
	LEFT JOIN Track on InvoiceLine.TrackId =  Track.TrackId 
	LEFT JOIN Genre on Track.GenreId  = Genre.GenreId 
	LEFT JOIN Invoice on InvoiceLine.InvoiceId  = Invoice.InvoiceId 
	LEFT JOIN Customer on Invoice.CustomerId = Customer.CustomerId
	GROUP BY 1, 2, 3
	HAVING COUNT(DISTINCT Genre.GenreId) >= 3
)

, invoices AS (
	SELECT *
	FROM Invoice
	WHERE InvoiceDate Between '2009-01-01'AND '2010-01-01'

)

SELECT *
FROM melo
LEFT JOIN invoices ON melo.CustomerId = invoices.CustomerId
WHERE invoices.CustomerId IS NOT NULL

-- **
SELECT *
FROM melo
WHERE melo.CustomerId IN (SELECT CustomerId FROM invoices)
-- LEFT JOIN invoices ON melo.CustomerId = invoices.CustomerId
-- WHERE invoices.CustomerId IS NOT NULL

--


WITH cte AS(
SELECT 
	i.InvoiceId 
	, i.CustomerId 
	, i.Total
	, ROW_NUMBER() OVER(PARTITION BY i.CustomerId ORDER BY Total DESC) AS invoice_nmb
	, RANK()       OVER(PARTITION BY i.CustomerId ORDER BY Total DESC) AS invoice_rank
	, DENSE_RANK() OVER(PARTITION BY i.CustomerId ORDER BY Total DESC) AS dense_rank
FROM Invoice i 
ORDER BY i.CustomerId 
)
SELECT *
FROM cte 
WHERE invoice_nmb = 2

