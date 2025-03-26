from neo4j import GraphDatabase

# URI examples: "neo4j://localhost", "neo4j+s://xxx.databases.neo4j.io"
URI = "bolt://localhost:7687"
AUTH = ("neo4j", "password")

with GraphDatabase.driver(URI, auth=AUTH) as driver:
    driver.verify_connectivity()

    records, summary, keys = driver.execute_query( # (1)
        "RETURN COUNT {()} AS count"
    )

    # Get the first record
    first = records[0]      # (2)

    # Print the count entry
    print(first["count"])   # (3)

    driver.close()
