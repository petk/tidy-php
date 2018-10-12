FROM phpearth/php:7.2-cli

RUN echo "@edgecommunity http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk add --no-cache bats@edgecommunity \
    && wget https://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -O php-cs-fixer \
    && chmod a+x php-cs-fixer \
    && mv php-cs-fixer /usr/local/bin/php-cs-fixer
