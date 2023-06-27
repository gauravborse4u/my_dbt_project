WITH cte AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY ITEM_ID, SKU, TYPE_NAME, SALESDESCRIPTION, CLASS_ID, WS_MERCHANDISE_DEPARTMENT_ID, WS_MERCHANDISE_COLLECTION_ID, WS_MERCHANDISE_CLASS_ID, WS_MERCHANDISE_SUBCLASS_ID ORDER BY ITEM_ID) AS row_num
  FROM Items
)
SELECT *
FROM cte
WHERE row_num = 1