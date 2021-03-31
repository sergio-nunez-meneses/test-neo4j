import random
import os
import uuid
from datetime import datetime

usernames = [
    'Amy-Leigh Aldred', 'Caroline Roberson', 'Leja Lancaster', 'Esmai Dillon', 'Rex Banks', 'Rehan Juarez',
    'Arla Werner', 'Hendrix Potts', 'Maude Burt', 'Finlay Joyner'
]
contact_firstnames = [
    'Josef', 'Rianne', 'Fredrick', 'Suman', 'Roseanna', 'Duane', 'Rosa', 'Jorja', 'Honor', 'Nayan'
]
contact_lastnames = [
    'Ewing', 'Crane', 'Blevins', 'Halliday', 'Flores', 'Milne', 'Beck', 'Sanchez', 'Quinn', 'Salazar'
]
territorial_firstnames = [
    'Ellen', 'Amayah', 'Hugo', 'Zakariah', 'Anna-Marie', 'Kaydon', 'Ellena', 'Luke', 'Axl', 'Mea'
]
territorial_lastnames = [
    'Berry', 'Butt', 'Harmon', 'Santos', 'Nairn', 'Cortez', 'Figueroa', 'Dickens', 'Stewart', 'Green'
]
offer_types = [
    'takeover offer', 'job offer', 'estate offer'
]
offer_titles = [
    'ut tellus elementum',
    'sagittis vitae et leo duis ut',
    'diam quam nulla porttitor massa',
    'id neque aliquam vestibulum morbi',
    'blandit cursus risus',
    'at ultrices mi tempus imperdiet',
    'nulla malesuada pellentesque elit',
    'eget gravida cum sociis',
    'natoque penatibus',
    'et magnis dis parturient montes',
    'nascetur ridiculus mus mauris',
    'vitae ultricies leo integer malesuada',
    'nunc vel risus commodo',
    'viverra maecenas accumsan lacus',
    'vel facilisis volutpat est velit',
    'egestas dui id ornare',
    'arcu odio ut sem',
    'nulla pharetra diam',
    'sit amet nisl',
    'suscipit adipiscing',
    'dui vivamus arcu felis bibendum',
    'ut tristique et egestas quis ipsum',
    'suspendisse ultrices gravida',
    'dictum fusce ut placerat',
    'orci nulla pellentesque',
    'dignissim enim sit amet venenatis',
    'urna cursus eget nunc viverra adipiscing at in tellus',
    'integer feugiat scelerisque varius morbi',
    'enim nunc faucibus a pellentesque sit amet porttitor eget dolor',
    'morbi non arcu risus quis varius quam quisque id diam'
]
offer_descriptions = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Et malesuada fames ac turpis egestas maecenas.',
    'Vitae aliquet nec ullamcorper sit amet risus.',
    'In dictum non consectetur a erat.',
    'Est ultricies integer quis auctor elit.',
    'Dui id ornare arcu odio ut sem nulla pharetra diam.',
    'Sit amet justo donec enim diam vulputate ut pharetra sit.',
    'Ridiculus mus mauris vitae ultricies.',
    'Non tellus orci ac auctor augue mauris augue neque.',
    'Sed risus ultricies tristique nulla aliquet enim tortor.',
    'Sed arcu non odio euismod lacinia.',
    'Orci eu lobortis elementum nibh tellus molestie nunc.',
    'Dui id ornare arcu odio.',
    'Porttitor eget dolor morbi non arcu risus.',
    'Duis ut diam quam nulla porttitor massa id.',
    'Varius quam quisque id diam.',
    'Vulputate eu scelerisque felis imperdiet proin fermentum leo.',
    'Et tortor at risus viverra adipiscing at.',
    'Massa sapien faucibus et molestie ac.',
    'Ridiculus mus mauris vitae ultricies leo.',
    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Ut diam quam nulla porttitor massa.',
    'Faucibus interdum posuere lorem ipsum dolor sit.',
    'Eu lobortis elementum nibh tellus molestie nunc non.',
    'Eu lobortis elementum nibh tellus molestie nunc non blandit massa.',
    'Dignissim sodales ut eu sem integer vitae justo eget.',
    'Neque ornare aenean euismod elementum nisi.',
    'Pretium fusce id velit ut tortor pretium viverra suspendisse.',
    'Diam phasellus vestibulum lorem sed risus.',
    'Consequat semper viverra nam libero justo laoreet sit amet cursus.'
]
published_date = [
    '2021-03-25', '2021-03-29', '2021-03-30', '2021-03-31', '2021-04-01', '2021-04-14', '2021-04-22', '2021-05-10',
    '2021-05-17', '2021-05-28', '2021-05-31', '2021-06-09', '2021-06-10', '2021-06-15', '2021-07-13', '2021-07-14',
    '2021-08-02', '2021-08-03', '2021-09-16', '2021-09-17', '2021-10-13', '2021-10-15', '2021-10-27', '2021-10-28',
    '2021-11-02', '2021-11-08', '2021-11-19', '2021-12-02', '2021-12-03', '2021-12-31'
]
end_published = [
    '2022-01-03', '2022-01-04', '2022-01-10', '2022-01-11', '2022-01-13', '2022-02-16', '2022-02-21', '2022-02-24',
    '2022-03-17', '2022-03-18', '2022-04-07', '2022-04-29', '2022-05-09', '2022-05-30', '2022-06-02', '2022-06-17',
    '2022-06-30', '2022-07-25', '2022-08-18', '2022-08-22', '2022-08-26', '2022-08-31', '2022-09-02', '2022-09-13',
    '2022-09-20', '2022-10-07', '2022-10-13', '2022-10-21', '2022-11-22', '2022-12-07'
]
addresses = [
    'Libero nunc consequat interdum varius sit amet mattis vulputate enim.',
    'Vestibulum lectus mauris ultrices eros in cursus turpis massa.',
    'Vitae nunc sed velit dignissim sodales.',
    'Semper feugiat nibh sed pulvinar proin gravida.',
    'Neque sodales ut etiam sit amet nisl purus in.',
    'Vitae et leo duis ut diam quam.',
    'Sit amet consectetur adipiscing elit duis tristique.',
    'Enim ut sem viverra aliquet eget sit.',
    'Amet aliquam id diam maecenas ultricies mi eget.',
    'Enim lobortis scelerisque fermentum dui faucibus.',
    'Fringilla urna porttitor rhoncus dolor purus non enim.',
    'Semper risus in hendrerit gravida rutrum quisque non.',
    'Diam phasellus vestibulum lorem sed risus.',
    'Viverra nam libero justo laoreet sit amet.',
    'Sapien pellentesque habitant morbi tristique senectus et netus.',
    'Nisi est sit amet facilisis magna etiam tempor.',
    'Senectus et netus et malesuada fames ac.',
    'Arcu felis bibendum ut tristique et egestas quis.',
    'Adipiscing elit ut aliquam purus sit amet.',
    'Porttitor rhoncus dolor purus non enim praesent elementum facilisis.',
    'Fermentum iaculis eu non diam phasellus vestibulum lorem sed.',
    'Felis eget velit aliquet sagittis id consectetur purus ut.',
    'Aenean et tortor at risus viverra adipiscing at in tellus.',
    'Aliquam eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis.',
    'Dolor sit amet consectetur adipiscing elit.',
    'At augue eget arcu dictum varius.',
    'Nec dui nunc mattis enim ut tellus elementum sagittis vitae.',
    'Morbi tempus iaculis urna id volutpat lacus laoreet non.',
    'At risus viverra adipiscing at in tellus integer feugiat.',
    'Tristique nulla aliquet enim tortor at auctor urna nunc.'
]
company_names = [
    'Eco Focus', 'Innovation Arch', 'Strat Security', 'Cogent Data', 'Epic Adventure Inc', 'Vortex Solar',
    'Admire Arts', 'Bonefete Fun', 'Cipher Publishing', 'Lambent Illumination'
]
cities = [
    'Achun', 'Alligny-Cosne', 'Alligny-en-Morvan', 'Alluy', 'Amazy', 'Anlezy', 'Annay', 'Anthien', 'Arbourse',
    'Arleuf','Armes', 'Arquian', 'Arthel', 'Arzembouy', 'Asnan', 'Asnois', 'Aunay-en-Bazois', 'Authiou',
    'Avrée', 'Avril-sur-Loire', 'Azy-le-Vif', 'Bazoches', 'Bazolles', 'Béard', 'Beaulieu', 'Beaumont-la-Ferrière',
    'Beaumont-Sardolles', 'Beuvron', 'Biches', 'Billy-Chevannes', 'Billy-sur-Oisy', 'Bitry', 'Blismes', 'Bona',
    'Bouhy', 'Brassy', 'Breugnon', 'Brèves', 'Brinay', 'Brinon-sur-Beuvron', 'Bulcy', 'Bussy-la-Pesle', 'Cercy-la-Tour',
    'Cervon', 'Cessy-les-Bois', 'Chalaux', 'Challement', 'Challuy', 'Champallement', 'Champlemy', 'Champlin',
    'Champvert', 'Champvoux', 'Chantenay-Saint-Imbert', 'Charrin', 'Chasnay', 'Château-Chinon Campagne',
    'Château-Chinon Ville', 'Châteauneuf-Val-de-Bargis', 'Châtillon-en-Bazois', 'Châtin', 'Chaulgnes', 'Chaumard',
    'Chaumot', 'Chazeuil', 'Chevannes-Changy', 'Chevenon', 'Chevroches', 'Chiddes', 'Chitry-les-Mines', 'Chougny',
    'Ciez', 'Cizely', 'Clamecy', 'Colméry', 'Corancy', 'Corbigny', "Corvol-d'Embernard", "Corvol-l'Orgueilleux",
    'Cosne-Cours-sur-Loire', 'Cossaye', 'Coulanges-lès-Nevers', 'Couloutre', 'Courcelles', 'Crux-la-Ville',
    'Cuncy-lès-Varzy', 'Dampierre-sous-Bouhy', 'Decize', 'Devay', 'Diennes-Aubigny', 'Dirol', 'Dommartin',
    'Dompierre-sur-Nièvre', 'Donzy', 'Dornecy', 'Dornes', 'Druy-Parigny', 'Dun-les-Places', 'Dun-sur-Grandry',
    'Empury', 'Entrains-sur-Nohain', 'Epiry', 'Fâchin', 'Fertrève', 'Fléty', 'Fleury-sur-Loire', 'Flez-Cuzy',
    'Fourchambault', 'Fours', 'Frasnay-Reugny', 'Gâcogne', 'Garchizy', 'Garchy', 'Germenay', 'Germigny-sur-Loire',
    'Gien-sur-Cure', 'Gimouille', 'Giry', 'Glux-en-Glenne', 'Gouloux', 'Grenois', 'Guérigny', 'Guipy', 'Héry', 'Imphy',
    'Isenay', 'Jailly', 'La Celle-sur-Loire', 'La Celle-sur-Nièvre', 'La Chapelle-Saint-André', 'La Charité-sur-Loire',
    'La Collancelle', 'La Fermeté', 'La Machine', 'La Maison-Dieu', 'La Marche', 'La Nocle-Maulaix',
    'Lamenay-sur-Loire', 'Langeron', 'Lanty', 'Larochemillay', 'Lavault-de-Frétoy', 'Limanton', 'Limon', 'Livry',
    'Lormes', 'Lucenay-lès-Aix', 'Lurcy-le-Bourg', 'Luthenay-Uxeloup', 'Luzy', 'Lys', 'Magny-Cours', 'Magny-Lormes',
    'Marcy', "Marigny-l'Église", 'Marigny-sur-Yonne', 'Mars-sur-Allier', 'Marzy', 'Maux', 'Menestreau', 'Menou',
    'Mesves-sur-Loire', 'Metz-le-Comte', 'Mhère', 'Millay', 'Moissy-Moulinot', 'Monceaux-le-Comte', 'Mont-et-Marré',
    'Montambert', 'Montapas', 'Montaron', 'Montenoison', 'Montigny-aux-Amognes', 'Montigny-en-Morvan',
    'Montigny-sur-Canne', 'Montreuillon', 'Montsauche-les-Settons', 'Moraches', 'Moulins-Engilbert', 'Mouron-sur-Yonne',
    'Moussy', 'Moux-en-Morvan', 'Murlin', 'Myennes', 'Nannay', 'Narcy', 'Neuffontaines', 'Neuilly',
    'Neuville-lès-Decize', 'Neuvy-sur-Loire', 'Nevers', 'Nolay', 'Nuars', 'Oisy', 'Onlay', 'Ouagne', 'Oudan', 'Ougny',
    'Oulon', 'Ouroux-en-Morvan', 'Parigny-la-Rose', 'Parigny-les-Vaux', 'Pazy', 'Perroy', 'Planchez', 'Poil', 'Poiseux',
    'Pougny', 'Pougues-les-Eaux', 'Pouilly-sur-Loire', 'Pouques-Lormes', 'Pousseaux', 'Prémery', 'Préporché', 'Raveau',
    'Rémilly', 'Rix', 'Rouy', 'Ruages', 'Saincaize-Meauce', 'Saint-Agnan', 'Saint-Amand-en-Puisaye', 'Saint-Andelain',
    'Saint-André-en-Morvan', 'Saint-Aubin-des-Chaumes', 'Saint-Aubin-les-Forges', "Saint-Benin-d'Azy",
    'Saint-Benin-des-Bois', 'Saint-Bonnot', 'Saint-Brisson', 'Saint-Didier', 'Saint-Éloi', 'Saint-Firmin',
    'Saint-Franchy', 'Saint-Germain-Chassenay', 'Saint-Germain-des-Bois', 'Saint-Gratien-Savigny',
    'Saint-Hilaire-en-Morvan', 'Saint-Hilaire-Fontaine', 'Saint-Honoré-les-Bains', 'Saint-Jean-aux-Amognes',
    "Saint-Laurent-l'Abbaye", 'Saint-Léger-de-Fougeret', 'Saint-Léger-des-Vignes', 'Saint-Loup',
    'Saint-Malo-en-Donziois', "Saint-Martin-d'Heuille", 'Saint-Martin-du-Puy', 'Saint-Martin-sur-Nohain',
    'Saint-Maurice', 'Saint-Ouen-sur-Loire', 'Saint-Parize-en-Viry', 'Saint-Parize-le-Châtel', 'Saint-Père',
    'Saint-Péreuse', 'Saint-Pierre-du-Mont', 'Saint-Pierre-le-Moûtier', 'Saint-Quentin-sur-Nohain', 'Saint-Révérien',
    'Saint-Saulge', 'Saint-Seine', 'Saint-Sulpice', 'Saint-Vérain', 'Sainte-Colombe-des-Bois', 'Sainte-Marie', 'Saizy',
    'Sardy-lès-Épiry', 'Sauvigny-les-Bois', 'Savigny-Poil-Fol', 'Saxi-Bourdon', 'Sémelay', 'Sermages',
    'Sermoise-sur-Loire', 'Sichamps', 'Sougy-sur-Loire', 'Suilly-la-Tour', 'Surgy', 'Taconnay', 'Talon',
    'Tamnay-en-Bazois', 'Tannay', 'Tazilly', 'Teigny', 'Ternant', 'Thaix', 'Thianges', 'Tintury', 'Toury-Lurcy',
    'Toury-sur-Jour', 'Tracy-sur-Loire', 'Tresnay', 'Trois-Vèvres', 'Tronsanges', "Trucy-l'Orgueilleux", 'Urzy',
    'Vandenesse', 'Varennes-lès-Narcy', 'Varennes-Vauzelles', 'Varzy', 'Vauclaix', "Vaux d'Amognes", 'Verneuil',
    'Vielmanay', 'Vignol', 'Villapourçon', 'Ville-Langy', 'Villiers-le-Sec', 'Villiers-sur-Yonne', 'Vitry-Laché'
]
zip_codes = [
    58110, 58200, 58230, 58110, 58190, 58270, 58450, 58800, 58350, 58430, 58500, 58310, 58700, 58700, 58420, 58190,
    58110, 58700, 58170, 58300, 58240, 58190, 58110, 58160, 58420, 58700, 58270, 58210, 58110, 58270, 58500, 58310,
    58120, 58330, 58310, 58140, 58460, 58530, 58110, 58420, 58400, 58420, 58340, 58800, 58220, 58140, 58420, 58000,
    58420, 58210, 58700, 58300, 58400, 58240, 58300, 58350, 58120, 58120, 58350, 58110, 58120, 58400, 58120, 58800,
    58700, 58420, 58160, 58500, 58170, 58800, 58110, 58220, 58270, 58500, 58350, 58120, 58800, 58210, 58460, 58200,
    58300, 58660, 58220, 58210, 58330, 58210, 58310, 58300, 58300, 58340, 58190, 58120, 58350, 58220, 58530, 58390,
    58160, 58230, 58110, 58140, 58410, 58800, 58430, 58270, 58170, 58240, 58190, 58600, 58250, 58270, 58140, 58600,
    58150, 58800, 58320, 58230, 58470, 58700, 58370, 58230, 58420, 58130, 58420, 58800, 58160, 58290, 58330, 58440,
    58700, 58210, 58400, 58800, 58160, 58260, 58190, 58400, 58250, 58300, 58240, 58250, 58370, 58230, 58290, 58270,
    58240, 58140, 58380, 58700, 58240, 58170, 58190, 58470, 58800, 58210, 58140, 58800, 58240, 58180, 58290, 58410,
    58210, 58400, 58190, 58140, 58170, 58190, 58190, 58110, 58250, 58110, 58250, 58700, 58130, 58120, 58340, 58800,
    58230, 58420, 58290, 58800, 58700, 58230, 58700, 58440, 58350, 58400, 58190, 58420, 58300, 58450, 58000, 58700,
    58190, 58500, 58370, 58500, 58210, 58110, 58700, 58230, 58210, 58320, 58800, 58220, 58230, 58170, 58130, 58200,
    58320, 58150, 58140, 58500, 58700, 58360, 58400, 58250, 58500, 58110, 58190, 58470, 58230, 58310, 58150, 58140,
    58190, 58130, 58270, 58330, 58700, 58230, 58190, 58000, 58270, 58330, 58300, 58210, 58340, 58120, 58300, 58360,
    58270, 58150, 58120, 58300, 58200, 58350, 58130, 58140, 58150, 58330, 58160, 58300, 58490, 58200, 58110, 58210,
    58240, 58150, 58420, 58330, 58250, 58270, 58310, 58220, 58330, 58190, 58800, 58160, 58170, 58330, 58360, 58290,
    58000, 58700, 58300, 58150, 58500, 58420, 58190, 58110, 58190, 58170, 58190, 58250, 58250, 58260, 58110, 58300,
    58240, 58150, 58240, 58260, 58400, 58460, 58130, 58290, 58400, 58640, 58210, 58140, 58130, 58300, 58150, 58190,
    58370, 58270, 58210, 58500, 58420
]
# widen variables scope
create_nodes = []
create_relationships = []

# create file content
for i in range(0, len(offer_titles)):
    # initialize node and relationship variables
    u_cypher = c_cypher = tc_cypher = co_cypher = to_cypher = jo_cypher = eo_cypher = ''
    u_rel_o = o_rel_ctc = o_rel_to = o_rel_jo = o_rel_eo = to_rel_lo = eo_rel_lo = jo_rel_co = co_rel_lo = ''

    # index for all nodes and properties
    str_id = str(i + 1)
    # index for users, contacts and territorial contacts
    new_i = i % 9
    random_new_i = str(random.randrange(1, 10))
    # index for offer types
    type_new_i = i % 3

    # users
    username = usernames[new_i]
    # contacts
    contact_firstname = contact_firstnames[new_i]
    contact_lastname = contact_lastnames[new_i]
    # territorial contacts
    territorial_firstname = territorial_firstnames[new_i]
    territorial_lastname = territorial_lastnames[new_i]
    territorial_fullname = territorial_firstname + territorial_lastname
    link = ''.join(random.sample(territorial_fullname, len(territorial_fullname))).lower()
    # companies
    company_name = company_names[new_i]
    # offers
    offer_type = offer_types[type_new_i]
    # locations
    random_index = random.randrange(0, len(cities))
    location_address = str(i * random.randrange(1, 5)) + ' ' + addresses[i]
    location_city = cities[random_index]
    location_zip_code = zip_codes[random_index]

    if i < 10:
        # set user properties
        u_node = 'u' + str_id + ':User'
        u_id = ' {id: ' + str_id + ', '
        u_username = 'username: "' + username + '"}'
        # set contact properties
        c_node = 'c' + str_id + ':Contact'
        c_id = ' {id: ' + str_id + ', '
        c_fullname = 'firstname: "' + contact_firstname + '", lastname: "' + contact_lastname + '"}'
        # set territorial contact properties
        tc_node = 'tc' + str_id + ':TerritorialContact'
        tc_id = ' {id: ' + str_id + ', '
        tc_fullname = 'firstname: "' + territorial_firstname + '", lastname: "' + territorial_lastname + '", '
        tc_link = 'link: "https://' + link + '.org"}'
        # set company properties
        co_node = 'co' + str_id + ':Company'
        co_id = ' {id: ' + str_id + ', '
        co_name = 'name: "' + company_name + '"}'

        # create user, contact, territorial contact, and company nodes
        u_cypher += 'CREATE (' + u_node + u_id + u_username + ')\n'
        c_cypher += 'CREATE (' + c_node + c_id + c_fullname + ')\n'
        tc_cypher += 'CREATE (' + tc_node + tc_id + tc_fullname + tc_link + ')\n'
        co_cypher += 'CREATE (' + co_node + co_id + co_name + ')\n'

    # set offer properties
    o_node = 'o' + str_id + ':Offer'
    o_id = ' {id: ' + str_id + ', '
    o_type = 'type: "' + offer_type + '", '
    o_title = 'title: "' + offer_titles[i] + '", '
    o_dates = 'publishedDate: "' + published_date[i] + '", endPublished: "' + end_published[i] + '"}'
    # set location properties
    lo_node = 'lo' + str_id + ':Location'
    lo_id = ' {id: ' + str_id + ', '
    lo_address = 'address: "' + location_address + '", '
    lo_city = 'city: "' + location_city + '", '
    # lo_zip_code = 'zipcode: "' + str(location_zip_code) + '"}'
    lo_zip_code = 'zipcode: {0}}}'.format(location_zip_code)

    # create offer and location nodes
    o_cypher = 'CREATE (' + o_node + o_id + o_type + o_title + o_dates + ')\n'
    lo_cypher = 'CREATE (' + lo_node + lo_id + lo_address + lo_city + lo_zip_code + ')\n'
    # create offer relationships
    u_rel_o = '(o' + str_id + ')<-[:PUBLISHED_BY]-(u' + random_new_i + '),\n'
    o_rel_ctc = '(c' + random_new_i + ')<-[:REFERS_TO]-(o' + str_id + ')-[:REFERS_TO]->(tc' + random_new_i + '),\n'

    # create takeover, job, and estate offer nodes and relationships
    if type_new_i == 0:
        to_node = 'to' + str_id + ':TakeoverOffer'
        to_description = ' {description: "' + offer_descriptions[i] + '"}'
        to_cypher = 'CREATE (' + to_node + to_description + ')\n'
        o_rel_to = '(o' + str_id + ')-[:IS_TYPE_TAKEOVER]->(to' + str_id + '),\n'
        to_rel_lo = '(to' + str_id + ')-[:IS_LOCATED]->(lo' + str_id + '),\n'
    elif type_new_i == 1:
        jo_node = 'jo' + str_id + ':JobOffer'
        jo_description = ' {description: "' + offer_descriptions[i] + '"}'
        jo_cypher = 'CREATE (' + jo_node + jo_description + ')\n'
        o_rel_jo = '(o' + str_id + ')-[:IS_TYPE_JOB]->(jo' + str_id + '),\n'
        jo_rel_co = '(jo' + str_id + ')-[:BELONGS_TO]->(co' + random_new_i + '),\n'
        co_rel_lo = '(co' + random_new_i + ')-[:IS_LOCATED]->(lo' + str_id + '),\n'
    elif type_new_i == 2:
        eo_node = 'eo' + str_id + ':EstateOffer'
        eo_description = ' {description: "' + offer_descriptions[i] + '"}'
        eo_cypher = 'CREATE (' + eo_node + eo_description + ')\n'
        o_rel_eo = '(o' + str_id + ')-[:IS_TYPE_ESTATE]->(eo' + str_id + '),\n'
        eo_rel_lo = '(eo' + str_id + ')-[:IS_LOCATED]->(lo' + str_id + '),\n'

    # store nodes and relationships
    create_nodes.extend([
        u_cypher, c_cypher, tc_cypher, co_cypher, o_cypher, to_cypher, jo_cypher, eo_cypher, lo_cypher
    ])
    create_relationships.extend([
        u_rel_o, o_rel_ctc, o_rel_to, to_rel_lo, o_rel_jo, jo_rel_co, co_rel_lo, o_rel_eo, eo_rel_lo
    ])

    # remove empty items
    while '' in create_relationships:
        create_relationships.remove('')

# format file content
drop_nodes = 'MATCH (n)\nDETACH DELETE n;\n'
nodes = drop_nodes + ''.join(create_nodes)
relationships = 'CREATE ' + '   '.join(create_relationships)[:-2] + ';'

# create folder
path = os.getcwd() + '/load_graph'

if not os.path.exists(path):
    os.mkdir(path)

os.chdir(path)

# save cypher file
filename = str(datetime.today().strftime('%Y%m%dT%H%M%S')) + '_' + str(uuid.uuid4()).replace('-', '') + '.cypher'
f = open(filename, 'w+')
f.write(nodes)
f.write(relationships)
f.close()

if os.path.isfile(filename):
    print('File created successfully!')


