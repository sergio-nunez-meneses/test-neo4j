<?php

require 'includes/class_autoloader.php';

IndexController::request_router($_SERVER['REQUEST_URI'], $_SERVER['REQUEST_METHOD']);