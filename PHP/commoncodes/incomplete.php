<?php
    function repeatStr($n, $str){
        for($initial=0; $initial<$n ; $initial++){
          $emptyArray = []; 
          array_push($emptyArray,$str);
          echo $emptyArray;
        }
      }

    repeatStr(3, "KARUGO");
?>