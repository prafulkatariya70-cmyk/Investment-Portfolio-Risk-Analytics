-- EXECUTIVE DASHBOARD ANALYSIS --

-- QUERY 1 : Total Clients --

Select count(*) as total_clients

from client.clients;

--  QUERY 2 : Total Portfolios --

select count(*) as total_portfolios

from portfolio.portfolios;

-- QUERY 3 : Total Assets --

Select count(*) as total_Assets

from market.assets;

-- QUERY 4 : Total Transactions --

Select count(*) as total_transactions

from portfolio.transactions

-- QUERY 5 : Total Assets Under Management --

Select sum (quantity * average_buy_price) as Total_AUM

from portfolio.holdings;

-- Query 6 : Average Portfolio Value --

Select avg(portfolio_value) as Average_Portfolio_Value

from
(

Select
portfolio_id,

sum(quantity * average_buy_price) as portfolio_value

from portfolio.holdings

group by portfolio_id
)

As portfolio_values;

-- QUERY 7 : Top 10 Clients by Net Worth --

Select top(10)

client_id,

concat(first_name, ' ', last_name) as Client_name,

net_worth

from client.clients

order by net_worth desc;

-- QUERY 8 : Clients by Risk Profile --

Select rp.profile_name,

count(c.client_id) as total_clients

FROM client.clients c

INNER JOIN client.risk_profiles rp
ON c.risk_profile_id = rp.risk_profile_id

GROUP BY rp.profile_name

ORDER BY Total_Clients DESC;
GO

--  QUERY 9 : Portfolio Distribution by Investment Goal --

SELECT

    investment_goal,

    COUNT(*) AS Total_Portfolios

FROM portfolio.portfolios

GROUP BY investment_goal

ORDER BY Total_Portfolios DESC;
GO

-- QUERY 10 : Top 10 Portfolios by Portfolio Value --

Select top (10)

p.portfolio_id,

p.portfolio_name,

sum(h.quantity * h.average_buy_price) as Portfolio_Value

FROM portfolio.portfolios p

INNER JOIN portfolio.holdings h
ON p.portfolio_id = h.portfolio_id

GROUP BY

    p.portfolio_id,
    p.portfolio_name

ORDER BY Portfolio_Value DESC;
GO
