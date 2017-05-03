FROM ubuntu:xenial

MAINTAINER Jon Shaulis <jon@mscreations.net>

RUN apt-get update \
	&& apt-get -q -y dist-upgrade \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get -q -y install --no-install-recommends \
	apache2 \
	php7.0 \
	libapache2-mod-php7.0 \
	php7.0-gd \
	php-http-request2 \
	php-imagick \
	php-xdebug \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
EXPOSE 443
EXPOSE 9000

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
