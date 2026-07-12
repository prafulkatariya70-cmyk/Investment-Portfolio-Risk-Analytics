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