# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/15 11:15:21 by user42            #+#    #+#              #
#    Updated: 2021/02/18 16:59:22 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	img_nginx

RUN		apk update && apk add openssl

RUN		mkdir -p etc/ssl
RUN		openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/selfsigned.key -out /etc/ssl/certs/selfsigned.crt -subj "/C=FR/ST=Paris/L=Paris/O=qgimenez/OU=qgimenez/CN=qgimenez.com"

COPY	./nginx.conf /etc/nginx/nginx.conf
COPY	html/index.html /etc/nginx/html/

COPY	./run.sh .
RUN		chmod +x ./run.sh

EXPOSE	80 443

CMD		./run.sh