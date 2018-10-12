--TEST--

Bug #35382 (Comment in end of file produces fatal error)
--CREDITS--

Peter Kokot
--FILEEOF--


<?php
echo 'Hello World';
//last line comment
?>
--EXPECT--


Hello World    
