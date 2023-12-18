FROM debian:buster

RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

COPY ./tools/install_wp.sh /usr/local/bin

RUN test -f /usr/local/bin/install_wp.sh && chmod +x /usr/local/bin/install_wp.sh

ENTRYPOINT [ "/usr/local/bin/install_wp.sh" ]

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]