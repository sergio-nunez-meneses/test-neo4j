exports.getNodeLabelFromUrl = async function(originalUrl) {
	const url      = originalUrl.split('/');
	const endpoint = url[2].includes('?') ? url[2].split('?')[0] : url[2];
	const label    = endpoint.charAt(0).toUpperCase() + endpoint.slice(1);

	return label;
}

exports.convertToLiteralMap = async function(reqKeys) {
	const keys      = Object.keys(reqKeys);
	var literalMaps = [];

	if (keys.length > 0) {
		for (var key of keys) {
			literalMaps.push([key, `$${key}`]);
		}

		return JSON.stringify(Object.fromEntries(literalMaps)).replace(/['"]+/g, '');
	}
}