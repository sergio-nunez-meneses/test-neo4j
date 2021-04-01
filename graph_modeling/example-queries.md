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
  (c)<-[:REFERS_TO]-(o)-[:REFERS_TO]->(tc)
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
  (o)-[:BELONGS_TO]->(co),
  (c)<-[:REFERS_TO]-(o)-[:REFERS_TO]->(tc)
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
  (c)<-[:REFERS_TO]-(o)-[:REFERS_TO]->(tc)
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
  (co)-[:IS_LOCATED]->(lo)
RETURN co, lo
```

## GET

```cypher
// return all nodes up to 2 hops away from Company, that have the indicated (<-) relationship
MATCH (co:Company)<-[*1..2]-(n) RETURN co, n

// return all nodes up to 2 hops away from Company, having a bi-directional relationship
MATCH (co:Company)-[*1..2]-(n) RETURN co, n

// return all nodes up to 1 hop away from Offer, having a bi-directional relationship
MATCH (o:Offer)-[*1]-(n) RETURN o, n

// return all nodes up to 1 hop away from Offer, if their publication ending date is lower than a given date
MATCH (o:Offer)-[*1]-(n)
WHERE date(o.endPublished) < date('YYYY-MM-dd')
RETURN o, n
```

Find all offers and directly related nodes given the relationship direction:

```cypher
// add Location, Images, Company and Company's Location nodes
MATCH (o:Offer)-[]->(n)
RETURN o, n
```

Find all takeover offers:

```cypher
// add Image node
MATCH (o:Offer {type: 'takeover offer'})-[:IS_TYPE_TAKEOVER]->(to:TakeoverOffer)-[:IS_LOCATED]->(lo:Location)
RETURN o, to, lo
```

Find all job offers:

```cypher
// add Company and Company's Location node
MATCH (o:Offer {type: 'job offer'})-[:IS_TYPE_JOB]->(jo:JobOffer)-[:IS_LOCATED]->(lo:Location)
RETURN o, jo, lo
```

Find all estate offers:

```cypher
// add Image node
MATCH (o:Offer {type: 'estate offer'})-[:IS_TYPE_ESTATE]->(eo:EstateOffer)-[:IS_LOCATED]->(lo:Location)
RETURN o, eo, lo
```

Find all offers by any property:

```cypher
MATCH (o:Offer {
  propertyName1: propertyValue1,
  propertyName2: propertyValue2
  // and so on
})-[]->(n)-[:IS_LOCATED]->(lo:Location)
RETURN o, n, lo
```

```cypher
MATCH (o:Offer)-[]->(n {
  propertyName1: propertyValue1,
  propertyName2: propertyValue2
  // and so on
})-[:IS_LOCATED]->(lo:Location)
RETURN o, n, lo
```

Find all job offers by company:

```cypher
MATCH (lo:Location)<-[:IS_LOCATED]-(co:Company {
  name: 'Doe Company'
})<-[:BELONGS_TO]-(o:Offer)-[:IS_TYPE_JOB]->(jo:JobOffer)
RETURN o, jo, co, lo
```

Find offer by id:

```cypher
// add Image node
MATCH (o:Offer {id: 1})-[]->(n)-[:IS_LOCATED]->(lo:Location)
RETURN o, to, lo
```

Find all type of offers by the distance between their location and a given point:

```cypher
// point() returns a 2D point in a CRS corresponding to the given values (WGS-84 or Cartesian)
WITH point({longitude: -84.27831, latitude: -73.81575}) AS startingPoint
MATCH (lo:Location)
// distance() returns geodesic distance in meters
WITH lo, round(distance(startingPoint, point({longitude: lo.longitude, latitude: lo.latitude}))) as distance
WHERE distance > 1000
// RETURN lo.address, distance
RETURN (lo)<-[*1..3]-()
```

Find all type of offers by the distance between their location and a given address:

```cypher
// apoc.spatial.geocodeOnce() returns coordinates from a textual address
CALL apoc.spatial.geocodeOnce('# address zipcode CITY COUNTRY')
YIELD location AS job
MATCH (lo:Location)
WITH lo, round(distance(point({longitude: job.longitude, latitude: job.latitude}), point({longitude: lo.longitude, latitude: lo.latitude}))) AS distance
WHERE distance < 4000
RETURN (lo)-[*1..3]-()
```

## PUT

Update any type of offer, e.g. job offer:

```cypher
MATCH (o:Offer {id: 1})-[]->(n)
SET n += {
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
}
RETURN o, n
```

## DELETE

Delete any type of offer, e.g. job offer:

```cypher
// check hop numbers
MATCH (o:Offer {id: 1})-[*1..5]->(offerDetails)
DETACH DELETE o, offerDetails
```