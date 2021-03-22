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