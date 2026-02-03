import pandas as pd

# Load dataset
df = pd.read_csv("survey_data_updated5.csv", low_memory=False)

# Columns with semicolon-separated values
multi_value_columns = [
    "LanguageHaveWorkedWith",
    "LanguageWantToWorkWith",
    "LanguageAdmired",
    "DatabaseHaveWorkedWith",
    "DatabaseWantToWorkWith",
    "DatabaseAdmired",
    "PlatformHaveWorkedWith",
    "PlatformWantToWorkWith",
    "PlatformAdmired",
    "WebframeHaveWorkedWith",
    "WebframeWantToWorkWith",
    "WebframeAdmired"
]

# Replace multi-values with first listed value
for col in multi_value_columns:
    if col in df.columns:
        df[col] = (
            df[col]
            .astype(str)
            .str.split(";")
            .str[0]
            .str.strip()
            .replace("nan", pd.NA)
        )

# Save ONE file
output_file = "survey_data_cognos_single_value.csv"
df.to_csv(output_file, index=False)

print("✅ Created ONE cleaned file:")
print(output_file)
