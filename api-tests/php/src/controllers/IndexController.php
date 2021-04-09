<?php

class IndexController {

	public static function filter_request($url) {
		if ($url['path'] !== '/') {
			return true;
		}
	}

	public static function route_request($url, $request_method) {
		$url = parse_url($url);

		if (!self::filter_request($url)) {
			echo self::response(403, 'Forbidden');
			return;
		}

		$node = self::set_node_data_from_url($url);
		echo self::response(200, $node);
	}

	public static function set_node_data_from_url($url) {
		$url_path = explode('/', $url['path']);
		$node_data = [];

		if (isset($url_path[2]) && $url_path[2] !== '') {
			$node_data['label'] = self::format_label($url_path[1]);
			$node_data['id'] = (int)$url_path[2];
		}
		else {
			$node_data['label'] = self::format_label($url_path[1]);
		}

		if (isset($url['query'])) {
			parse_str($url['query'], $parameters);
			$node_data['properties'] = $parameters;
		}

		return $node_data;
	}

	public static function format_label($label) {
		return substr($label, 0, -1);
	}

	public static function response($status_code, $data) {
		return json_encode([
				'status_code' => $status_code,
				'response'    => $data,
		]);
	}
}