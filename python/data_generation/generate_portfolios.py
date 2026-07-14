import random
import pandas as pd
from faker import Faker

fake = Faker()

# -----------------------------
# Load Clients
# -----------------------------
import sys
import os

sys.path.append(os.path.abspath("python/etl"))

from python.etl.database import get_connection

conn = get_connection()

clients = pd.read_sql(
    "SELECT client_id FROM client.clients",
    conn
)

portfolio_names = [
    "Retirement Portfolio",
    "Long Term Growth",
    "Wealth Creation",
    "Tax Saving",
    "Balanced Portfolio",
    "Aggressive Growth",
    "Dividend Income",
    "Education Fund",
    "Emergency Fund",
    "Global Equity"
]

investment_goals = [
    "Retirement",
    "Wealth Creation",
    "Capital Appreciation",
    "Income",
    "Tax Saving",
    "Education"
]

portfolios = []

# -----------------------------
# Generate Portfolios
# -----------------------------
for client_id in clients["client_id"]:

    # Each client gets 1 to 4 portfolios
    number_of_portfolios = random.randint(1, 4)

    for _ in range(number_of_portfolios):

        portfolios.append({

            "client_id": client_id,

            "portfolio_name": random.choice(portfolio_names),

            "investment_goal": random.choice(investment_goals),

            "initial_investment": round(
                random.uniform(50000, 5000000), 2
            ),

            "creation_date": fake.date_between(
                start_date="-8y",
                end_date="today"
            )

        })

# -----------------------------
# Save CSV
# -----------------------------
portfolio_df = pd.DataFrame(portfolios)

portfolio_df.to_csv(
    "data/raw/portfolios.csv",
    index=False
)

print("Portfolios generated successfully!")
print("Total Portfolios:", len(portfolio_df))
print(portfolio_df.head())