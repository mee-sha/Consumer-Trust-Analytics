import pandas as pd
from google_play_scraper import reviews, Sort
from apps import APPS
from pathlib import Path

# ==========================
# SETTINGS
# ==========================

LANGUAGE = "en"
COUNTRY = "us"

REVIEWS_PER_APP = 2000

# Create output folder if it doesn't exist
Path("data/raw").mkdir(parents=True, exist_ok=True)

all_reviews = []

print("=" * 60)
print("GLOBAL EDTECH REVIEW COLLECTOR")
print("=" * 60)

# ==========================
# COLLECT REVIEWS
# ==========================

for app in APPS:

    print(f"\nCollecting reviews for {app['platform']}...")

    try:

        result, _ = reviews(
            app["package"],
            lang=LANGUAGE,
            country=COUNTRY,
            sort=Sort.NEWEST,
            count=REVIEWS_PER_APP
        )

        print(f"✓ {len(result)} reviews collected")

        for review in result:

            all_reviews.append({

                "platform": app["platform"],
                "category": app["category"],
                "source": "Google Play",

                "review_id": review["reviewId"],
                "rating": review["score"],
                "review": review["content"],

                "review_date": review["at"],

                "thumbs_up": review["thumbsUpCount"],

                "app_version": review.get("appVersion"),

                "reply_content": review.get("replyContent"),
                "replied_at": review.get("repliedAt")

            })

    except Exception as e:

        print(f"✗ Failed to collect {app['platform']}")
        print(f"Reason: {e}")

# ==========================
# CREATE DATAFRAME
# ==========================

df = pd.DataFrame(all_reviews)

# Remove duplicate reviews
df.drop_duplicates(subset="review_id", inplace=True)

# Convert date columns
df["review_date"] = pd.to_datetime(df["review_date"])

if "replied_at" in df.columns:
    df["replied_at"] = pd.to_datetime(df["replied_at"])

# Create useful features
df["review_length"] = df["review"].astype(str).str.len()

df["review_year"] = df["review_date"].dt.year
df["review_month"] = df["review_date"].dt.month_name()

df["rating_category"] = df["rating"].map({
    1: "Very Poor",
    2: "Poor",
    3: "Average",
    4: "Good",
    5: "Excellent"
})

# ==========================
# SAVE DATA
# ==========================

output_file = "data/raw/edtech_reviews.csv"

df.to_csv(output_file, index=False)

# ==========================
# SUMMARY
# ==========================

print("\n" + "=" * 60)
print("DATA COLLECTION COMPLETED")
print("=" * 60)

print(f"Total Reviews      : {len(df):,}")
print(f"Platforms          : {df['platform'].nunique()}")
print(f"Categories         : {df['category'].nunique()}")
print(f"Average Rating     : {df['rating'].mean():.2f}")

print(f"\nDataset saved to:\n{output_file}")

print("\nReviews by Platform:")

summary = (
    df.groupby("platform")
      .size()
      .reset_index(name="reviews_collected")
      .sort_values("reviews_collected", ascending=False)
)

print(summary.to_string(index=False))

print("\nDone! 🚀")                                                 

