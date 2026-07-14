import random
import pandas as pd
from faker import Faker

fake = Faker()

# Read holdings
holdings = pd.read_csv("data/raw/holdings.csv")

transactions = []

for _, row in holdings.iterrows():

    # Generate 1 to 5 transactions for each holding
    number_of_transactions = random.randint(1, 5)

    for _ in range(number_of_transactions):

        transaction_type = random.choice(["BUY", "SELL"])

        quantity = random.randint(1, row["quantity"])

        price = round(
            random.uniform(
                row["average_purchase_price"] * 0.8,
                row["average_purchase_price"] * 1.2
            ),
            2
        )

        fees = round(price * quantity * 0.0025, 2)

        transactions.append({

            "portfolio_id": row["portfolio_id"],

            "asset_id": row["asset_id"],

            "transaction_type": transaction_type,

            "quantity": quantity,

            "price": price,

            "fees": fees,

            "trade_date": fake.date_between(
                start_date="-5y",
                end_date="today"
            )

        })

transaction_df = pd.DataFrame(transactions)

transaction_df.to_csv(
    "data/raw/transactions.csv",
    index=False
)

print("Transactions generated successfully!")
print("Total Transactions:", len(transaction_df))
print(transaction_df.head())