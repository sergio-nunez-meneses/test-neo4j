const ash    = require('express-async-handler');
const driver = require('../models/index');

exports.createOne = ash(async function(session, label, properties) {
	return await session.run(
			`CREATE (a:${label} $properties) RETURN a`,
			{properties: properties},
	);
});