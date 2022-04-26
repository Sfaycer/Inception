FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
    curl wget php7.3 php7.3-cli php7.3-fpm php7.3-opcache \
	php7.3-curl php7.3-mbstring php7.3-zip php7.3-xml php7.3-mysqli

#RUN wget https://wordpress.org/latest.tar.gz
#RUN tar -xzvf latest.tar.gz && rm -rf latest.tar.gz
#RUN mv wordpress /var/www/html/
COPY ./distributive/latest.tar.gz /var/www/
RUN cd /var/www/ && tar -xzvf latest.tar.gz
RUN mv /var/www/wordpress /var/www/html
COPY ./configs/wp-config.php /var/www/html/wp-config.php
COPY ./configs/www.conf /etc/php/7.3/fpm/pool.d

# Give rights to files (volume data)
RUN chown -R www-data:www-data /var/www/html/* && \
chmod -R 775 /var/www/html/*

COPY ./tools/start.sh /
EXPOSE 9000
ENTRYPOINT [ "bash", "./start.sh" ]
