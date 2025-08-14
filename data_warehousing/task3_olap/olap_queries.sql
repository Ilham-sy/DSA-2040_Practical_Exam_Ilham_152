SELECT s.country,
       t.quarter,
       SUM(f.total_sales) AS total_sales
FROM Sales_Fact f
JOIN Store_Dim s ON f.store_id = s.store_id
JOIN Time_Dim t ON f.time_id = t.time_id
GROUP BY s.country, t.quarter
ORDER BY s.country, t.quarter;

SELECT s.country,
       t.month,
       SUM(f.total_sales) AS total_sales
FROM Sales_Fact f
JOIN Store_Dim s ON f.store_id = s.store_id
JOIN Time_Dim t ON f.time_id = t.time_id
WHERE s.country = 'United Kingdom'
GROUP BY s.country, t.month
ORDER BY t.month;

SELECT p.category,
       SUM(f.total_sales) AS total_sales
FROM Sales_Fact f
JOIN Product_Dim p ON f.product_id = p.product_id
WHERE p.category = 'Electronics'
GROUP BY p.category;

