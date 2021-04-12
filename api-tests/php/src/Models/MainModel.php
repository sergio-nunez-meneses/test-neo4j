<?php

namespace App\Models;

use Laudis\Neo4j\ClientBuilder;

class MainModel
{

    protected function connection()
    {
        return ClientBuilder::create()
            ->addHttpConnection('backup', 'http://' . USERNAME . ':' . PASSWORD . '@localhost:7474')
            ->addBoltConnection('default', 'bolt://' . USERNAME . ':' . PASSWORD . '@localhost:7687')
            ->setDefaultConnection('backup')
            ->build();
    }

    protected function run_query($cypher, $properties = [])
    {
        $db = $this->connection();

        if (empty($properties)) {
            return $db->run($cypher);
        }
    }
}

// old connection
// use Neoxygen\NeoClient\ClientBuilder;
//
// class MainModel
// {
//
//     protected function connection()
//     {
//         return ClientBuilder::create()
//             ->addConnection('default', 'http', 'localhost', 7474, true, USERNAME, PASSWORD)
//             ->setAutoFormatResponse(true)
//             ->build();
//     }
//
//     protected function run_query($cypher, $properties = [])
//     {
//         $db = $this->connection();
//
//         if (empty($properties)) {
//             return $db->sendCypherQuery($cypher)
//                 ->getRows();
//         }
//     }
// }