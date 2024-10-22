WITH ZeroTraffic AS (
  SELECT
    url,
    CAST(date AS DATE) AS date,
    screenpageviews,
    LAG(screenpageviews, 1) OVER (PARTITION BY url ORDER BY CAST(date AS DATE)) AS prev_day_views,
    LAG(screenpageviews, 2) OVER (PARTITION BY url ORDER BY CAST(date AS DATE)) AS prev_two_day_views
  FROM
    `${client_id}.ga4`
  WHERE
    CAST(date AS DATE) BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY) AND DATE_SUB(CURRENT_DATE(), INTERVAL 2 DAY)

),
ConsecutiveZeros AS (
  SELECT
    url,
    date,
    screenpageviews,
    ROW_NUMBER() OVER (PARTITION BY url ORDER BY date)
      - ROW_NUMBER() OVER (PARTITION BY url, screenpageviews ORDER BY date) AS grp
  FROM
    ZeroTraffic
  WHERE
    screenpageviews = 0
)
SELECT
  url,
  COUNT(*) AS zero_day_count
FROM
  ConsecutiveZeros
GROUP BY
  url, grp
HAVING
  COUNT(*) > 0
ORDER BY
  zero_day_count DESC;
