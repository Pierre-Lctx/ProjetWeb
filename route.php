<?php
    $controllers = array("users" => ["index", "create", "edit", "store", "update", "delete"],);

    if (!array_key_exists($controller, $controllers) || !in_array($action, $controllers[$controller])) 
    {
        $controller = "pages";
        $action = "error";
    }

    if (strpos($controller, "users") !== false)
    {
        include_once("controllers/" . $controller . "Controller.php");
    }

    $class = str_replace(" ", "", ucwords($controller)) . "Controller";
    $controller = new $class;
    $controller->$action();
?>