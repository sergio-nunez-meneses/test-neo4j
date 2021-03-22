# Getting Started with Cypher

### Overview

This [tutorial](https://neo4j.com/developer/cypher/guide-cypher-basics/) explains the basic concepts of Cypher, Neo4j’s query language, including how to create and query graphs.

### Goals

Be able to read and understand Cypher queries after finishing this tutorial.

### Prerequisites

You should have familiarized yourself with [Graph Databases](https://neo4j.com/developer/get-started/) and the [Property Graph Model](https://neo4j.com/developer/graph-database/#property-graph).

# Queries Cheat Sheet

Return all movies released after the year 2005:

```
MATCH (m:Movie)
WHERE m.released > 2005
RETURN m
```

Return the number of movies released after the year 2005:

```
MATCH (m:Movie)
WHERE m.released > 2005
RETURN COUNT(m)
```

Return all Person nodes that acted in a movie released after the year 2010:

```
MATCH (p:Person)-[a:ACTED_IN]-(m:Movie)
WHERE m.released > 2010
RETURN p, a, m
```

Return all Person nodes' names and birthdates:

```
MATCH (p:Person)
RETURN p.name, p.born
```

Create new Person node with _name_ property (a more complex version with other nodes and relationships):

```
CREATE
(a:Person)-[r:ACTED_IN]->(m:Movie)<-[:DIRECTED]-(d:Person)
SET
a += {name: 'Mark Hamill', born: '1951'},
r += {roles: 'Luke Skywalker'},
m += {title: 'Star Wars: Episode IV', tagline: 'A New Hope', released: 1977},
d += {name: 'George Lucas', born: '1944'}
```

Return movie with title _Cloud Atlas_:

```
MATCH (m:Movie {title: 'Cloud Atlas'})
RETURN m
```

Return all movies released between 2010 and 2015:

```
MATCH (m:Movie)
WHERE m.released > 2010 AND m.released < 2015
RETURN m
```

Merge clause (like Sequelize method `findOrCreate`):

```
MERGE (m:Movie {title: 'Greyhound'})
ON CREATE SET m.released = 2020, m.lastUpdatedAt = timestamp()
ON MATCH SET m.lastUpdatedAt = timestamp()
RETURN m
```

Return all Person nodes from the movie 'The Da Vinci Code':

```
MATCH (p:Person)-[]->(m:Movie)
WHERE m.title='The Da Vinci Code'
RETURN p
```

Return all Person nodes having acted in more than 2 movies:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, COUNT(m) AS numberOfMovies
WHERE numberOfMovies > 2
// display data as graph
RETURN p

// display data as table
// RETURN p.name, numberOfMovies
```

Return all Person nodes whose names start with 'N':

```
MATCH (p:Person)
WHERE p.name =~ 'N.+'
RETURN p
```

Delete a Person node and its relationships:

```
MATCH (n {name: 'Mark Hamill'})
DETACH DELETE n
```

Delete all Person nodes and their relationships based on movie title

```
MATCH (p:Person)-[]->(m:Movie)
WHERE m.title =~ 'Star.+'
WITH p, m
DETACH DELETE p, m
```
