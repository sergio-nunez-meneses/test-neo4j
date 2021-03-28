const ash            = require('express-async-handler');
const driver         = require('../models/index');
const mainRepository = require('../repositories/mainRepository');

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
	const url      = req.originalUrl.split('/');
	const endpoint = url[2].includes('?') ? url[2].split('?')[0] : url[2];
	const label    = endpoint.charAt(0).toUpperCase() + endpoint.slice(1);

	const session = driver.session();
	const result  = await mainRepository.createOne(session, label, req.body);

	if (result.records.length === 0) {
		return res.status(500).send({
			error: `An error occurred while creating ${label} node.`
		});
	}

	console.log('result:', result.records[0].get(0)); // just for debugging

	await session.close();

	res.status(200).send({
		message: `node ${label} created successfully!`
	});
});