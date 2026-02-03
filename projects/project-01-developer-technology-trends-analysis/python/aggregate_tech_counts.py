import pandas as pd

# Load your original data
df = pd.read_csv('survey_data_updated5.csv')

# The 8 specific columns from your assignment
cols = [
    "LanguageHaveWorkedWith", "LanguageWantToWorkWith",
    "DatabaseHaveWorkedWith", "DatabaseWantToWorkWith",
    "PlatformHaveWorkedWith", "PlatformWantToWorkWith",
    "WebframeHaveWorkedWith", "WebframeWantToWorkWith"
]

# We create a list of summarized dataframes
summarized_data = []

for col in cols:
    # Split the semicolons, count the occurrences, and keep the original column name
    summary = df[col].str.split(';').explode().value_counts().reset_index()
    
    # We name the count column 'RespondentCount' to keep it distinct
    summary.columns = [col, 'RespondentCount']
    
    # Add this summary to our list
    summarized_data.append(summary)

# We join them side-by-side into one file
final_df = pd.concat(summarized_data, axis=1)

# Save as the file name required for your assignment
final_df.to_csv('survey_data_updated.csv', index=False)

print("File ready! Each column has its original name with its respective counts.")