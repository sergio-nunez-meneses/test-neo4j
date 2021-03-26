// drop nodes
MATCH (n) DETACH DELETE n;
// create nodes and set properties
CREATE (uJohn:User {name: 'John Doe'})
CREATE (uJenny:User {name: 'Jenny Doe'})
CREATE (ojo:Offer {title: 'New job offer'})
CREATE (oto:Offer {title: 'New takeover offer'})
CREATE (oeo:Offer {title: 'New estate offer'})
CREATE (jo:JobOffer {jobDescription: 'It is a really awesome job!'})
CREATE (to:TakeoverOffer {description: 'It is a really awesome business!'})
CREATE (eo:EstateOffer {description: 'It is a really awesome house!'})
CREATE (c:Company {name: "Jane's Company"})
// create relationships
CREATE
  (uJohn)-[:PUBLISHES]->(ojo),
  (uJenny)-[:PUBLISHES]->(oto),
  (uJenny)-[:PUBLISHES]->(oeo),
  (ojo)-[:IS_JOB_OFFER]->(jo),
  (oto)-[:IS_TAKEOVER_OFFER]->(to),
  (oeo)-[:IS_ESTATE_OFFER]->(eo),
  (c)-[:HAS_JOB_OFFER]->(jo);
