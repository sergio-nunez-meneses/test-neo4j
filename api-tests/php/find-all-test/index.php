<?php

echo "
	<style>
	body {
		background-color: black;
		color: darkgrey;
	}
	</style>
";

/* controller */
$url = parse_url($_SERVER['REQUEST_URI']);
parse_str($url['query'], $data);

$data_keys = array_values($data);
$data_values = array_values($data);

if (count($data_keys) !== count($data_values) || in_array('', $data_values)) {
	exit('Bad Request');
}

$query_parameters = $relationships = $properties = [];

foreach ($data as $key => $value) {
	switch ($key) {
		case 'type':
			$relationships[$key] = filter_var($value, FILTER_SANITIZE_STRING);
			break;
		case 'contactId':
			$relationships[$key] = (int)filter_var($value,FILTER_SANITIZE_STRING);
			break;
		case 'territorialContactId':
			$relationships[$key] = (int)filter_var($value,FILTER_SANITIZE_STRING);
			break;
		default:
			$properties[$key] = filter_var($value, FILTER_SANITIZE_STRING);
	}
}

if (!empty($properties)) {
	$query_parameters['properties'] = array_to_json_properties($properties);
}

if (!empty($relationships)) {
	$query_parameters['relationships'] = $relationships;
}

/* model */
$offer = $offer_type = $contact = $territorial_contact = '';

if (isset($query_parameters['properties'])) {
	$offer .= '(o:Offer' . $query_parameters['properties'] . ')';
}
else {
	$offer .= '(o:Offer)';
}

if (isset($query_parameters['relationships'])) {
	$relationship = $query_parameters['relationships'];

	if (isset($relationship['type'])) {
		$offer_type .= ', (o)-->(:OfferType {type:"' . $relationship['type'] . '"})';
	}
	if (isset($relationship['contactId'])) {
		$contact .= ', (o)-->(:Contact {id:' . $relationship['contactId'] . '})';
	}
	if (isset($relationship['territorialContactId'])) {
		$territorial_contact .= ', (o)-->(:TerritorialContact {id:' . $relationship['territorialContactId'] . '})';
	}
}

$cypher = "MATCH $offer $offer_type $contact $territorial_contact RETURN o";

echo "<pre>";
var_dump($cypher);
echo "</pre>";


function array_to_json_properties($properties) {
	return preg_replace('/"([^"]+)":/', '$1:', json_encode($properties));
}