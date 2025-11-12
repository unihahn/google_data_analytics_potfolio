-- Query 1: Demonstrates using SELECT, FROM, WHERE, GROUP BY, and ORDER BY
-- This is a foundational query structure for data aggregation.
SELECT
  language,
  title,
  SUM(views) AS views
FROM
  `bigquery-samples.wikipedia_benchmark.Wiki10B`
WHERE
  title LIKE '%Google%'
GROUP BY
  language,
  title
ORDER BY
  views DESC;

--------------------------------------------------------------------------------

-- Query 2: Demonstrates the TRIM() function for cleaning string data
-- Used to remove leading/trailing whitespace from a column.
SELECT
  TRIM(column_name) AS trimmed_column
FROM
  `your_practice_table`;

--------------------------------------------------------------------------------

-- Query 3: Demonstrates the LENGTH() function
-- Calculates the number of characters in the 'country' column.
SELECT
  LENGTH(country) AS letters_in_country
FROM
  `predictive-host-477917-s5.customer_data.customer_address`;

--------------------------------------------------------------------------------

-- Query 4: Demonstrates combining WHERE with LENGTH()
-- Filters rows to only show countries where the string length is greater than 2 characters.
SELECT
  country
FROM
  `predictive-host-477917-s5.customer_data.customer_address`
WHERE
  LENGTH(country) > 2;

--------------------------------------------------------------------------------

-- Query 5: Demonstrates the SUBSTR() function
-- Extracts the first 2 characters from the 'country' column and filters for 'US'.
-- Note: This is a less efficient alternative to LIKE 'US%'.
SELECT
  customer_id
FROM
  `predictive-host-477917-s5.customer_data.customer_address`
WHERE
  SUBSTR(country, 1, 2) = 'US';

--------------------------------------------------------------------------------

-- Query 6: Demonstrates using DISTINCT with SUBSTR()
-- Finds unique customer IDs where the country string starts with 'US'.
SELECT
  DISTINCT customer_id
FROM
  `predictive-host-477917-s5.customer_data.customer_address`
WHERE
  SUBSTR(country, 1, 2) = 'US';

--------------------------------------------------------------------------------

-- Query 7: Demonstrates combining LENGTH() with WHERE clause (Applied to 'state')
-- Filters rows to only show states where the string length is greater than 2 characters.
SELECT
  state
FROM
  `predictive-host-477917-s5.customer_data.customer_address`
WHERE
  LENGTH(state) > 2;

--------------------------------------------------------------------------------

-- Query 8: Demonstrates combining DISTINCT with TRIM()
-- Filters for unique customer IDs where the state, after cleaning whitespace, matches 'OH'.
SELECT
  DISTINCT customer_id
FROM
  `predictive-host-477917-s5.customer_data.customer_address`
WHERE
  TRIM(state) = 'OH';

--------------------------------------------------------------------------------

-- You still have one more query to include to reach the 9 successful queries you mentioned.
-- If the 9th query was the one you used for the 100 Billion Row Wikipedia query,
-- make sure to include it in the '02_query_scale_performance.sql' file instead.