<?php

class Addres
{
    private $_id;
    private $_idTown;
    private $_street;
    private $_number;
    private $_zipCode;
    private $_complement;

    // Constructeur
    public function __construct(array $data)
    {
        $this->hydrate($data);
    }

    // Hydratation
    public function hydrate(array $data)
    {
        foreach($data as $key => $value)
        {
            $method = 'set'.ucfirst($key);

            if(method_exists($this, $method))
                $this->$method($value);
        }
    }

    // Setters 

    public function setId($id)
    {
        $id = (int) $id;

        if($id > 0)
            $this->_id = $id;
    }
    public function setIdTown($idTown)
    {
        $idTown = (int) $idTown;

        if($idTown > 0)
            $this->_idTown = $idTown;
    }
    public function setStreet($street)
    {
        if(is_string($street))
            $this->_street = $street;
    }
    public function setNumber($number)
    {
        if(is_string($number))
            $this->_number = $number;
    }
    public function setZipCode($zipCode)
    {
        if(is_string($zipCode))
            $this->_zipCode = $zipCode;
    }
    public function setComplement($complement)
    {
        if(is_string($complement))
            $this->_complement = $complement;
    }

    // Getters

    public function getId()
    {
        return $this->_id;
    }
    public function getIdTown()
    {
        return $this->_idTown;
    }
    public function getStreet()
    {
        return $this->_street;
    }
    public function getNumber()
    {
        return $this->_number;
    }
    public function getZipCode()
    {
        return $this->_zipCode;
    }
    public function getComplement()
    {
        return $this->_Complement;
    }

?>