import pandas as pd

# ==============================
# 1. LOAD DATA
# ==============================

monthly = pd.read_csv("data/raw/monthly_ae_activity_202512.csv")
when = pd.read_csv("data/raw/opendata_monthly_ae_when_202512.csv")
referral = pd.read_csv("data/raw/opendata_monthly_ae_referral_202512.csv")


# ==============================
# 2. CLEAN COLUMN NAMES
# ==============================

def clean_columns(df):
    df.columns = (
        df.columns
        .str.strip()
        .str.lower()
        .str.replace(" ", "_", regex=False)
    )
    return df

monthly = clean_columns(monthly)
when = clean_columns(when)
referral = clean_columns(referral)


# ==============================
# 3. CONVERT MONTH TO DATETIME
# ==============================

monthly["month"] = pd.to_datetime(monthly["month"], format="%Y%m")
when["month"] = pd.to_datetime(when["month"], format="%Y%m")
referral["month"] = pd.to_datetime(referral["month"], format="%Y%m")

# ==============================
# 3.5 DERIVE YEAR AND MONTH FIELDS
# ==============================

monthly["year"] = monthly["month"].dt.year
monthly["month_number"] = monthly["month"].dt.month
monthly["month_name"] = monthly["month"].dt.strftime("%b")

# ==============================
# 4. REMOVE QUALITY FLAG (QF) COLUMNS
# ==============================

monthly = monthly.loc[:, ~monthly.columns.str.endswith("qf")]
referral = referral.loc[:, ~referral.columns.str.endswith("qf")]


# ==============================
# 5. FILTER TO "ALL" ATTENDANCE CATEGORY
# ==============================

monthly = monthly[monthly["attendancecategory"] == "All"]


# ==============================
# 6. SELECT RELEVANT COLUMNS
# ==============================

monthly = monthly[[
    "month",
    "hbt",
    "departmenttype",
    "numberofattendancesall",
    "numberwithin4hoursall",
    "numberover4hoursall",
    "numberover8hoursepisode",
    "numberover12hoursepisode"
]]


# ==============================
# 7. RENAME FOR CLARITY
# ==============================

monthly = monthly.rename(columns={
    "numberofattendancesall": "attendances",
    "numberwithin4hoursall": "within_4h",
    "numberover4hoursall": "over_4h",
    "numberover8hoursepisode": "over_8h",
    "numberover12hoursepisode": "over_12h"
})


# ==============================
# 8. HANDLE MISSING VALUES
# ==============================

monthly[["over_8h", "over_12h"]] = monthly[["over_8h", "over_12h"]].fillna(0)


# ==============================
# 9. AGGREGATE TO CORRECT GRAIN
# (Month × HBT × DepartmentType)
# ==============================

monthly = (
    monthly
    .groupby(["month", "hbt", "departmenttype"], as_index=False)
    .sum()
)


# ==============================
# 10. RE-CALCULATE KPI PERCENTAGES (SAFE DIVISION)
# ==============================

def safe_divide(numerator, denominator):
    return numerator / denominator if denominator != 0 else 0

monthly["pct_within_4h"] = monthly.apply(
    lambda x: safe_divide(x["within_4h"], x["attendances"]), axis=1
)

monthly["pct_over_4h"] = monthly.apply(
    lambda x: safe_divide(x["over_4h"], x["attendances"]), axis=1
)

monthly["pct_over_8h"] = monthly.apply(
    lambda x: safe_divide(x["over_8h"], x["attendances"]), axis=1
)

monthly["pct_over_12h"] = monthly.apply(
    lambda x: safe_divide(x["over_12h"], x["attendances"]), axis=1
)

monthly[[
    "pct_within_4h",
    "pct_over_4h",
    "pct_over_8h",
    "pct_over_12h"
]] = monthly[[
    "pct_within_4h",
    "pct_over_4h",
    "pct_over_8h",
    "pct_over_12h"
]].round(4)



# ==============================
# 11. AGGREGATE REFERRAL TOTALS
# ==============================

referral_totals = (
    referral.groupby(["month", "hbt"])["numberofattendances"]
    .sum()
    .reset_index()
    .rename(columns={"numberofattendances": "total_referral_attendances"})
)


# ==============================
# 12. MERGE REFERRAL TOTALS
# ==============================

final_df = monthly.merge(
    referral_totals,
    on=["month", "hbt"],
    how="left"
)


# ==============================
# 13. EXPORT FINAL DATASET
# ==============================

final_df.to_csv("data/processed/ae_modeled_dataset.csv", index=False)

print("Modeling complete. Clean dataset exported.")
