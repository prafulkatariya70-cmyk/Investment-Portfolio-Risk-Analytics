-- TRADING & ASSET ANALYTICS --

--  QUERY 21 : Buy vs Sell Transactions --

SELECT

    transaction_type,

    COUNT(*) AS Total_Transactions

FROM portfolio.transactions

GROUP BY transaction_type

ORDER BY Total_Transactions DESC;
GO

-- QUERY 22 : Top 10 Most Traded Assets --

SELECT TOP (10)

    a.ticker,

    a.asset_name,

    COUNT(t.transaction_id) AS Total_Trades

FROM portfolio.transactions t

INNER JOIN market.assets a
ON t.asset_id = a.asset_id

GROUP BY

    a.ticker,
    a.asset_name

ORDER BY Total_Trades DESC;
GO

-- QUERY 23 : Asset Distribution by Sector --

SELECT

    s.sector_name,

    COUNT(a.asset_id) AS Total_Assets

FROM market.assets a

INNER JOIN market.sectors s
ON a.sector_id = s.sector_id

GROUP BY s.sector_name

ORDER BY Total_Assets DESC;
GO

--  QUERY 24 : Asset Distribution by Asset Type --

SELECT

    at.asset_type_name,

    COUNT(a.asset_id) AS Total_Assets

FROM market.assets a

INNER JOIN market.asset_types at
ON a.asset_type_id = at.asset_type_id

GROUP BY at.asset_type_name

ORDER BY Total_Assets DESC;
GO

-- QUERY 25 : Trading Volume by Year --

SELECT

    YEAR(trade_date) AS Trade_Year,

    COUNT(*) AS Total_Transactions

FROM portfolio.transactions

GROUP BY YEAR(trade_date)

ORDER BY Trade_Year;
GO
