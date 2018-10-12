--TEST--
Bug #35382 (Comment in end of file produces fatal error)
--FILEEOF--
<?php
echo 'Hello World';
//last line comment
?>
--EXPECT--
Hello World    
