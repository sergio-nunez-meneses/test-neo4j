<?php

function string_contains($str, $needle) {
	if (strpos($str, $needle) !== false) {
		return true;
	}

	return false;
}

function get_str_pos($str, $needle) {
    $pos = strpos($str, $needle);

    if ($pos) {
        return $pos;
    }
}

function endpoint_explode($label, $needle, $str_apend = '') {
    return ucfirst(explode($needle, $label)[0]) . $str_apend;
}

function endpoint_substr($label, $length, $str_apend = '') {
    return ucfirst(substr($label, 0, $length)) . $str_apend;
}

function dump_beautified($data) {
	echo '<pre>';
	var_dump($data);
	echo '</pre>';
}

function console_log($data) {
	echo "<script type='text/javascript'>console.log($data);</script>";
}
