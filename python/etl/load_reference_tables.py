import pandas as pd
from python.etl.database import get_connection

conn = get_connection()
cursor = conn.cursor()

# -----------------------------
# Countries
# -----------------------------
countries = pd.read_csv("data/raw/countries.csv")

for _, row in countries.iterrows():
    cursor.execute("""
        INSERT INTO market.countries
        (country_code, country_name, region)
        VALUES (?, ?, ?)
    """,
    row.country_code,
    row.country_name,
    row.region)

print("✔ Countries Loaded")


# -----------------------------
# Risk Profiles
# -----------------------------
risk_profiles = pd.read_csv("data/raw/risk_profiles.csv")

for _, row in risk_profiles.iterrows():
    cursor.execute("""
        INSERT INTO client.risk_profiles
        (profile_name, description)
        VALUES (?, ?)
    """,
    row.profile_name,
    row.description)

print("✔ Risk Profiles Loaded")


# -----------------------------
# Asset Types
# -----------------------------
asset_types = pd.read_csv("data/raw/asset_types.csv")

for _, row in asset_types.iterrows():
    cursor.execute("""
        INSERT INTO market.asset_types
        (asset_type_name)
        VALUES (?)
    """,
    row.asset_type_name)

print("✔ Asset Types Loaded")


# -----------------------------
# Sectors
# -----------------------------
sectors = pd.read_csv("data/raw/sectors.csv")

for _, row in sectors.iterrows():
    cursor.execute("""
        INSERT INTO market.sectors
        (sector_name)
        VALUES (?)
    """,
    row.sector_name)

print("✔ Sectors Loaded")


# -----------------------------
# Currencies
# -----------------------------
currencies = pd.read_csv("data/raw/currencies.csv")

for _, row in currencies.iterrows():
    cursor.execute("""
        INSERT INTO market.currencies
        (currency_code, currency_name, symbol)
        VALUES (?, ?, ?)
    """,
    row.currency_code,
    row.currency_name,
    row.symbol)

print("✔ Currencies Loaded")


conn.commit()

print("Countries committed")

cursor.close()
conn.close()

print("Connection Closed")

print("\n🎉 Reference tables loaded successfully!")