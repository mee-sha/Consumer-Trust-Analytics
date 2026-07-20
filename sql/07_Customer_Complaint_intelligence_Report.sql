-- =====================================================
-- REPORT 4 : CUSTOMER COMPLAINT INTELLIGENCE REPORT
-- =====================================================

-- -----------------------------------------------------
-- Business Question 1
-- Which EdTech platforms receive the highest number
-- of negative customer reviews?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Negative_Reviews
FROM reviews
WHERE rating <= 2
GROUP BY platform
ORDER BY Negative_Reviews DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with a higher number of negative reviews
-- may indicate recurring customer issues related to
-- course quality, platform usability, pricing, or
-- customer support. These platforms should be monitored
-- closely to identify and resolve common pain points.

-- -----------------------------------------------------
-- Business Question 2
-- Which EdTech platforms have the highest percentage
-- of negative customer reviews?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Total_Reviews,
    SUM(CASE
            WHEN rating <= 2 THEN 1
            ELSE 0
        END) AS Negative_Reviews,
    ROUND(
        (SUM(CASE
                WHEN rating <= 2 THEN 1
                ELSE 0
            END) * 100.0) / COUNT(*),
        2
    ) AS Negative_Review_Percentage
FROM reviews
GROUP BY platform
ORDER BY Negative_Review_Percentage DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- The percentage of negative reviews provides a fairer
-- comparison than total complaint counts. Platforms with
-- a high negative review percentage may require immediate
-- attention to improve customer satisfaction.

-- -----------------------------------------------------
-- Business Question 3
-- Which EdTech platforms receive the longest
-- negative customer reviews?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Negative_Reviews,
    ROUND(AVG(review_length), 2) AS Average_Review_Length
FROM reviews
WHERE rating <= 2
GROUP BY platform
ORDER BY Average_Review_Length DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Longer negative reviews often indicate that customers
-- are providing detailed explanations of their problems.
-- Platforms with longer complaint reviews may gain deeper
-- insights into recurring issues and opportunities for
-- service improvement.                 

-- -----------------------------------------------------
-- Business Question 4
-- Which EdTech platforms receive the highest average
-- number of helpful votes on negative reviews?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Negative_Reviews,
    ROUND(AVG(thumbs_up), 2) AS Average_Helpful_Votes
FROM reviews
WHERE rating <= 2
GROUP BY platform
ORDER BY Average_Helpful_Votes DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Negative reviews with higher helpful votes indicate
-- that many users agree with the reported issues.
-- These complaints may highlight widespread customer
-- concerns that should be prioritized for resolution.

-- -----------------------------------------------------
-- Business Question 5
-- Which EdTech platforms should management prioritize
-- for customer complaint resolution?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Negative_Reviews,
    ROUND(AVG(review_length), 2) AS Avg_Review_Length,
    ROUND(AVG(thumbs_up), 2) AS Avg_Helpful_Votes
FROM reviews
WHERE rating <= 2
GROUP BY platform
ORDER BY
    Negative_Reviews DESC,
    Avg_Helpful_Votes DESC,
    Avg_Review_Length DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with a high number of negative reviews,
-- longer complaint descriptions, and higher helpful
-- votes should be prioritized for investigation. These
-- platforms are more likely to have recurring issues
-- affecting a larger portion of their users.

