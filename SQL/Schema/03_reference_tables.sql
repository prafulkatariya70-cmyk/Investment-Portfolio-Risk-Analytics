USE InvestmentPortfolioAnalytics;
GO

------------------------------------------------------------
-- Countries
------------------------------------------------------------
CREATE TABLE market.countries
(
    country_id INT IDENTITY(1,1) PRIMARY KEY,
    country_code CHAR(2) NOT NULL UNIQUE,
    country_name VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL,
    created_at DATETIME2 DEFAULT GETDATE()
);
GO

------------------------------------------------------------
-- Risk Profiles
------------------------------------------------------------
CREATE TABLE client.risk_profiles
(
    risk_profile_id INT IDENTITY(1,1) PRIMARY KEY,
    profile_name VARCHAR(30) NOT NULL UNIQUE,
    description VARCHAR(200),
    created_at DATETIME2 DEFAULT GETDATE()
);
GO

------------------------------------------------------------
-- Asset Types
------------------------------------------------------------
CREATE TABLE market.asset_types
(
    asset_type_id INT IDENTITY(1,1) PRIMARY KEY,
    asset_type_name VARCHAR(50) NOT NULL UNIQUE,
    created_at DATETIME2 DEFAULT GETDATE()
);
GO

------------------------------------------------------------
-- Sectors
------------------------------------------------------------
CREATE TABLE market.sectors
(
    sector_id INT IDENTITY(1,1) PRIMARY KEY,
    sector_name VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME2 DEFAULT GETDATE()
);
GO