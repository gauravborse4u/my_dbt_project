-- Define the SQL query for the view
with
    transations_lines_agg as (
        select
            transaction_id,
            sum(amount) as total_amount,
            sum(cost) as total_cost,
            sum(units) as total_units
        from stg_transaction_lines  -- our staging table
        group by transaction_id
    )

select
    tl.transaction_id,
    tl.transaction_line_id,
    tl.location_id,
    tl.department_id,
    tl.item_id,
    tl.amount,
    tl.cost,
    tl.units,
    tla.total_amount,
    tla.total_cost,
    tla.total_units
from stg_transaction_lines tl
join transations_lines_agg tla on tl.transaction_id = tla.transaction_id
;
