<?php

require 'includes/class_autoloader.php';
require 'config/neo4j_credentials.php';
require 'vendor/autoload.php';
require 'tools/functions.php';

IndexController::request_router($_SERVER['REQUEST_URI'], $_SERVER['REQUEST_METHOD']);

// use Laudis\Neo4j\ClientBuilder;
// use Laudis\Neo4j\Databags\Statement;
//
// $client = ClientBuilder::create()
// 		->addHttpConnection('backup', 'http://' . USERNAME . ':' . PASSWORD . '@test')
// 		->addBoltConnection('default', 'bolt://' . USERNAME . ':' . PASSWORD . '@test')
// 		->setDefaultConnection('backup')
// 		->build();
//
// dump_beautified($client);
//
// $statement = new Statement("MATCH (o:Offer {type: 'joboffers'}) RETURN o", []);
// $result = $client->runStatement($statement, 'backup');
//
// dump_beautified($result);

// use GraphAware\Neo4j\Client\ClientBuilder;
//
// $client = ClientBuilder::create()
//     ->addConnection('default', 'http://' . USERNAME . ':' . PASSWORD . '@test')
//     ->addConnection('bolt', 'bolt://' . USERNAME . ':' . PASSWORD . '@test')
// 		->setDefaultTimeout(100)
//     ->build();
//
// $query = "MATCH (o:Offer) RETURN o";
// $result = $client->run($query);
//
// dump_beautified($result);

// WORKING
// use Neoxygen\NeoClient\ClientBuilder;
//
// $client = ClientBuilder::create()
//     ->addConnection('default', 'http', 'localhost', 7474, true, USERNAME, PASSWORD)
//     ->setAutoFormatResponse(true)
//     ->build();
//
// dump_beautified($client);
//
// $cypher = "MATCH (o:Offer) WHERE o.type CONTAINS 'job' RETURN o";
// $response = $client->sendCypherQuery($cypher);
// $result = $client->getRows();
// dump_beautified($result);