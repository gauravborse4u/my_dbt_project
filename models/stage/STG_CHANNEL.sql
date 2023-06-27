WITH cte AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY DATE_CREATED, IS_RECORD_INACTIVE, LAST_MODIFIED_DATE, LIST_ID, LIST_ITEM_NAME ORDER BY DATE_CREATED) AS row_num
  FROM CHANNEL
)
SELECT *
FROM cte
WHERE row_num = 1
