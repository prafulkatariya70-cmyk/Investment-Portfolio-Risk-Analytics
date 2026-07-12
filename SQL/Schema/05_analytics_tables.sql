USE InvestmentPortfolioAnalytics;
GO

------------------------------------------------------------
-- MARKET PRICES
------------------------------------------------------------
CREATE TABLE market.market_prices
(
    price_id INT IDENTITY(1,1) PRIMARY KEY,

    asset_id INT NOT NULL,

    trade_date DATE NOT NULL,

    open_price DECIMAL(18,2) NOT NULL,
    high_price DECIMAL(18,2) NOT NULL,
    low_price DECIMAL(18,2) NOT NULL,
    close_price DECIMAL(18,2) NOT NULL,

    volume BIGINT NOT NULL,

    created_at DATETIME2 DEFAULT GETDATE(),

    CONSTRAINT FK_MarketPrice_Asset
        FOREIGN KEY(asset_id)
        REFERENCES market.assets(asset_id)
);
GO

------------------------------------------------------------
-- PORTFOLIO PERFORMANCE
------------------------------------------------------------
CREATE TABLE analytics.portfolio_performance
(
    performance_id INT IDENTITY(1,1) PRIMARY KEY,

    portfolio_id INT NOT NULL,

    valuation_date DATE NOT NULL,

    portfolio_value DECIMAL(18,2) NOT NULL,

    daily_return DECIMAL(10,4),

    cumulative_return DECIMAL(10,4),

    created_at DATETIME2 DEFAULT GETDATE(),

    CONSTRAINT FK_Performance_Portfolio
        FOREIGN KEY(portfolio_id)
        REFERENCES portfolio.portfolios(portfolio_id)
);
GO

------------------------------------------------------------
-- RISK METRICS
------------------------------------------------------------
CREATE TABLE analytics.risk_metrics
(
    risk_metric_id INT IDENTITY(1,1) PRIMARY KEY,

    portfolio_id INT NOT NULL,

    calculation_date DATE NOT NULL,

    volatility DECIMAL(10,4),

    sharpe_ratio DECIMAL(10,4),

    max_drawdown DECIMAL(10,4),

    value_at_risk DECIMAL(18,2),

    created_at DATETIME2 DEFAULT GETDATE(),

    CONSTRAINT FK_Risk_Portfolio
        FOREIGN KEY(portfolio_id)
        REFERENCES portfolio.portfolios(portfolio_id)
);
GO

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA, TABLE_NAME;