import pandas as pd

# Load data from a CSV file
df = pd.read_csv('your_dataset.csv')

# Display the first few rows
print(df.head())

# Get a concise summary of the DataFrame
print(df.info())

# Get descriptive statistics
print(df.describe())
