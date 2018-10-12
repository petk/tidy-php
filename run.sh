#!/bin/sh

git clone --depth=1 git://github.com/php/php-src
wget https://raw.githubusercontent.com/petk/tidy-php/master/tidy.php -O php-src/scripts/dev/tidy.php
chmod +x php-src/scripts/dev/tidy.php
