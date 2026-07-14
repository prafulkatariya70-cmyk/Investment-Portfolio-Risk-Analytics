/*==========================================================
   CLIENT TABLES
==========================================================*/

ALTER TABLE client.clients
ADD CONSTRAINT FK_Client_Country
FOREIGN KEY (country_id)
REFERENCES market.countries(country_id);
GO


ALTER TABLE client.clients
ADD CONSTRAINT FK_Client_RiskProfile
FOREIGN KEY (risk_profile_id)
REFERENCES client.risk_profiles(risk_profile_id);
GO



/*==========================================================
   PORTFOLIO TABLES
==========================================================*/

ALTER TABLE portfolio.portfolios
ADD CONSTRAINT FK_Portfolio_Client
FOREIGN KEY (client_id)
REFERENCES client.clients(client_id);
GO


ALTER TABLE portfolio.holdings
ADD CONSTRAINT FK_Holding_Portfolio
FOREIGN KEY (portfolio_id)
REFERENCES portfolio.portfolios(portfolio_id);
GO


ALTER TABLE portfolio.holdings
ADD CONSTRAINT FK_Holding_Asset
FOREIGN KEY (asset_id)
REFERENCES market.assets(asset_id);
GO


ALTER TABLE portfolio.transactions
ADD CONSTRAINT FK_Transaction_Portfolio
FOREIGN KEY (portfolio_id)
REFERENCES portfolio.portfolios(portfolio_id);
GO


ALTER TABLE portfolio.transactions
ADD CONSTRAINT FK_Transaction_Asset
FOREIGN KEY (asset_id)
REFERENCES market.assets(asset_id);
GO



/*==========================================================
   ANALYTICS TABLES
==========================================================*/

ALTER TABLE analytics.portfolio_performance
ADD CONSTRAINT FK_Performance_Portfolio
FOREIGN KEY (portfolio_id)
REFERENCES portfolio.portfolios(portfolio_id);
GO


ALTER TABLE analytics.risk_metrics
ADD CONSTRAINT FK_Risk_Portfolio
FOREIGN KEY (portfolio_id)
REFERENCES portfolio.portfolios(portfolio_id);
GO