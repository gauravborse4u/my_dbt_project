WITH stg_transations AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY TRANSACTION_ID, TRANID, TRANSACTION_TYPE, TRANDATE, CHANNEL_ID ORDER BY TRANSACTION_ID) AS row_num
  FROM TRANSACTIONS
)
SELECT * FROM stg_transations
WHERE row_num > 1
