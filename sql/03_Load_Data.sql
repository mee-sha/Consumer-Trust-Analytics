-- =====================================================
-- LOAD DATA
-- Reviews Dataset
-- =====================================================

-- Data Loading Method
-- -----------------------------------------------------
-- The final engineered dataset
-- (final_edtech_reviews.csv)
-- was imported into the 'reviews' table
-- using Python (Pandas + SQLAlchemy).
--
-- This approach was chosen to ensure
-- compatibility and efficient bulk loading.
-- -----------------------------------------------------

-- Verify Successful Import

SELECT COUNT(*) AS Total_Reviews
FROM reviews;

-- Preview Dataset

SELECT *
FROM reviews
LIMIT 10;

