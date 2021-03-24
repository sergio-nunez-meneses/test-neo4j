# Scenario

A User <u>_publishes_</u> an Offer.<br>
An Offer is <u>_published by_</u> a User.

A Contact or a Territorial Contact, <u>_are referents for_</u> an Offer.<br>
An Offer <u>_refers to_</u> a Contact and a Territorial Contact.

A Company <u>_has a Job Offer_</u>.<br>
A Job Offer <u>_belongs to a Company_</u>.

An Offer is either a <u>_Job offer_</u>, an <u>_Estate offer_</u>, or a <u>_Takeover offer_</u>.<br>
A Job, Estate or Takeover offers <u>_belong to an Offer_</u>.

# Labels

- Offer
    - JobOffer
    - RealEstateOffer
    - TakeoverOffer
- User
- Contact
- TerritorialContact

# Relationships

- PUBLISHES
- PUBLISHED_BY
- IS_REFERENT_FOR
- REFERS_TO
- HAS_JOB_OFFER
- BELONGS_TO_COMPANY
- IS_JOB_OFFER
- IS_ESTATE_OFFER
- IS_TAKEOVER_OFFER
- BELONGS_TO_OFFER

# Example Queries

```
// more or less like 'DROP TABLE' in MySQL
MATCH (n) WHERE (n:User OR n:Offer OR n:JobOffer) DETACH DELETE n

// create nodes with relationships
CREATE (u:User { name: 'John Doe' })
CREATE (o:Offer { title: 'New job offer' })
CREATE (jo:JobOffer { jobDescription: 'It is a really awesome job!'})
// CREATE (eo:EstateOffer { } )
// CREATE (to:TakeoverOffer { } )
CREATE (u)->[:PUBLISHES]->(o)-[:IS_ESTATE_OFFER]->(eo)
```
