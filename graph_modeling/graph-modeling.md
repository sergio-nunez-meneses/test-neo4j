# Scenario

A User <u>_publishes_</u> an Offer.<br>
An Offer is <u>_published by_</u> a User.

A Contact or a Territorial Contact, <u>_are referents for_</u> an Offer.<br>
An Offer <u>_refers to_</u> a Contact and a Territorial Contact.

A Company <u>_has a Job Offer_</u>.<br>
A Job Offer <u>_belongs to a Company_</u>.

An Offer is either a <u>_Job offer_</u>, a <u>_Takeover offer_</u>, or an <u>_Estate offer_</u>.<br>
A Job, Takeover or Estate offers <u>_belong to an Offer_</u>.

A Takeover or Estate offers, or a Company, <u>_are located_</u> somewhere.<br>

# Labels

- User
- Contact
- TerritorialContact
- Company
- Offer
  - JobOffer
  - RealEstateOffer
  - TakeoverOffer
- Location

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
- IS_LOCATED_AT