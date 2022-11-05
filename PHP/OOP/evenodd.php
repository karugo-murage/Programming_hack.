<?php
    class Classify{
        public $number;

        function __construct($name) {
            $this->name = $name;
        }
        function get_number(){
            return $this->number."\n";
        }
        function classify_number(){
            if ($this->number%2 == 0)
                 echo $this->number . " is an even number" ."\n";
            else
                echo $this->number. " is an odd number" ."\n";
        }
        
    }

    $odd = new Classify(7);
    $even = new Classify(8);

    echo $odd->get_number();
    echo $odd->classify_number();
    echo $even->classify_number();
?>