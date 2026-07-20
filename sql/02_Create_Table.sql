-- =====================================================
-- CREATE TABLE
-- Reviews
-- =====================================================

CREATE TABLE reviews (

    platform VARCHAR(100),
    category VARCHAR(100),
    rating DECIMAL(2,1),
    review TEXT,
    review_date DATE,
    thumbs_up INT,
    reply_content TEXT,
    review_length INT,
    sentiment VARCHAR(20),
    review_type VARCHAR(30),
    helpful_review VARCHAR(10),
    review_length_category VARCHAR(30),
    review_year INT,
    review_month VARCHAR(20),
    review_quarter VARCHAR(10),
    rating_category VARCHAR(30)

);

