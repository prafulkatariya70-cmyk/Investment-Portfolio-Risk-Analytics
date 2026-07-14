import pandas as pd
from python.etl.database import get_connection

# Connect to SQL Server
conn = get_connection()
cursor = conn.cursor()

# Read portfolios CSV
portfolios = pd.read_csv("data/raw/portfolios.csv")

# Insert portfolios
for _, row in portfolios.iterrows():

    cursor.execute("""
    INSERT INTO portfolio.portfolios
    (
        client_id,
        portfolio_name,
        investment_goal,
        initial_investment,
        creation_date
    )
    VALUES (?, ?, ?, ?, ?)
    """,
    row["client_id"],
    row["portfolio_name"],
    row["investment_goal"],
    row["initial_investment"],
    row["creation_date"]
    )

conn.commit()

cursor.close()
conn.close()

print("Portfolios loaded successfully!")