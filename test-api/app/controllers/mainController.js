const ash     = require('express-async-handler');
const config  = require('../config/config');
const neo4j   = require('neo4j-driver');
const driver  = neo4j.driver(config.url, neo4j.auth.basic(config.user, config.password));

exports.create = ash(async function(req, res) {
	console.log('function call:', req.body);

	const personName = req.body.name;
	const session = driver.session();
	const result     = await session.run(
			'CREATE (a:Person {name: $name}) RETURN a',
			{name: personName},
	);

	const singleRecord = result.records[0];
	const node         = singleRecord.get(0);

	await session.close();
	await driver.close();

	console.log(node);

	res.json({created: node.properties.name});
});