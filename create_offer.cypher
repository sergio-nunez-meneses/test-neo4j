// drop nodes
MATCH (n) DETACH DELETE n;
// create nodes
CREATE (o:Offer)
// set properties
SET
o.type = 'Takeover offer',
o.title = 'New offer',
o.reference = 'AX145BL',
o.publishedDate = date(),
o.endPublished = o.publishedDate + duration({months: 1}),
o.catchPhrase = 'Lorem ipsum dolor sit amet.'