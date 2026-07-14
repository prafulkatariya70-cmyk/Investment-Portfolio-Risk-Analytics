import os
import pandas as pd

# -----------------------------
# Create output folder
# -----------------------------
output_folder = "data/raw"
os.makedirs(output_folder, exist_ok=True)

# -----------------------------
# Countries
# -----------------------------
countries = pd.DataFrame({
    "country_code": ["US", "CA", "GB", "DE", "FR", "JP", "IN", "AU", "SG", "CH"],
    "country_name": [
        "United States",
        "Canada",
        "United Kingdom",
        "Germany",
        "France",
        "Japan",
        "India",
        "Australia",
        "Singapore",
        "Switzerland"
    ],
    "region": [
        "North America",
        "North America",
        "Europe",
        "Europe",
        "Europe",
        "Asia",
        "Asia",
        "Oceania",
        "Asia",
        "Europe"
    ]
})

# -----------------------------
# Sectors
# -----------------------------
sectors = pd.DataFrame({
    "sector_name": [
        "Technology",
        "Financials",
        "Healthcare",
        "Energy",
        "Industrials",
        "Consumer Discretionary",
        "Consumer Staples",
        "Utilities",
        "Real Estate",
        "Communication Services",
        "Materials"
    ]
})

# -----------------------------
# Asset Types
# -----------------------------
asset_types = pd.DataFrame({
    "asset_type_name": [
        "Stock",
        "ETF",
        "Bond",
        "Mutual Fund",
        "REIT"
    ]
})

# -----------------------------
# Risk Profiles
# -----------------------------
risk_profiles = pd.DataFrame({
    "profile_name": [
        "Conservative",
        "Moderate",
        "Growth",
        "Aggressive"
    ],
    "description": [
        "Low Risk",
        "Medium Risk",
        "Growth Focused",
        "High Risk"
    ]
})

# -----------------------------
# Currencies
# -----------------------------
currencies = pd.DataFrame({
    "currency_code": [
        "USD",
        "EUR",
        "GBP",
        "JPY",
        "INR",
        "CHF",
        "CAD",
        "AUD",
        "SGD",
        "HKD"
    ],
    "currency_name": [
        "US Dollar",
        "Euro",
        "British Pound",
        "Japanese Yen",
        "Indian Rupee",
        "Swiss Franc",
        "Canadian Dollar",
        "Australian Dollar",
        "Singapore Dollar",
        "Hong Kong Dollar"
    ],
    "symbol": [
        "$",
        "€",
        "£",
        "¥",
        "₹",
        "CHF",
        "C$",
        "A$",
        "S$",
        "HK$"
    ]
})

# -----------------------------
# Exchanges
# -----------------------------
exchanges = pd.DataFrame({
    "exchange_code": [
        "NASDAQ",
        "NYSE",
        "LSE",
        "NSE",
        "BSE",
        "JPX",
        "TSX",
        "SIX",
        "HKEX",
        "SGX"
    ],
    "exchange_name": [
        "NASDAQ",
        "New York Stock Exchange",
        "London Stock Exchange",
        "National Stock Exchange",
        "Bombay Stock Exchange",
        "Japan Exchange Group",
        "Toronto Stock Exchange",
        "SIX Swiss Exchange",
        "Hong Kong Exchanges",
        "Singapore Exchange"
    ]
})

# -----------------------------
# Benchmarks
# -----------------------------
benchmarks = pd.DataFrame({
    "benchmark_name": [
        "S&P 500",
        "NASDAQ 100",
        "Dow Jones",
        "Russell 2000",
        "NIFTY 50",
        "SENSEX",
        "FTSE 100",
        "Nikkei 225"
    ]
})

# -----------------------------
# Save CSV Files
# -----------------------------
countries.to_csv(f"{output_folder}/countries.csv", index=False)
sectors.to_csv(f"{output_folder}/sectors.csv", index=False)
asset_types.to_csv(f"{output_folder}/asset_types.csv", index=False)
risk_profiles.to_csv(f"{output_folder}/risk_profiles.csv", index=False)
currencies.to_csv(f"{output_folder}/currencies.csv", index=False)
exchanges.to_csv(f"{output_folder}/exchanges.csv", index=False)
benchmarks.to_csv(f"{output_folder}/benchmarks.csv", index=False)

print("Reference data generated successfully!")