SELECT
  url,
  SUM(screenpageviews) AS views
FROM
  mmap.ga4
WHERE
  CONTAINS_SUBSTR (sessionsourcemedium, 'organic')
GROUP BY
  url
ORDER BY
  views DESC;
