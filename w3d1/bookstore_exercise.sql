-- 1
SELECT e.isbn
FROM editions AS e, publishers AS p
WHERE p.name = 'Random House' AND e.publisher_id = p.id;
-- or 
SELECT e.isbn
FROM editions AS e
JOIN publishers AS p on e.publisher_id = p.id
WHERE p.name = 'Random House'

-- 2
SELECT e.isbn, b.title
FROM editions AS e, publishers AS p, books AS b
WHERE p.name = 'Random House' AND e.publisher_id = p.id AND e.book_id = b.id;
-- or 
SELECT e.isbn, b.title
FROM editions AS e
JOIN publishers AS p on e.publisher_id = p.id
JOIN books AS b on e.book_id = b.id
WHERE p.name = 'Random House'

-- 3
SELECT editions.isbn, books.title, stock.cost, stock.stock
FROM editions
JOIN books
  ON editions.book_id = books.id
JOIN publishers
  ON editions.publisher_id = publishers.id
JOIN stock
  ON editions.isbn = stock.isbn
WHERE publishers.name = 'Random House';

-- 4
SELECT editions.isbn, books.title, stock.cost, stock.stock
FROM editions
JOIN books
  ON editions.book_id = books.id
JOIN publishers
  ON editions.publisher_id = publishers.id
JOIN stock
  ON editions.isbn = stock.isbn
WHERE publishers.name = 'Random House' AND stock.stock > 0;

-- 5
SELECT e.isbn, b.title, s.cost, s.stock,
  CASE WHEN e.type = 'h' THEN 'Hardcover'
       WHEN e.type = 'p' THEN 'Paperback'
  END AS type
FROM editions AS e
JOIN books AS b
  ON e.book_id = b.id
JOIN publishers AS p
  ON e.publisher_id = p.id
JOIN stock AS s
  ON e.isbn = s.isbn
WHERE p.name = 'Random House' AND s.stock > 0;
--OR
SELECT *,CASE WHEN e.type = 'h' THEN 'Hardcover'
  WHEN e.type = 'p' THEN 'Paperback'
  END AS type
FROM editions as e;

-- 6
SELECT b.title, e.publication
FROM books AS b
LEFT OUTER JOIN editions AS e
  ON b.id = e.book_id

-- 7
SELECT sum(s.stock) AS total_copies
FROM stock AS s;

-- 8
SELECT ROUND(avg(s.cost), 2) AS avg_cost,
FLOOR(avg(s.retail)) AS avg_retail,
avg(s.retail)-avg(s.cost) AS profit
FROM stock AS s;

-- 9
SELECT editions.book_id, stock.stock
FROM editions
JOIN stock
  ON editions.isbn = stock.isbn
  ORDER BY stock.stock desc
  limit 1;

-- 10
SELECT a.id, (a.first_name || ' ' ||  a.last_name)AS full_name, count(b.title)
FROM authors as a
JOIN books as b on a.id = b.author_id
GROUP BY a.id;

-- 11 order by count of books
SELECT a.id, (a.first_name || ' ' ||  a.last_name)AS full_name, count(b.title)
FROM authors as a
JOIN books as b on a.id = b.author_id
GROUP BY a.id
ORDER BY count(b.title) desc;

-- 12
Select title from books where book_id in
(
    select distinct(book_id) from editions where book_id in 
    (
        select book_id from editions where type='h' group by book_id, type
    )
    and book_id in 
    (
        select book_id from editions where type='p' group by book_id, type    
    )
)


-- 13 For each publisher, list their average book sale price, number of editions published.
SELECT avg(s.retail), count(e.edition)
FROM editions AS e
JOIN stock AS s on e.isbn = s.isbn
GROUP BY e.publisher_id;

-- or
SELECT p.name AS publishers, avg(s.retail), count(e.edition)
FROM editions AS e
JOIN stock AS s on e.isbn = s.isbn
JOIN publishers AS p on p.id = e.publisher_id
GROUP BY p.name;


