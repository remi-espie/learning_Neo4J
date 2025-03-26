CREATE (u:User {name: "Matéo" });
CREATE (u:User {name: "Adrien"});
CREATE (u:User {name: "Noé" });
CREATE (u:User {name: "Muriel" });
CREATE (u:User {name: "Thomas" });
CREATE (u:User {name: "Vincent" });
CREATE (u:User {name: "Martin" });
CREATE (u:User {name: "Dziyana" });
CREATE (u:User {name: "Charley" });
CREATE (u:User {name: "Rémi" });
CREATE (u:User {name: "Fabien" });
CREATE (u:User {name: "Alexandre" });
CREATE (u:User {name: "Sylvain" });
CREATE (u:User {name: "Mathias" });

CREATE (m:Movie {title: "The Matrix", genre: "Action"});
CREATE (m:Movie {title: "Inception", genre: "Sci-Fi" });
CREATE (m:Movie {title: "The Godfather", genre: "Drama" });
CREATE (m:Movie {title: "Forest Gump", genre: "Drama"});
CREATE (m:Movie {title: "Interstellar", genre: "Sci-FI" });
CREATE (m:Movie {title: "Mission Impossible", genre: "Action" });
CREATE (m:Movie {title: "La La Land", genre: "Musical" });

MATCH (u:User {name: "Rémi" }), (m:Movie {title: "The Lord of the Ring", genre: "Fantasy"})
MERGE (u)-[:LIKES]->(m);

MATCH (u:User {name: "Matéo" }), (m:Movie {title: "The Matrix", genre: "Action"})
MERGE (u)-[:LIKES]->(m);

MATCH (u:User {name: "Alexandre" }), (m:Movie {title: "The Godfather", genre: "Drama"})
MERGE (u)-[:LIKES]->(m);

MATCH (u:User {name: "Thomas" }), (m:Movie {title: "Interstellar", genre: "Sci-Fi" })
MERGE (u)-[:LIKES]->(m);

MATCH (u:User {name: "Noé" }), (m:Movie {title: "Mission Impossible", genre: "Action"})
MERGE (u)-[:LIKES]->(m);

MATCH (u:User {name: "Muriel" }), (m:Movie {title: "Inception", genre: "Sci-Fi"})
MERGE (u)-[:LIKES]->(m);

MATCH (u:User {name: "Mathias" }), (m:Movie {title: "Inception", genre: "Sci-Fi"})
MERGE (u)-[:LIKES]->(m);

MATCH (u:User {name: "Sylvain" }), (m:Movie {title: "The Matrix", genre: "Action"})
MERGE (u)-[:LIKES]->(m);

MATCH (u:User {name: "Fabien"}), (m:Movie {title: "Mission Impossible", genre: "Action" })
MERGE (u)-[:LIKES]->(m);

MATCH (u:User {name: "Vincent" }), (m:Movie {title: "Interstellar", genre: "Sci-Fi"})
MERGE (u)-[:LIKES]->(m);

MATCH (u:User {name: "Charley" }), (m:Movie {title: "Interstellar", genre: "Sci-FI"})
MERGE (u)-[:LIKES]->(m);

MATCH (u:User {name: "Dziyana" }), (m:Movie {title: "The Matrix", genre: "Action"})
MERGE (u)-[:LIKES]->(m);

//---------------
CREATE
  (mateo:User {name: "Matéo" }),
  (adrien:User {name: "Adrien" }),
  (noe:User {name: "Noé" }),
  (muriel:User {name: "Muriel" }),
  (thomas:User {name: "Thomas" }),
  (vincent:User {name: "Vincent" }),
  (martin:User {name: "Martin" }),
  (dziyana:User {name: "Dziyana" }),
  (charley:User {name: "Charley" }),
  (remi:User {name: "Rémi" }),
  (fabien:User {name: "Fabien" }),
  (alexandre:User {name: "Alexandre" }),
  (sylvain:User {name: "Sylvain" }),
  (mathias:User {name: "Mathias" }),
  (m0:Movie {title: "The Matrix", genre: "Action"}),
  (m1:Movie {title: "Inception", genre: "Sci-Fi" }),
  (m2:Movie {title: "The Godfather", genre: "Drama" }),
  (m3:Movie {title: "Forest Gump", genre: "Drama"}),
  (m4:Movie {title: "Interstellar", genre: "Sci-Fi" }),
  (m5:Movie {title: "Mission Impossible", genre: "Action" }),
  (m6:Movie {title: "La La Land", genre: "Musical" }),
  (mateo)-[:LIKES]->(m0),
  (alexandre)-[:LIKES]->(m2),
  (remi)-[:LIKES]->(m4),
  (thomas)-[:LIKES]->(m4),
  (noe)-[:LIKES]->(m5),
  (muriel)-[:LIKES]->(m1),
  (mathias)-[:LIKES]->(m1),
  (sylvain)-[:LIKES]->(m0),
  (fabien)-[:LIKES]->(m5),
  (vincent)-[:LIKES]->(m4),
  (martin)-[:LIKES]->(m0),
  (adrien)-[:LIKES]->(m4),
  (charley)-[:LIKES]->(m4),
  (dziyana)-[:LIKES]->(m0);

//---------------
MATCH (n) DETACH DELETE n;

CREATE
  (mateo:User {name: "Matéo" }),
  (adrien:User {name: "Adrien" }),
  (noe:User {name: "Noé" }),
  (muriel:User {name: "Muriel" }),
  (thomas:User {name: "Thomas" }),
  (vincent:User {name: "Vincent" }),
  (martin:User {name: "Martin" }),
  (dziyana:User {name: "Dziyana" }),
  (charley:User {name: "Charley" }),
  (remi:User {name: "Rémi" }),
  (fabien:User {name: "Fabien" }),
  (alexandre:User {name: "Alexandre" }),
  (sylvain:User {name: "Sylvain" }),
  (mathias:User {name: "Mathias" }),
  (m0:Movie {title: "The Matrix", genre: "Action"}),
  (m1:Movie {title: "Inception", genre: "Sci-Fi" }),
  (m2:Movie {title: "The Godfather", genre: "Drama" }),
  (m3:Movie {title: "Forest Gump", genre: "Drama"}),
  (m4:Movie {title: "Interstellar", genre: "Sci-Fi" }),
  (m5:Movie {title: "Mission Impossible", genre: "Action" }),
  (m6:Movie {title: "La La Land", genre: "Musical" }),
  (m7:Movie {title: "The Dark Knight", genre: "Action"}),
  (m8:Movie {title: "Pulp Fiction", genre: "Crime"}),
  (m9:Movie {title: "The Shawshank Redemption", genre: "Drama"}),
  (m10:Movie {title: "Star Wars: A New Hope", genre: "Sci-Fi"}),
  (m11:Movie {title: "The Lion King", genre: "Animation"}),
  (m12:Movie {title: "The Silence of the Lambs", genre: "Thriller"}),
  (m13:Movie {title: "Amélie Poulain", genre: "Romance"}),
  (m14:Movie {title: "The Grand Budapest Hotel", genre: "Comedy"}),
  (mateo)-[:LIKES]->(m0),
  (alexandre)-[:LIKES]->(m2),
  (remi)-[:LIKES]->(m4),
  (thomas)-[:LIKES]->(m4),
  (noe)-[:LIKES]->(m5),
  (muriel)-[:LIKES]->(m1),
  (mathias)-[:LIKES]->(m1),
  (sylvain)-[:LIKES]->(m0),
  (fabien)-[:LIKES]->(m5),
  (vincent)-[:LIKES]->(m4),
  (martin)-[:LIKES]->(m0),
  (adrien)-[:LIKES]->(m4),
  (charley)-[:LIKES]->(m4),
  (dziyana)-[:LIKES]->(m0),
  (mateo)-[:LIKES]->(m7),
  (mateo)-[:LIKES]->(m10),
  (adrien)-[:LIKES]->(m9),
  (adrien)-[:LIKES]->(m13),
  (noe)-[:LIKES]->(m8),
  (noe)-[:LIKES]->(m12),
  (muriel)-[:LIKES]->(m11),
  (muriel)-[:LIKES]->(m14),
  (thomas)-[:LIKES]->(m10),
  (thomas)-[:LIKES]->(m7),
  (vincent)-[:LIKES]->(m9),
  (vincent)-[:LIKES]->(m2),
  (martin)-[:LIKES]->(m8),
  (martin)-[:LIKES]->(m12),
  (dziyana)-[:LIKES]->(m13),
  (dziyana)-[:LIKES]->(m11),
  (charley)-[:LIKES]->(m14),
  (charley)-[:LIKES]->(m3),
  (remi)-[:LIKES]->(m7),
  (remi)-[:LIKES]->(m9),
  (fabien)-[:LIKES]->(m8),
  (fabien)-[:LIKES]->(m12),
  (alexandre)-[:LIKES]->(m10),
  (alexandre)-[:LIKES]->(m11),
  (sylvain)-[:LIKES]->(m13),
  (sylvain)-[:LIKES]->(m14),
  (mathias)-[:LIKES]->(m3),
  (mathias)-[:LIKES]->(m6),
  (mateo)-[:FRIENDS_WITH]->(adrien),
  (mateo)-[:FRIENDS_WITH]->(noe),
  (mateo)-[:FRIENDS_WITH]->(sylvain),
  (adrien)-[:FRIENDS_WITH]->(vincent),
  (adrien)-[:FRIENDS_WITH]->(charley),
  (noe)-[:FRIENDS_WITH]->(fabien),
  (noe)-[:FRIENDS_WITH]->(thomas),
  (muriel)-[:FRIENDS_WITH]->(mathias),
  (muriel)-[:FRIENDS_WITH]->(dziyana),
  (thomas)-[:FRIENDS_WITH]->(remi),
  (vincent)-[:FRIENDS_WITH]->(martin),
  (martin)-[:FRIENDS_WITH]->(alexandre),
  (charley)-[:FRIENDS_WITH]->(remi),
  (fabien)-[:FRIENDS_WITH]->(sylvain),
  (alexandre)-[:FRIENDS_WITH]->(mathias);

//----------------
MATCH (target:User {name: "Rémi"})-[:FRIENDS_WITH]-(friend:User)-[:LIKES]->(m:Movie)
  WHERE NOT (target)-[:LIKES]->(m)
RETURN m.title, COUNT(*) AS recommendationScore
  ORDER BY recommendationScore DESC
  LIMIT 5

MATCH (target:User {name: "Dziyana"})-[:FRIENDS_WITH]-(friend:User)-[:LIKES]->(m:Movie)
  WHERE NOT (target)-[:LIKES]->(m)
RETURN m.title, COUNT(*) AS recommendationScore
  ORDER BY recommendationScore DESC

//----------------
MATCH (target:User {name: "Vincent"})-[:LIKES]->(liked:Movie)
MATCH (rec:Movie {genre: liked.genre})
  WHERE NOT (target)-[:LIKES]->(rec)
RETURN rec.title, COUNT(*) AS recommendationScore
  ORDER BY recommendationScore DESC
  LIMIT 5
