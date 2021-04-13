CREATE (u:User {username: 'Ted Mosby'})
CREATE (c:Contact {firstname: 'Marshall', lastname: 'Ericksen'})
CREATE (tc:TerritorialContact {firstname: 'Barney', lastname: 'Stinson'})
CREATE (co:Company {name: 'Mosbius Designs'})
CREATE (o:Offer {title: 'ut tellus elementum', publishedDate: '2021-04-13', endPublished: '2021-07-09'})
CREATE (t:Type {type: 'job'})
CREATE (od:OfferDetail {description: 'Mosbius Designs has failed.'})
CREATE (l:Location {address: '2353 Broadway', city: 'New York', zipcode: 10024, latitude: 40.78872652493875, longitude: -73.9757984200795})
CREATE
    (o)-[:PUBLISHED_BY]->(u),
    (o)-[:REFERS_TO]->(c),
    (o)-[:REFERS_TO]->(tc),
    (o)-[:IS_OF_TYPE]->(t),
    (o)-[:HAS_DETAILS]->(od),
    (o)-[:BELONGS_TO]->(co),
    (co)-[:IS_LOCATED]->(l);