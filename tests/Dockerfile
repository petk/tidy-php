FROM alpine

RUN apk add --no-cache \
    curl \
    git \
    bats \
    php82 \
    php82-zip \
    php82-openssl \
    php82-mbstring \
    php82-phar \
    php82-tokenizer \
    php82-xmlwriter \
    php82-simplexml \
    && ln -s /usr/bin/php82 /usr/bin/php \
    && echo "memory_limit = -1" >> /etc/php82/php.ini \
    && curl -sS https://getcomposer.org/installer | php -- \
        --install-dir=/usr/bin --filename=composer \
    && curl -L https://cs.symfony.com/download/php-cs-fixer-v3.phar -o php-cs-fixer \
    && chmod a+x php-cs-fixer \
    && mv php-cs-fixer /usr/local/bin/php-cs-fixer

ENV PATH "$PATH:/root/.composer/vendor/bin"

WORKDIR "/opt/app"
