const ash    = require('express-async-handler');
const driver = require('../models/index');

exports.createOne = ash(async function(session, label, properties) {
	const cypher = `CREATE (n:${label} $properties) RETURN n`;
	const props  = {properties: properties};

	return await session.run(cypher, props);
});

// arguments: session, label, properties
exports.find = ash(async function() {
	if (arguments[2].hasOwnProperty('where')) {
		const where = arguments[2].where;
		delete arguments[2].where;
		const cypher = `MATCH (n:${arguments[1]} ${where}) RETURN n`;

		return await arguments[0].run(cypher, arguments[2]);
	}
	else {
		return await arguments[0].run(`MATCH (n:${arguments[1]}) RETURN n`);
	}
});

exports.updateOne = ash(async function(session, label, properties) {
	const cypher = `MATCH (n:${arguments[1]} ${properties.where}) SET ${properties.set} RETURN n`;

	return await session.run(cypher, properties.id);
});

exports.delete = ash(async function() {
	if (arguments.length > 2) {
		const where = arguments[2].where;
		delete arguments[2].where;
		const cypher = `MATCH (n:${arguments[1]} ${where}) DETACH DELETE n RETURN n`;

		return await arguments[0].run(cypher, arguments[2]);
	}
	else {
		const cypher = `MATCH (n:${arguments[1]}) DETACH DELETE n RETURN n`;

		return await arguments[0].run(cypher);
	}
});