FROM eboraas/apache
MAINTAINER Jon Shaulis <jon@mscreations.net>

RUN apt-get update && apt-get -y install php5 php5-gd php-http-request2 php5-imagick php-xdebug vim && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN /usr/sbin/a2dismod 'mpm_*' && /usr/sbin/a2enmod mpm_prefork

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

