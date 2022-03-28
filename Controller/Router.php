<?php
class Routeur
{
    private $_ctrl;
    private $_view;

    public function routeReq()
    {
        try
        {   
            // Chargement auto des classes
            spl_autoload_register(function($class)
            {
                require_once('Model/'.$class.'.php');
            })

            $url = '';

            if(isset($_GET['url']))
            {
                $url = explode('/', filter_var($_GET['url'], FILTER_SANITIZE_URL));

                $controller = ucfirst(strtolower($url[0]));
                $controllerClass = "Controller".$controller;
                $controllerFile = "controller/".controllerClass.".php"

                if(file_exists($controllerFile))
                {
                    require_once($controllerFile);
                    $this->_ctrl = new $controllerClass($url);

                }
                else
                throw new Exception('Page introuvable');
            }
            else
            {
                require_once('controller/ControllerHome.php');
                $this->_ctrl = new  ControllerHome($url);
            }
        }
        catch(Exception $e)
        {
            $errorMsg = $e->getMessage();
            require_once('views/error.php')
        }
    }
}