import os
import pandas as pd
from io import StringIO
import random

def write_to_local_folder():
    local_folder = os.getenv("LOCAL_FOLDER", "users")

    # Create the directory if it doesn't exist
    if not os.path.exists(local_folder):
        os.makedirs(local_folder)

    for i in range(100):
        user_df = pd.DataFrame(
            {
                "id": [i],
                "name": [f"user{i}"],
                "age": [random.randint(0, 100)]
            }
        )
        file_path = os.path.join(local_folder, f'user{i}.csv')
        user_df.to_csv(file_path, header=True, index=False)

if __name__ == "__main__":
    write_to_local_folder()