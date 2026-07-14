CREATE TABLE market.countries
(
    country_id INT IDENTITY(1,1) PRIMARY KEY,

    country_code CHAR(2) NOT NULL UNIQUE,

    country_name VARCHAR(100) NOT NULL,

    region VARCHAR(50) NOT NULL,

    created_at DATETIME2 DEFAULT GETDATE()
);
GOCREATE TABLES

CREATE TABLE market.sectors
(
    sector_id INT IDENTITY(1,1) PRIMARY KEY,

    sector_name VARCHAR(100) NOT NULL UNIQUE,

    created_at DATETIME2 DEFAULT GETDATE()
);
GO


CREATE TABLE market.asset_types
(
    asset_type_id INT IDENTITY(1,1) PRIMARY KEY,

    asset_type_name VARCHAR(50) NOT NULL UNIQUE,

    created_at DATETIME2 DEFAULT GETDATE()
);
GO


CREATE TABLE market.currencies
(
    currency_id INT IDENTITY(1,1) PRIMARY KEY,

    currency_code CHAR(3) NOT NULL UNIQUE,

    currency_name VARCHAR(50) NOT NULL,

    symbol VARCHAR(10),

    created_at DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE market.exchanges
(
    exchange_id INT IDENTITY(1,1) PRIMARY KEY,

    exchange_code VARCHAR(10) NOT NULL UNIQUE,

    exchange_name VARCHAR(100) NOT NULL,

    country_id INT NOT NULL,

    timezone VARCHAR(50),

    created_at DATETIME2 DEFAULT GETDATE()
);
GO


CREATE TABLE market.benchmarks
(
    benchmark_id INT IDENTITY(1,1) PRIMARY KEY,

    benchmark_name VARCHAR(100) NOT NULL,

    benchmark_symbol VARCHAR(20),

    created_at DATETIME2 DEFAULT GETDATE()
);
GO


CREATE TABLE market.assets
(
    asset_id INT IDENTITY(1,1) PRIMARY KEY,

    ticker VARCHAR(20) NOT NULL UNIQUE,

    asset_name VARCHAR(100) NOT NULL,

    asset_type_id INT NOT NULL,

    sector_id INT NOT NULL,

    country_id INT NOT NULL,

    created_at DATETIME2 DEFAULT GETDATE()
);
GO


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

    created_at DATETIME2 DEFAULT GETDATE()
);
GO

/*==========================================================
   CLIENT TABLES
==========================================================*/

CREATE TABLE client.risk_profiles
(
    risk_profile_id INT IDENTITY(1,1) PRIMARY KEY,

    profile_name VARCHAR(30) NOT NULL UNIQUE,

    description VARCHAR(200),

    created_at DATETIME2 DEFAULT GETDATE()
);
GO


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

    created_at DATETIME2 DEFAULT GETDATE()
);
GO

/*==========================================================
   PORTFOLIO TABLES
==========================================================*/

CREATE TABLE portfolio.portfolios
(
    portfolio_id INT IDENTITY(1,1) PRIMARY KEY,

    client_id INT NOT NULL,

    portfolio_name VARCHAR(100) NOT NULL,

    investment_goal VARCHAR(50),

    initial_investment DECIMAL(18,2),

    creation_date DATE NOT NULL,

    created_at DATETIME2 DEFAULT GETDATE()
);
GO


CREATE TABLE portfolio.holdings
(
    holding_id INT IDENTITY(1,1) PRIMARY KEY,

    portfolio_id INT NOT NULL,

    asset_id INT NOT NULL,

    quantity DECIMAL(18,4) NOT NULL,

    average_buy_price DECIMAL(18,2) NOT NULL,

    last_updated DATETIME2 DEFAULT GETDATE()
);
GO


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

    created_at DATETIME2 DEFAULT GETDATE()
);
GO

/*==========================================================
   ANALYTICS TABLES
==========================================================*/

CREATE TABLE analytics.portfolio_performance
(
    performance_id INT IDENTITY(1,1) PRIMARY KEY,

    portfolio_id INT NOT NULL,

    valuation_date DATE NOT NULL,

    portfolio_value DECIMAL(18,2) NOT NULL,

    daily_return DECIMAL(10,4),

    cumulative_return DECIMAL(10,4),

    created_at DATETIME2 DEFAULT GETDATE()
);
GO


CREATE TABLE analytics.risk_metrics
(
    risk_metric_id INT IDENTITY(1,1) PRIMARY KEY,

    portfolio_id INT NOT NULL,

    calculation_date DATE NOT NULL,

    volatility DECIMAL(10,4),

    sharpe_ratio DECIMAL(10,4),

    max_drawdown DECIMAL(10,4),

    value_at_risk DECIMAL(18,2),

    created_at DATETIME2 DEFAULT GETDATE()
);
GO