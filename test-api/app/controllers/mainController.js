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

exports.create = ash(async function(req, res) {
	console.log('function called:', req.body); // just for debugging

	// testing getNodeLabelFromUrl function
	const url        = req.originalUrl.split('/');
	const endpoint   = url[2].includes('?') ? url[2].split('?')[0] : url[2];
	const label      = endpoint.charAt(0).toUpperCase() + endpoint.slice(1);

	const session    = driver.session();
	const result = await session.run(
			`CREATE (a:${label} $properties) RETURN a`,
			{properties: req.body},
	);
	// const instance   = await mainRepository.createOne(label, req.body);

	const singleRecord = result.records[0];
	const node         = singleRecord.get(0);

	await session.close();

	console.log('result:', node); // just for debugging

	res.json({message: 'node ' + node.properties.name + ' created successfully!'});
});