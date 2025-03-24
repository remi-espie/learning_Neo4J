MATCH(n) DETACH DELETE n
//---
CALL apoc.load.json("file:///questions.json") YIELD value
UNWIND value.items AS item
MERGE (q:Question {id: item.question_id})
SET q.title = item.title,
    q.body = item.body_markdown,
    q.creation_date = item.creation_date,
    q.view_count = item.view_count,
    q.score = item.score

FOREACH (tag IN item.tags |
  MERGE (t:Tag {name: tag})
  MERGE (q)-[:TAGGED]->(t)
)

MERGE (owner:User {id: item.owner.user_id})
SET owner.reputation = item.owner.reputation,
    owner.display_name = item.owner.display_name,
    owner.profile_image = item.owner.profile_image
MERGE (owner)-[:ASKED]->(q)

FOREACH (answer IN item.answers |
  MERGE (a:Answer {id: answer.answer_id})
  SET a.body = answer.body_markdown,
      a.creation_date = answer.creation_date,
      a.score = answer.score,
      a.is_accepted = answer.is_accepted
  MERGE (a)-[:ANSWERING]->(q)

  MERGE (answer_owner:User {id: answer.owner.user_id})
  SET answer_owner.reputation = answer.owner.reputation,
      answer_owner.display_name = answer.owner.display_name,
      answer_owner.profile_image = answer.owner.profile_image
  MERGE (answer_owner)-[:PROVIDED]->(a)
)
