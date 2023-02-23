-- 1.) List all customers who live in Texas (use JOINs)

SELECT first_name, last_name
FROM customer 
INNER JOIN address 
ON customer.customer_id = address.address_id
WHERE district = 'Texas'
-- Dorothy Taylor; Thelma Murray; Daniel Cabral
-- Leonard Schofield; Alfredo Mcadams.     


-- 2.) Get all payments above $6.99 with the Customer's Full Name  
SELECT  first_name, last_name 
FROM customer 
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY payment_id
    HAVING SUM(amount)>6.99
);  


-- 3.) Show all customers names who have made payments over $175(use subqueries)
SELECT  first_name, last_name 
FROM customer 
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY payment_id
    HAVING SUM(amount)>175
);  
-- Peter Menard



-- 4.) List all customers that live in Nepal (use the city table)
SELECT first_name, last_name 
FROM customer 
WHERE customer_id IN ( 
    SELECT customer.customer_id 
    FROM customer     
    INNER JOIN address  
    ON customer.customer_id = address.address_id
    INNER JOIN  city
    ON address.address_id =city.city_id  
    WHERE city = 'Nepal'
);

-- 0 customers live in Nepal    




--  5.) Which staff member had the most transactions?  
SELECT payment_id
FROM payment 
WHERE  
    (SELECT COUNT(*) 
     FROM payment 
     WHERE payment.payment_id);   


-- 6.)How many movies of each rating are there?  
SELECT rating,COUNT(film_id)
FROM Film
GROUP BY rating;


-- 7.)Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT  first_name, last_name 
FROM customer 
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY payment_id
    HAVING (amount) > 6.99
);  
  