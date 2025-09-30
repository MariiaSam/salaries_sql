SELECT 
	InvoiceLine.InvoiceId 
	, Genre.GenreId 
	, Customer.CustomerId
	, Customer.FirstName 
	, Customer.LastName 
FROM InvoiceLine
LEFT JOIN Track on InvoiceLine.TrackId =  Track.TrackId 
LEFT JOIN Genre on Track.GenreId  = Genre.GenreId 
LEFT JOIN Invoice on InvoiceLine.InvoiceId  = Invoice.InvoiceId 
LEFT JOIN Customer on Invoice.CustomerId = Customer.CustomerId

SELECT *
FROM Track;

-- які замовники придбали більше 3 треків


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

SELECT *
FROM Track;