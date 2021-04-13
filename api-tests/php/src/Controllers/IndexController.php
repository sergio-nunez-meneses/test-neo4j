<?php

namespace App\Controllers;

use App\Models\IndexModel;

class IndexController
{

    public static function request_router($url, $request_method)
    {
        $url = parse_url($url);

        if (!self::filter_request($url)) {
            echo self::response(403, 'Forbidden');

            return;
        }

        $node_data = self::set_node_data_from_url($url);
        $response = self::model_router($node_data, $request_method);

        if ($response === null) {
            echo self::response(404, 'Not found');
        }

        echo self::response(200, $response);
    }

    private static function model_router($node_data, $request_method)
    {
        $node = new IndexModel();
        $response = null;

        switch ($request_method) {
            case 'GET':
                if (isset($node_data['id'])) {
                    return $node->find_one($node_data['label'], $node_data['id']);
                }
                elseif (isset($node_data['query_parameters']) && isset($node_data['parameters'])) {
                    return $node->find_all($node_data['label'], $node_data['query_parameters'], $node_data['parameters']);
                }
                else {
                    return $node->find_all($node_data['label']);
                }

            case 'POST':
                $query_parameters = self::format_query_parameters($_POST);
                return $node->create($node_data['label'], $query_parameters, $_POST);

            case 'PUT':
                parse_str(file_get_contents('php://input'), $output);
                return $node->update($node_data['label'], $node_data['id'], self::format_body_parameters($output));

            case 'DELETE':
                return $node->delete($node_data['label'], $node_data['id']);

            default:
                return null;
        }
    }

    private static function set_node_data_from_url($url)
    {
        $url_path = explode('/', $url['path']);
        $node_data = [];
        $node_data['label'] = filter_var(self::format_node_label($url_path[1]), FILTER_SANITIZE_STRING);

        if (isset($url_path[2]) && !empty($url_path[2])) {
            $node_data['id'] = (int)$url_path[2];
        }

        if (isset($url['query'])) {
            parse_str($url['query'], $parameters);

            if (array_key_exists('id', $parameters)) {
                $parameters['id'] = (int)$parameters['id'];
            }

            $node_data['query_parameters'] = self::format_query_parameters($parameters);
            $node_data['parameters'] = $parameters;
        }

        return $node_data;
    }

    private static function format_query_parameters($parameters) {
        $literal_map = [];

        foreach ($parameters as $key => $value) {
            $literal_map[$key] = "$$key";
        }

        return preg_replace('/[\'"]+/','', json_encode($literal_map));
    }

    private static function format_body_parameters($parameters) {
        return 'n += ' . preg_replace('/"([^"]+)":/', '$1:', json_encode($parameters));
    }

    private static function format_node_label($label)
    {
        if ($label === 'companies') {
            return endpoint_substr($label, -3, 'y');
        }
        elseif (string_contains($label, 'territorial')) {
            return endpoint_explode($label, 'contacts', 'Contact');
        }
        elseif (string_contains($label, 'offers') && get_str_pos($label, 'offers') !== null) {
            return endpoint_explode($label, 'offers', 'Offer');
        }

        return endpoint_substr($label, -1);
    }

    private static function filter_request($url)
    {
        if ($url['path'] !== '/') {
            return true;
        }
    }

    private static function response($status_code, $data)
    {
        return json_encode(
            [
                'status_code' => $status_code,
                'response'    => $data,
            ]
        );
    }
}