<?php

// require 'includes/class_autoloader.php';
require 'config/neo4j_credentials.php';
require 'vendor/autoload.php';
require 'tools/functions.php';

// use src\controllers\IndexController;
//
// IndexController::request_router($_SERVER['REQUEST_URI'], $_SERVER['REQUEST_METHOD']);

// WORKING
use Laudis\Neo4j\ClientBuilder;

$client = ClientBuilder::create()
		->addHttpConnection('backup', 'http://' . USERNAME . ':' . PASSWORD . '@localhost:7474')
		->addBoltConnection('default', 'bolt://' . USERNAME . ':' . PASSWORD . '@localhost:7687')
		->setDefaultConnection('backup')
		->build();

dump_beautified($client);

$result = $client->run('MATCH (o:Offer) RETURN (o)-[:IS_TYPE_TAKEOVER]->()--()');

dump_beautified($result);

// use GraphAware\Neo4j\Client\ClientBuilder;
//
// $client = ClientBuilder::create()
//     ->addConnection('default', 'http://' . USERNAME . ':' . PASSWORD . '@test')
//     ->addConnection('bolt', 'bolt://' . USERNAME . ':' . PASSWORD . '@test')
// 		->setDefaultTimeout(1000000)
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