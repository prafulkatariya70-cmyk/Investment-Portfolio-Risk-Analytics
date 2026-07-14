--  CLIENT ANALYTICS --

-- QUERY 11 : Clients by Country --

SELECT

    co.country_name,

    COUNT(c.client_id) AS Total_Clients

FROM client.clients c

INNER JOIN market.countries co
ON c.country_id = co.country_id

GROUP BY co.country_name

ORDER BY Total_Clients DESC;
GO

-- QUERY 12 : Average Income by Risk Profile --

SELECT

    rp.profile_name,

    AVG(c.annual_income) AS Average_Income

FROM client.clients c

INNER JOIN client.risk_profiles rp
ON c.risk_profile_id = rp.risk_profile_id

GROUP BY rp.profile_name

ORDER BY Average_Income DESC;
GO

-- QUERY 13 : Top 10 Clients by Annual Income --

Select top (10)

client_id,

concat(first_name, ' ', last_name) as Client_Name,

annual_income

from client.clients

order by annual_income desc;

--  QUERY 14 : Average Net Worth by Country --

Select co.country_name,

AVG(c.net_worth) AS Average_Net_Worth

FROM client.clients c

INNER JOIN market.countries co
ON c.country_id = co.country_id

GROUP BY co.country_name

ORDER BY Average_Net_Worth DESC;
GO

-- QUERY 15 : Client Onboarding Trend --


SELECT

    YEAR(onboarding_date) AS Onboarding_Year,

    COUNT(client_id) AS Total_Clients

FROM client.clients

GROUP BY YEAR(onboarding_date)

ORDER BY Onboarding_Year;
GO