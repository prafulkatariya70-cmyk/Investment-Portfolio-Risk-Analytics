import pandas as pd

# Read clients CSV
df = pd.read_csv("data/raw/clients.csv")

# Count duplicate emails
duplicates = df["email"].duplicated().sum()

print("Total Clients:", len(df))
print("Duplicate Emails:", duplicates)