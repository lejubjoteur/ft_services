# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/27 09:14:01 by user42            #+#    #+#              #
#    Updated: 2021/02/05 16:54:49 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN		apk update && apk add --no-cache vsftpd openssl

RUN		mkdir -p etc/ssl
RUN		openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/selfsigned.key -out /etc/ssl/certs/selfsigned.crt -subj "/C=FR/ST=Paris/L=Paris/O=qgimenez/OU=qgimenez/CN=qgimenez.com"

COPY	./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY	./fichiertest.txt .
COPY	./run.sh .
RUN		chmod +x ./run.sh

EXPOSE  21 30021

CMD	["./run.sh"]