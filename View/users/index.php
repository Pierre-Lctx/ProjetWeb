<!DOCTYPE html>
<html>
    <?php
        require_once "Model/MConnect.php";

        if (isset($_GET["controller"])) 
        {
            $controller = $_GET["controller"];
            if (isset($_GET["action"]))
            {
                $action = $_GET["action"];
            } 
            else
            {
                $action = "index";
            }
        }
        else
        {
            $controller = "pages";
            $action = "home";
        }

        require_once("routes.php");
    ?>
    <head>
        <title>Test</title>
    </head>
    <body>
        <?php
            echo @$content;
        ?>
    </body>
</html>