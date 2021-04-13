<?php

namespace App\Models;

use Laudis\Neo4j\ClientBuilder;

class MainModel
{

    private $db;

    protected function connection()
    {
        $this->db = ClientBuilder::create()
            ->addHttpConnection('backup', 'http://'.USERNAME.':'.PASSWORD.'@localhost:7474')
            ->addBoltConnection('default', 'bolt://'.USERNAME.':'.PASSWORD.'@localhost:7687')
            ->setDefaultConnection('default')
            ->build();

        if (count((array)$this->db) > 0) {
            return true;
        }
    }

    protected function run_query($cypher, $parameters = [])
    {
        if ($this->connection()) {
            if (empty($parameters)) {
                return $this->db->run($cypher);
            } else {
                return $this->db->run($cypher, $parameters, 'default');
            }
        }
    }
}