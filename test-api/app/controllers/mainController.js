const ash = require('express-async-handler');
const driver  = require('../models/index');

exports.create = ash(async function(req, res) {
	console.log('function call:', req.body);

	const session    = driver.session();
	const personName = req.body.name;
	const result     = await session.run(
			'CREATE (a:Person {name: $name}) RETURN a',
			{name: personName},
	);

	const singleRecord = result.records[0];
	const node         = singleRecord.get(0);

	await session.close();

	console.log(node);

	res.json({created: node.properties.name});
});