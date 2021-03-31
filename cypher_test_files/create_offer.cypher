// drop nodes
MATCH (n)
DETACH DELETE n;
// create offer
CREATE (o:Offer)
SET
o.type = 'Takeover offer',
o.title = 'New offer',
o.reference = 'AX145BL',
o.publishedDate = date() + duration({months: 3}),
o.endPublished = o.publishedDate + duration({months: 6}),
o.catchPhrase = 'Lorem ipsum dolor sit amet.'
// create takeover offer
CREATE (to:TakeoverOffer)
SET
to.description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
to.startingDate = date() - duration({years: 5}),
to.numberOfEmployees = 10,
to.ERPcategory = 'Not concerned',
to.turnover = 123456.7,
to.activityType = 'Activity type',
to.currentActivity = 'Current activity',
to.commercialConditions = 'Commercial conditions',
to.targetProfile = 'Target profile',
to.funding = 'Funding opportunities'
// create location
CREATE (lo:Location)
SET
lo.address = '12 consectetur adipiscing elit',
lo.zipCode = '01234',
lo.city = 'Lorem',
lo.latitude = 37.54341930246453,
lo.longitude = -79.07646838707805
// create images
CREATE (i:Images)
SET
i.imgList = [
  'https://example.com/img/1.jpg',
  'https://example.com/img/2.jpg'
]
// create relationships
CREATE
  (o)-[:IS_TAKEOVER]->(to),
  (to)-[:IS_LOCATED]->(lo),
  (to)-[:HAS_MEDIA]->(i);