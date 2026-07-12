USE InvestmentPortfolioAnalytics;
GO

CREATE TABLE market.countries
(
    country_id INT IDENTITY(1,1) PRIMARY KEY,

    country_code CHAR(2) NOT NULL UNIQUE,

    country_name VARCHAR(100) NOT NULL,

    region VARCHAR(50) NOT NULL,

    created_at DATETIME2
        DEFAULT GETDATE()
);
GO

SELECT *
FROM market.countries;

USE InvestmentPortfolioAnalytics;
GO

------------------------------------------------------------
-- CURRENCIES
------------------------------------------------------------
CREATE TABLE market.currencies
(
    currency_id INT IDENTITY(1,1) PRIMARY KEY,
    currency_code CHAR(3) NOT NULL UNIQUE,
    currency_name VARCHAR(50) NOT NULL,
    symbol VARCHAR(10),
    created_at DATETIME2 DEFAULT GETDATE()
);
GO

------------------------------------------------------------
-- EXCHANGES
------------------------------------------------------------
CREATE TABLE market.exchanges
(
    exchange_id INT IDENTITY(1,1) PRIMARY KEY,
    exchange_code VARCHAR(10) NOT NULL UNIQUE,
    exchange_name VARCHAR(100) NOT NULL,
    country_id INT NOT NULL,
    timezone VARCHAR(50),
    created_at DATETIME2 DEFAULT GETDATE(),

    CONSTRAINT FK_Exchange_Country
        FOREIGN KEY(country_id)
        REFERENCES market.countries(country_id)
);
GO

------------------------------------------------------------
-- SECTORS
------------------------------------------------------------
CREATE TABLE market.sectors
(
    sector_id INT IDENTITY(1,1) PRIMARY KEY,
    sector_name VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME2 DEFAULT GETDATE()
);
GO

------------------------------------------------------------
-- ASSET TYPES
------------------------------------------------------------
CREATE TABLE market.asset_types
(
    asset_type_id INT IDENTITY(1,1) PRIMARY KEY,
    asset_type_name VARCHAR(50) NOT NULL UNIQUE,
    created_at DATETIME2 DEFAULT GETDATE()
);
GO

------------------------------------------------------------
-- BENCHMARKS
------------------------------------------------------------
CREATE TABLE market.benchmarks
(
    benchmark_id INT IDENTITY(1,1) PRIMARY KEY,
    benchmark_name VARCHAR(100) NOT NULL,
    benchmark_symbol VARCHAR(20),
    created_at DATETIME2 DEFAULT GETDATE()
);
GO

------------------------------------------------------------
-- RISK PROFILES
------------------------------------------------------------
CREATE TABLE client.risk_profiles
(
    risk_profile_id INT IDENTITY(1,1) PRIMARY KEY,
    profile_name VARCHAR(30) NOT NULL UNIQUE,
    description VARCHAR(200),
    created_at DATETIME2 DEFAULT GETDATE()
);
GO

SELECT
TABLE_SCHEMA,
TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA, TABLE_NAME;