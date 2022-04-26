FROM debian:buster

RUN apt-get update && \
	apt-get install -y mariadb-server

COPY ./tools/start.sh ./

EXPOSE 3306
ENTRYPOINT ["bash", "./start.sh"]
