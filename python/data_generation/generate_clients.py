import os
import random
import numpy as np
import pandas as pd
from faker import Faker

# Initialize Faker
fake = Faker()

# -----------------------------
# Configuration
# -----------------------------
NUM_CLIENTS = 5000
OUTPUT_FOLDER = "data/raw"

os.makedirs(OUTPUT_FOLDER, exist_ok=True)

clients = []

# -----------------------------
# Generate Clients
# -----------------------------
for _ in range(NUM_CLIENTS):

    first_name = fake.first_name()
    last_name = fake.last_name()

    email = fake.unique.email().lower()

    phone = fake.msisdn()[:10]

    dob = fake.date_of_birth(minimum_age=22, maximum_age=75)

    annual_income = int(np.random.lognormal(mean=16.3, sigma=0.6))
    annual_income = max(500000, min(annual_income, 50000000))

    net_worth = int(annual_income * random.uniform(2, 20))

    onboarding_date = fake.date_between(
        start_date="-7y",
        end_date="today"
    )

    # SQL country IDs (12-21)
    country_id = random.randint(12, 21)

    # Risk Profile IDs (1-4)
    risk_profile_id = random.randint(1, 4)

    clients.append({
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "phone": phone,
        "date_of_birth": dob,
        "annual_income": annual_income,
        "net_worth": net_worth,
        "onboarding_date": onboarding_date,
        "country_id": country_id,
        "risk_profile_id": risk_profile_id
    })

# -----------------------------
# Create DataFrame
# -----------------------------
df = pd.DataFrame(clients)

# Safety check
df.drop_duplicates(subset=["email"], inplace=True)

# Save CSV
df.to_csv(f"{OUTPUT_FOLDER}/clients.csv", index=False)

print("Clients dataset generated successfully!")
print("Total Clients:", len(df))
print(df.head())