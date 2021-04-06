import random
import os
import uuid
from datetime import datetime

users = dict(
    # node label and variable name
    nodeInfo=dict(
        label='User', name='u'
    ),
    username=[
        'Amy-Leigh Aldred', 'Caroline Roberson', 'Leja Lancaster', 'Esmai Dillon', 'Rex Banks', 'Rehan Juarez',
        'Arla Werner', 'Hendrix Potts', 'Maude Burt', 'Finlay Joyner'
    ]
)
contacts = dict(
    nodeInfo=dict(
        label='Contact', name='c'
    ),
    firstname=[
        'Josef', 'Rianne', 'Fredrick', 'Suman', 'Roseanna', 'Duane', 'Rosa', 'Jorja', 'Honor', 'Nayan'
    ],
    lastname=[
        'Ewing', 'Crane', 'Blevins', 'Halliday', 'Flores', 'Milne', 'Beck', 'Sanchez', 'Quinn', 'Salazar'
    ]
)
territorial_contacts = dict(
    nodeInfo=dict(
        label='TerritorialContact', name='tc'
    ),
    firstname=[
        'Ellen', 'Amayah', 'Hugo', 'Zakariah', 'Anna-Marie', 'Kaydon', 'Ellena', 'Luke', 'Axl', 'Mea'
    ],
    lastname=[
        'Berry', 'Butt', 'Harmon', 'Santos', 'Nairn', 'Cortez', 'Figueroa', 'Dickens', 'Stewart', 'Green'
    ]
)
companies = dict(
    nodeInfo=dict(
        label='Company', name='co'
    ),
    name=[
        'Eco Focus', 'Innovation Arch', 'Strat Security', 'Cogent Data', 'Epic Adventure Inc', 'Vortex Solar',
        'Admire Arts', 'Bonefete Fun', 'Cipher Publishing', 'Lambent Illumination'
    ]
)
offers = dict(
    nodeInfo=dict(
        label='Offer', name='o'
    ),
    type=[
        'takeover offer', 'job offer', 'estate offer', 'takeover offer', 'job offer', 'estate offer', 'takeover offer',
        'job offer', 'estate offer', 'takeover offer', 'job offer', 'estate offer', 'takeover offer', 'job offer',
        'estate offer', 'takeover offer', 'job offer', 'estate offer', 'takeover offer', 'job offer', 'estate offer',
        'takeover offer', 'job offer', 'estate offer', 'takeover offer', 'job offer', 'estate offer', 'takeover offer',
        'job offer', 'estate offer'
    ],
    title=[
        'ut tellus elementum', 'sagittis vitae et leo duis ut', 'diam quam nulla porttitor massa',
        'id neque aliquam vestibulum morbi', 'blandit cursus risus', 'at ultrices mi tempus imperdiet',
        'nulla malesuada pellentesque elit', 'eget gravida cum sociis', 'natoque penatibus',
        'et magnis dis parturient montes', 'nascetur ridiculus mus mauris', 'vitae ultricies leo integer malesuada',
        'nunc vel risus commodo', 'viverra maecenas accumsan lacus', 'vel facilisis volutpat est velit',
        'egestas dui id ornare', 'arcu odio ut sem', 'nulla pharetra diam', 'sit amet nisl', 'suscipit adipiscing',
        'dui vivamus arcu felis bibendum', 'ut tristique et egestas quis ipsum', 'suspendisse ultrices gravida',
        'dictum fusce ut placerat', 'orci nulla pellentesque', 'dignissim enim sit amet venenatis',
        'urna cursus eget nunc viverra adipiscing at in tellus', 'integer feugiat scelerisque varius morbi',
        'enim nunc faucibus a pellentesque sit amet porttitor eget dolor',
        'morbi non arcu risus quis varius quam quisque id diam'
    ],
    publishedDate=[
        '2021-04-13', '2021-04-30', '2021-05-06', '2021-05-10', '2021-05-12', '2021-05-13', '2021-05-17', '2021-05-18',
        '2021-05-20', '2021-05-27', '2021-05-28', '2021-05-31', '2021-06-04', '2021-06-07', '2021-06-17', '2021-06-21',
        '2021-06-23', '2021-06-24', '2021-06-25', '2021-07-13', '2021-07-14', '2021-07-15', '2021-07-19', '2021-07-23',
        '2021-07-28', '2021-08-02', '2021-08-04', '2021-08-16', '2021-08-23', '2021-09-07'
    ],
    endPublished=[
        '2021-07-09', '2021-07-13', '2021-07-15', '2021-07-20', '2021-07-23', '2021-08-04', '2021-08-09', '2021-08-10',
        '2021-08-17', '2021-09-10', '2021-09-14', '2021-09-15', '2021-09-20', '2021-09-30', '2021-10-11', '2021-10-14',
        '2021-10-19', '2021-11-04', '2021-11-11', '2021-11-17', '2021-11-29', '2021-12-09', '2021-12-13', '2021-12-14',
        '2021-12-21', '2021-12-02', '2021-12-06', '2021-12-15', '2021-12-17', '2021-12-23'
    ]
)
takeover_offers = dict(
    nodeInfo=dict(
        label='TakeoverOffer', name='to'
    ),
    description=[
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Et malesuada fames ac turpis egestas maecenas.',
        'Vitae aliquet nec ullamcorper sit amet risus.', 'In dictum non consectetur a erat.',
        'Est ultricies integer quis auctor elit.', 'Dui id ornare arcu odio ut sem nulla pharetra diam.',
        'Sit amet justo donec enim diam vulputate ut pharetra sit.', 'Ridiculus mus mauris vitae ultricies.',
        'Non tellus orci ac auctor augue mauris augue neque.',
        'Sed risus ultricies tristique nulla aliquet enim tortor.'
    ]
)
job_offers = dict(
    nodeInfo=dict(
        label='JobOffer', name='jo'
    ),
    description=[
        'Sed arcu non odio euismod lacinia.', 'Orci eu lobortis elementum nibh tellus molestie nunc.',
        'Dui id ornare arcu odio.', 'Porttitor eget dolor morbi non arcu risus.',
        'Duis ut diam quam nulla porttitor massa id.', 'Varius quam quisque id diam.',
        'Vulputate eu scelerisque felis imperdiet proin fermentum leo.', 'Et tortor at risus viverra adipiscing at.',
        'Massa sapien faucibus et molestie ac.', 'Ridiculus mus mauris vitae ultricies leo.'
    ]
)
estate_offers = dict(
    nodeInfo=dict(
        label='EstateOffer', name='eo'
    ),
    description=[
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Ut diam quam nulla porttitor massa.',
        'Faucibus interdum posuere lorem ipsum dolor sit.', 'Eu lobortis elementum nibh tellus molestie nunc non.',
        'Eu lobortis elementum nibh tellus molestie nunc non blandit massa.',
        'Dignissim sodales ut eu sem integer vitae justo eget.', 'Neque ornare aenean euismod elementum nisi.',
        'Pretium fusce id velit ut tortor pretium viverra suspendisse.', 'Diam phasellus vestibulum lorem sed risus.',
        'Consequat semper viverra nam libero justo laoreet sit amet cursus.'
    ]
)
locations = dict(
    nodeInfo=dict(
        label='Location', name='lo'
    ),
    address=[
        '14 Rue Fonmorigny', '18 Rue de la Jonction', '3 Rue François Mitterrand', '1 Rue de la Revenderie',
        '1 Rue Charles-Roy', '4 Rue du 13E de Ligne', '13 Place Mosse', '2 Rue Saint-Didier', '60 Rue de Nièvre',
        '5 Rue Saint-Didier', '31 Avenue Colbert', '27 Rue des Grands Jardins', '3 Square de la Résistance',
        '11 Square de la Résistance', '25 Quai de Mantoue', '50 Avenue Général de Gaulle', '18 Rue Georges Pielin',
        '4 Place Guy Coquille', '15 Rue Pierre Emile Gaspard', '26 Avenue Pierre Bérégovoy', 'Le Bourg', 'Le Bourg',
        "Lieu-dit L'Usage", '14 Route de la Mairie', 'Le Bourg', "3-5 L'Haut de la Croix", 'La Chaume', 'Le Bourg',
        "15 Rue de l'Église", 'Le Bourg'
    ],
    city=[
        'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Nevers',
        'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Nevers', 'Vauclaix',
        "Vaux d'Amognes", 'Verneuil', 'Vielmanay', 'Vignol', 'Villapourçon', 'Ville-Langy', 'Villiers-le-Sec',
        'Villiers-sur-Yonne', 'Vitry-Laché'
    ],
    zipcode=[
        58000, 58000, 58000, 58000, 58000, 58000, 58000, 58000, 58000, 58000, 58000, 58000, 58000, 58000, 58000, 58000,
        58000, 58000, 58000, 58000, 58140, 58130, 58300, 58150, 58190, 58370, 58270, 58210, 58500, 58420
    ],
    latitude=[
        46.991204872852826, 46.98203504301195, 46.98788329704684, 46.98995990612068, 46.99479384802674,
        46.99271058484829, 46.98532094680932, 46.988408894671885, 46.99012038693866, 46.98846461978366,
        46.99751804899956, 46.99669613969092, 46.992343240636394, 46.99197291498163, 46.98560073592141,
        46.98792207813667, 46.982982999776105, 46.99082004710196, 46.986243809641095, 46.98623649070845,
        47.231626333124716, 47.0577154271303, 46.86662413805243, 47.267110045916944, 47.361730940390075,
        46.96465490618421, 46.94251136709633, 47.377613200472304, 47.413497205148694, 47.20099160043019
    ],
    longitude=[
        3.164862684797683, 3.163733684078444, 3.1615197110684434, 3.16304281106852, 3.1628061552439317,
        3.1461043110686413, 3.156744197573458, 3.155955468738543, 3.1636086092232514, 3.1564295533983597,
        3.1571131417491647, 3.136766355244028, 3.160591355243829, 3.160327826408791, 3.15820304174869,
        3.151402784078711, 3.1269296245630915, 3.162575482233523, 3.150180228253858, 3.150137312913691,
        3.8231016239738085, 3.3074656991485534, 3.5707704933001176, 3.11333922030654, 3.6706914403232664,
        4.0287466279613735, 3.495937990703361, 3.430606898156778, 3.5745199432764454, 3.5643014221490588
    ]
)


def create_cypher_file(data):
    nodes = [format_nodes_and_infos(format_properties(node)) for node in data]
    node_infos = get_node_infos(nodes)
    relationships = format_relationships(node_infos)
    file_content = concatenate_nodes(nodes) + relationships

    if save_file(file_content):
        print('File created successfully!')


def concatenate_nodes(nodes):
    node_str = ''.join(node for nodes in nodes for node in nodes)
    return 'MATCH (n)\nDETACH DELETE n;\n' + node_str


def create_nodes(variable_name, idx, node_label, properties):
    node = 'CREATE ({}{}:{} {})\n'.format(variable_name, idx, node_label, properties)
    keys = list(set([keys for keys in properties]))  # return list without duplicates

    # remove single quotes from dict keys
    for key in keys:
        node = node.replace('\'' + key + '\'', key)

    return node


def format_nodes_and_infos(properties):
    node_infos = properties.pop()
    nodes = [create_nodes(node_infos['name'], i+1, node_infos['label'], properties[i]) for i in
             range(len(properties))]
    node_names = ['({}{})'.format(node_infos['name'], i) for i in range(len(properties))]  # create list with node_infos
    node_infos = dict(label=node_infos['label'].lower(), names=node_names)
    nodes.append(node_infos)  # restore node_infos
    return nodes


def format_properties(node):
    node_infos = node.pop('nodeInfo')

    if 'id' not in node:
        node['id'] = [i+1 for i in range(len(list(node.values())[0]))]  # create id properties

    keys = node.keys()
    values = zip(*[node[k] for k in keys])  # unzip given dict
    properties = [dict(zip(keys, v)) for v in values]  # create new dict
    properties.append(node_infos)
    return properties


def get_node_infos(nodes):
    node_infos = []

    for node in nodes:
        for node_info in node:
            if isinstance(node_info, dict):
                node_infos.append(node_info)
                node.pop(len(node) - 1)

    return node_infos


def create_relationships(*args):
    relationship = args[len(args) - 1]

    if relationship == 'REFERS_TO':
        return '{}<-[:{}]-{}-[:{}]->{},\n'.format(args[2], relationship, args[0], relationship, args[1])
    else:
        return '{}-[:{}]->{},\n'.format(args[0], relationship, args[1])


def format_relationships(node_infos):
    relationships = 'CREATE\n'
    infos_to_dict = {}

    # convert list to dict
    for node_info in node_infos:
        node_label = node_info.pop('label')  # remove duplicated key
        infos_to_dict[node_label] = node_info

    globals().update(infos_to_dict)  # create variables from dict keys

    for i in range(len(offer['names'])):
        relationships += create_relationships(offer['names'][i], random.choice(user['names']), 'PUBLISHED_BY')
        relationships += create_relationships(offer['names'][i], random.choice(contact['names']),
                                              random.choice(territorialcontact['names']), 'REFERS_TO')
        idx = i % 3

        if idx == 0:
            to_idx = i % len(takeoveroffer['names'])

            relationships += create_relationships(offer['names'][i], takeoveroffer['names'][to_idx], 'IS_TYPE_TAKEOVER')
            relationships += create_relationships(takeoveroffer['names'][to_idx], random.choice(location['names']),
                                                  'IS_LOCATED')
        elif idx == 1:
            jo_idx = i % len(joboffer['names'])
            co_idx = random.choice(company['names'])

            relationships += create_relationships(offer['names'][i], joboffer['names'][jo_idx], 'IS_TYPE_JOB')
            relationships += create_relationships(joboffer['names'][jo_idx], co_idx, 'BELONGS_TO')
            relationships += create_relationships(co_idx, random.choice(location['names']), 'IS_LOCATED')
        elif idx == 2:
            eo_idx = i % len(estateoffer['names'])

            relationships += create_relationships(offer['names'][i], estateoffer['names'][eo_idx], 'IS_TYPE_ESTATE')
            relationships += create_relationships(estateoffer['names'][eo_idx], random.choice(location['names']),
                                                  'IS_LOCATED')

    return relationships[:-2] + ';'


def save_file(file_content):
    create_and_change_dir('load_graph')
    filename = str(datetime.today().strftime('%Y%m%dT%H%M%S')) + '_' + str(uuid.uuid4()).replace('-', '') + '.cypher'

    with open(filename, 'w+') as f:
        f.write(file_content)

    return os.path.isfile(filename)


def create_and_change_dir(dir_name):
    path = os.getcwd() + '/' + dir_name

    if not os.path.exists(path):
        os.mkdir(path)

    os.chdir(path)


create_cypher_file(
    [users, contacts, territorial_contacts, companies, offers, takeover_offers, job_offers, estate_offers, locations])
