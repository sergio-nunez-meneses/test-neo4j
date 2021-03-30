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

Find all offers:

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
})-[]->(n)->[:IS_LOCATED]->(lo:Location)
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

Find all type of offers by location (this will be a very more complex query though):

```cypher
MATCH (lo:Location {city: 'Doeland'})<-[:IS_LOCATED]-(n)<-[]-(o:Offer)
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

## PUT

Update any type of offer, e.g. job offer:

```cypher
MATCH (o:Offer {id: 1})->[]->(n)
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
MATCH (o:Offer {id: 1})->[1..5]->(offerDetails)
DETACH DELETE o, offerDetails
```