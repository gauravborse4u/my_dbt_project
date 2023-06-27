with
    demand as (
        select
            sum(replace(amount, ',', '')) as demandamount,
            sum(units) as demandunits,
            sum(replace(amount, ',', '') + replace(cost, ',', '')) as demandprofit
        from {{ ref("TRANSACTIONS_LINES_FACT") }}
        where transaction_type = 'Sales Order' and replace(amount, ',', '') != 0
    ),
    sales as (
        select
            sum(replace(amount, ',', '')) as salesamount,
            sum(units) as salesunits,
            sum(replace(amount, ',', '') + replace(cost, ',', '')) as salesprofit
        from {{ ref("TRANSACTIONS_LINES_FACT") }}
        where transaction_type = 'Invoice' and replace(amount, ',', '') != 0
    )

select
    round(((demandprofit / demandamount) * 100), 2) as demand_percent,
    round(((salesprofit / salesamount) * 100), 2) as sales_percent
from demand, sales
