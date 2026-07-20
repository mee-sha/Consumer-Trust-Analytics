-- =====================================================
-- REPORT 2 : CUSTOMER SATISFACTION ANALYSIS
-- =====================================================

-- -----------------------------------------------------
-- Business Question 6
-- Which EdTech platforms have the highest average
-- customer rating?
-- -----------------------------------------------------

SELECT
    platform,
    ROUND(AVG(rating), 2) AS Average_Rating
FROM reviews
GROUP BY platform
ORDER BY Average_Rating DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with higher average ratings consistently
-- deliver better customer experiences and demonstrate
-- stronger customer satisfaction.

-- -----------------------------------------------------
-- Business Question 7
-- Which learning categories have the highest average
-- customer rating?
-- -----------------------------------------------------

SELECT
    category,
    ROUND(AVG(rating), 2) AS Average_Rating
FROM reviews
GROUP BY category
ORDER BY Average_Rating DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Categories with higher average ratings indicate
-- stronger learner satisfaction and better perceived
-- educational quality.

-- -----------------------------------------------------
-- Business Question 3
-- Which platforms have an average customer rating
-- greater than 4.50?
-- -----------------------------------------------------

SELECT
    platform,
    ROUND(AVG(rating),2) AS Average_Rating
FROM reviews
GROUP BY platform
HAVING AVG(rating) > 4.50
ORDER BY Average_Rating DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with an average rating above 4.50 represent
-- high-performing services and can serve as benchmarks
-- for customer satisfaction and product quality.

-- -----------------------------------------------------
-- Business Question 4
-- Which EdTech platforms have the highest percentage
-- of 5-star reviews?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(CASE WHEN rating = 5 THEN 1 END) AS Five_Star_Reviews,
    COUNT(*) AS Total_Reviews,
    ROUND(
        COUNT(CASE WHEN rating = 5 THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS Five_Star_Percentage
FROM reviews
GROUP BY platform
ORDER BY Five_Star_Percentage DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- A higher percentage of 5-star reviews reflects stronger
-- customer satisfaction and positive learning experiences.
-- These platforms are more likely to build long-term
-- customer trust and loyalty.

-- -----------------------------------------------------
-- Business Question 5
-- Which EdTech platforms have the highest percentage
-- of 1-star reviews?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(CASE WHEN rating = 1 THEN 1 END) AS One_Star_Reviews,
    COUNT(*) AS Total_Reviews,
    ROUND(
        COUNT(CASE WHEN rating = 1 THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS One_Star_Percentage
FROM reviews
GROUP BY platform
ORDER BY One_Star_Percentage DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- A high percentage of 1-star reviews may indicate
-- recurring customer dissatisfaction related to course
-- quality, platform usability, pricing, or support
-- services. These platforms require closer investigation.