<?php

    //Base Controller

    class BaseControler
    {
        // variable folder name in to access views folder
        protected $folder;

        //Show result to views

        function render($file, $data = array()) 
        {
            // Check exist current file
            $view_file = "Views/" . $this->folder . "/" . $file . ".php";

            if (is_file($view_file)) 
            {
                // if exist file, create variable and add to call function
                extract($data);

                // Save data and show with variable to views
                ob_start();
                require_once($view_file);
                $content = ob_get_clean();

                // use common template
                require_once("views/layouts.php");
            }
            else
            {
                // if file not exist, show error page
                header("Location: index.php?controller=pages&action=error");
            }
        }
    }
?>