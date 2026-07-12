USE InvestmentPortfolioAnalytics;
GO

------------------------------------------------------------
-- CLIENTS
------------------------------------------------------------
CREATE TABLE client.clients
(
    client_id INT IDENTITY(1,1) PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,

    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),

    date_of_birth DATE,

    annual_income DECIMAL(18,2),

    net_worth DECIMAL(18,2),

    onboarding_date DATE NOT NULL,

    country_id INT NOT NULL,

    risk_profile_id INT NOT NULL,

    created_at DATETIME2 DEFAULT GETDATE(),

    CONSTRAINT FK_Client_Country
        FOREIGN KEY (country_id)
        REFERENCES market.countries(country_id),

    CONSTRAINT FK_Client_RiskProfile
        FOREIGN KEY (risk_profile_id)
        REFERENCES client.risk_profiles(risk_profile_id)
);
GO

------------------------------------------------------------
-- PORTFOLIOS
------------------------------------------------------------
CREATE TABLE portfolio.portfolios
(
    portfolio_id INT IDENTITY(1,1) PRIMARY KEY,

    client_id INT NOT NULL,

    portfolio_name VARCHAR(100) NOT NULL,

    investment_goal VARCHAR(50),

    initial_investment DECIMAL(18,2),

    creation_date DATE NOT NULL,

    created_at DATETIME2 DEFAULT GETDATE(),

    CONSTRAINT FK_Portfolio_Client
        FOREIGN KEY (client_id)
        REFERENCES client.clients(client_id)
);
GO

------------------------------------------------------------
-- ASSETS
------------------------------------------------------------
CREATE TABLE market.assets
(
    asset_id INT IDENTITY(1,1) PRIMARY KEY,

    ticker VARCHAR(20) NOT NULL UNIQUE,

    asset_name VARCHAR(100) NOT NULL,

    asset_type_id INT NOT NULL,

    sector_id INT NOT NULL,

    country_id INT NOT NULL,

    created_at DATETIME2 DEFAULT GETDATE(),

    CONSTRAINT FK_Asset_Type
        FOREIGN KEY (asset_type_id)
        REFERENCES market.asset_types(asset_type_id),

    CONSTRAINT FK_Asset_Sector
        FOREIGN KEY (sector_id)
        REFERENCES market.sectors(sector_id),

    CONSTRAINT FK_Asset_Country
        FOREIGN KEY (country_id)
        REFERENCES market.countries(country_id)
);
GO

------------------------------------------------------------
-- TRANSACTIONS
------------------------------------------------------------
CREATE TABLE portfolio.transactions
(
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,

    portfolio_id INT NOT NULL,
    asset_id INT NOT NULL,

    transaction_type VARCHAR(10) NOT NULL,

    quantity DECIMAL(18,4) NOT NULL,

    price DECIMAL(18,2) NOT NULL,

    fees DECIMAL(18,2) DEFAULT 0,

    trade_date DATE NOT NULL,

    created_at DATETIME2 DEFAULT GETDATE(),

    CONSTRAINT FK_Transaction_Portfolio
        FOREIGN KEY(portfolio_id)
        REFERENCES portfolio.portfolios(portfolio_id),

    CONSTRAINT FK_Transaction_Asset
        FOREIGN KEY(asset_id)
        REFERENCES market.assets(asset_id)
);
GO

------------------------------------------------------------
-- HOLDINGS
------------------------------------------------------------
CREATE TABLE portfolio.holdings
(
    holding_id INT IDENTITY(1,1) PRIMARY KEY,

    portfolio_id INT NOT NULL,

    asset_id INT NOT NULL,

    quantity DECIMAL(18,4) NOT NULL,

    average_buy_price DECIMAL(18,2) NOT NULL,

    last_updated DATETIME2 DEFAULT GETDATE(),

    CONSTRAINT FK_Holding_Portfolio
        FOREIGN KEY(portfolio_id)
        REFERENCES portfolio.portfolios(portfolio_id),

    CONSTRAINT FK_Holding_Asset
        FOREIGN KEY(asset_id)
        REFERENCES market.assets(asset_id)
);
GO

SELECT
TABLE_SCHEMA,
TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA,TABLE_NAME;