<?php

class AddressManager extends Model
{
    public function getAddress()
    {
        return $this->getAll('address', 'Addres');
    }
}

?>