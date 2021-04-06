exports.getNodeLabelFromUrl = async function(originalUrl) {
	const url      = originalUrl.split('/');
	const endpoint = url[2].includes('?') ? url[2].split('?')[0] : url[2];
	const label    = endpoint.charAt(0).toUpperCase() + endpoint.slice(1);

	return label;
};

exports.toLiteralMapFind = async function(reqKeys) {
	var literalMap = [];

	for (var key of Object.keys(reqKeys)) {
		literalMap.push([key, `$${key}`]);
	}

	return JSON.stringify(Object.fromEntries(literalMap)).replace(/['"]+/g, '');
};

exports.toLiteralMapSet = async function(propKeys) {
	return `n += ${JSON.stringify(propKeys).replace(/"([^"]+)":/g, '$1:')}`;
};