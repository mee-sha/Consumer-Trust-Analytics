-- =====================================================
-- REPORT 3 : CONSUMER TRUST REPORT
-- =====================================================
-- -----------------------------------------------------
-- Business Question 1
-- Which EdTech platforms receive the highest average
-- number of helpful votes?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Total_Reviews,
    ROUND(AVG(thumbs_up),2) AS Average_Helpful_Votes
FROM reviews
GROUP BY platform
ORDER BY Average_Helpful_Votes DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with higher average helpful votes receive
-- customer feedback that is considered more valuable
-- and informative by other users.

-- -----------------------------------------------------
-- Business Question 2
-- Which EdTech platforms receive the longest customer
-- reviews on average?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Total_Reviews,
    ROUND(AVG(review_length),2) AS Average_Review_Length
FROM reviews
GROUP BY platform
ORDER BY Average_Review_Length DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Longer customer reviews generally contain more detailed
-- experiences, feature requests, and complaints, providing
-- richer insights into customer satisfaction.

-- -----------------------------------------------------
-- Business Question 3
-- Which EdTech platforms actively respond to customer
-- reviews?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Total_Reviews,
    COUNT(reply_content) AS Total_Replies
FROM reviews
GROUP BY platform
ORDER BY Total_Replies DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- Platforms with higher numbers of replies demonstrate
-- greater engagement with customer feedback and a stronger
-- commitment to customer support.

-- -----------------------------------------------------
-- Business Question 4
-- Which EdTech platforms have the highest customer
-- reply rate?
-- -----------------------------------------------------

SELECT
    platform,
    COUNT(*) AS Total_Reviews,
    COUNT(reply_content) AS Total_Replies,

    ROUND(
        COUNT(reply_content) * 100.0 / COUNT(*),
        2
    ) AS Reply_Rate_Percentage

FROM reviews

GROUP BY platform

ORDER BY Reply_Rate_Percentage DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- A higher reply rate reflects stronger customer
-- engagement and indicates that the platform actively
-- acknowledges and addresses customer feedback.

-- -----------------------------------------------------
-- Business Question 5
-- Which EdTech platforms have the highest Consumer
-- Trust Score?
-- -----------------------------------------------------

SELECT

    platform,

    COUNT(*) AS Total_Reviews,

    ROUND(AVG(rating),2) AS Average_Rating,

    ROUND(AVG(thumbs_up),2) AS Average_Helpful_Votes,

    ROUND(
        COUNT(reply_content) * 100.0 / COUNT(*),
        2
    ) AS Reply_Rate,

    ROUND(

        (
            AVG(rating) * 20
        ) +

        (
            AVG(thumbs_up) * 5
        ) +

        (
            COUNT(reply_content) * 100.0 / COUNT(*)
        ),

        2

    ) AS Consumer_Trust_Score

FROM reviews

GROUP BY platform

ORDER BY Consumer_Trust_Score DESC;

-- -----------------------------------------------------
-- Business Insight
-- -----------------------------------------------------
-- The Consumer Trust Score combines customer satisfaction,
-- review usefulness, and platform responsiveness into a
-- single performance metric. Platforms with higher scores
-- demonstrate stronger customer trust and engagement.