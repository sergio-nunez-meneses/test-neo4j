<?php

class Autoloader
{

    static function register()
    {
        spl_autoload_register(array(__CLASS__, 'autoload'));
    }

    /**
     * @param $class string Name of the class (with namepsace)
     */
    static function autoload($class)
    {
        require 'src/'.$class.'.php';
    }
}

Autoloader::register();
