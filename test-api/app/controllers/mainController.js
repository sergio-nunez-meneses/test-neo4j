const ash    = require('express-async-handler');
const driver = require('../models/index');

exports.getNodeLabelFromUrl = async function(req) {
	var data       = [];
	const url      = req.originalUrl.split('/');
	const endpoint = url[2].includes('?') ? url[2].split('?')[0] : url[2];
	const label    = endpoint.charAt(0).toUpperCase() + endpoint.slice(1);

	data.push(endpoint, label);

	return data;
}

exports.create = ash(async function(req, res, endpoint) {
	console.log('function call:', req.body);

	const label      = endpoint.charAt(0).toUpperCase() + endpoint.slice(1);
	const session    = driver.session();

	// const instance   = await mainRepository.createOne(label, req.body);

	const result = await session.run(
			`CREATE (a:${label} $properties) RETURN a`,
			{properties: req.body},
	);

	const singleRecord = result.records[0];
	const node         = singleRecord.get(0);

	await session.close();

	console.log(node);

	res.json({message: 'node ' + node.properties.name + ' created successfully!'});
});