<?php

    class DB
    {
        /**
        * Static variable DB Name
        */
        public function config()
        {
            return "projetweb";
        }

        //Connection to Database
        public static function getInstance()
        {
            $db = new DB();
            $db_name = $db->config();

            try 
            {
                $pdo = new PDO('mysql:host=localhost; dbname=' . $db_name, 'root', '');
                $pdo->exec(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } 
            catch (PDOException $ex) 
            {
                $pdo = $ex->getMessage();
            }

            return $pdo;
        }
    }

?>