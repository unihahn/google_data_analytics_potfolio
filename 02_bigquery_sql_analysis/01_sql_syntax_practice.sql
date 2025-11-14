-- ######################################################################
-- SQL SYNTAX DEMONSTRATION: FOUNDATIONAL COMMANDS & CLEANING FUNCTIONS
--
-- This file demonstrates core SQL syntax used for data aggregation,
-- transformation, and cleaning, as covered in the Google Data Analytics course.
-- ######################################################################


-- QUERY 1: FOUNDATIONAL STRUCTURE (SELECT, FROM, WHERE, GROUP BY, ORDER BY, SUM)
-- Aggregates total views for titles containing 'Google', ordered by view count.
SELECT
  language,
  title,
  SUM(views) AS total_views
FROM
  `bigquery-samples.wikipedia_benchmark.Wiki10B`
WHERE
  title LIKE '%Google%'
GROUP BY
  language,
  title
ORDER BY
  total_views DESC;

--------------------------------------------------------------------------------

-- QUERY 2: TRIM() FUNCTION
-- Used for cleaning string data by removing leading/trailing whitespace.
SELECT
  TRIM(column_name) AS trimmed_column
FROM
  `your_practice_table`;

--------------------------------------------------------------------------------

-- QUERY 3: LENGTH() FUNCTION
-- Calculates the number of characters in the 'country' column.
SELECT
  LENGTH(country) AS country_length
FROM
  `predictive-host-477917-s5.customer_data.customer_address`;

--------------------------------------------------------------------------------

-- QUERY 4: COMBINING WHERE with LENGTH()
-- Filters rows to only show countries where the string length is greater than 2 characters.
SELECT
  country
FROM
  `predictive-host-477917-s5.customer_data.customer_address`
WHERE
  LENGTH(country) > 2;

--------------------------------------------------------------------------------

-- QUERY 5: SUBSTR() FUNCTION
-- Extracts the first 2 characters from the 'country' column.
SELECT
  SUBSTR(country, 1, 2) AS country_abbrev
FROM
  `predictive-host-477917-s5.customer_data.customer_address`;

--------------------------------------------------------------------------------

-- QUERY 6: DISTINCT with SUBSTR()
-- Finds unique customer IDs where the country string starts with 'US'.
SELECT
  DISTINCT customer_id
FROM
  `predictive-host-477917-s5.customer_data.customer_address`
WHERE
  SUBSTR(country, 1, 2) = 'US';

--------------------------------------------------------------------------------

-- QUERY 7: DISTINCT with TRIM()
-- Filters for unique customer IDs where the state, after cleaning whitespace, matches 'OH'.
SELECT
  DISTINCT customer_id
FROM
  `predictive-host-477917-s5.customer_data.customer_address`
WHERE
  TRIM(state) = 'OH';

--------------------------------------------------------------------------------

-- QUERY 8: LIMIT FUNCTION
-- Retrieves up to 1000 unique fuel types for preview/sampling.
SELECT
  DISTINCT fuel_type
FROM
  `predictive-host-477917-s5.cars.Native table`
LIMIT 1000;

--------------------------------------------------------------------------------

-- QUERY 9: MIN and MAX FUNCTIONS
-- Calculates the minimum and maximum values of the 'length' column.
SELECT
  MIN(length) AS min_length,
  MAX(length) AS max_length
FROM
  `predictive-host-477917-s5.cars.Native table`;

--------------------------------------------------------------------------------

-- QUERY 10: IDENTIFYING MISSING DATA (IS NULL)
-- Retrieves all rows where the 'num_of_doors' column is NULL.
SELECT
  *
FROM
  `predictive-host-477917-s5.cars.Native table`
WHERE
  num_of_doors IS NULL;

--------------------------------------------------------------------------------

-- QUERY 11: DISTINCT FUNCTION for Error Identification
-- Lists unique values in 'num_of_cylinders' to easily spot potential data entry errors (e.g., 'five', '5').
SELECT
  DISTINCT num_of_cylinders
FROM
  `predictive-host-477917-s5.cars.Native table`;

--------------------------------------------------------------------------------

-- QUERY 12: LENGTH() for String Columns
-- Lists unique 'drive_wheels' values and their string length to check consistency.
SELECT
  DISTINCT drive_wheels,
  LENGTH(drive_wheels) AS string_length
FROM
  `predictive-host-477917-s5.cars.Native table`;

--------------------------------------------------------------------------------

-- QUERY 13: MAX FUNCTION (Price)
-- Finds the maximum price recorded in the table.
SELECT
  MAX(price) AS max_price
FROM
  `predictive-host-477917-s5.cars.Native table`;

--------------------------------------------------------------------------------

-- QUERY 14: ORDER BY and DESC
-- Orders purchase prices from highest to lowest.
SELECT
  purchase_price
FROM
  `predictive-host-477917-s5.lauren_customer_data.customer_purchase`
ORDER BY
  purchase_price DESC;

--------------------------------------------------------------------------------

-- QUERY 15: CAST() FUNCTION
-- Converts the 'purchase_price' column from its current data type to FLOAT64 for accurate calculation/sorting.
SELECT
  CAST(purchase_price AS FLOAT64) AS purchase_price_float
FROM
  `predictive-host-477917-s5.lauren_customer_data.customer_purchase`
ORDER BY
  purchase_price_float DESC;

--------------------------------------------------------------------------------

-- QUERY 16: DATE FILTERING (BETWEEN AND)
-- Filters transactions to include only those that occurred in December 2020.
SELECT
  date,
  purchase_price
FROM
  `predictive-host-477917-s5.lauren_customer_data.customer_purchase`
WHERE
  date BETWEEN '2020-12-01' AND '2020-12-31';

--------------------------------------------------------------------------------

-- QUERY 17: CAST() to Extract Date Only
-- Converts a full timestamp/datetime field to just a date, then filters by a date range.
SELECT
  CAST(date AS date) AS date_only,
  purchase_price
FROM
  `predictive-host-477917-s5.lauren_customer_data.customer_purchase`
WHERE
  date BETWEEN '2020-12-01' AND '2020-12-31';

--------------------------------------------------------------------------------

-- QUERY 18: CONCAT() FUNCTION
-- Combines product code and color into a single 'new_product_code' field.
SELECT
  CONCAT(product_code, product_color) AS new_product_code
FROM
  `predictive-host-477917-s5.lauren_customer_data.customer_purchase`
WHERE
  product = 'couch';

--------------------------------------------------------------------------------

-- QUERY 19: COALESCE() FUNCTION (Handling Missing Values)
-- Returns the first non-null value from the list ('product' or 'product_code') to fill gaps.
SELECT
  COALESCE(product, product_code) AS product_info
FROM
  `predictive-host-477917-s5.lauren_customer_data.customer_purchase`;

--------------------------------------------------------------------------------

-- QUERY 20: CASE WHEN THEN, ELSE, END AS (Conditional Logic)
-- Demonstrates conditional cleaning: corrects the misspelling 'fwd' to 'fad'.
SELECT
  make,
  CASE
    WHEN drive_wheels = "fwd" THEN "fixed_front_wheel_drive" -- Corrected 'fad' to a more descriptive term for clarity
    ELSE drive_wheels
  END AS cleaned_drive_wheels
FROM
  `predictive-host-477917-s5.cars.Native table`;



