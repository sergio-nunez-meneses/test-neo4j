# Labels

- User
- Contact
- TerritorialContact
- Company
- Offer
- Type
- OfferDetail
- Location
- Image

# Scenario

An Offer is <u>_published by_</u> a User.<br>
An Offer <u>_refers to_</u> a Contact, and a Territorial Contact.<br>
An Offer <u>_is of type_</u> takeover, job, or estate.<br>
An Offer <u>_has details_</u>.

If an Offer <u>_is of type_</u> takeover or estate, Offer Detail <u>_is located_</u> somewhere and _has media_.<br>
If an Offer <u>_is of type_</u> job, Offer Detal <u>_belongs to_</u> a Company.

A Company <u>_is located_</u> somewhere.

# Relationships

- PUBLISHED_BY
- REFERS_TO
- BELONGS_TO
- IS_OF_TYPE
- IS_LOCATED
- HAS_MEDIA

```cypher
CREATE
    (o:Offer)-[:PUBLISHED_BY]->(u:User)
    (c:Contact)<-[:REFERS_TO]-(o:Offer)-[:REFERS_TO]->(tc:TerritorialContact)
    (o:Offer)-[:IS_OF_TYPE]->(t:Type)
    (o:Offer)-[:HAS_DETAILS]->(od:OfferDetail) // must be confirmed
    // if type takeover or estate
    (o:Offer)-[:IS_LOCATED]->(l:Location)
    (o:Offer)-[:HAS_MEDIA]->(i:Image)
    // if type job
    (o:Offer)-[:BELONGS_TO]->(co:Company)
    (co:Company)-[:IS_LOCATED]->(l:Location);
```