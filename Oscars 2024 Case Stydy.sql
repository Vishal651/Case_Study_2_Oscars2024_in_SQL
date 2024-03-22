use oscars2024;

Select * from winners;
Select * from movies;
Select * from nominees;

-- 1)Find the producer names along with the count of movies they have produced that won an award?
SELECT m.producer, COUNT(w.movie_title) AS won_count
FROM Winners w
JOIN Movies m ON w.movie_title = m.title
GROUP BY m.producer;

-- 2)Find the names of all movies along with the count of nominations they received and arrange in descending order?
SELECT n.movie_title, COUNT(n.movie_title) AS nomination_count
FROM Nominees n
GROUP BY n.movie_title
ORDER BY nomination_count DESC;

-- 3)Find the names of all producers who have produced movies that were both nominated and won an award?
SELECT DISTINCT m.producer
FROM Winners w
JOIN Movies m ON w.movie_title = m.title
WHERE m.title IN (SELECT DISTINCT movie_title FROM Nominees);

-- 4)Which category Cillian Murphy and Robert Downey Jr. won the award ?
SELECT category
FROM Winners
WHERE winner_name IN ('Cillian Murphy', 'Robert Downey Jr.');

-- 5)Retrieve the count of winners for each category from the Winners table?
SELECT category, COUNT(*) AS winner_count
FROM Winners
GROUP BY category;