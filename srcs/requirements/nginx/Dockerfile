FROM debian:buster

ARG CERT
ARG CERT_KEY

RUN apt-get update && \
    apt-get install -y \
    nginx \
    openssl

RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/L=Kazan/O=school_21/OU=dkarisa/CN=dkarisa.42.fr" -keyout ${CERT_KEY} -out ${CERT}

COPY ./config/nginx.conf /etc/nginx/conf.d/nginx.conf
EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
