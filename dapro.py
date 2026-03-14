import pandas as pd
import numpy as np

# Load data
df = pd.read_excel("healthcare_claims_dataset.xlsx")

# Convert to CSV
df.to_csv("healthcare_claims_dataset.csv", index=False)

# Convert dates
df['Submission_Date'] = pd.to_datetime(df['Submission_Date'])
print("Data Cleaning Completed")