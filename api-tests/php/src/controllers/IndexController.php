<?php

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
        // echo self::response(200, $node_data);
        $response = self::model_router($node_data, $request_method);

        if ($response === null) {
            echo self::response(404, 'Not found');
        }

        echo self::response(200, $response);
    }

    public static function model_router($node_data, $request_method)
    {
        // $node_label = ucfirst($node_data['label']).'Model';
        $node = new IndexModel();
        $response = null;

        switch ($request_method) {
            case 'GET':
                if (isset($node_data['id'])) {
                    return $node->find_one($node_data['label'], $node_data['id']);
                }
                elseif (isset($node_data['properties'])) {
                    return $node->find_all($node_data['label'], $node_data['properties']);
                }
                else {
                    return $node->find_all($node_data['label']);
                }

            case 'POST':
                return $node->create($_POST);

            case 'PUT':
                parse_str(file_get_contents('php://input'), $output);
                return $node->update($node_data['id'], $output);

            case 'DELETE':
                return $node->delete($node_data['id']);

            default:
                return null;
        }
    }

    public static function filter_request($url)
    {
        if ($url['path'] !== '/') {
            return true;
        }
    }

    public static function set_node_data_from_url($url)
    {
        $url_path = explode('/', $url['path']);
        $node_data = [];

        if (isset($url_path[2]) && $url_path[2] !== '') {
            $node_data['label'] = self::format_label($url_path[1]);
            $node_data['id'] = (int)$url_path[2];
        } else {
            $node_data['label'] = self::format_label($url_path[1]);
        }

        if (isset($url['query'])) {
            parse_str($url['query'], $parameters);
            $node_data['properties'] = $parameters;
        }

        return $node_data;
    }

    public static function format_label($label)
    {
        return ucfirst(substr($label, 0, -1));
    }

    public static function response($status_code, $data)
    {
        return json_encode(
            [
                'status_code' => $status_code,
                'response'    => $data,
            ]
        );
    }
}