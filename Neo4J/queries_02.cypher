CALL db.schema.visualization()
//---
MATCH (m:Movie)
RETURN m.title, m.released
//---
MATCH (m:Movie)
WHERE m.released > 2000
RETURN m.title, m.released
//---
MATCH (m:Movie)
RETURN COUNT(m) AS NumberOfMovies
//---
MATCH (n:Person)
WHERE n.name = 'Tom Hanks'
RETURN n
//---
MATCH (m:Movie)-[r:ACTED_IN]-(a:Person)
with m, collect(a) as cast
WHERE size(cast) > 1
RETURN m.title, size(cast)
//---
CREATE (m:Movie {title: 'MyMovie', released: 2022})-[:ACTED_IN]->(a:Person {name: 'Me'})
MATCH(m:Movie)-[r:ACTED_IN]-(a:Person)
WHERE m.title = 'MyMovie'
with m, collect(a.name) as cast
RETURN m.title, cast
//---
CALL apoc.load.json("file:///test_data.json") YIELD value
