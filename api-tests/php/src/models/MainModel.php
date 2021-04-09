<?php
//
// require_once '../../config/neo4j_credentials.php';
// require_once '../../tools/functions.php';
//
// use Laudis\Neo4j\ClientBuilder;
//
// class MainModel {
//
// use Neoxygen\NeoClient\ClientBuilder;
//
// $client = ClientBuilder::create()
// 		->addConnection('default', 'http', 'localhost', 7474, true, USERNAME, PASSWORD)
// 		->build();
//
// dump_beautified($client);
// console_log($client);
// 	$client = ClientBuilder::create()
// 			->addBoltConnection('default', sprintf('bolt://%s:%s@localhost:7687', USERNAME, PASSWORD))
// 			->build();
//
// 	dump_beautified($client);
// 	console_log($client);
// 	echo "Couldn't connect to database " . DB_NAME . "\n";
//
// 	public function connection() {
// 		$client = Laudis\Neo4j\ClientBuilder::create()
// 				->addHttpConnection('backup', 'http://' . USERNAME . ':' . PASSWORD . '@localhost:7687')
// 				->addBoltConnection('default', 'bolt://' . USERNAME . ':' . PASSWORD . '@localhost:7687')
// 				->setDefaultConnection('default')
// 				->build();
// 	}
//
// 	protected function run_query($cypher, $properties= [])
// 	{
// 		if ($this->connection() === true)
// 		{
// 			if (empty($properties))
// 			{
// 				return $this->pdo->query($cypher)->fetchAll();
// 			}
// 			else
// 			{
// 				$stmt = $this->pdo->prepare($sql);
// 				$stmt->execute($properties);
// 				return $stmt;
// 			}
// 		}
// 	}
// }