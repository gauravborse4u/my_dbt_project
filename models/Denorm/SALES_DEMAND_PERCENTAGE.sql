with
    demand as (
        select
            sum(replace(amount, ',', '')) as demandamount,
            sum(units) as demandunits,
            sum(replace(amount, ',', '') + replace(cost, ',', '')) as demandprofit
        from {{ ref("TRANSACTIONS_LINES_FACT") }}
        where transaction_type = 'Sales Order'
    ),
    sales as (
        select
            sum(replace(amount, ',', '')) as salesamount,
            sum(units) as salesunits,
            sum(replace(amount, ',', '') + replace(cost, ',', '')) as salesprofit
        from {{ ref("TRANSACTIONS_LINES_FACT") }}
        where transaction_type = 'Invoice'
    )

select *
from demand, sales
