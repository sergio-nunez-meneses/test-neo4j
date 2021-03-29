const ash    = require('express-async-handler');
const driver = require('../models/index');

exports.createOne = ash(async function(session, label, properties) {
	const cypher = `CREATE (n:${label} $properties) RETURN n`;
	const props  = {properties: properties};

	return await session.run(cypher, props);
});

exports.find = ash(async function() {
	if (typeof arguments[2] === 'object' && arguments[2].hasOwnProperty('literalMaps')) {
		const properties = arguments[2].literalMaps;
		delete arguments[2].literalMaps;
		const cypher = `MATCH (n:${arguments[1]} ${properties}) RETURN n`;

		return await arguments[0].run(cypher, arguments[2]);
	}
	else {
		return await arguments[0].run(`MATCH (n:${arguments[1]}) RETURN n`);
	}
});