// Details of all the Crimes under investigation by Officer Larive (Badge Number 26-5234182)
MATCH (c:Crime {last_outcome: "Under investigation"})-[i:INVESTIGATED_BY]->(o:Officer {badge_no: "26-5234182", surname: "Larive"})
RETURN c, i, o;

