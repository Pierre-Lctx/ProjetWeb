<?php

    Class User
    {
    //List all
    public function all($per_page)
    {
        $db = DB::getInstance();
        if (isset($_GET["page"]))
        {
            $page = (int)$_GET["page"];
        }
        else
        {
            $page = 1;
        }

        if ($page > 1)
        {
            $start = ($page * $per_page) - $per_page;
        }
        else
        {
            $start = 0;
        }

        // query get pagination, page_total
        $page_num = $db->prepare("SELECT count(*) FROM `personne` where NOM = ? and PRENOM = ?");     //Mettre la requête de selection de count de users where nom et prenom et age = aux variables
        $page_num->execute(["Lechatreux", "Pierre"]);
        $page_total = $page_num->fetchColumn();
        $pagination = ceil($page_total / $per_page);

        // query get list data
        // your query is select all of them (SELECT * FROM users LIMIT {$start}, $per_page)
        // or add conditions with last_name and age value

        $NOM = "Lechatreux";
        $PRENOM = "Pierre";
        $request = $db->prepare("SELECT * FROM personne WHERE NOM = ? AND PRENOM = ? LIMIT {$start}, $per_page ");

        $lists = [];
        if ($request->execute([$NOM, $PRENOM]))
        {
            foreach ($request->fetchAll() as $item)
            {
                $list = [];
                $list["PRENOM"] = $item["PRENOM"];
                $list["NOM"] = $item["NOM"];

                $lists[] = $list;
            }
        }

        return [$lists, $pagination, $page_total];
        }
    }

    //Find
    public function find(int $id)
    {
        $db = DB::getInstance();
        $sql = $db->prepare("SELECT * FROM users WHERE id = ? ");
        $sql->execute([$id]);
        $list = [];
        if ($item = $sql->fetch())
        {
        // code …
        }

    return $list;
    }

    //Store Action
    public function store()
    {
        try {
            $db = DB::getInstance();
            // insert to users table
            $sql = "INSERT INTO users (first_name, last_name, age) VALUES (?, ?, ?)";
            $row = $db->prepare($sql);

            if ($row->execute([$first_name, $last_name, $age]))
            {
                $result = 1; // successful
            }
            else
            {
                $result = 0; // failed
            }
        }
        catch (PDOException $ex)
        {
            $result = $ex->getMessage();
        }
        return $result;
    }

    //Update Action
    public function update()
    {
        try
        {
            $db = DB::getInstance();
            // update to users table
            $sql = "UPDATE users SET first_name = ?, last_name = ?, age = ? WHERE id = ?";
            $row = $db->prepare($sql);

            if ($row->execute([$first_name, $last_name, $age, $id]))
            {
                $result = 1; // successful
            }
            else
            {
                $result = 0; // failed
            }
        }
        catch (PDOException $ex)
        {
            $result = $ex->getMessage();
        }
        return $result;
    }

    //Delete Action
    public function delete(int $id)
    {
        try
        {
            $db = DB::getInstance();
            // delete to users table
            $sql = "DELETE FROM users WHERE id = ?";
            $row = $db->prepare($sql);

            if ($row->execute([$id]))
            {
                $result = 1; // successful
            }
            else
            {
                $result = 0; // failed
            }
        }
        catch (PDOException $ex)
        {
            $result = $ex->getMessage();
        }
        return $result;

    }
?>