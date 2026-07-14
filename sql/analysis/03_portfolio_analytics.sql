 -- PORTFOLIO ANALYTICS --

 -- QUERY 16 : Top 10 Portfolios by Portfolio Value --

 SELECT TOP (10)

    p.portfolio_id,

    p.portfolio_name,

    SUM(h.quantity * h.average_buy_price) AS Portfolio_Value

FROM portfolio.portfolios p

INNER JOIN portfolio.holdings h
ON p.portfolio_id = h.portfolio_id

GROUP BY

    p.portfolio_id,
    p.portfolio_name

ORDER BY Portfolio_Value DESC;
GO

-- QUERY 17 : Average Portfolio Value by Investment Goal --

SELECT

    p.investment_goal,

    AVG(h.quantity * h.average_buy_price) AS Average_Portfolio_Value

FROM portfolio.portfolios p

INNER JOIN portfolio.holdings h
ON p.portfolio_id = h.portfolio_id

GROUP BY p.investment_goal

ORDER BY Average_Portfolio_Value DESC;
GO

-- QUERY 18 : Total Holdings by Portfolio --

SELECT

    p.portfolio_name,

    COUNT(h.holding_id) AS Total_Holdings

FROM portfolio.portfolios p

INNER JOIN portfolio.holdings h
ON p.portfolio_id = h.portfolio_id

GROUP BY p.portfolio_name

ORDER BY Total_Holdings DESC;
GO

-- QUERY 19 : Total Investment by Portfolio --

SELECT

    p.portfolio_name,

    SUM(h.quantity * h.average_buy_price) AS Total_Investment

FROM portfolio.portfolios p

INNER JOIN portfolio.holdings h
ON p.portfolio_id = h.portfolio_id

GROUP BY p.portfolio_name

ORDER BY Total_Investment DESC;
GO

-- QUERY 20 : Portfolio Creation Trend --

SELECT

    YEAR(creation_date) AS Creation_Year,

    COUNT(*) AS Total_Portfolios

FROM portfolio.portfolios

GROUP BY YEAR(creation_date)

ORDER BY Creation_Year;
GO