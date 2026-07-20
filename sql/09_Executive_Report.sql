-- =====================================================
-- REPORT 6 : EXECUTIVE DECISION SUPPORT REPORT
-- =====================================================

-- -----------------------------------------------------
-- Business Question 1
-- Which EdTech platforms have both high customer
-- satisfaction and high customer engagement?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Total_Reviews,
    ROUND(AVG(rating),2) AS Average_Rating
FROM reviews
GROUP BY platform
HAVING AVG(rating) >= 4.5
AND COUNT(*) >= 1000
ORDER BY Average_Rating DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with both high ratings and a large number
-- of reviews demonstrate strong customer satisfaction
-- at scale and represent industry leaders.

-- -----------------------------------------------------
-- Business Question 2
-- Which EdTech platforms receive above-average
-- helpful votes?
-- -----------------------------------------------------

SELECT
    platform,
    ROUND(AVG(thumbs_up),2) AS Avg_Helpful_Votes
FROM reviews
GROUP BY platform
HAVING AVG(thumbs_up) >
(
    SELECT AVG(thumbs_up)
    FROM reviews
)
ORDER BY Avg_Helpful_Votes DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Higher helpful votes indicate that customer feedback
-- is considered valuable by other users and may reveal
-- important product strengths or weaknesses.

-- -----------------------------------------------------
-- Business Question 3
-- Which EdTech platforms have the best customer
-- support responsiveness?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Total_Reviews,
    COUNT(reply_content) AS Replied_Reviews,
    ROUND(
        COUNT(reply_content) * 100.0 / COUNT(*),
        2
    ) AS Reply_Rate
FROM reviews
GROUP BY platform
ORDER BY Reply_Rate DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- A higher reply rate indicates stronger engagement
-- with customers and a greater commitment to resolving
-- customer concerns.

-- -----------------------------------------------------
-- Business Question 4
-- Which EdTech platforms receive the most detailed
-- customer feedback?
-- -----------------------------------------------------

SELECT
    platform,
    ROUND(AVG(review_length),2) AS Avg_Review_Length,
    ROUND(AVG(thumbs_up),2) AS Avg_Helpful_Votes
FROM reviews
GROUP BY platform
ORDER BY Avg_Review_Length DESC;

-- -----------------------------------------------------
-- Business Question 5
-- Which EdTech platforms should executives prioritize
-- for improvement?
-- -----------------------------------------------------

SELECT
    platform,
    ROUND(AVG(rating),2) AS Average_Rating,
    COUNT(*) AS Total_Reviews,
    ROUND(AVG(thumbs_up),2) AS Avg_Helpful_Votes
FROM reviews
GROUP BY platform
ORDER BY
    Average_Rating ASC,
    Avg_Helpful_Votes DESC,
    Total_Reviews DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with lower customer ratings, high customer
-- engagement, and a large review volume should be
-- prioritized for product improvements and customer
-- support initiatives.


