WITH cte AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY LOCATION_ID, ADDRESS, CITY, COUNTRY, DATE_LAST_MODIFIED, FULL_NAME, ISINACTIVE, NAME ORDER BY LOCATION_ID) AS row_num
  FROM LOCATIONS
)
SELECT *
FROM cte
WHERE row_num = 1