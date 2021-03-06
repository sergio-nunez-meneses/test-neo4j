# Getting Started with Cypher

### Overview

This [tutorial](https://neo4j.com/developer/cypher/guide-cypher-basics/) explains the basic concepts of Cypher, Neo4j’s
query language, including how to create and query graphs.

### Goals

Be able to read and understand Cypher queries after finishing this tutorial.

### Prerequisites

You should have familiarized yourself with [Graph Databases](https://neo4j.com/developer/get-started/) and
the [Property Graph Model](https://neo4j.com/developer/graph-database/#property-graph).

# Queries Cheat Sheet

Return all movies released after the year 2005:

```cypher
MATCH (m:Movie)
WHERE m.released > 2005
RETURN m
```

Return the number of movies released after the year 2005:

```cypher
MATCH (m:Movie)
WHERE m.released > 2005
RETURN COUNT(m)
```

Return all Person nodes that acted in a movie released after the year 2010:

```cypher
MATCH (p:Person)-[a:ACTED_IN]-(m:Movie)
WHERE m.released > 2010
RETURN p, a, m
```

Return all Person nodes' names and birthdates:

```cypher
MATCH (p:Person)
RETURN p.name, p.born
```

Create new Person node with _name_ property (a more complex version with other nodes and relationships):

```cypher
CREATE
(a:Person)-[r:ACTED_IN]->(m:Movie)<-[:DIRECTED]-(d:Person)
SET
a += {name: 'Mark Hamill', born: '1951'},
r += {roles: 'Luke Skywalker'},
m += {title: 'Star Wars: Episode IV', tagline: 'A New Hope', released: 1977},
d += {name: 'George Lucas', born: '1944'}
```

Return movie with title _Cloud Atlas_:

```cypher
MATCH (m:Movie {title: 'Cloud Atlas'})
RETURN m
```

Return all movies released between 2010 and 2015:

```cypher
MATCH (m:Movie)
WHERE m.released > 2010 AND m.released < 2015
RETURN m
```

Merge clause (like Sequelize method `findOrCreate`):

```cypher
MERGE (m:Movie {title: 'Greyhound'})
ON CREATE SET m.released = 2020, m.lastUpdatedAt = timestamp()
ON MATCH SET m.lastUpdatedAt = timestamp()
RETURN m
```

Create relationship `:WATCHED` between your node and _Cloud Atlas_ movie:

```cypher
CREATE (p:Person {name: 'Sergio Nuñez Meneses'})
WITH p
MATCH (m:Movie {title: 'Star Wars: Episode IV'})
CREATE (p)-[w:WATCHED]->(m)
RETURN type(w)
```

Return all Person and Movie nodes that are connected by REVIEWED relationship:

```cypher
MATCH (p:Person)-[:REVIEWED]->(m:Movie)
return p, m
```

Return all Person nodes from the movie _The Da Vinci Code_:

```cypher
MATCH (p:Person)-[]->(m:Movie)
WHERE m.title='The Da Vinci Code'
RETURN p
```

Return all Person nodes having acted in more than 2 movies:

```cypher
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, COUNT(m) AS numberOfMovies
WHERE numberOfMovies > 2
// display data as graph
RETURN p

// display data as table
// RETURN p.name, numberOfMovies
```

Return all Person nodes whose names start with 'N':

```cypher
MATCH (p:Person) WHERE p.name =~ 'N.+'
RETURN p

// or
MATCH (p:Person) WHERE p.name STARTS WITH 'N'
RETURN p
```

Delete a Person node and its relationships:

```cypher
MATCH (n {name: 'Mark Hamill'})
DETACH DELETE n
```

Delete relationship:

```cypher
MATCH (n)-[r:WATCHED]->()
WHERE n.name =~ 'Sergio.+' // or n.name STARTS WITH 'Ser'
DELETE r
```

Delete all Person nodes and their relationships based on movie title

```cypher
MATCH (p:Person)-[]->(m:Movie)
WHERE m.title =~ 'Star.+' // or m.title STARTS WITH 'Star'
WITH p, m
DETACH DELETE p, m
```

Return all Person nodes based on given age:

```cypher
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, m, toInteger(substring(toString(date()), 0, 4))-toInteger(p.born) AS age
WHERE age > 80
RETURN p.name, p.born, m.title

// or using duration temporal function
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, m, duration.between(date(toString(p.born)), date()).years AS age
WHERE age > 80
RETURN p.name, p.born, m.title
```

Return all Person nodes based on the number of their relationships:

```cypher
MATCH (p:Person)-[r]->(m:Movie)
WITH p, m, COUNT(r) AS numberOfRoles
WHERE numberOfRoles >= 2
RETURN p, m
```

# Advanced Queries

Return the director of _Cloud Atlas_ movie:

```cypher
MATCH (p:Person)-[:DIRECTED]-(m:Movie)
WHERE m.title = 'Cloud Atlas'
RETURN p, m

// or...
// MATCH (p:Person)-[:DIRECTED]-(m:Movie {title: 'Cloud Atlas'})
// RETURN p, m
```

Return all Person nodes that co-acted with Tom Hanks in any movie:

```cypher
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)<-[:ACTED_IN]-(tom:Person {name: 'Tom Hanks'})
RETURN p, m
```

Return all Person nodes from the movie _Cloud Atlas_:

```cypher
MATCH (p:Person)-[]-(m:Movie {title: 'Cloud Atlas'})
// display data as graph
RETURN p, m

// using the variable relatedTo
MATCH (p:Person)-[relatedTo]-(m:Movie {title: 'Cloud Atlas'})
// display data as table
RETURN p.name, relatedTo.roles, type(relatedTo)
```

Return all nodes that are `n` hops away Tom Hanks. `filmIndustry` variable refers to Person and Movie nodes:

```cypher
// return all Movie nodes
MATCH (p:Person {name: 'Tom Hanks'})-[*1]-(filmIndustry)
RETURN DISTINCT p, filmIndustry

// same as
// MATCH (p:Person {name: 'Tom Hanks'})-[:ACTED_IN]-(m:Movie)
// RETURN DISTINCT p, m

// return nodes up to 3 hops away
MATCH (p:Person {name: 'Tom Hanks'})-[*1..3]-(filmIndustry)
RETURN DISTINCT p, filmIndustry
```

# Cypher Shell Cheat Sheet

To launch Cypher shell (assuming Neo4j Community Edition is already installed) run:

```
cd path/to/neo4j/server
bin/cypher-shell
```

Enter your credentials:

```
username: neo4j
password: *****
```

The following response should be displayed:

```
Connected to Neo4j using Bolt protocol version x.x at neo4j://localhost:port as user neo4j.
Type :help for a list of available commands or :exit to exit the shell.
Note that Cypher queries must end with a semicolon.
```

To execute a script:

```shell
neo4j@dbname> :source path/to/file.cypher
```

