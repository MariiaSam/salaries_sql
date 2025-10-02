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

