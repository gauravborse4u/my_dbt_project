WITH cte AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY ITEM_MERCHANDISE_COLLECTION_ID, DESCRIPTION, ITEM_MERCHANDISE_COLLECTION_NA ORDER BY ITEM_MERCHANDISE_COLLECTION_ID) AS row_num
  FROM {{ source('PUBLIC', 'ITEM_MERCHANDISE_COLLECTION') }}
)
SELECT *
FROM cte
WHERE row_num = 1