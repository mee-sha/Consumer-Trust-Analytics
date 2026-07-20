-- =====================================================
-- REPORT 1 : CUSTOMER OVERVIEW
-- =====================================================

-- -----------------------------------------------------
-- Business Question 1
-- How many customer reviews are available?
-- -----------------------------------------------------

SELECT
    COUNT(*) AS Total_Reviews
FROM reviews;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- The database contains 37,999 customer reviews,
-- providing a strong foundation for reliable analysis.

-- -----------------------------------------------------
-- Business Question 2
-- How many EdTech platforms are represented?
-- -----------------------------------------------------

SELECT
    COUNT(DISTINCT platform) AS Total_Platforms
FROM reviews;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- The dataset includes multiple EdTech platforms,
-- enabling cross-platform comparison of customer
-- satisfaction and consumer trust.


-- -----------------------------------------------------
-- Business Question 3
-- Which platforms have the largest number of reviews?
-- -----------------------------------------------------

SELECT
    COUNT(DISTINCT category) AS Total_Categories
FROM reviews;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with higher review volumes indicate
-- greater customer engagement and provide more
-- reliable data for performance evaluation.
   

-- -----------------------------------------------------
-- Business Question 4
-- Which platforms have the largest number of reviews?

-- -----------------------------------------------------
				
SELECT
    platform,
    COUNT(*) AS Total_Reviews
FROM reviews
GROUP BY platform
ORDER BY Total_Reviews DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with higher review volumes indicate
-- stronger customer engagement and generate more
-- representative customer feedback.


-- -----------------------------------------------------
-- Business Question 5
-- Which learning categories have the highest number of
-- customer reviews?
--- -----------------------------------------------------

SELECT
    category,
    COUNT(*) AS Total_Reviews
FROM reviews
GROUP BY category
ORDER BY Total_Reviews DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Categories with higher review volumes indicate stronger
-- customer participation and provide a richer source of
-- customer feedback for business analysis.
