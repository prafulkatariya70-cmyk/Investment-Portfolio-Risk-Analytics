import pandas as pd
from python.etl.database import get_connection

# Connect to SQL Server
conn = get_connection()
cursor = conn.cursor()

# Read clients CSV
clients = pd.read_csv("data/raw/clients.csv")

# Insert clients
for _, row in clients.iterrows():

    cursor.execute("""
    INSERT INTO client.clients
    (
        first_name,
        last_name,
        email,
        phone,
        date_of_birth,
        annual_income,
        net_worth,
        onboarding_date,
        country_id,
        risk_profile_id
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """,
    row["first_name"],
    row["last_name"],
    row["email"],
    row["phone"],
    row["date_of_birth"],
    row["annual_income"],
    row["net_worth"],
    row["onboarding_date"],
    row["country_id"],
    row["risk_profile_id"]
    )

conn.commit()

cursor.close()
conn.close()

print("Clients loaded successfully!")

