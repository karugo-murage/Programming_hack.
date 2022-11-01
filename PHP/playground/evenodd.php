<?php
    echo "ENTER A NUMBER AND I WILL TELL IF IT IS EVEN OR ODD :" ."\n";
    $test_number = readline();
    if ($test_number%2 == 0)
        echo $test_number . "is an even number" ."\n";
    else
        echo $test_number . " is an odd number" ."\n";

?>