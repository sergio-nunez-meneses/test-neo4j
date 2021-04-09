<?php

function str_contains($str, $needle) {
	if (strpos($str, $needle) !== false) {
		return true;
	}

	return false;
}

function dump_beautified($data) {
	echo '<pre>';
	var_dump($data);
	echo '</pre>';
}

function console_log($data) {
	echo "<script type='text/javascript'>console.log($data);</script>";
}
