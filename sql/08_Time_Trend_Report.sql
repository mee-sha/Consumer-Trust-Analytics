-- =====================================================
-- REPORT 5 : CUSTOMER TREND ANALYSIS REPORT
-- =====================================================

-- -----------------------------------------------------
-- Business Question 1
-- Which EdTech platforms have maintained an average
-- customer rating above the overall average rating?
-- -----------------------------------------------------

SELECT
    platform,
    ROUND(AVG(rating), 2) AS Average_Rating
FROM reviews
GROUP BY platform
HAVING AVG(rating) >
(
    SELECT AVG(rating)
    FROM reviews
)
ORDER BY Average_Rating DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with an average rating above the overall
-- average demonstrate stronger customer satisfaction
-- and may serve as benchmarks for industry best
-- practices.

-- -----------------------------------------------------
-- Business Question 2
-- Which EdTech platforms have received more customer
-- reviews than the average platform?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Total_Reviews
FROM reviews
GROUP BY platform
HAVING COUNT(*) >
(
    SELECT AVG(review_count)
    FROM
    (
        SELECT
            COUNT(*) AS review_count
        FROM reviews
        GROUP BY platform
    ) AS Platform_Reviews
)
ORDER BY Total_Reviews DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms receiving more reviews than the average
-- platform generally have higher customer engagement
-- and a larger active user base. These platforms
-- generate more customer feedback, making them key
-- candidates for performance monitoring.

-- -----------------------------------------------------
-- Business Question 3
-- Which EdTech platforms have the highest percentage
-- of positive customer reviews?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Total_Reviews,
    SUM(
        CASE
            WHEN rating >= 4 THEN 1
            ELSE 0
        END
    ) AS Positive_Reviews,
    ROUND(
        SUM(
            CASE
                WHEN rating >= 4 THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS Positive_Review_Percentage
FROM reviews
GROUP BY platform
ORDER BY Positive_Review_Percentage DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with a higher percentage of positive
-- reviews consistently deliver better customer
-- experiences and stronger user satisfaction.

-- -----------------------------------------------------
-- Business Question 4
-- Which EdTech platforms have an above-average
-- customer satisfaction score?
-- -----------------------------------------------------

SELECT
    platform,
    Average_Rating
FROM
(
    SELECT
        platform,
        ROUND(AVG(rating), 2) AS Average_Rating
    FROM reviews
    GROUP BY platform
) AS Platform_Ratings

WHERE Average_Rating >
(
    SELECT AVG(Average_Rating)
    FROM
    (
        SELECT
            ROUND(AVG(rating), 2) AS Average_Rating
        FROM reviews
        GROUP BY platform
    ) AS Avg_Ratings
)

ORDER BY Average_Rating DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with an average rating above the industry
-- average consistently deliver better customer
-- experiences and can be considered high-performing
-- platforms.

-- -----------------------------------------------------
-- Business Question 5
-- Which EdTech platforms have the highest developer
-- reply rate to customer reviews?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Total_Reviews,
    COUNT(reply_content) AS Replied_Reviews,
    ROUND(
        (COUNT(reply_content) * 100.0) / COUNT(*),
        2
    ) AS Reply_Rate_Percentage
FROM reviews
GROUP BY platform
ORDER BY Reply_Rate_Percentage DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with higher reply rates demonstrate stronger
-- customer engagement and a greater commitment to
-- addressing user concerns. Monitoring reply rates helps
-- evaluate the effectiveness of customer support.

