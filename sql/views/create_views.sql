-- VIEW 1 : Executive Dashboard --

CREATE VIEW analytics.vw_ExecutiveDashboard
AS
SELECT
    p.portfolio_id,
    p.portfolio_name,
    c.client_id,
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    SUM(h.quantity * h.average_buy_price) AS portfolio_value
FROM portfolio.portfolios p
INNER JOIN client.clients c
    ON p.client_id = c.client_id
INNER JOIN portfolio.holdings h
    ON p.portfolio_id = h.portfolio_id
GROUP BY
    p.portfolio_id,
    p.portfolio_name,
    c.client_id,
    c.first_name,
    c.last_name;
GO

--  VIEW 2 : Client Analytics --

CREATE VIEW analytics.vw_ClientAnalytics
AS
SELECT
    c.client_id,
    CONCAT(c.first_name,' ',c.last_name) AS client_name,
    rp.profile_name,
    co.country_name,
    c.annual_income,
    c.net_worth,
    c.onboarding_date
FROM client.clients c
INNER JOIN client.risk_profiles rp
    ON c.risk_profile_id = rp.risk_profile_id
INNER JOIN market.countries co
    ON c.country_id = co.country_id;
GO

-- VIEW 3 : Portfolio Analytics --

CREATE VIEW analytics.vw_PortfolioAnalytics
AS
SELECT
    p.portfolio_id,
    p.portfolio_name,
    p.investment_goal,
    COUNT(h.holding_id) AS total_holdings,
    SUM(h.quantity * h.average_buy_price) AS portfolio_value
FROM portfolio.portfolios p
INNER JOIN portfolio.holdings h
    ON p.portfolio_id = h.portfolio_id
GROUP BY
    p.portfolio_id,
    p.portfolio_name,
    p.investment_goal;
GO

--  VIEW 4 : Trading Analytics --

CREATE VIEW analytics.vw_TradingAnalytics
AS
SELECT
    t.transaction_id,
    t.trade_date,
    t.transaction_type,
    p.portfolio_name,
    CONCAT(c.first_name,' ',c.last_name) AS client_name,
    a.ticker,
    a.asset_name,
    t.quantity,
    t.price,
    t.fees
FROM portfolio.transactions t
INNER JOIN portfolio.portfolios p
    ON t.portfolio_id = p.portfolio_id
INNER JOIN client.clients c
    ON p.client_id = c.client_id
INNER JOIN market.assets a
    ON t.asset_id = a.asset_id;
GO

-- VIEW 5 : Asset Analytics --

CREATE VIEW analytics.vw_AssetAnalytics
AS
SELECT
    a.asset_id,
    a.ticker,
    a.asset_name,
    s.sector_name,
    at.asset_type_name,
    co.country_name
FROM market.assets a
INNER JOIN market.sectors s
    ON a.sector_id = s.sector_id
INNER JOIN market.asset_types at
    ON a.asset_type_id = at.asset_type_id
INNER JOIN market.countries co
    ON a.country_id = co.country_id;
GO