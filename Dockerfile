FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apache2 libapache2-mod-php zip

COPY www/ /var/www/html/

COPY round2 /tmp/round2/
RUN zip -r /var/www/html/hardstuff.zip /tmp/round2

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
