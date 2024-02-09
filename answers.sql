-- problem 1 
SELECT email FROM customers ORDER BY email;

-- problem 2
SELECT id 
FROM orders 
WHERE customer_id IN (
  SELECT id 
  FROM customers 
  WHERE fname = 'Elizabeth' AND lname = 'Crocker'
);

-- problem 3
SELECT SUM(num_cupcakes) FROM orders WHERE processed = false;

-- problem 4 
SELECT cupcakes.name, SUM(orders.num_cupcakes) AS total_ordered
FROM cupcakes
LEFT JOIN orders ON cupcakes.id = orders.cupcake_id
GROUP BY cupcakes.name
ORDER BY cupcakes.name ASC;

-- problem 5 
SELECT 
    email, 
    SUM(num_cupcakes) AS total_cupcakes_ordered
FROM 
    customers
JOIN 
    orders ON customers.id = customer_id
GROUP BY 
    email
ORDER BY 
    total_cupcakes_ordered DESC;

-- problem 6
SELECT DISTINCT 
    fname, 
    lname, 
    email
FROM 
    customers
JOIN 
    orders ON customers.id = customer_id
JOIN 
    cupcakes ON cupcake_id = cupcakes.id
WHERE 
    name = 'funfetti' AND processed = TRUE;
