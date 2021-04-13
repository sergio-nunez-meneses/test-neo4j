# Example Queries

`POST`, `GET`, `PUT`, and `DELETE` requests using only the required data.

## POST

Create takeover offer:

```cypher
// all offers are published by a User.
MATCH (u:User {
  name: string
})
// all offers refer to a contact and territorial contact
MATCH (c:Contact {
  firstname: string
})
MATCH (tc:TerritorialContact {
  firstname: string
})
// create offer
CREATE (o:Offer {
  id: integer,
  type: string,
  title: string,
  publishedDate: string,
  endPublished: string,
  catchPhrase: string
})
// depending on the offer type, i.e. takeover, job or estate, new nodes are created and related to the offer
CREATE (to:TakeoverOffer {
  area: number,
  description: string,
  startingDate: string,
  numberOfEmployees: integer,
  ERPcategory: string,
  turnover: number,
  activityType: string,
  currentActivity: string,
  commercialConditions: string,
  targetProfile: string,
  funding: string
})
// a takeover offer has a location and images
CREATE (lo:Location {
  address: string,
  zipCode: string,
  city: string,
  latitude: float,
  longitude: float
})
CREATE (i:Images {
  imgList: array
})
// create relationships
CREATE
  (o)<-[:PUBLISHED_BY]-(u),
  (o)-[:IS_TYPE_TAKEOVER]->(to),
  (to)-[:IS_LOCATED]->(lo),
  (to)-[:HAS_IMAGES]->(i),
  (c)<-[:REFERS_TO]-(o)-[:REFERS_TO]->(tc);
```

Create job offer:

```cypher
MATCH (u:User {
  username: string
})
MATCH (c:Contact {
  firstname: string
})
MATCH (tc:TerritorialContact {
  firstname: string
})
// a job offer belongs to a company
MATCH (co:Company {
  name: string
})
CREATE (o:Offer {
  id: integer,
  type: string,
  title: string,
  publishedDate: string,
  endPublished: string,
  catchPhrase: string
})
CREATE (jo:JobOffer {
  townHall: string,
  startingDate: string,
  trade: string, // what does trade stand for?
  jobDescription: string,
  contractType: string,
  duration: string,
  experience: string,
  qualifications: string,
  skills: string,
  executive: boolean,
  applicationDeadline: string
})
// create relationships
CREATE
  (o)<-[:PUBLISHED_BY]-(u),
  (o)-[:IS_TYPE_JOB]->(jo),
  (jo)-[:BELONGS_TO]->(co),
  (c)<-[:REFERS_TO]-(o)-[:REFERS_TO]->(tc);
```

Create estate offer:

```cypher
MATCH (u:User {
  username: string
})
MATCH (c:Contact {
  firstname: string
})
MATCH (tc:TerritorialContact {
  firstname: string
})
CREATE (o:Offer {
  id: integer,
  type: string,
  title: string,
  publishedDate: string,
  endPublished: string,
  catchPhrase: string
})
CREATE (eo:EstateOffer {
  projectType: string,
  propertyType: string,
  sellingPrice: float,
  area: number,
  numberOfRooms: integer,
  sellingType: string,
  description: string,
  rent: float,
  availableFrom: string,
  numberOfLots: integer,
  annualFees: float,
  transportProximity: string,
  schoolProximity: string,
  hospitalProximity: string,
  storeProximity: string,
  downTownProximity: string,
  map: string
})
// a estate offer has a location and images
CREATE (lo:Location {
  address: string,
  zipCode: string,
  city: string,
  latitude: float,
  longitude: float
})
CREATE (i:Images {
  imgList: array
})
// create relationships
CREATE
  (o)<-[:PUBLISHED_BY]-(u),
  (o)-[:IS_TYPE_ESTATE]->(eo),
  (eo)-[:IS_LOCATED]->(lo),
  (eo)-[:HAS_IMAGES]->(i),
  (c)<-[:REFERS_TO]-(o)-[:REFERS_TO]->(tc);
```

Create contact:

```cypher
CREATE (c:Contact {
  id: integer,
  firstname: string,
  lastname: string,
  phoneNumber: string,
  email: string
})
RETURN c
```

Create territorial contact:

```cypher
CREATE (tc:TerritorialContact {
  id: integer,
  firstname: string,
  lastname: string,
  phoneNumber: string,
  email: string,
  link: string
})
RETURN tc
```

Create company:

```cypher
// a company has a location; if it doesn't exist, create it
MERGE (lo:Location {address: string})
  ON CREATE SET
  lo += {
    address: string,
    zipCode: string,
    city: string,
    latitude: float,
    longitude: float
  }
CREATE (co:Company {
  id: integer,
  name: string
})
// create relationship
CREATE
  (co)-[:IS_LOCATED]->(lo);
```

## POST Optimizations

Create Offer, Type, and relationship in between:

```cypher
MERGE (t:Type {type: 'job'})
WITH t
CREATE (o:Offer {title: 'Lorem ipsum'})
CREATE (o)-[:IS_OF_TYPE]->(t);
```

## GET

Find all offers and their directly related nodes, based on the relationship direction:

```cypher
// add Location, Images, Company and Company's Location nodes
MATCH (o:Offer)
RETURN (o)-[]->()
```

Find all takeover offers and their locations:

```cypher
// add Image node
MATCH (o:Offer)
RETURN (o)-[:IS_TYPE_TAKEOVER]->()--() // ()--() returns to related nodes
```

Find all job offers, companies and their locations:

```cypher
MATCH (o:Offer)
RETURN (o)-[:IS_TYPE_JOB]->()--()--()

// or
MATCH path = (o:Offer {type: 'job offer'})-[*1..3]-()
RETURN path
```

Find all estate offers:

```cypher
// add Image node
MATCH (o:Offer)
RETURN (o)-[:IS_TYPE_ESTATE]->()--() // ()--() returns all directly related nodes
```

Find all offers by any property:

```cypher
// return all directly related nodes
MATCH (o:Offer {
  propertyName1: propertyValue1,
  propertyName2: propertyValue2
  // and so on
})
RETURN (o)-[]-()

// or find by a set of keywords and return all directly related nodes 
WITH ['sit', 'id', 'sed', 'id'] AS keywords
UNWIND keywords AS keyword
MATCH (o:Offer)
WHERE o.title =~ ('.*\\b' + keyword + '\\b.*')
RETURN (o)--()

// or return the specified path
WITH ['lorem', 'cursus', 'morbid', 'sit'] AS keywords
UNWIND keywords AS keyword
MATCH path = (o:Offer)-[:IS_TYPE_TAKEOVER|:IS_TYPE_JOB|:IS_TYPE_ESTATE]->(n)
WHERE n.description =~ ('.*\\b' + keyword + '\\b.*')
RETURN path
```

Find all offers and their directly related nodes by company:

```cypher
MATCH path = (co:Company {name: 'Lorem ipsum'})-[]-()--()
RETURN path
```

Find offer and its directly related nodes by id:

```cypher
// add Image node
MATCH path = (o:Offer {id: 1})--()
RETURN path
```

Find all nodes by very specific constraints:

```cypher
// return all nodes up to 2 hops away from Company, that have the indicated relationship (<)
MATCH (co:Company)
RETURN (co)<-[*1..2]-()

// return all nodes up to 2 hops away from Company, having a bi-directional relationship
MATCH (co:Company)
RETURN (co)-[*1..2]-()

// return all nodes that are 1 hop away from Offer, having a bi-directional relationship
MATCH (o:Offer)
RETURN (o)-[*1]-()

// return all nodes that are 1 hop away from Offer, having a publication ending date lower than the given date
WITH 'YYYY-mm-dd' as givenDate
MATCH (o:Offer)
WHERE date(o.publishedDate) < date(givenDate)
RETURN (o:Offer)-[*1]-()

// or
MATCH (o:Offer)
WHERE date(o.publishedDate) < date('YYYY-mm-dd')
RETURN (o:Offer)-[*1]-()

// return all nodes that are 1 hop away from Offer, having a publication ending date lower than 'n' days from a given date
WITH 'YYYY-mm-dd' AS givenDate, 105 AS numberOfDays
MATCH (o:Offer)
WITH o, numberOfDays, duration.inDays(date(givenDate), date(o.endPublished)).days AS daysDifference
WHERE daysDifference < numberOfDays
RETURN 'The ' + o.type + ' entitled "' + o.title + '" will expire in ' + daysDifference + ' days.'

// or, having a publication ending date lower than 'n' days from the current date
MATCH (o:Offer)
WHERE duration.inDays(date(), date(o.endPublished)).days < 110
// display data as graph
RETURN (o)-[*1]-()

// return all offers by the distance between their location and a given point:
// point() returns a 2D point in a CRS corresponding to the given values (WGS-84 or Cartesian)
WITH point({longitude: -84.27831, latitude: -73.81575}) AS startingPoint
// target node is specified
MATCH (lo:Location)-[*1..3]-(o:Offer)
// distance() returns geodesic distance in meters
WITH lo, o, toInteger(distance(startingPoint, point({longitude: lo.longitude, latitude: lo.latitude}))) as distance
WHERE distance > 1000
// return data as table
RETURN 'You are ' + distance + 'm away from offer "' + o.title + '", located at '  + lo.address + '.'

// return all nodes that are up to 3 hops away from Offer, by the distance between their location and a given address:
// apoc.spatial.geocodeOnce() returns coordinates from a textual address
CALL apoc.spatial.geocodeOnce('# address zipcode CITY COUNTRY')
YIELD location AS job
MATCH (lo:Location)
WITH lo, round(distance(point({longitude: job.longitude, latitude: job.latitude}), point({longitude: lo.longitude, latitude: lo.latitude}))) AS distance
WHERE distance < 4000
RETURN (lo)-[*1..3]-()
```

## GET Optimizations

Find all offers, and their strictly related nodes:

```cypher
MATCH (o:Offer) RETURN (o)--()
```

Find all offers by type:

```cypher
MATCH (o)-[:IS_OF_TYPE]->(t:Type {type: 'takeover'}) RETURN o

// or
MATCH (t:Type {type: 'takeover'})<-[]-(o) RETURN o
```

Find offer by id:

```cypher
WITH 1 AS nodeIdentity
MATCH (o:Offer)
WHERE ID(o) = nodeIdentity
RETURN o {id:id(o), properties: properties(o)} // using map projection
```

## PUT

Update offers by id:

```cypher
MATCH path = (o:Offer {id: 1})-[]-(jo)
SET
o += {
  title: string,
  publishedDate: string,
  endPublished: date(o.endPublished) + duration({months: 3}),
  catchPhrase: string
},
jo += {
  townHall: string,
  startingDate: date(jo.applicationDeadline) + duration({months: 6}),
  trade: string, // what does trade stand for?
  jobDescription: string,
  contractType: string,
  duration: string,
  experience: string,
  qualifications: string,
  skills: string,
  executive: boolean,
  applicationDeadline: date(jo.applicationDeadline) + duration({months: 2})
}
RETURN path
```

## DELETE

Delete nodes and its relationships by id:

```cypher
MATCH (n:Label {id: 1})
DETACH DELETE n
```