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
            // or add conditions with NOM and age value

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
        

        //Select Section
        public function findUserByID(int $id)
        {
            $db = DB::getInstance();
            $sql = $db->prepare("SELECT * FROM users WHERE id = ? ");
            $sql->execute([$id]);
            foreach ($sql->fetch() as $item)
            {
                $list = [];
                $list["ID_USER"] = $item["ID_USER"];
                $list["ID_ADDRESS"] = $item["ID_ADDRESS"];
                $list["ID_PROMOTION"] = $item["ID_PROMOTION"];
                $list["LAST_NAME"] = $item["LAST_NAME"];
                $list["FIRST_NAME"] = $item["FIRST_NAME"];
                $list["EMAIL"] = $item["EMAIL"];
                $list["BIRTHDAY"] = $item["BIRTHDAY"];
                $list["PASSWORD"] = $item["PASSWORD"];
            }

        return $list;
        }

        public function findUserByName(string $FirstName, string $LastName)
        {
            $db = DB::getInstance();
            $sql = $db->prepare("SELECT * FROM users WHERE FIRST_NAME = ? and LAST_NAME = ?");
            $sql->execute([$FirstName, $LastName]);
            foreach ($sql->fetch() as $item)
            {
                $list = [];
                $list["ID_USER"] = $item["ID_USER"];
                $list["ID_ADDRESS"] = $item["ID_ADDRESS"];
                $list["ID_PROMOTION"] = $item["ID_PROMOTION"];
                $list["LAST_NAME"] = $item["LAST_NAME"];
                $list["FIRST_NAME"] = $item["FIRST_NAME"];
                $list["EMAIL"] = $item["EMAIL"];
                $list["BIRTHDAY"] = $item["BIRTHDAY"];
                $list["PASSWORD"] = $item["PASSWORD"];
            }

        return $list; test
        }

        public function findIntershipByName(string $CompanyName)
        {
            $db = DB::getInstance();
            $sql = $db->prepare("SELECT offer.ID_OFFER, company.COMPANY_NAME, offer.OFFER_NAME, offer.MISSION, offer.SALARY, offer.MIN_DURATION, offer.MAX_DURATION, offer.OFFER_DATE, offer.TRUST, evaluate.EVALUATION, offer.NUMBER_OF_PLACES FROM offer inner join company on offer.ID_COMPANY = company.ID_COMPANY inner join evaluate on evaluate.ID_OFFER = offer.ID_OFFER WHERE company.COMPANY_NAME = ?");
            $sql->execute([$CompanyName]);
            foreach ($sql->fetch() as $item)
            {
                $list = [];
                $list["ID_OFFER"] = $item["ID_OFFER"];
                $list["COMPANY_NAME"] = $item["ID_ADDRESSCOMPANY_NAME"];
                $list["OFFER_NAME"] = $item["OFFER_NAME"];
                $list["MISSION"] = $item["MISSION"];
                $list["SALARY"] = $item["SALARY"];
                $list["MIN_DURATION"] = $item["MIN_DURATION"];
                $list["MAX_DURATION"] = $item["MAX_DURATION"];
                $list["TRUST"] = $item["TRUST"];
                $list["EVALUATION"] = $item["EVALUATION"];
                $list["NUMBER_OF_STUDENTS"] = $item["NUMBER_OF_STUDENTS"];
                $list["OFFER_DATE"] = $item["OFFER_DATE"];
                $list["OFFER_DATE"] = $item["OFFER_DATE"];
            }

        return $list;
        }

        //Store Action
        public function store()
        {
            try {
                $db = DB::getInstance();
                // insert to users table
                $sql = "INSERT INTO users (PRENOM, NOM) VALUES (?, ?)";
                $row = $db->prepare($sql);

                if ($row->execute([$PRENOM, $NOM]))
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
                $sql = "UPDATE users SET PRENOM = ?, NOM = ?, age = ? WHERE id = ?";
                $row = $db->prepare($sql);

                if ($row->execute([$PRENOM, $NOM, $id]))
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
    }
?>