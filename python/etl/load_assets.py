import pandas as pd
from database import get_connection

# Connect to SQL Server
conn = get_connection()
cursor = conn.cursor()

# Load assets CSV
assets = pd.read_csv("data/raw/assets.csv")

# Get sector IDs from SQL Server
sector_df = pd.read_sql("""
SELECT sector_id, sector_name
FROM market.sectors
""", conn)

sector_map = dict(zip(sector_df["sector_name"], sector_df["sector_id"]))

# Insert assets
for _, row in assets.iterrows():

    sector_id = sector_map[row["sector_name"]]

    cursor.execute("""
    INSERT INTO market.assets
    (
        ticker,
        asset_name,
        asset_type_id,
        sector_id,
        country_id
    )
    VALUES (?, ?, ?, ?, ?)
    """,
    row["ticker"],
    row["asset_name"],
    row["asset_type_id"],
    sector_id,
    row["country_id"]
    )

conn.commit()

cursor.close()
conn.close()

print("Assets loaded successfully!")