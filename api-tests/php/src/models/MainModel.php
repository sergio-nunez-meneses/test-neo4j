<?php

use Neoxygen\NeoClient\ClientBuilder;

class MainModel
{

    protected function connection()
    {
        return ClientBuilder::create()
            ->addConnection('default', 'http', 'localhost', 7474, true, USERNAME, PASSWORD)
            ->setAutoFormatResponse(true)
            ->build();
    }

    protected function run_query($cypher, $properties = [])
    {
        $db = $this->connection();

        if (empty($properties)) {
            return $db->sendCypherQuery($cypher)
                ->getRows();
        }
    }
}