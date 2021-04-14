# Scenario

An Offer is <u>_published by_</u> a User.<br>
An Offer <u>_refers to_</u> a Contact, and a Territorial Contact.<br>
An Offer <u>_is of type_</u> takeover, job, or estate.<br>

If OfferType is takeover or estate, it <u>_is located_</u> somewhere, and _has_ Image and Plan.<br>
If OfferType is job, it <u>_belongs to_</u> a Company.<br>
The Company <u>_is located_</u> somewhere.

# Nodes

- User
- Contact
- TerritorialContact
- Company
- Offer
- OfferType
- ERPCategory
- Municipality
- TradeType
- ContractType
- ProjectType
- PropertyType
- SellingType
- Image
- Plan
- Location

# Node properties

```yaml
# only required properties
Offer:
  properties:
    id:
      type: string
    title:
      type: string
    reference:
      type: string
    publicationStarts:
      type: string
    publicationEnds:
      type: string
    catchPhrase:
      type: string
    
    # if type takeover
    area:
      type: number
    description:
      type: string
    activityStarts:
      type: string
    numberOfEmployees:
      type: integer
    turnover:
      type: number
    activityType:
      type: string
    currentActivity:
      type: string
    commercialConditions:
      type: string
    targetProfile:
      type: string
    funding:
      type: string

    # if type job
    jobStarts:
      type: string
    description:
      type: string
    duration:
      type: string
    experience:
      type: string
    qualifications:
      type: string
    skills:
      type: string
    executive:
      type: boolean
    applicationDeadline:
      type: string

    # if type estate
    sellingPrice:
      type: float
    area:
      type: number
    numberOfRooms:
      type: integer
    description:
      type: string
    rent:
      type: float
    availableFrom:
      type: string
    numberOfLots:
      type: integer
    annualFees:
      type: float
    transportProximity:
      type: string
    schoolProximity:
      type: string
    hospitalProximity:
      type: string
    storeProximity:
      type: string
    downTownProximity:
      type: string

OfferType:
  properties:
    offerType:
      type: string
      
ERPCategory:
  properties:
    category:
      type: integer

ProjectType:
  properties:
    projectType:
      type: array

PropertyType:
  properties:
    propertyType:
      type: array
      
SellingType:
  properties:
    sellingType:
      type: array

Image:
  properties:
    images: array

Plan:
  properties:
    plans: array
```

# Node relationships

- PUBLISHED_BY
- REFERS_TO
- BELONGS_TO
- IS_OF_TYPE
- IS_LOCATED

```cypher
// not the correct syntax, just for the example
CREATE
    (o:Offer)-[:PUBLISHED_BY]->(u:User),
    (c:Contact)<-[:REFERS_TO]-(o:Offer)-[:REFERS_TO]->(tc:TerritorialContact),
    (o:Offer)-[:IS_OF_TYPE]->(t:Type),
    // if type is takeover
    (o:Offer)-[:UNNAMED]->(ec:ERPCategory),
    (o:Offer)-[:UNNAMED]->(i:Image),
    (o:Offer)-[:UNNAMED]->(p:Plan),
    (o:Offer)-[:IS_LOCATED]->(l:Location),
    // if type job
    (o:Offer)-[:UNNAMED]->(m:Municipality),
    (o:Offer)-[:UNNAMED]->(ct:ContractType),
    (o:Offer)-[:UNNAMED]->(at:TradeType),
    (o:Offer)-[:BELONGS_TO]->(co:Company),
    (co:Company)-[:IS_LOCATED]->(l:Location),
    // if type estate
    (o:Offer)-[:UNNAMED]->(prop:ProjectType),
    (o:Offer)-[:UNNAMED]->(proj:PropertyType),
    (o:Offer)-[:UNNAMED]->(st:SellingType),
    (o:Offer)-[:UNNAMED]->(i:Image),
    (o:Offer)-[:UNNAMED]->(p:Plan),
    (o:Offer)-[:IS_LOCATED]->(l:Location);
```