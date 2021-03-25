// more or less like 'DROP TABLE' in MySQL
MATCH (n) DETACH DELETE n;
// create nodes with relationships
CREATE (u:User {name: 'John Doe'})
CREATE (o:Offer {title: 'New job offer'})
CREATE (jo:JobOffer {jobDescription: 'It is a really awesome job!'})
CREATE (jo:JobOffer {jobDescription: 'It is a really awesome job!'})
CREATE
  (u)-[:PUBLISHES]->(o),
  (o)-[:IS_JOB_OFFER]->(jo);