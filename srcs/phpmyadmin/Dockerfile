# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qgimenez <qgimenez@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/23 11:07:29 by user42            #+#    #+#              #
#    Updated: 2021/01/11 11:40:28 by qgimenez         ###   ########.fr        #
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
    php7-phar \
	php7-session \
	php7-mbstring \
    openssl
	
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz \
	&& tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz \
	&& mv phpMyAdmin-5.0.2-all-languages /www \
	&& rm phpMyAdmin-5.0.2-all-languages.tar.gz

RUN   mkdir -p etc/ssl
RUN   openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/selfsigned.key -out /etc/ssl/certs/selfsigned.crt -subj "/C=FR/ST=Paris/L=Paris/O=qgimenez/OU=qgimenez/CN=qgimenez.com"

COPY	./nginx.conf /etc/nginx/nginx.conf
COPY	./config.inc.php /www/phpMyAdmin-5.0.2-all-languages

COPY	./run.sh .
RUN		chmod +x ./run.sh

EXPOSE 5000

CMD		[ "./run.sh" ]