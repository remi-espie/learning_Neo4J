// Create GDS Project
CALL gds.graph.project(
'routes',
'Airport',
'HAS_ROUTE'
)
YIELD
graphName, nodeProjection, nodeCount, relationshipProjection, relationshipCount

// Centrality
CALL gds.pageRank.stream('routes')
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS n, score AS pageRank
RETURN n.iata AS iata, n.descr AS description, pageRank
ORDER BY pageRank DESC, iata ASC

// Write pageRank property
CALL gds.pageRank.write('routes', {
  writeProperty: 'pageRank'
})
YIELD nodePropertiesWritten, ranIterations

// Show airports with pageRank
MATCH (a:Airport)
RETURN a.iata AS iata, a.descr AS description, a.pageRank AS pageRank
ORDER BY a.pageRank DESC, a.iata ASC

// Uncovering distinct clusters or communities of nodes, shedding light on cohesive groups or substructures within a graph.
CALL gds.louvain.stream('routes')
YIELD nodeId, communityId
WITH gds.util.asNode(nodeId) AS n, communityId
RETURN
  communityId,
  SIZE(COLLECT(n)) AS numberOfAirports,
  COLLECT(DISTINCT n.city) AS cities
  ORDER BY numberOfAirports DESC, communityId;

// Node similarity
CALL gds.nodeSimilarity.stream('routes')
YIELD node1, node2, similarity
WITH gds.util.asNode(node1) AS n1, gds.util.asNode(node2) AS n2, similarity
RETURN
  n1.iata AS iata,
  n1.city AS city,
  COLLECT({iata:n2.iata, city:n2.city, similarityScore: similarity}) AS similarAirports
  ORDER BY city LIMIT 20

//Node similarity: topN and bottomN
CALL gds.nodeSimilarity.stream(
'routes',
{
  topK: 1,
  topN: 10
}
)
YIELD node1, node2, similarity
WITH gds.util.asNode(node1) AS n1, gds.util.asNode(node2) AS n2, similarity AS similarityScore
RETURN
  n1.iata AS iata,
  n1.city AS city,
  {iata:n2.iata, city:n2.city} AS similarAirport,
  similarityScore
  ORDER BY city