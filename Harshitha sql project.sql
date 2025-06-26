use books ;

SELECT *from `03_books (1)` ;
 

/*1. what is hightest price of a book?*/
SELECT * 
FROM `03_books (1)`
WHERE price = (
    SELECT MAX(price) 
    FROM `03_books (1)`
);


/*2. what is lowest price of a book?*/
SELECT * 
FROM `03_books (1)`
WHERE price = (
    SELECT MIN(price) 
    FROM `03_books (1)`
);

/*3.What is count of Total no of books ?*/
SELECT COUNT(*) AS total_books FROM `03_books (1)`;

/*3. What is Top 3 books with most stock?*/
SELECT title, stock
FROM `03_books (1)`
ORDER BY stock DESC
LIMIT 3;

/* 4. What is Top 5 most frequent genre?*/
SELECT genre, COUNT(*) AS count
FROM `03_books (1)`
GROUP BY genre
ORDER BY count DESC
LIMIT 5;

/* 5. right JOIN */ 
   SELECT 
    b.Title, 
    o.Quantity
FROM 
    `03_books (1)` AS b
RIGHT JOIN `04_orders` AS o 
    ON b.Book_ID = o.Book_ID;
    
  /* 6. Inner JOIN */  
    SELECT 
    b.Title, 
    o.Quantity, 
    o.Order_Date
FROM 
    `03_books (1)` AS b
INNER JOIN `04_orders` AS o 
    ON b.Book_ID = o.Book_ID;
    
  /*7. LEFT JOIN */  
    SELECT 
    b.Title, 
    o.Quantity, 
    o.Order_Date
FROM 
    `03_books (1)` AS b
LEFT JOIN `04_orders` AS o 
    ON b.Book_ID = o.Book_ID;
   
   /* Top 5 Best-Selling Books (Year-wise)*/
    SELECT 
    b.Title,
    YEAR(o.Order_Date) AS Year,
    SUM(o.Quantity) AS Total_Sold
FROM 
    `03_books (1)` AS b
INNER JOIN `04_orders` AS o 
    ON b.Book_ID = o.Book_ID
GROUP BY 
    b.Title, YEAR(o.Order_Date)
ORDER BY 
    YEAR(o.Order_Date),
    Total_Sold DESC
LIMIT 5;

/*Find Books Published Before the Year 1950*/
SELECT Title, Author, Published_Year, Genre
FROM `03_books (1)`
WHERE Published_Year < 1950;

/* Find the Total Stock Available by Genre*/
SELECT Genre, SUM(Stock) AS Total_Stock
FROM `03_books (1)`
GROUP BY Genre;