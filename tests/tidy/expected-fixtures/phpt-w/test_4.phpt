--TEST--
Bug #35382 (Comment in end of file produces fatal error)
--FILEEOF--
<?php
echo 'Hello World';
function foo() {
    $i = 1;




}
//last line comment
?>
--EXPECT--

Hello World    

