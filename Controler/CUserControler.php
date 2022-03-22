<?php

    require "MConnect.php";
    require "CBaseControler.php";
    require "Model/MUser.php";

    Class UsersController extends BaseController
{
    //Create View
    public function create()
    {
        // It return add view in views/users/create.php
        $this->render("add");
    }

    //Store action
    public function store()
    {
        $result = User::store();

        if ($result == $this->status_success)
        {
            $_SESSION["alert_success"] = $this->save_success;
            echo "";
        } 
        else
        {
            $_SESSION["alert_danger"] = $this->save_error;
            echo "";
        }
    }

    //Edit View
    public function edit()
    {
        // It return add view in views/users/edit.php
        $user = User::find($id);
        $data = ["user" => $user];
        $this->render("edit", $data);
    }

    //Update Action
    public function update()
    {
        $result = User::update();
        
        if ($result == $this->status_success)
        {
            $_SESSION["alert_success"] = $this->save_success;
            echo "";
        }
        else
        {
            $_SESSION["alert_danger"] = $this->save_error;
            echo "";
        }
    }

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