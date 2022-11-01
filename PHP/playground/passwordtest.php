<?php
    echo "ENTER PASSWORD : ";
    $password = readline();
    echo "CONFIRM PASSWORD : ";
    $confirm = readline();
    if ($password === $confirm){
        echo "PASSWORD MATCH";
    }
    else {
        echo "PASSWOD DON'T MATCH TRY AGAIN";
    }

?>
<!-- IMPLEMENT FUNCTIONS -->