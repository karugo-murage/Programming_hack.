<?php
    function output_even_numbers($min_number, $max_number){
        $even_numbers=[];
        for ($count = $min_number; $count <= $max_number; $count++){
            $n = 0;
            if ($count%2==0){
              /*array_push($even_numbers, $count);
                echo $count;
                echo "\n";*/
                $even_numbers[$n] = $count;
                $n++;
            }
        }
            
            
        foreach ($even_numbers as $numbers) {
            echo $numbers, "\n";
        }
    }
     output_even_numbers(87,96);
?>





 