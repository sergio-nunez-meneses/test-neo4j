<?php

require 'includes/class_autoloader.php';
require 'config/neo4j_credentials.php';
require 'vendor/autoload.php';
require 'tools/functions.php';

IndexController::request_router($_SERVER['REQUEST_URI'], $_SERVER['REQUEST_METHOD']);

// use Laudis\Neo4j\ClientBuilder;
//
// $parsed_http_url = parse_url('http://'.USERNAME.':'.PASSWORD.'@localhost:7474');
// $parsed_bolt_url = parse_url('bolt://'.USERNAME.':'.PASSWORD.'@localhost:7687');
// $client = ClientBuilder::create()
//     ->addHttpConnection('backup', $parsed_http_url)
//     ->addBoltConnection('default', $parsed_bolt_url)
//     ->setDefaultConnection('default')
//     ->build();

// use GraphAware\Neo4j\Client\ClientBuilder;
//
// $http_url = 'http://localhost:7474';
// $bolt_url = 'bolt://localhost:7687';
// $client = ClientBuilder::create()
//     ->addConnection('default', $http_url)
//     ->addConnection('bolt', $bolt_url)
//     ->build();
//
// $query = "MATCH (o:Offer) RETURN o";
// $result = $client->run($query);

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