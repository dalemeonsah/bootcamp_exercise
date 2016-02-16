SELECT editions.name, books.isbn
FROM editions
JOIN books ON editions.book_id = books.id
ORDER BY editions.name ASC;

SELECT editions.book_id, stock.stock
FROM editions
JOIN stock
  ON editions.isbn = stock.isbn
  ORDER BY stock.stock desc
  limit 1;


-- bonus question
-- nested query 