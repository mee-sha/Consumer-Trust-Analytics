import pandas as pd
from sqlalchemy import create_engine, text
from urllib.parse import quote_plus
import os

# =====================================
# MySQL Configuration
# Replace <YOUR_MYSQL_PASSWORD> with your local MySQL password.
# =====================================

MYSQL_USER = "root"
MYSQL_PASSWORD = "<YOUR_MYSQL_PASSWORD>"
MYSQL_HOST = "localhost"
MYSQL_PORT = "3306"
MYSQL_DATABASE = "consumer_trust_analytics"

# ============================
# CSV File Path
# ============================

CSV_PATH = "data/featured/final_edtech_reviews.csv"

# ============================
# Check if CSV Exists
# ============================

if not os.path.exists(CSV_PATH):
    print(f"❌ CSV file not found:\n{CSV_PATH}")
    exit()

# ============================
# Read CSV
# ============================

print("📂 Reading CSV file...")

try:
    df = pd.read_csv(CSV_PATH)
    print(f"✅ CSV Loaded Successfully")
    print(f"Rows   : {len(df):,}")
    print(f"Columns: {len(df.columns)}")
except Exception as e:
    print("❌ Error reading CSV")
    print(e)
    exit()

# ============================
# Encode Password
# ============================

encoded_password = quote_plus(MYSQL_PASSWORD)

# ============================
# Create Connection
# ============================

connection_string = (
    f"mysql+pymysql://{MYSQL_USER}:{encoded_password}"
    f"@{MYSQL_HOST}:{MYSQL_PORT}/{MYSQL_DATABASE}"
)

print("\n🔗 Connecting to MySQL...")

try:
    engine = create_engine(connection_string)

    with engine.connect() as conn:
        conn.execute(text("SELECT 1"))

    print("✅ Connected Successfully!")

except Exception as e:
    print("❌ Could not connect to MySQL")
    print(e)
    exit()

# ============================
# Import Data
# ============================

print("\n🚀 Importing data...")

try:

    df.to_sql(
        name="reviews",
        con=engine,
        if_exists="replace",
        index=False
    )

    print("\n🎉 IMPORT COMPLETED SUCCESSFULLY!")
    print(f"Total Reviews Imported : {len(df):,}")

except Exception as e:
    print("❌ Import Failed")
    print(e)
    exit()

# ============================
# Verify Import
# ============================

try:

    with engine.connect() as conn:

        result = conn.execute(
            text("SELECT COUNT(*) FROM reviews")
        )

        total = result.scalar()

    print("\n✅ Verification Successful")
    print(f"Rows inside MySQL : {total:,}")

except Exception as e:
    print("❌ Verification Failed")
    print(e)

print("\n==============================")
print("Consumer Trust Analytics")
print("MySQL Import Completed")
print("==============================")