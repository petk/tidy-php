<?php

return PhpCsFixer\Config::create()
    ->setUsingCache(true)
    ->setRiskyAllowed(true)
    ->setRules([
        '@Symfony' => true,
        'array_syntax' => ['syntax' => 'short'],
        'binary_operator_spaces' => [
            'align_double_arrow' => false,
        ],
        'combine_consecutive_unsets' => true,
        'no_useless_else' => true,
        'no_useless_return' => true,
        'ordered_imports' => true,
        'phpdoc_summary' => false,
        'strict_comparison' => true,
    ])
;
