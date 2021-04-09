<?php

require 'includes/class_autoloader.php';

IndexController::route_request($_SERVER['REQUEST_URI'], $_SERVER['REQUEST_METHOD']);
