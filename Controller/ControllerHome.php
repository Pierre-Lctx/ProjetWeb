<?php

class ControllerHome
{
    private $_addressManager;
    private $_view;

    public function __construct($url)
    {
        if(isset($url) && count($url) > 1)
            throw new Exception('Page introuvable');
        else
            $this->address();
    }

    private function address()
    {
        $this->_addressManager = new AddressManager;
        $address = $this->_addressManager->getAddress();

        require_once('View\viewAcceuil.php');
    }
}

?>