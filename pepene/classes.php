<?php 

class Connexion
    {
        private string $querymail = "SELECT * FROM user where EMAIL Like ? ";
        private string $querypwd = "SELECT * FROM user INNER JOIN `associate_role` on associate_role.ID_USER=user.ID_USER INNER JOIN `role` on associate_role.ID_ROLE=role.ID_ROLE where PASSWORD Like ? and EMAIL like ? ";
        private string $Email= "";
        private string $passwordlogin= "";
        private string $servername = 'localhost';
        private string $username = 'root';
        private string $password_db = '';
        private $conn;
        private $connmail;
        private $result0;
        private $connpwd;
        private $result1;
        private $row1;


        public function IDs(){
            $this->Email= htmlspecialchars($_POST['E-mail']);
            $this->passwordlogin= htmlspecialchars($_POST['Password']);
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
                        $this->connmail = $this->conn->prepare($this->querymail);
                        $this->connmail->bindValue(1,$this->Email, PDO::PARAM_STR);
                        $this->connmail->execute();
                        $this->result0 = $this->connmail->fetchAll(PDO::FETCH_BOTH);
                        if ($this->connmail->rowCount()==0){
                            echo "Cet Email n'existe pas";
                        }
                        else {
                            $this->connpwd = $this->conn->prepare($this->querypwd);
                            $this->connpwd->bindValue(1,$this->passwordlogin, PDO::PARAM_STR);
                            $this->connpwd->bindValue(2,$this->Email, PDO::PARAM_STR);
                            $this->connpwd->execute();
                            $this->result1 = $this->connpwd->fetchAll(PDO::FETCH_BOTH);
                        if ($this->connpwd->rowCount()==0){
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
                                $this->passwordlogin,
                                [
                                    'expires' => time() + 365*24*3600,
                                ]
                            );
                            header("Location: a-home.php");
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
    
            
           
            
?>