import pandas as pd
from database import get_connection

conn = get_connection()
cursor = conn.cursor()

transactions = pd.read_csv("data/raw/transactions.csv")

for _, row in transactions.iterrows():

    cursor.execute("""
    INSERT INTO portfolio.transactions
    (
        portfolio_id,
        asset_id,
        transaction_type,
        quantity,
        price,
        fees,
        trade_date
    )
    VALUES (?, ?, ?, ?, ?, ?, ?)
    """,
    row["portfolio_id"],
    row["asset_id"],
    row["transaction_type"],
    row["quantity"],
    row["price"],
    row["fees"],
    row["trade_date"]
    )

conn.commit()

cursor.close()
conn.close()

print("Transactions loaded successfully!")