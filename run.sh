#!/bin/sh

git clone --depth=1 git://github.com/php/php-src
wget https://raw.githubusercontent.com/petk/tidy-php/master/tidy.php -o php-src/scripts/dev/tidy.php
