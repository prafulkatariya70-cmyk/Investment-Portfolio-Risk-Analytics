import random
import pandas as pd
from faker import Faker

fake = Faker()

# -----------------------------
# Read IDs from SQL export
# -----------------------------
portfolio_ids = list(range(2, 12565))
asset_ids = list(range(505, 1008))

holdings = []

# -----------------------------
# Generate Holdings
# -----------------------------
for portfolio_id in portfolio_ids:

    # Each portfolio owns 5–15 different assets
    selected_assets = random.sample(asset_ids, random.randint(5, 15))

    for asset_id in selected_assets:

        holdings.append({

            "portfolio_id": portfolio_id,

            "asset_id": asset_id,

            "quantity": random.randint(10, 500),

            "average_purchase_price": round(
                random.uniform(20, 1000), 2
            ),

            "purchase_date": fake.date_between(
                start_date="-5y",
                end_date="today"
            )

        })

# -----------------------------
# Save CSV
# -----------------------------
df = pd.DataFrame(holdings)

df.to_csv(
    "data/raw/holdings.csv",
    index=False
)

print("Holdings generated successfully!")
print("Total Holdings:", len(df))
print(df.head())