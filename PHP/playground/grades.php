<?php
     declare(strict_types =1);
    function inputcat_marks(){
        echo "ENTER CAT MARKS : ";
        $cat = readline();
        if ($cat <= 30){
            echo "VALID CAT MARKS : ". "\n";
        }
        else {
            echo "INVALID CAT MARKS : ";
            inputcat_marks();
        }
        return $cat ;

    }

    function inputexam_marks(){
        echo "ENTER EXAM MARKS : ";
        $exam = readline();
        if ($exam <= 70){
            echo "VALID EXAM MARKS :". "\n";
        }
        else {
            echo "INVALID EXAM MARKS : ";
            inputexam_marks();
        }
        return $exam ;

    }

    function calculate_marks($catone,$cattwo, $exammarks ){
        return $exammarks + ($catone+$cattwo)/2;
    }

    inputcat_marks();
    inputexam_marks();

?>