const ash            = require('express-async-handler');
const driver         = require('../models/index');
const mainRepository = require('../repositories/mainRepository');
const tools          = require('../tools/mainFunctions');

exports.createNode = ash(async function(req, res) {
	console.log('function called:', req.body); // just for debugging

	const label   = await tools.getNodeLabelFromUrl(req.originalUrl);
	const session = driver.session();

	// if (req.body.hasOwnProperty('id')) {
	// 	req.body.id = Number(req.body.id);
	// }

	const node = await mainRepository.createOne(session, label, req.body);

	if (node.records.length === 0) {
		return res.status(500).send({
			error: `An error occurred while creating ${label} node.`,
		});
	}

	console.log('result:', node); // just for debugging

	await session.close();

	res.status(200).send({
		message: `${label} node created successfully!`,
	});
});

exports.findAllNodes = ash(async function(req, res) {
	console.log('function called:', req.query); // just for debugging

	const label = await tools.getNodeLabelFromUrl(req.originalUrl);

	// build literal map for cypher's where clause
	if (Object.keys(req.query).length > 0) {
		req.query.literalMaps = await tools.convertToLiteralMap(req.query);
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
		// console.log('nodes:', record.get(0)); // just for debugging

		nodes.push(record.get(0));
	}

	console.log('result:', result); // just for debugging

	await session.close();

	res.status(200).send(nodes);
});

exports.findOneNode = ash(async function(req, res) {
	console.log('function called:', req.params); // just for debugging

	const label            = await tools.getNodeLabelFromUrl(req.originalUrl);
	req.params.literalMaps = await tools.convertToLiteralMap(req.params); // build literal map for cypher's where clause

	const session = driver.session();
	const node    = await mainRepository.find(session, label, req.params);

	if (node.records.length === 0) {
		return res.status(500).send({
			error: `Error retrieving ${label} node with id=${req.params.id}. Maybe ${label} node was not found.`,
		});
	}

	console.log('result:', node); // just for debugging

	await session.close();

	res.status(200).send(node.records[0].get(0));
});

exports.updateNode = ash(async function(req, res) {
	console.log('function called:', req.params, req.body); // just for debugging

	const label          = await tools.getNodeLabelFromUrl(req.originalUrl);
	req.body.paramsMaps  = await tools.convertToLiteralMapUpdate(req.body); // build literal map for cypher's where clause
	req.body.literalMaps = await tools.convertToLiteralMap(req.params);
	req.body.id          = req.params;

	const session = driver.session();
	const node    = await mainRepository.updateOne(session, label, req.body);

	if (node.records.length === 0) {
		return res.status(500).send({
			error: `Error updating ${label} node with id=${req.params.id}.`,
		});
	}

	console.log('result:', node); // just for debugging

	await session.close();

	res.status(200).send({
		message: `${label} node updated successfully!`,
	});
});

exports.deleteNode = ash(async function(req, res) {
	console.log('function called:', req.params); // just for debugging

	const label            = await tools.getNodeLabelFromUrl(req.originalUrl);
	req.params.literalMaps = await tools.convertToLiteralMap(req.params); // build literal map for cypher's where clause

	const session = driver.session();
	const node    = await mainRepository.delete(session, label, req.params);

	if (node.records.length === 0) {
		return res.status(500).send({
			error: `Couldn't delete ${label} node with id=${req.params.id}.`,
		});
	}

	console.log('result:', node); // just for debugging

	await session.close();

	res.status(200).send({
		message: `${label} node deleted successfully!`
	});
});