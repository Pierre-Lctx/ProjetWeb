<?php

    require "MConnect.php";
    require "CBaseControler.php";
    require "Model/MUser.php";


    //Delete Action
    public function delete()
    {
        $result = User::delete();
        
        if ($result == $this->status_success)
        {
            $_SESSION["alert_success"] = $this->delete_success;
            echo "";
        }
        else
        {
            $_SESSION["alert_danger"] = $this->delete_error;
            echo "";
        }
        }
    }

?>