# Cleaning Pipeline in Python
import pandas as pd

# Load data in chunks
chunks = pd.read_csv("data.csv", chunksize=50000)

cleaned_chunks = []

for chunk in chunks:
    # Example cleaning steps
    chunk.columns = [c.lower().strip() for c in chunk.columns]
    chunk = chunk.drop_duplicates()
    chunk = chunk.fillna({'age': chunk.age.median()})
    cleaned_chunks.append(chunk)

df = pd.concat(cleaned_chunks)
df.to_parquet("cleaned_data.parquet")
