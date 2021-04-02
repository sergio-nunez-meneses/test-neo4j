MATCH (n)
DETACH DELETE n;
CREATE (u1:User {id: 1, username: "Amy-Leigh Aldred"})
CREATE (c1:Contact {id: 1, firstname: "Josef", lastname: "Ewing"})
CREATE (tc1:TerritorialContact {id: 1, firstname: "Ellen", lastname: "Berry", link: "https://beerlelryn.org"})
CREATE (co1:Company {id: 1, name: "Eco Focus"})
CREATE (o1:Offer {id: 1, type: "takeover offer", title: "ut tellus elementum", publishedDate: "2021-04-13", endPublished: "2021-07-09"})
CREATE (to1:TakeoverOffer {description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})
CREATE (lo1:Location {id: 1, address: "14 Rue Fonmorigny", city: "Nevers", zipcode: 58000, latitude: 46.991204872852826, longitude:3.164862684797683})
CREATE (u2:User {id: 2, username: "Caroline Roberson"})
CREATE (c2:Contact {id: 2, firstname: "Rianne", lastname: "Crane"})
CREATE (tc2:TerritorialContact {id: 2, firstname: "Amayah", lastname: "Butt", link: "https://yabhtmauat.org"})
CREATE (co2:Company {id: 2, name: "Innovation Arch"})
CREATE (o2:Offer {id: 2, type: "job offer", title: "sagittis vitae et leo duis ut", publishedDate: "2021-04-30", endPublished: "2021-07-13"})
CREATE (jo2:JobOffer {description: "Et malesuada fames ac turpis egestas maecenas."})
CREATE (lo2:Location {id: 2, address: "18 Rue de la Jonction", city: "Nevers", zipcode: 58000, latitude: 46.98203504301195, longitude: 3.163733684078444})
CREATE (u3:User {id: 3, username: "Leja Lancaster"})
CREATE (c3:Contact {id: 3, firstname: "Fredrick", lastname: "Blevins"})
CREATE (tc3:TerritorialContact {id: 3, firstname: "Hugo", lastname: "Harmon", link: "https://hhgonmuora.org"})
CREATE (co3:Company {id: 3, name: "Strat Security"})
CREATE (o3:Offer {id: 3, type: "estate offer", title: "diam quam nulla porttitor massa", publishedDate: "2021-05-06", endPublished: "2021-07-15"})
CREATE (eo3:EstateOffer {description: "Vitae aliquet nec ullamcorper sit amet risus."})
CREATE (lo3:Location {id: 3, address: "3 Rue François Mitterrand", city: "Nevers", zipcode: 58000, latitude: 46.98788329704684, longitude: 3.1615197110684434})
CREATE (u4:User {id: 4, username: "Esmai Dillon"})
CREATE (c4:Contact {id: 4, firstname: "Suman", lastname: "Halliday"})
CREATE (tc4:TerritorialContact {id: 4, firstname: "Zakariah", lastname: "Santos", link: "https://aknihasosaartz.org"})
CREATE (co4:Company {id: 4, name: "Cogent Data"})
CREATE (o4:Offer {id: 4, type: "takeover offer", title: "id neque aliquam vestibulum morbi", publishedDate: "2021-05-10", endPublished: "2021-07-20"})
CREATE (to4:TakeoverOffer {description: "In dictum non consectetur a erat."})
CREATE (lo4:Location {id: 4, address: "1 Rue de la Revenderie", city: "Nevers", zipcode: 58000, latitude: 46.98995990612068, longitude: 3.16304281106852})
CREATE (u5:User {id: 5, username: "Rex Banks"})
CREATE (c5:Contact {id: 5, firstname: "Roseanna", lastname: "Flores"})
CREATE (tc5:TerritorialContact {id: 5, firstname: "Anna-Marie", lastname: "Nairn", link: "https://ninnaeiaar-amrn.org"})
CREATE (co5:Company {id: 5, name: "Epic Adventure Inc"})
CREATE (o5:Offer {id: 5, type: "job offer", title: "blandit cursus risus", publishedDate: "2021-05-12", endPublished: "2021-07-23"})
CREATE (jo5:JobOffer {description: "Est ultricies integer quis auctor elit."})
CREATE (lo5:Location {id: 5, address: "1 Rue Charles-Roy", city: "Nevers", zipcode: 58000, latitude: 46.99479384802674, longitude: 3.1628061552439317})
CREATE (u6:User {id: 6, username: "Rehan Juarez"})
CREATE (c6:Contact {id: 6, firstname: "Duane", lastname: "Milne"})
CREATE (tc6:TerritorialContact {id: 6, firstname: "Kaydon", lastname: "Cortez", link: "https://tazkeroondcy.org"})
CREATE (co6:Company {id: 6, name: "Vortex Solar"})
CREATE (o6:Offer {id: 6, type: "estate offer", title: "at ultrices mi tempus imperdiet", publishedDate: "2021-05-13", endPublished: "2021-08-04"})
CREATE (eo6:EstateOffer {description: "Dui id ornare arcu odio ut sem nulla pharetra diam."})
CREATE (lo6:Location {id: 6, address: "4 Rue du 13E de Ligne", city: "Nevers", zipcode: 58000, latitude: 46.99271058484829, longitude: 3.1461043110686413})
CREATE (u7:User {id: 7, username: "Arla Werner"})
CREATE (c7:Contact {id: 7, firstname: "Rosa", lastname: "Beck"})
CREATE (tc7:TerritorialContact {id: 7, firstname: "Ellena", lastname: "Figueroa", link: "https://gelaearflonieu.org"})
CREATE (co7:Company {id: 7, name: "Admire Arts"})
CREATE (o7:Offer {id: 7, type: "takeover offer", title: "nulla malesuada pellentesque elit", publishedDate: "2021-05-17", endPublished: "2021-08-09"})
CREATE (to7:TakeoverOffer {description: "Sit amet justo donec enim diam vulputate ut pharetra sit."})
CREATE (lo7:Location {id: 7, address: "13 Place Mosse", city: "Nevers", zipcode: 58000, latitude: 46.98532094680932, longitude: 3.156744197573458})
CREATE (u8:User {id: 8, username: "Hendrix Potts"})
CREATE (c8:Contact {id: 8, firstname: "Jorja", lastname: "Sanchez"})
CREATE (tc8:TerritorialContact {id: 8, firstname: "Luke", lastname: "Dickens", link: "https://iucnkseldke.org"})
CREATE (co8:Company {id: 8, name: "Bonefete Fun"})
CREATE (o8:Offer {id: 8, type: "job offer", title: "eget gravida cum sociis", publishedDate: "2021-05-18", endPublished: "2021-08-10"})
CREATE (jo8:JobOffer {description: "Ridiculus mus mauris vitae ultricies."})
CREATE (lo8:Location {id: 8, address: "2 Rue Saint-Didier", city: "Nevers", zipcode: 58000, latitude: 46.988408894671885, longitude: 3.155955468738543})
CREATE (u9:User {id: 9, username: "Maude Burt"})
CREATE (c9:Contact {id: 9, firstname: "Honor", lastname: "Quinn"})
CREATE (tc9:TerritorialContact {id: 9, firstname: "Axl", lastname: "Stewart", link: "https://xasltterwa.org"})
CREATE (co9:Company {id: 9, name: "Cipher Publishing"})
CREATE (o9:Offer {id: 9, type: "estate offer", title: "natoque penatibus", publishedDate: "2021-05-20", endPublished: "2021-08-17"})
CREATE (eo9:EstateOffer {description: "Non tellus orci ac auctor augue mauris augue neque."})
CREATE (lo9:Location {id: 9, address: "60 Rue de Nièvre", city: "Nevers", zipcode: 58000, latitude: 46.99012038693866, longitude: 3.1636086092232514})
CREATE (u10:User {id: 10, username: "Amy-Leigh Aldred"})
CREATE (c10:Contact {id: 10, firstname: "Josef", lastname: "Ewing"})
CREATE (tc10:TerritorialContact {id: 10, firstname: "Ellen", lastname: "Berry", link: "https://elernlrbey.org"})
CREATE (co10:Company {id: 10, name: "Eco Focus"})
CREATE (o10:Offer {id: 10, type: "takeover offer", title: "et magnis dis parturient montes", publishedDate: "2021-05-27", endPublished: "2021-09-10"})
CREATE (to10:TakeoverOffer {description: "Sed risus ultricies tristique nulla aliquet enim tortor."})
CREATE (lo10:Location {id: 10, address: "5 Rue Saint-Didier", city: "Nevers", zipcode: 58000, latitude: 46.98846461978366, longitude: 3.1564295533983597})
CREATE (o11:Offer {id: 11, type: "job offer", title: "nascetur ridiculus mus mauris", publishedDate: "2021-05-28", endPublished: "2021-09-14"})
CREATE (jo11:JobOffer {description: "Sed arcu non odio euismod lacinia."})
CREATE (lo11:Location {id: 11, address: "31 Avenue Colbert", city: "Nevers", zipcode: 58000, latitude: 46.99751804899956, longitude: 3.1571131417491647})
CREATE (o12:Offer {id: 12, type: "estate offer", title: "vitae ultricies leo integer malesuada", publishedDate: "2021-05-31", endPublished: "2021-09-15"})
CREATE (eo12:EstateOffer {description: "Orci eu lobortis elementum nibh tellus molestie nunc."})
CREATE (lo12:Location {id: 12, address: "27 Rue des Grands Jardins", city: "Nevers", zipcode: 58000, latitude: 46.99669613969092, longitude: 3.136766355244028})
CREATE (o13:Offer {id: 13, type: "takeover offer", title: "nunc vel risus commodo", publishedDate: "2021-06-04", endPublished: "2021-09-20"})
CREATE (to13:TakeoverOffer {description: "Dui id ornare arcu odio."})
CREATE (lo13:Location {id: 13, address: "3 Square de la Résistance", city: "Nevers", zipcode: 58000, latitude: 46.992343240636394, longitude: 3.160591355243829})
CREATE (o14:Offer {id: 14, type: "job offer", title: "viverra maecenas accumsan lacus", publishedDate: "2021-06-07", endPublished: "2021-09-30"})
CREATE (jo14:JobOffer {description: "Porttitor eget dolor morbi non arcu risus."})
CREATE (lo14:Location {id: 14, address: "11 Square de la Résistance", city: "Nevers", zipcode: 58000, latitude: 46.99197291498163, longitude: 3.160327826408791})
CREATE (o15:Offer {id: 15, type: "estate offer", title: "vel facilisis volutpat est velit", publishedDate: "2021-06-17", endPublished: "2021-10-11"})
CREATE (eo15:EstateOffer {description: "Duis ut diam quam nulla porttitor massa id."})
CREATE (lo15:Location {id: 15, address: "25 Quai de Mantoue", city: "Nevers", zipcode: 58000, latitude: 46.98560073592141, longitude: 3.15820304174869})
CREATE (o16:Offer {id: 16, type: "takeover offer", title: "egestas dui id ornare", publishedDate: "2021-06-21", endPublished: "2021-10-14"})
CREATE (to16:TakeoverOffer {description: "Varius quam quisque id diam."})
CREATE (lo16:Location {id: 16, address: "50 Avenue Général de Gaulle", city: "Nevers", zipcode: 58000, latitude: 46.98792207813667, longitude: 3.151402784078711})
CREATE (o17:Offer {id: 17, type: "job offer", title: "arcu odio ut sem", publishedDate: "2021-06-23", endPublished: "2021-10-19"})
CREATE (jo17:JobOffer {description: "Vulputate eu scelerisque felis imperdiet proin fermentum leo."})
CREATE (lo17:Location {id: 17, address: "18 Rue Georges Pielin", city: "Nevers", zipcode: 58000, latitude: 46.982982999776105, longitude: 3.1269296245630915})
CREATE (o18:Offer {id: 18, type: "estate offer", title: "nulla pharetra diam", publishedDate: "2021-06-24", endPublished: "2021-11-04"})
CREATE (eo18:EstateOffer {description: "Et tortor at risus viverra adipiscing at."})
CREATE (lo18:Location {id: 18, address: "4 Place Guy Coquille", city: "Nevers", zipcode: 58000, latitude: 46.99082004710196, longitude: 3.162575482233523})
CREATE (o19:Offer {id: 19, type: "takeover offer", title: "sit amet nisl", publishedDate: "2021-06-25", endPublished: "2021-11-11"})
CREATE (to19:TakeoverOffer {description: "Massa sapien faucibus et molestie ac."})
CREATE (lo19:Location {id: 19, address: "15 Rue Pierre Emile Gaspard", city: "Nevers", zipcode: 58000, latitude: 46.986243809641095, longitude: 3.150180228253858})
CREATE (o20:Offer {id: 20, type: "job offer", title: "suscipit adipiscing", publishedDate: "2021-07-13", endPublished: "2021-11-17"})
CREATE (jo20:JobOffer {description: "Ridiculus mus mauris vitae ultricies leo."})
CREATE (lo20:Location {id: 20, address: "26 Avenue Pierre Bérégovoy", city: "Nevers", zipcode: 58000, latitude: 46.98623649070845, longitude: 3.150137312913691})
CREATE (o21:Offer {id: 21, type: "estate offer", title: "dui vivamus arcu felis bibendum", publishedDate: "2021-07-14", endPublished: "2021-11-29"})
CREATE (eo21:EstateOffer {description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."})
CREATE (lo21:Location {id: 21, address: "20 Fermentum iaculis eu non diam phasellus vestibulum lorem sed.", city: "Saint-Hilaire-Fontaine", zipcode: 58300})
CREATE (o22:Offer {id: 22, type: "takeover offer", title: "ut tristique et egestas quis ipsum", publishedDate: "2021-07-15", endPublished: "2021-12-09"})
CREATE (to22:TakeoverOffer {description: "Ut diam quam nulla porttitor massa."})
CREATE (lo22:Location {id: 22, address: "63 Felis eget velit aliquet sagittis id consectetur purus ut.", city: "Bazoches", zipcode: 58190})
CREATE (o23:Offer {id: 23, type: "job offer", title: "suspendisse ultrices gravida", publishedDate: "2021-07-19", endPublished: "2021-12-13"})
CREATE (jo23:JobOffer {description: "Faucibus interdum posuere lorem ipsum dolor sit."})
CREATE (lo23:Location {id: 23, address: "22 Aenean et tortor at risus viverra adipiscing at in tellus.", city: "Fours", zipcode: 58250})
CREATE (o24:Offer {id: 24, type: "estate offer", title: "dictum fusce ut placerat", publishedDate: "2021-07-23", endPublished: "2021-12-14"})
CREATE (eo24:EstateOffer {description: "Eu lobortis elementum nibh tellus molestie nunc non."})
CREATE (lo24:Location {id: 24, address: "46 Aliquam eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis.", city: "Saint-Parize-en-Viry", zipcode: 58300})
CREATE (o25:Offer {id: 25, type: "takeover offer", title: "orci nulla pellentesque", publishedDate: "2021-07-28", endPublished: "2021-12-21"})
CREATE (to25:TakeoverOffer {description: "Eu lobortis elementum nibh tellus molestie nunc non blandit massa."})
CREATE (lo25:Location {id: 25, address: "96 Dolor sit amet consectetur adipiscing elit.", city: "Arthel", zipcode: 58700})
CREATE (o26:Offer {id: 26, type: "job offer", title: "dignissim enim sit amet venenatis", publishedDate: "2021-08-02", endPublished: "2021-12-02"})
CREATE (jo26:JobOffer {description: "Dignissim sodales ut eu sem integer vitae justo eget."})
CREATE (lo26:Location {id: 26, address: "25 At augue eget arcu dictum varius.", city: "Lanty", zipcode: 58250})
CREATE (o27:Offer {id: 27, type: "estate offer", title: "urna cursus eget nunc viverra adipiscing at in tellus", publishedDate: "2021-08-04", endPublished: "2021-12-06"})
CREATE (eo27:EstateOffer {description: "Neque ornare aenean euismod elementum nisi."})
CREATE (lo27:Location {id: 27, address: "78 Nec dui nunc mattis enim ut tellus elementum sagittis vitae.", city: "Montigny-aux-Amognes", zipcode: 58130})
CREATE (o28:Offer {id: 28, type: "takeover offer", title: "integer feugiat scelerisque varius morbi", publishedDate: "2021-08-16", endPublished: "2021-12-15"})
CREATE (to28:TakeoverOffer {description: "Pretium fusce id velit ut tortor pretium viverra suspendisse."})
CREATE (lo28:Location {id: 28, address: "27 Morbi tempus iaculis urna id volutpat lacus laoreet non.", city: "Guipy", zipcode: 58420})
CREATE (o29:Offer {id: 29, type: "job offer", title: "enim nunc faucibus a pellentesque sit amet porttitor eget dolor", publishedDate: "2021-08-23", endPublished: "2021-12-17"})
CREATE (jo29:JobOffer {description: "Diam phasellus vestibulum lorem sed risus."})
CREATE (lo29:Location {id: 29, address: "84 At risus viverra adipiscing at in tellus integer feugiat.", city: "Dornecy", zipcode: 58530})
CREATE (o30:Offer {id: 30, type: "estate offer", title: "morbi non arcu risus quis varius quam quisque id diam", publishedDate: "2021-09-07", endPublished: "2021-12-23"})
CREATE (eo30:EstateOffer {description: "Consequat semper viverra nam libero justo laoreet sit amet cursus."})
CREATE (lo30:Location {id: 30, address: "87 Tristique nulla aliquet enim tortor at auctor urna nunc.", city: "Rouy", zipcode: 58110})
CREATE (o1)<-[:PUBLISHED_BY]-(u1),
       (c1)<-[:REFERS_TO]-(o1)-[:REFERS_TO]->(tc1),
       (o1)-[:IS_TYPE_TAKEOVER]->(to1),
       (to1)-[:IS_LOCATED]->(lo1),
       (o2)<-[:PUBLISHED_BY]-(u7),
       (c7)<-[:REFERS_TO]-(o2)-[:REFERS_TO]->(tc7),
       (o2)-[:IS_TYPE_JOB]->(jo2),
       (jo2)-[:BELONGS_TO]->(co7),
       (co7)-[:IS_LOCATED]->(lo2),
       (o3)<-[:PUBLISHED_BY]-(u2),
       (c2)<-[:REFERS_TO]-(o3)-[:REFERS_TO]->(tc2),
       (o3)-[:IS_TYPE_ESTATE]->(eo3),
       (eo3)-[:IS_LOCATED]->(lo3),
       (o4)<-[:PUBLISHED_BY]-(u8),
       (c8)<-[:REFERS_TO]-(o4)-[:REFERS_TO]->(tc8),
       (o4)-[:IS_TYPE_TAKEOVER]->(to4),
       (to4)-[:IS_LOCATED]->(lo4),
       (o5)<-[:PUBLISHED_BY]-(u8),
       (c8)<-[:REFERS_TO]-(o5)-[:REFERS_TO]->(tc8),
       (o5)-[:IS_TYPE_JOB]->(jo5),
       (jo5)-[:BELONGS_TO]->(co8),
       (co8)-[:IS_LOCATED]->(lo5),
       (o6)<-[:PUBLISHED_BY]-(u2),
       (c2)<-[:REFERS_TO]-(o6)-[:REFERS_TO]->(tc2),
       (o6)-[:IS_TYPE_ESTATE]->(eo6),
       (eo6)-[:IS_LOCATED]->(lo6),
       (o7)<-[:PUBLISHED_BY]-(u9),
       (c9)<-[:REFERS_TO]-(o7)-[:REFERS_TO]->(tc9),
       (o7)-[:IS_TYPE_TAKEOVER]->(to7),
       (to7)-[:IS_LOCATED]->(lo7),
       (o8)<-[:PUBLISHED_BY]-(u2),
       (c2)<-[:REFERS_TO]-(o8)-[:REFERS_TO]->(tc2),
       (o8)-[:IS_TYPE_JOB]->(jo8),
       (jo8)-[:BELONGS_TO]->(co2),
       (co2)-[:IS_LOCATED]->(lo8),
       (o9)<-[:PUBLISHED_BY]-(u8),
       (c8)<-[:REFERS_TO]-(o9)-[:REFERS_TO]->(tc8),
       (o9)-[:IS_TYPE_ESTATE]->(eo9),
       (eo9)-[:IS_LOCATED]->(lo9),
       (o10)<-[:PUBLISHED_BY]-(u3),
       (c3)<-[:REFERS_TO]-(o10)-[:REFERS_TO]->(tc3),
       (o10)-[:IS_TYPE_TAKEOVER]->(to10),
       (to10)-[:IS_LOCATED]->(lo10),
       (o11)<-[:PUBLISHED_BY]-(u9),
       (c9)<-[:REFERS_TO]-(o11)-[:REFERS_TO]->(tc9),
       (o11)-[:IS_TYPE_JOB]->(jo11),
       (jo11)-[:BELONGS_TO]->(co9),
       (co9)-[:IS_LOCATED]->(lo11),
       (o12)<-[:PUBLISHED_BY]-(u5),
       (c5)<-[:REFERS_TO]-(o12)-[:REFERS_TO]->(tc5),
       (o12)-[:IS_TYPE_ESTATE]->(eo12),
       (eo12)-[:IS_LOCATED]->(lo12),
       (o13)<-[:PUBLISHED_BY]-(u3),
       (c3)<-[:REFERS_TO]-(o13)-[:REFERS_TO]->(tc3),
       (o13)-[:IS_TYPE_TAKEOVER]->(to13),
       (to13)-[:IS_LOCATED]->(lo13),
       (o14)<-[:PUBLISHED_BY]-(u5),
       (c5)<-[:REFERS_TO]-(o14)-[:REFERS_TO]->(tc5),
       (o14)-[:IS_TYPE_JOB]->(jo14),
       (jo14)-[:BELONGS_TO]->(co5),
       (co5)-[:IS_LOCATED]->(lo14),
       (o15)<-[:PUBLISHED_BY]-(u8),
       (c8)<-[:REFERS_TO]-(o15)-[:REFERS_TO]->(tc8),
       (o15)-[:IS_TYPE_ESTATE]->(eo15),
       (eo15)-[:IS_LOCATED]->(lo15),
       (o16)<-[:PUBLISHED_BY]-(u6),
       (c6)<-[:REFERS_TO]-(o16)-[:REFERS_TO]->(tc6),
       (o16)-[:IS_TYPE_TAKEOVER]->(to16),
       (to16)-[:IS_LOCATED]->(lo16),
       (o17)<-[:PUBLISHED_BY]-(u3),
       (c3)<-[:REFERS_TO]-(o17)-[:REFERS_TO]->(tc3),
       (o17)-[:IS_TYPE_JOB]->(jo17),
       (jo17)-[:BELONGS_TO]->(co3),
       (co3)-[:IS_LOCATED]->(lo17),
       (o18)<-[:PUBLISHED_BY]-(u7),
       (c7)<-[:REFERS_TO]-(o18)-[:REFERS_TO]->(tc7),
       (o18)-[:IS_TYPE_ESTATE]->(eo18),
       (eo18)-[:IS_LOCATED]->(lo18),
       (o19)<-[:PUBLISHED_BY]-(u1),
       (c1)<-[:REFERS_TO]-(o19)-[:REFERS_TO]->(tc1),
       (o19)-[:IS_TYPE_TAKEOVER]->(to19),
       (to19)-[:IS_LOCATED]->(lo19),
       (o20)<-[:PUBLISHED_BY]-(u2),
       (c2)<-[:REFERS_TO]-(o20)-[:REFERS_TO]->(tc2),
       (o20)-[:IS_TYPE_JOB]->(jo20),
       (jo20)-[:BELONGS_TO]->(co2),
       (co2)-[:IS_LOCATED]->(lo20),
       (o21)<-[:PUBLISHED_BY]-(u2),
       (c2)<-[:REFERS_TO]-(o21)-[:REFERS_TO]->(tc2),
       (o21)-[:IS_TYPE_ESTATE]->(eo21),
       (eo21)-[:IS_LOCATED]->(lo21),
       (o22)<-[:PUBLISHED_BY]-(u9),
       (c9)<-[:REFERS_TO]-(o22)-[:REFERS_TO]->(tc9),
       (o22)-[:IS_TYPE_TAKEOVER]->(to22),
       (to22)-[:IS_LOCATED]->(lo22),
       (o23)<-[:PUBLISHED_BY]-(u8),
       (c8)<-[:REFERS_TO]-(o23)-[:REFERS_TO]->(tc8),
       (o23)-[:IS_TYPE_JOB]->(jo23),
       (jo23)-[:BELONGS_TO]->(co8),
       (co8)-[:IS_LOCATED]->(lo23),
       (o24)<-[:PUBLISHED_BY]-(u5),
       (c5)<-[:REFERS_TO]-(o24)-[:REFERS_TO]->(tc5),
       (o24)-[:IS_TYPE_ESTATE]->(eo24),
       (eo24)-[:IS_LOCATED]->(lo24),
       (o25)<-[:PUBLISHED_BY]-(u9),
       (c9)<-[:REFERS_TO]-(o25)-[:REFERS_TO]->(tc9),
       (o25)-[:IS_TYPE_TAKEOVER]->(to25),
       (to25)-[:IS_LOCATED]->(lo25),
       (o26)<-[:PUBLISHED_BY]-(u1),
       (c1)<-[:REFERS_TO]-(o26)-[:REFERS_TO]->(tc1),
       (o26)-[:IS_TYPE_JOB]->(jo26),
       (jo26)-[:BELONGS_TO]->(co1),
       (co1)-[:IS_LOCATED]->(lo26),
       (o27)<-[:PUBLISHED_BY]-(u7),
       (c7)<-[:REFERS_TO]-(o27)-[:REFERS_TO]->(tc7),
       (o27)-[:IS_TYPE_ESTATE]->(eo27),
       (eo27)-[:IS_LOCATED]->(lo27),
       (o28)<-[:PUBLISHED_BY]-(u9),
       (c9)<-[:REFERS_TO]-(o28)-[:REFERS_TO]->(tc9),
       (o28)-[:IS_TYPE_TAKEOVER]->(to28),
       (to28)-[:IS_LOCATED]->(lo28),
       (o29)<-[:PUBLISHED_BY]-(u3),
       (c3)<-[:REFERS_TO]-(o29)-[:REFERS_TO]->(tc3),
       (o29)-[:IS_TYPE_JOB]->(jo29),
       (jo29)-[:BELONGS_TO]->(co3),
       (co3)-[:IS_LOCATED]->(lo29),
       (o30)<-[:PUBLISHED_BY]-(u4),
       (c4)<-[:REFERS_TO]-(o30)-[:REFERS_TO]->(tc4),
       (o30)-[:IS_TYPE_ESTATE]->(eo30),
       (eo30)-[:IS_LOCATED]->(lo30);