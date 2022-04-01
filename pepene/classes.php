<?php 

class Connexion
    {

        private $querymail = "SELECT * FROM user where EMAIL Like ? ";
        private $querypwd = "SELECT * FROM user INNER JOIN `associate_role` on associate_role.ID_USER=user.ID_USER INNER JOIN `role` on associate_role.ID_ROLE=role.ID_ROLE where PASSWORD Like ? and EMAIL like ? ";
        private $Email= "";
        private $passwordlogin= "";
        private $servername = 'localhost';
        private $username = 'root';
        private $password_db = '';
        private $conn;
        private $connMail;
        private $result0;
        private $connPwd;
        private $result1;
        private $row1;


        public function IDs(){
            $this->Email= htmlspecialchars($_POST['E-mail']);
            $this->passwordLogin= htmlspecialchars($_POST['Password']);
        }
        public function connecter_site(){
            if (isset($_POST['E-mail']) &&  isset($_POST['Password'])) {
                $this->IDs();
                 //On essaie de se connecter
                try{
                    $this->conn = new PDO("mysql:host=$this->servername;dbname=projetweb", $this->username, $this->password_db);
                    //On définit le mode d'erreur de PDO sur Exception
                    $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    if ($this->Email==""){
                        echo "Rentrez un E-mail svp";
                    }
                    else {
                        $this->connMail = $this->conn->prepare($this->queryMail);
                        $this->connMail->bindValue(1,$this->Email, PDO::PARAM_STR);
                        $this->connMail->execute();
                        $this->result0 = $this->connMail->fetchAll(PDO::FETCH_BOTH);
                        if ($this->connMail->rowCount()==0){
                            echo "Cet Email n'existe pas";
                        }
                        else {
                            $this->connPwd = $this->conn->prepare($this->queryPwd);
                            $this->connPwd->bindValue(1,$this->passwordLogin, PDO::PARAM_STR);
                            $this->connPwd->bindValue(2,$this->Email, PDO::PARAM_STR);
                            $this->connPwd->execute();
                            $this->result1 = $this->connPwd->fetchAll(PDO::FETCH_BOTH);
                        if ($this->connPwd->rowCount()==0){
                            echo "Ce mot de passe n'est pas bon";
                        }
                        else {
                            echo "Connexion réussie";
                            echo "<br> Bienvenue ";
                            foreach ($this->result1 as $this->row1){
                                echo $this->row1['FIRST_NAME'];
                                echo " ";
                                echo $this->row1['LAST_NAME'];
                                echo " ";
                                echo $this->row1['ROLE_NAME'];
                            }
                            setcookie(
                                'E-mail',
                                $this->Email,
                                [
                                    'expires' => time() + 365*24*3600,
                                ]
                            );
                            setcookie(
                                'Password',
                                $this->passwordLogin,
                                [
                                    'expires' => time() + 365*24*3600,
                                ]
                            );
                            header("Location: home-etud.php");
                        }
                        }
                        
                }
            }
                    
                
                /*On capture les exceptions si une exception est lancée et on affiche
                 *les informations relatives à celle-ci*/
                catch(PDOException $e){
                  echo "Erreur : " . $e->getMessage();
                }
            }
        }
    }
class entreprise {
        
}   
    

class Offer
{
    private $servername = 'localhost';
    private $username = 'root';
    private $password_db = '';
    private $conn;
    private $idOffer;

    public function showOffer()
    {
        
        $servername = 'localhost';
            $username = 'root';
            $password = '';

            //On essaie de se connecter
            try{
                $this->conn = new PDO("mysql:host=$servername;dbname=projetweb", $this->username, $this->password_db);
                //On définit le mode d'erreur de PDO sur Exception
                $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 
                $manyOffer = $this->conn->prepare('SELECT final_offer.ID_OFFER, final_offer.COMPANY_NAME, final_offer.OFFER_NAME, final_offer.MISSION FROM final_offer;');

                $manyOffer->execute();
                $recipeOffer = $manyOffer->fetchAll();

                return $recipeOffer;

            }


            /*On capture les exceptions si une exception est lancée et on affiche
             les informations relatives à celle-ci*/

            catch(PDOException $e){
              echo "Erreur : " . $e->getMessage();
            }      
        
    }

    public function setIdCard($id)
    {
        $idOffer = $id;
    }


    public function offerDesc()
    {
            $servername = 'localhost';
            $username = 'root';
            $password = '';

            $idOfferDesc = 1;

            //On essaie de se connecter
            try{
                $this->conn = new PDO("mysql:host=$servername;dbname=projetweb", $this->username, $this->password_db);
                //On définit le mode d'erreur de PDO sur Exception
                $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 
                $manyOffer = $this->conn->prepare('SELECT final_offer.ID_OFFER, final_offer.COMPANY_NAME, final_offer.OFFER_NAME, final_bind.SKILL_NAME, final_offer.MISSION, final_offer.SALARY, final_offer.MISSION, town.TOWN_NAME, final_offer.MIN_DURATION, final_offer.MAX_DURATION, final_offer.NUMBER_OF_PLACES, final_offer.TRUST FROM final_offer inner join final_bind on final_bind.ID_OFFER = final_offer.ID_OFFER inner join locate on locate.ID_COMPANY = final_offer.ID_COMPANY inner join address on address.ID_ADDRESS = locate.ID_ADDRESS inner join town on address.ID_TOWN = town.ID_TOWN where final_offer.ID_OFFER = '. $idOfferDesc . ''
                );  

                $manyOffer->execute();
                $recipeOffer = $manyOffer->fetchAll();

                return $recipeOffer;

            }


            /*On capture les exceptions si une exception est lancée et on affiche
             les informations relatives à celle-ci*/

            catch(PDOException $e){
              echo "Erreur : " . $e->getMessage();
            } 
    }


}
           
            
?>
