CREATE TABLE public.sales (
    sale_id SERIAL PRIMARY KEY,       -- Auto-increment ID
    sale_date DATE NOT NULL,          -- Date of sale
    coffee_type VARCHAR(50) NOT NULL, -- Type of coffee
    quantity INT NOT NULL,            -- Number of cups sold
    price_per_cup NUMERIC(6,2) NOT NULL, -- Price for each cup
    total_amount NUMERIC(8,2)         -- Total = quantity × price_per_cup
);
INSERT INTO public.sales (sale_date, coffee_type, quantity, price_per_cup, total_amount)
VALUES
('2025-08-10', 'Latte', 3, 150.00, 450.00),
('2025-08-10', 'Cappuccino', 2, 180.00, 360.00),
('2025-08-10', 'Espresso', 1, 120.00, 120.00);
-- Select all Latte sales in August 2025, sorted by amount (highest first)
SELECT *
FROM public.sales
WHERE coffee_type = 'Latte'
  AND sale_date BETWEEN '2025-08-01' AND '2025-08-31'
ORDER BY total_amount DESC;

-- Total sales amount by coffee type
SELECT coffee_type, SUM(total_amount) AS total_sales
FROM public.sales
GROUP BY coffee_type
ORDER BY total_sales DESC;

ALTER TABLE public.sales
ADD COLUMN customer_id INT
UPDATE public.sales
SET customer_id = 1
WHERE sale_id = 1;

UPDATE public.sales
SET customer_id = 2
WHERE sale_id = 2;

UPDATE public.sales
SET customer_id = 1
WHERE sale_id = 3;
CREATE TABLE public.customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO public.customers (customer_name, city)
VALUES
('Akshaya', 'Chennai'),
('John', 'Mumbai'),
('Priya', 'Delhi'),
('Ravi', 'Kolkata'); -- This one will have no sales

UPDATE public.sales SET customer_id = 1 WHERE sale_id = 1;
UPDATE public.sales SET customer_id = 2 WHERE sale_id = 2;
UPDATE public.sales SET customer_id = 1 WHERE sale_id = 3;
UPDATE public.sales SET customer_id = NULL WHERE sale_id = 4; -- no customer info

-- INNER JOIN: only matching sales & customers
SELECT s.sale_id, s.coffee_type, s.total_amount, c.customer_name, c.city
FROM public.sales s
INNER JOIN public.customers c
ON s.customer_id = c.customer_id;

-- LEFT JOIN: all sales, even those with no customer
SELECT s.sale_id, s.coffee_type, c.customer_name
FROM public.sales s
LEFT JOIN public.customers c
ON s.customer_id = c.customer_id;

-- RIGHT JOIN: all customers, even those with no sales
SELECT s.sale_id, s.coffee_type, c.customer_name
FROM public.sales s
RIGHT JOIN public.customers c
ON s.customer_id = c.customer_id;

INSERT INTO public.sales (sale_date, coffee_type, quantity, price_per_cup, total_amount, customer_id)
VALUES
-- Akshaya (customer_id = 1)
(CURRENT_DATE, 'Latte', 2, 150.00, 2 * 150.00, 1),
(CURRENT_DATE, 'Cappuccino', 1, 180.00, 1 * 180.00, 1),

-- John (customer_id = 2)
(CURRENT_DATE, 'Espresso', 3, 120.00, 3 * 120.00, 2),

-- Priya (customer_id = 3)
(CURRENT_DATE, 'Mocha', 4, 200.00, 4 * 200.00, 3),

-- NULL (unknown customer)
(CURRENT_DATE, 'Americano', 2, 100.00, 2 * 100.00, NULL);

SELECT * FROM public.sales;

