-- Query 1: Ran on the 10 Billion Row Sample (Wiki10B)
-- This query processed the smaller data size (approx. 415 GB).
SELECT
  language,
  title,
  SUM(views) AS views
FROM
  `bigquery-samples.wikipedia_benchmark.Wiki10B` -- <--- SMALLER TABLE
WHERE
  title LIKE '%Google%'
GROUP BY
  language,
  title
ORDER BY
  views DESC;

--------------------------------------------------------------------------------

-- Query 2: Ran on the 100 Billion Row Dataset (Wiki100B)
-- This query processed the larger data size (approx. 4.1 TB) for comparison.
SELECT
  language,
  title,
  SUM(views) AS views
FROM
  `bigquery-samples.wikipedia_benchmark.Wiki100B` -- <--- LARGER TABLE
WHERE
  title LIKE '%Google%'
GROUP BY
  language,
  title
ORDER BY
  views DESC;