MATCH (n)
DETACH DELETE n;
CREATE (u1:User {username: 'Amy-Leigh Aldred', id: 1})
CREATE (u2:User {username: 'Caroline Roberson', id: 2})
CREATE (u3:User {username: 'Leja Lancaster', id: 3})
CREATE (u4:User {username: 'Esmai Dillon', id: 4})
CREATE (u5:User {username: 'Rex Banks', id: 5})
CREATE (u6:User {username: 'Rehan Juarez', id: 6})
CREATE (u7:User {username: 'Arla Werner', id: 7})
CREATE (u8:User {username: 'Hendrix Potts', id: 8})
CREATE (u9:User {username: 'Maude Burt', id: 9})
CREATE (u10:User {username: 'Finlay Joyner', id: 10})
CREATE (c1:Contact {firstname: 'Josef', lastname: 'Ewing', id: 1})
CREATE (c2:Contact {firstname: 'Rianne', lastname: 'Crane', id: 2})
CREATE (c3:Contact {firstname: 'Fredrick', lastname: 'Blevins', id: 3})
CREATE (c4:Contact {firstname: 'Suman', lastname: 'Halliday', id: 4})
CREATE (c5:Contact {firstname: 'Roseanna', lastname: 'Flores', id: 5})
CREATE (c6:Contact {firstname: 'Duane', lastname: 'Milne', id: 6})
CREATE (c7:Contact {firstname: 'Rosa', lastname: 'Beck', id: 7})
CREATE (c8:Contact {firstname: 'Jorja', lastname: 'Sanchez', id: 8})
CREATE (c9:Contact {firstname: 'Honor', lastname: 'Quinn', id: 9})
CREATE (c10:Contact {firstname: 'Nayan', lastname: 'Salazar', id: 10})
CREATE (tc1:TerritorialContact {firstname: 'Ellen', lastname: 'Berry', id: 1})
CREATE (tc2:TerritorialContact {firstname: 'Amayah', lastname: 'Butt', id: 2})
CREATE (tc3:TerritorialContact {firstname: 'Hugo', lastname: 'Harmon', id: 3})
CREATE (tc4:TerritorialContact {firstname: 'Zakariah', lastname: 'Santos', id: 4})
CREATE (tc5:TerritorialContact {firstname: 'Anna-Marie', lastname: 'Nairn', id: 5})
CREATE (tc6:TerritorialContact {firstname: 'Kaydon', lastname: 'Cortez', id: 6})
CREATE (tc7:TerritorialContact {firstname: 'Ellena', lastname: 'Figueroa', id: 7})
CREATE (tc8:TerritorialContact {firstname: 'Luke', lastname: 'Dickens', id: 8})
CREATE (tc9:TerritorialContact {firstname: 'Axl', lastname: 'Stewart', id: 9})
CREATE (tc10:TerritorialContact {firstname: 'Mea', lastname: 'Green', id: 10})
CREATE (co1:Company {name: 'Eco Focus', id: 1})
CREATE (co2:Company {name: 'Innovation Arch', id: 2})
CREATE (co3:Company {name: 'Strat Security', id: 3})
CREATE (co4:Company {name: 'Cogent Data', id: 4})
CREATE (co5:Company {name: 'Epic Adventure Inc', id: 5})
CREATE (co6:Company {name: 'Vortex Solar', id: 6})
CREATE (co7:Company {name: 'Admire Arts', id: 7})
CREATE (co8:Company {name: 'Bonefete Fun', id: 8})
CREATE (co9:Company {name: 'Cipher Publishing', id: 9})
CREATE (co10:Company {name: 'Lambent Illumination', id: 10})
CREATE (o1:Offer {type: 'takeover offer', title: 'ut tellus elementum', publishedDate: '2021-04-13', endPublished: '2021-07-09', id: 1})
CREATE (o2:Offer {type: 'job offer', title: 'sagittis vitae et leo duis ut', publishedDate: '2021-04-30', endPublished: '2021-07-13', id: 2})
CREATE (o3:Offer {type: 'estate offer', title: 'diam quam nulla porttitor massa', publishedDate: '2021-05-06', endPublished: '2021-07-15', id: 3})
CREATE (o4:Offer {type: 'takeover offer', title: 'id neque aliquam vestibulum morbi', publishedDate: '2021-05-10', endPublished: '2021-07-20', id: 4})
CREATE (o5:Offer {type: 'job offer', title: 'blandit cursus risus', publishedDate: '2021-05-12', endPublished: '2021-07-23', id: 5})
CREATE (o6:Offer {type: 'estate offer', title: 'at ultrices mi tempus imperdiet', publishedDate: '2021-05-13', endPublished: '2021-08-04', id: 6})
CREATE (o7:Offer {type: 'takeover offer', title: 'nulla malesuada pellentesque elit', publishedDate: '2021-05-17', endPublished: '2021-08-09', id: 7})
CREATE (o8:Offer {type: 'job offer', title: 'eget gravida cum sociis', publishedDate: '2021-05-18', endPublished: '2021-08-10', id: 8})
CREATE (o9:Offer {type: 'estate offer', title: 'natoque penatibus', publishedDate: '2021-05-20', endPublished: '2021-08-17', id: 9})
CREATE (o10:Offer {type: 'takeover offer', title: 'et magnis dis parturient montes', publishedDate: '2021-05-27', endPublished: '2021-09-10', id: 10})
CREATE (o11:Offer {type: 'job offer', title: 'nascetur ridiculus mus mauris', publishedDate: '2021-05-28', endPublished: '2021-09-14', id: 11})
CREATE (o12:Offer {type: 'estate offer', title: 'vitae ultricies leo integer malesuada', publishedDate: '2021-05-31', endPublished: '2021-09-15', id: 12})
CREATE (o13:Offer {type: 'takeover offer', title: 'nunc vel risus commodo', publishedDate: '2021-06-04', endPublished: '2021-09-20', id: 13})
CREATE (o14:Offer {type: 'job offer', title: 'viverra maecenas accumsan lacus', publishedDate: '2021-06-07', endPublished: '2021-09-30', id: 14})
CREATE (o15:Offer {type: 'estate offer', title: 'vel facilisis volutpat est velit', publishedDate: '2021-06-17', endPublished: '2021-10-11', id: 15})
CREATE (o16:Offer {type: 'takeover offer', title: 'egestas dui id ornare', publishedDate: '2021-06-21', endPublished: '2021-10-14', id: 16})
CREATE (o17:Offer {type: 'job offer', title: 'arcu odio ut sem', publishedDate: '2021-06-23', endPublished: '2021-10-19', id: 17})
CREATE (o18:Offer {type: 'estate offer', title: 'nulla pharetra diam', publishedDate: '2021-06-24', endPublished: '2021-11-04', id: 18})
CREATE (o19:Offer {type: 'takeover offer', title: 'sit amet nisl', publishedDate: '2021-06-25', endPublished: '2021-11-11', id: 19})
CREATE (o20:Offer {type: 'job offer', title: 'suscipit adipiscing', publishedDate: '2021-07-13', endPublished: '2021-11-17', id: 20})
CREATE (o21:Offer {type: 'estate offer', title: 'dui vivamus arcu felis bibendum', publishedDate: '2021-07-14', endPublished: '2021-11-29', id: 21})
CREATE (o22:Offer {type: 'takeover offer', title: 'ut tristique et egestas quis ipsum', publishedDate: '2021-07-15', endPublished: '2021-12-09', id: 22})
CREATE (o23:Offer {type: 'job offer', title: 'suspendisse ultrices gravida', publishedDate: '2021-07-19', endPublished: '2021-12-13', id: 23})
CREATE (o24:Offer {type: 'estate offer', title: 'dictum fusce ut placerat', publishedDate: '2021-07-23', endPublished: '2021-12-14', id: 24})
CREATE (o25:Offer {type: 'takeover offer', title: 'orci nulla pellentesque', publishedDate: '2021-07-28', endPublished: '2021-12-21', id: 25})
CREATE (o26:Offer {type: 'job offer', title: 'dignissim enim sit amet venenatis', publishedDate: '2021-08-02', endPublished: '2021-12-02', id: 26})
CREATE (o27:Offer {type: 'estate offer', title: 'urna cursus eget nunc viverra adipiscing at in tellus', publishedDate: '2021-08-04', endPublished: '2021-12-06', id: 27})
CREATE (o28:Offer {type: 'takeover offer', title: 'integer feugiat scelerisque varius morbi', publishedDate: '2021-08-16', endPublished: '2021-12-15', id: 28})
CREATE (o29:Offer {type: 'job offer', title: 'enim nunc faucibus a pellentesque sit amet porttitor eget dolor', publishedDate: '2021-08-23', endPublished: '2021-12-17', id: 29})
CREATE (o30:Offer {type: 'estate offer', title: 'morbi non arcu risus quis varius quam quisque id diam', publishedDate: '2021-09-07', endPublished: '2021-12-23', id: 30})
CREATE (to1:TakeoverOffer {description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', id: 1})
CREATE (to2:TakeoverOffer {description: 'Et malesuada fames ac turpis egestas maecenas.', id: 2})
CREATE (to3:TakeoverOffer {description: 'Vitae aliquet nec ullamcorper sit amet risus.', id: 3})
CREATE (to4:TakeoverOffer {description: 'In dictum non consectetur a erat.', id: 4})
CREATE (to5:TakeoverOffer {description: 'Est ultricies integer quis auctor elit.', id: 5})
CREATE (to6:TakeoverOffer {description: 'Dui id ornare arcu odio ut sem nulla pharetra diam.', id: 6})
CREATE (to7:TakeoverOffer {description: 'Sit amet justo donec enim diam vulputate ut pharetra sit.', id: 7})
CREATE (to8:TakeoverOffer {description: 'Ridiculus mus mauris vitae ultricies.', id: 8})
CREATE (to9:TakeoverOffer {description: 'Non tellus orci ac auctor augue mauris augue neque.', id: 9})
CREATE (to10:TakeoverOffer {description: 'Sed risus ultricies tristique nulla aliquet enim tortor.', id: 10})
CREATE (jo1:JobOffer {description: 'Sed arcu non odio euismod lacinia.', id: 1})
CREATE (jo2:JobOffer {description: 'Orci eu lobortis elementum nibh tellus molestie nunc.', id: 2})
CREATE (jo3:JobOffer {description: 'Dui id ornare arcu odio.', id: 3})
CREATE (jo4:JobOffer {description: 'Porttitor eget dolor morbi non arcu risus.', id: 4})
CREATE (jo5:JobOffer {description: 'Duis ut diam quam nulla porttitor massa id.', id: 5})
CREATE (jo6:JobOffer {description: 'Varius quam quisque id diam.', id: 6})
CREATE (jo7:JobOffer {description: 'Vulputate eu scelerisque felis imperdiet proin fermentum leo.', id: 7})
CREATE (jo8:JobOffer {description: 'Et tortor at risus viverra adipiscing at.', id: 8})
CREATE (jo9:JobOffer {description: 'Massa sapien faucibus et molestie ac.', id: 9})
CREATE (jo10:JobOffer {description: 'Ridiculus mus mauris vitae ultricies leo.', id: 10})
CREATE (eo1:EstateOffer {description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', id: 1})
CREATE (eo2:EstateOffer {description: 'Ut diam quam nulla porttitor massa.', id: 2})
CREATE (eo3:EstateOffer {description: 'Faucibus interdum posuere lorem ipsum dolor sit.', id: 3})
CREATE (eo4:EstateOffer {description: 'Eu lobortis elementum nibh tellus molestie nunc non.', id: 4})
CREATE (eo5:EstateOffer {description: 'Eu lobortis elementum nibh tellus molestie nunc non blandit massa.', id: 5})
CREATE (eo6:EstateOffer {description: 'Dignissim sodales ut eu sem integer vitae justo eget.', id: 6})
CREATE (eo7:EstateOffer {description: 'Neque ornare aenean euismod elementum nisi.', id: 7})
CREATE (eo8:EstateOffer {description: 'Pretium fusce id velit ut tortor pretium viverra suspendisse.', id: 8})
CREATE (eo9:EstateOffer {description: 'Diam phasellus vestibulum lorem sed risus.', id: 9})
CREATE (eo10:EstateOffer {description: 'Consequat semper viverra nam libero justo laoreet sit amet cursus.', id: 10})
CREATE (lo1:Location {address: '14 Rue Fonmorigny', city: 'Nevers', zipcode: 58000, latitude: 46.991204872852826, longitude: 3.164862684797683, id: 1})
CREATE (lo2:Location {address: '18 Rue de la Jonction', city: 'Nevers', zipcode: 58000, latitude: 46.98203504301195, longitude: 3.163733684078444, id: 2})
CREATE (lo3:Location {address: '3 Rue François Mitterrand', city: 'Nevers', zipcode: 58000, latitude: 46.98788329704684, longitude: 3.1615197110684434, id: 3})
CREATE (lo4:Location {address: '1 Rue de la Revenderie', city: 'Nevers', zipcode: 58000, latitude: 46.98995990612068, longitude: 3.16304281106852, id: 4})
CREATE (lo5:Location {address: '1 Rue Charles-Roy', city: 'Nevers', zipcode: 58000, latitude: 46.99479384802674, longitude: 3.1628061552439317, id: 5})
CREATE (lo6:Location {address: '4 Rue du 13E de Ligne', city: 'Nevers', zipcode: 58000, latitude: 46.99271058484829, longitude: 3.1461043110686413, id: 6})
CREATE (lo7:Location {address: '13 Place Mosse', city: 'Nevers', zipcode: 58000, latitude: 46.98532094680932, longitude: 3.156744197573458, id: 7})
CREATE (lo8:Location {address: '2 Rue Saint-Didier', city: 'Nevers', zipcode: 58000, latitude: 46.988408894671885, longitude: 3.155955468738543, id: 8})
CREATE (lo9:Location {address: '60 Rue de Nièvre', city: 'Nevers', zipcode: 58000, latitude: 46.99012038693866, longitude: 3.1636086092232514, id: 9})
CREATE (lo10:Location {address: '5 Rue Saint-Didier', city: 'Nevers', zipcode: 58000, latitude: 46.98846461978366, longitude: 3.1564295533983597, id: 10})
CREATE (lo11:Location {address: '31 Avenue Colbert', city: 'Nevers', zipcode: 58000, latitude: 46.99751804899956, longitude: 3.1571131417491647, id: 11})
CREATE (lo12:Location {address: '27 Rue des Grands Jardins', city: 'Nevers', zipcode: 58000, latitude: 46.99669613969092, longitude: 3.136766355244028, id: 12})
CREATE (lo13:Location {address: '3 Square de la Résistance', city: 'Nevers', zipcode: 58000, latitude: 46.992343240636394, longitude: 3.160591355243829, id: 13})
CREATE (lo14:Location {address: '11 Square de la Résistance', city: 'Nevers', zipcode: 58000, latitude: 46.99197291498163, longitude: 3.160327826408791, id: 14})
CREATE (lo15:Location {address: '25 Quai de Mantoue', city: 'Nevers', zipcode: 58000, latitude: 46.98560073592141, longitude: 3.15820304174869, id: 15})
CREATE (lo16:Location {address: '50 Avenue Général de Gaulle', city: 'Nevers', zipcode: 58000, latitude: 46.98792207813667, longitude: 3.151402784078711, id: 16})
CREATE (lo17:Location {address: '18 Rue Georges Pielin', city: 'Nevers', zipcode: 58000, latitude: 46.982982999776105, longitude: 3.1269296245630915, id: 17})
CREATE (lo18:Location {address: '4 Place Guy Coquille', city: 'Nevers', zipcode: 58000, latitude: 46.99082004710196, longitude: 3.162575482233523, id: 18})
CREATE (lo19:Location {address: '15 Rue Pierre Emile Gaspard', city: 'Nevers', zipcode: 58000, latitude: 46.986243809641095, longitude: 3.150180228253858, id: 19})
CREATE (lo20:Location {address: '26 Avenue Pierre Bérégovoy', city: 'Nevers', zipcode: 58000, latitude: 46.98623649070845, longitude: 3.150137312913691, id: 20})
CREATE (lo21:Location {address: 'Le Bourg', city: 'Vauclaix', zipcode: 58140, latitude: 47.231626333124716, longitude: 3.8231016239738085, id: 21})
CREATE (lo22:Location {address: 'Le Bourg', city: "Vaux d'Amognes", zipcode: 58130, latitude: 47.0577154271303, longitude: 3.3074656991485534, id: 22})
CREATE (lo23:Location {address: "Lieu-dit L'Usage", city: 'Verneuil', zipcode: 58300, latitude: 46.86662413805243, longitude: 3.5707704933001176, id: 23})
CREATE (lo24:Location {address: '14 Route de la Mairie', city: 'Vielmanay', zipcode: 58150, latitude: 47.267110045916944, longitude: 3.11333922030654, id: 24})
CREATE (lo25:Location {address: 'Le Bourg', city: 'Vignol', zipcode: 58190, latitude: 47.361730940390075, longitude: 3.6706914403232664, id: 25})
CREATE (lo26:Location {address: "3-5 L'Haut de la Croix", city: 'Villapourçon', zipcode: 58370, latitude: 46.96465490618421, longitude: 4.0287466279613735, id: 26})
CREATE (lo27:Location {address: 'La Chaume', city: 'Ville-Langy', zipcode: 58270, latitude: 46.94251136709633, longitude: 3.495937990703361, id: 27})
CREATE (lo28:Location {address: 'Le Bourg', city: 'Villiers-le-Sec', zipcode: 58210, latitude: 47.377613200472304, longitude: 3.430606898156778, id: 28})
CREATE (lo29:Location {address: "15 Rue de l'Église", city: 'Villiers-sur-Yonne', zipcode: 58500, latitude: 47.413497205148694, longitude: 3.5745199432764454, id: 29})
CREATE (lo30:Location {address: 'Le Bourg', city: 'Vitry-Laché', zipcode: 58420, latitude: 47.20099160043019, longitude: 3.5643014221490588, id: 30})
CREATE
(o0)-[:PUBLISHED_BY]->(u1),
(tc5)<-[:REFERS_TO]-(o0)-[:REFERS_TO]->(c8),
(o0)-[:IS_TYPE_TAKEOVER]->(to0),
(to0)-[:IS_LOCATED]->(lo22),
(o1)-[:PUBLISHED_BY]->(u5),
(tc7)<-[:REFERS_TO]-(o1)-[:REFERS_TO]->(c4),
(o1)-[:IS_TYPE_JOB]->(jo1),
(jo1)-[:BELONGS_TO]->(co5),
(co5)-[:IS_LOCATED]->(lo17),
(o2)-[:PUBLISHED_BY]->(u6),
(tc7)<-[:REFERS_TO]-(o2)-[:REFERS_TO]->(c4),
(o2)-[:IS_TYPE_ESTATE]->(eo2),
(eo2)-[:IS_LOCATED]->(lo0),
(o3)-[:PUBLISHED_BY]->(u1),
(tc1)<-[:REFERS_TO]-(o3)-[:REFERS_TO]->(c6),
(o3)-[:IS_TYPE_TAKEOVER]->(to3),
(to3)-[:IS_LOCATED]->(lo18),
(o4)-[:PUBLISHED_BY]->(u8),
(tc7)<-[:REFERS_TO]-(o4)-[:REFERS_TO]->(c4),
(o4)-[:IS_TYPE_JOB]->(jo4),
(jo4)-[:BELONGS_TO]->(co2),
(co2)-[:IS_LOCATED]->(lo28),
(o5)-[:PUBLISHED_BY]->(u2),
(tc6)<-[:REFERS_TO]-(o5)-[:REFERS_TO]->(c9),
(o5)-[:IS_TYPE_ESTATE]->(eo5),
(eo5)-[:IS_LOCATED]->(lo29),
(o6)-[:PUBLISHED_BY]->(u4),
(tc7)<-[:REFERS_TO]-(o6)-[:REFERS_TO]->(c1),
(o6)-[:IS_TYPE_TAKEOVER]->(to6),
(to6)-[:IS_LOCATED]->(lo16),
(o7)-[:PUBLISHED_BY]->(u7),
(tc1)<-[:REFERS_TO]-(o7)-[:REFERS_TO]->(c5),
(o7)-[:IS_TYPE_JOB]->(jo7),
(jo7)-[:BELONGS_TO]->(co1),
(co1)-[:IS_LOCATED]->(lo29),
(o8)-[:PUBLISHED_BY]->(u2),
(tc5)<-[:REFERS_TO]-(o8)-[:REFERS_TO]->(c7),
(o8)-[:IS_TYPE_ESTATE]->(eo8),
(eo8)-[:IS_LOCATED]->(lo1),
(o9)-[:PUBLISHED_BY]->(u4),
(tc3)<-[:REFERS_TO]-(o9)-[:REFERS_TO]->(c3),
(o9)-[:IS_TYPE_TAKEOVER]->(to9),
(to9)-[:IS_LOCATED]->(lo9),
(o10)-[:PUBLISHED_BY]->(u2),
(tc1)<-[:REFERS_TO]-(o10)-[:REFERS_TO]->(c3),
(o10)-[:IS_TYPE_JOB]->(jo0),
(jo0)-[:BELONGS_TO]->(co0),
(co0)-[:IS_LOCATED]->(lo27),
(o11)-[:PUBLISHED_BY]->(u0),
(tc9)<-[:REFERS_TO]-(o11)-[:REFERS_TO]->(c5),
(o11)-[:IS_TYPE_ESTATE]->(eo1),
(eo1)-[:IS_LOCATED]->(lo26),
(o12)-[:PUBLISHED_BY]->(u4),
(tc1)<-[:REFERS_TO]-(o12)-[:REFERS_TO]->(c1),
(o12)-[:IS_TYPE_TAKEOVER]->(to2),
(to2)-[:IS_LOCATED]->(lo25),
(o13)-[:PUBLISHED_BY]->(u5),
(tc2)<-[:REFERS_TO]-(o13)-[:REFERS_TO]->(c3),
(o13)-[:IS_TYPE_JOB]->(jo3),
(jo3)-[:BELONGS_TO]->(co9),
(co9)-[:IS_LOCATED]->(lo24),
(o14)-[:PUBLISHED_BY]->(u9),
(tc4)<-[:REFERS_TO]-(o14)-[:REFERS_TO]->(c2),
(o14)-[:IS_TYPE_ESTATE]->(eo4),
(eo4)-[:IS_LOCATED]->(lo7),
(o15)-[:PUBLISHED_BY]->(u0),
(tc4)<-[:REFERS_TO]-(o15)-[:REFERS_TO]->(c6),
(o15)-[:IS_TYPE_TAKEOVER]->(to5),
(to5)-[:IS_LOCATED]->(lo5),
(o16)-[:PUBLISHED_BY]->(u7),
(tc9)<-[:REFERS_TO]-(o16)-[:REFERS_TO]->(c9),
(o16)-[:IS_TYPE_JOB]->(jo6),
(jo6)-[:BELONGS_TO]->(co3),
(co3)-[:IS_LOCATED]->(lo27),
(o17)-[:PUBLISHED_BY]->(u7),
(tc6)<-[:REFERS_TO]-(o17)-[:REFERS_TO]->(c1),
(o17)-[:IS_TYPE_ESTATE]->(eo7),
(eo7)-[:IS_LOCATED]->(lo17),
(o18)-[:PUBLISHED_BY]->(u6),
(tc6)<-[:REFERS_TO]-(o18)-[:REFERS_TO]->(c7),
(o18)-[:IS_TYPE_TAKEOVER]->(to8),
(to8)-[:IS_LOCATED]->(lo12),
(o19)-[:PUBLISHED_BY]->(u8),
(tc1)<-[:REFERS_TO]-(o19)-[:REFERS_TO]->(c3),
(o19)-[:IS_TYPE_JOB]->(jo9),
(jo9)-[:BELONGS_TO]->(co7),
(co7)-[:IS_LOCATED]->(lo22),
(o20)-[:PUBLISHED_BY]->(u4),
(tc6)<-[:REFERS_TO]-(o20)-[:REFERS_TO]->(c4),
(o20)-[:IS_TYPE_ESTATE]->(eo0),
(eo0)-[:IS_LOCATED]->(lo13),
(o21)-[:PUBLISHED_BY]->(u9),
(tc4)<-[:REFERS_TO]-(o21)-[:REFERS_TO]->(c1),
(o21)-[:IS_TYPE_TAKEOVER]->(to1),
(to1)-[:IS_LOCATED]->(lo19),
(o22)-[:PUBLISHED_BY]->(u0),
(tc5)<-[:REFERS_TO]-(o22)-[:REFERS_TO]->(c1),
(o22)-[:IS_TYPE_JOB]->(jo2),
(jo2)-[:BELONGS_TO]->(co1),
(co1)-[:IS_LOCATED]->(lo11),
(o23)-[:PUBLISHED_BY]->(u9),
(tc6)<-[:REFERS_TO]-(o23)-[:REFERS_TO]->(c5),
(o23)-[:IS_TYPE_ESTATE]->(eo3),
(eo3)-[:IS_LOCATED]->(lo13),
(o24)-[:PUBLISHED_BY]->(u7),
(tc3)<-[:REFERS_TO]-(o24)-[:REFERS_TO]->(c1),
(o24)-[:IS_TYPE_TAKEOVER]->(to4),
(to4)-[:IS_LOCATED]->(lo6),
(o25)-[:PUBLISHED_BY]->(u4),
(tc1)<-[:REFERS_TO]-(o25)-[:REFERS_TO]->(c5),
(o25)-[:IS_TYPE_JOB]->(jo5),
(jo5)-[:BELONGS_TO]->(co4),
(co4)-[:IS_LOCATED]->(lo24),
(o26)-[:PUBLISHED_BY]->(u3),
(tc1)<-[:REFERS_TO]-(o26)-[:REFERS_TO]->(c9),
(o26)-[:IS_TYPE_ESTATE]->(eo6),
(eo6)-[:IS_LOCATED]->(lo22),
(o27)-[:PUBLISHED_BY]->(u7),
(tc4)<-[:REFERS_TO]-(o27)-[:REFERS_TO]->(c4),
(o27)-[:IS_TYPE_TAKEOVER]->(to7),
(to7)-[:IS_LOCATED]->(lo23),
(o28)-[:PUBLISHED_BY]->(u4),
(tc8)<-[:REFERS_TO]-(o28)-[:REFERS_TO]->(c7),
(o28)-[:IS_TYPE_JOB]->(jo8),
(jo8)-[:BELONGS_TO]->(co3),
(co3)-[:IS_LOCATED]->(lo8),
(o29)-[:PUBLISHED_BY]->(u1),
(tc7)<-[:REFERS_TO]-(o29)-[:REFERS_TO]->(c3),
(o29)-[:IS_TYPE_ESTATE]->(eo9),
(eo9)-[:IS_LOCATED]->(lo26);