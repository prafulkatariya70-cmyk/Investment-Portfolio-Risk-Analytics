import pandas as pd
from database import get_connection

# Connect to SQL Server
conn = get_connection()
cursor = conn.cursor()

# Read holdings CSV
holdings = pd.read_csv("data/raw/holdings.csv")

# Insert holdings
for _, row in holdings.iterrows():

    cursor.execute("""
    INSERT INTO portfolio.holdings
(
    portfolio_id,
    asset_id,
    quantity,
    average_buy_price
)
VALUES (?, ?, ?, ?)
    """,
    row["portfolio_id"],
row["asset_id"],
row["quantity"],
row["average_purchase_price"]
    )

conn.commit()

cursor.close()
conn.close()

print("Holdings loaded successfully!")