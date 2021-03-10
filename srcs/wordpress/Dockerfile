# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qgimenez <qgimenez@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/15 11:15:21 by user42            #+#    #+#              #
#    Updated: 2021/01/13 17:02:48 by qgimenez         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM img_nginx

RUN mkdir -p /www
RUN apk add --update --no-cache php7-common \
    php7-fpm \
    php7 \
    php7-opcache \
    php7-iconv \
    php7-json \
    php7-gd \
    php7-curl \
    php7-xml \
    php7-mysqli \
    php7-imap \
    php7-cgi \
    fcgi \
    php7-pdo \
    php7-pdo_mysql \
    php7-soap \
    php7-xmlrpc \
    php7-posix \
    php7-mcrypt \
    php7-gettext \
    php7-ldap \
    php7-ctype \
    php7-dom \
    php7-cli \
    php-pear \
    php7-pspell \
    php7-zlib \
    php7-phar

RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xvf latest.tar.gz \
    && mv wordpress /www \
    && rm latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY	./nginx.conf /etc/nginx/nginx.conf

COPY    ./wp-config.php /www/wordpress

COPY	./run.sh .
RUN		chmod +x ./run.sh

EXPOSE	5050

ENTRYPOINT [ "./run.sh" ]