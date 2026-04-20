CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;
SELECT COUNT(*) FROM online_retail;
DESCRIBE online_retail;


-- 1)  Total revenue by country
SELECT Country,
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_revenue
FROM online_retail
WHERE Country != 'United Kingdom'
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 10;


-- 2)Monthly revenue trend
SELECT
	YEAR(InvoiceDate) AS years,
    MONTH(InvoiceDate) AS months,
    COUNT( DISTINCT InvoiceNo) AS total_orders,
    ROUND(SUM(TotalPrice) , 2) AS monthly_revenue
FROM online_retail
GROUP BY YEAR(InvoiceDate) , MONTH (InvoiceDate)
ORDER BY years, months;


-- 3)Top 10 best selling products
SELECT 
	ROUND(SUM(TotalPrice) , 2) AS total_revenue,
    SUM(quantity) AS total_units_sold
FROM online_retail
GROUP BY Description
ORDER BY total_units_sold DESC
LIMIT 10;


-- 4) Revenue by month using CTE
WITH monthly_sales AS(
SELECT	
    YEAR(InvoiceDate) AS years,
    MONTH(InvoiceDate) AS months,
    ROUND(SUM(TotalPrice) , 2) AS revenue
FROM online_retail
GROUP BY YEAR (InvoiceDate) , MONTH (InvoiceDate) 
)
SELECT
	years,
    months,
    revenue
FROM monthly_sales
ORDER BY years, months;


-- 5) Month over month revenue growth using LAG
WITH monthly_sales AS(
SELECT
	YEAR(InvoiceDate) AS years,
    MONTH(InvoiceDate) AS months,
    ROUND(SUM(TotalPrice) ,2) AS revenue
FROM online_retail
GROUP BY YEAR (InvoiceDate) , MONTH(InvoiceDate)
)
SELECT
	years,
    months,
    revenue,
    LAG(revenue) OVER(ORDER BY years,months) AS previous_months_revenue,
    ROUND( revenue - LAG(revenue) OVER(ORDER BY years,months) / LAG(revenue) OVER(ORDER BY years,months) *100 ,2) AS growth_precentage
FROM monthly_sales
ORDER BY years, months;


-- 6) Top customers by revenue using RANK
WITH customer_revenue AS (
SELECT
	CustomerID,
    ROUND(SUM(TotalPrice) ,2) AS total_spent,
    COUNT( DISTINCT InvoiceNo) AS total_orders
FROM online_retail
GROUP BY CustomerID
)
SELECT
	total_spent,
    total_orders,
    CustomerID,
    RANK() OVER(ORDER BY total_spent DESC) AS revenue_rank
FROM customer_revenue
LIMIT 10;