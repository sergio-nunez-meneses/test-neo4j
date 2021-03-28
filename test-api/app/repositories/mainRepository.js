const ash    = require('express-async-handler');
const driver = require('../models/index');

exports.createOne = ash(async function(session, label, properties) {
	return await session.run(
			`CREATE (n:${label} $properties) RETURN n`,
			{properties: properties},
	);
});

exports.find = ash(async function(session, label, properties) {
	return await session.run(
			`MATCH (n:${label}) RETURN n`
	);
});