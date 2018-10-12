--TEST--

Bug #35382 (Comment in end of file produces fatal error)
--FILE--

<?php
echo 'Hello World';
//last line comment
?>
--EXPECT--

Hello World
