# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qgimenez <qgimenez@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/17 12:30:10 by user42            #+#    #+#              #
#    Updated: 2021/01/14 17:05:27 by qgimenez         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update && apk add --no-cache mysql mysql-client

COPY /config/my.cnf /etc/mysql/my.cnf

COPY run.sh /run.sh
COPY start.sh /start.sh

RUN chmod +x /start.sh
RUN chmod +x /run.sh

EXPOSE 3306

CMD ["/run.sh"]