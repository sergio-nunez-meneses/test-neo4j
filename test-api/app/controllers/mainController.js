const ash            = require('express-async-handler');
const driver         = require('../models/index');
const mainRepository = require('../repositories/mainRepository');
const tools          = require('../tools/mainFunctions');

exports.createNode = ash(async function(req, res) {
	console.log('function called:', req.body); // just for debugging

	// testing getNodeLabelFromUrl function
	const url      = req.originalUrl.split('/');
	const endpoint = url[2].includes('?') ? url[2].split('?')[0] : url[2];
	const label    = endpoint.charAt(0).toUpperCase() + endpoint.slice(1);

	const session = driver.session();
	const node    = await mainRepository.createOne(session, label, req.body);

	if (node.records.length === 0) {
		return res.status(500).send({
			error: `An error occurred while creating ${label} node.`,
		});
	}

	console.log('result:', node.records[0].get(0)); // just for debugging

	await session.close();

	res.status(200).send({
		message: `${label} node created successfully!`,
	});
});

exports.findAllNodes = ash(async function(req, res) {
	console.log('function called:', req.query); // just for debugging

	// testing getNodeLabelFromUrl function
	const url       = req.originalUrl.split('/');
	const endpoint  = url[2].includes('?') ? url[2].split('?')[0] : url[2];
	const label     = endpoint.charAt(0).toUpperCase() + endpoint.slice(1);
	var keys        = Object.keys(req.query);
	var literalMaps = [];

	// build literal maps for cypher query
	if (keys.length > 0) {
		for (var key of keys) {
			literalMaps.push([key, `$${key}`]);
		}

		req.query['literalMaps'] = JSON.stringify(Object.fromEntries(literalMaps)).replace(/['"]+/g, '');
	}

	const session = driver.session();
	const result  = await mainRepository.find(session, label, req.query);
	var nodes     = [];

	if (result.records.length === 0) {
		return res.status(500).send({
			error: `An error occurred while retrieving ${label} nodes. Maybe ${label} nodes were not found.`,
		});
	}

	for (var record of result.records) {
		console.log('nodes:', record.get(0)); // just for debugging

		nodes.push(record.get(0));
	}

	await session.close();

	res.status(200).send(nodes);
});

exports.findOneNode = async function(req, res) {
	console.log('function called:', req.params); // just for debugging

	const label            = await tools.getNodeLabelFromUrl(req.originalUrl);
	req.params.literalMaps = await tools.convertToLiteralMap(req.params);

	const session = driver.session();
	const result  = await mainRepository.find(session, label, req.params);

	if (result.records.length === 0) {
		return res.status(500).send({
			error: `Error retrieving ${label} node with id=${req.params.id}. Maybe ${label} node was not found.`,
		});
	}

	await session.close();

	res.status(200).send(result.records[0].get(0));
};