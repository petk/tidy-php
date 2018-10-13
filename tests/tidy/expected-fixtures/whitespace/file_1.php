<?php

class Foo
{
    public function bar( $baz  )
    {
        echo "  
        Multiline           
        
        string      
        ";
    }

}

$heredoc = <<<END
    
This    
    is      
        multiline       
                heredoc

END;
