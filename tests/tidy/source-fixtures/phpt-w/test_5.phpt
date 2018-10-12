--TEST--    
Bug #35382 (Comment in end of file produces fatal error)    
--FILEEOF--    
<?php    
echo 'Hello World';    
function foo() {
    $i = 1;  
    
	  
    $heredoc = <<<END
        a    
END;

echo <<<'EOT'
My name is "$name". I am printing some $foo->foo.   
Now, I am printing some {$foo->bar[1]}.   
This should not print a capital 'A': \x41
EOT;

	
    	      
}  
//last line comment    
?>    
--EXPECT--    

Hello World    

