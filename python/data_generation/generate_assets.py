import pandas as pd

# Read CSV
df = pd.read_csv("data/raw/sp500_companies.csv")

# Keep required columns
df = df[['Symbol', 'Security', 'GICS Sector']]

# Rename columns
df.columns = [
    'ticker',
    'asset_name',
    'sector_name'
]

# -----------------------
# Sector Mapping
# -----------------------
sector_map = {
    "Information Technology": "Technology",
    "Financials": "Financials",
    "Health Care": "Healthcare",
    "Energy": "Energy",
    "Industrials": "Industrials",
    "Consumer Discretionary": "Consumer Discretionary",
    "Consumer Staples": "Consumer Staples",
    "Utilities": "Utilities",
    "Real Estate": "Real Estate",
    "Communication Services": "Communication Services",
    "Materials": "Materials"
}

df["sector_name"] = df["sector_name"].map(sector_map)

import random

# Country ID (USA)
df["country_id"] = 12

# Asset Type Mapping
asset_types = [
    ("Stock", 1),
    ("ETF", 2),
    ("Bond", 3),
    ("Mutual Fund", 4),
    ("REIT", 5)
]

weights = [60, 15, 10, 10, 5]

selected = random.choices(asset_types, weights=weights, k=len(df))

df["asset_type"] = [x[0] for x in selected]
df["asset_type_id"] = [x[1] for x in selected]

print(df.head())

# Save
df.to_csv("data/raw/assets.csv", index=False)

print("assets.csv created successfully!")