MATCH (n:Person) RETURN n
//---
MATCH (p:Person)-[r:STUDY]->(s:School)
RETURN s, r, p
//---
MATCH (p:Person)-[r:STUDY]->(s:School)
RETURN s.Name, r.Since, p.Name
//---
MATCH (p:Person)-[r:STUDY]->(s:School)
WHERE s.Name = "Polytech"
RETURN s.Name, r.Since, p.Name
