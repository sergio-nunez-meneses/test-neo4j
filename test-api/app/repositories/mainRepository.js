const ash    = require('express-async-handler');
const driver = require('../models/index');

exports.createOne = ash(async function(session, label, properties) {
	return await session.run(
			`CREATE (n:${label} $properties) RETURN n`,
			{properties: properties},
	);
});

exports.find = ash(async function() {
	if (typeof arguments[2] === 'object' && Object.keys(arguments[2]).length > 0) {
		const literalMaps = arguments[2].literalMaps;
		delete arguments[2].literalMaps;
		const cypher = `MATCH (n:${arguments[1]} ${literalMaps}) RETURN n`;

		return await arguments[0].run(cypher, arguments[2]);
	}
	// find one node
	else if (typeof arguments[2] === 'number') {
		// return;
	}
	else {
		return await arguments[0].run(`MATCH (n:${arguments[1]}) RETURN n`);
	}
});