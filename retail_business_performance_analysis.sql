/* 
Retail Business Performance & Profitability Analysis
Dataset: Superstore (Single-table retail transactional data)
Objective:
- Identify profit-draining categories and sub-categories
- Analyze regional performance
- Study discount impact on profitability
*/

/* --------------------------------------------------
1. Preview Dataset
-------------------------------------------------- */
SELECT *
FROM superstore
LIMIT 10;


/* --------------------------------------------------
2. Overall Sales and Profit
-------------------------------------------------- */
SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore;


/* --------------------------------------------------
3. Category-wise Sales and Profit
-------------------------------------------------- */
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;


/* --------------------------------------------------
4. Sub-Category Profit Analysis (Identify Loss Areas)
-------------------------------------------------- */
SELECT
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Sub_Category
ORDER BY Total_Profit ASC;


/* --------------------------------------------------
5. Discount Impact on Profitability
-------------------------------------------------- */
SELECT
    Discount,
    ROUND(AVG(Profit), 2) AS Average_Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;


/* --------------------------------------------------
6. Region-wise Business Performance
-------------------------------------------------- */
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;


/* --------------------------------------------------
7. State-wise Profit Contribution
-------------------------------------------------- */
SELECT
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY State
ORDER BY Total_Profit DESC;


/* --------------------------------------------------
8. High Discount, Low Profit Products (Risk Items)
-------------------------------------------------- */
SELECT
    Category,
    Sub_Category,
    Discount,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
WHERE Discount >= 0.3
GROUP BY Category, Sub_Category, Discount
ORDER BY Total_Profit ASC;


/* --------------------------------------------------
9. Top Profitable Sub-Categories
-------------------------------------------------- */
SELECT
    Sub_Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Sub_Category
ORDER BY Total_Profit DESC
LIMIT 5;


/* --------------------------------------------------
10. Least Profitable Sub-Categories
-------------------------------------------------- */
SELECT
    Sub_Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Sub_Category
ORDER BY Total_Profit ASC
LIMIT 5;
