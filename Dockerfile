FROM debian:jessie
MAINTAINER Damien Debin <damien.debin@smartapps.fr>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

RUN \
 apt-get update &&\
 apt-get -y --no-install-recommends install locales lsb-release wget ca-certificates apt-utils &&\
 echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen &&\
 locale-gen en_US.UTF-8 &&\
 /usr/sbin/update-locale LANG=en_US.UTF-8 &&\
 echo "mysql-server mysql-server/root_password password root" | debconf-set-selections &&\
 echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections &&\
 apt-get -y --no-install-recommends install git php5-mysqlnd php5-cli php5-mcrypt php5-curl php-gettext php5-gd php5-imagick imagemagick openssh-client curl software-properties-common gettext zip mysql-server mysql-client apt-transport-https &&\
 curl -sL https://deb.nodesource.com/setup_4.x | bash - &&\
 apt-get -y --no-install-recommends install nodejs &&\
 apt-get autoclean && apt-get clean && apt-get autoremove

RUN \
 sed -ri -e "s/^variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/cli/php.ini

RUN \
 curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin &&\
 npm install --no-color --production --global gulp-cli webpack mocha &&\
 rm -r /root/.npm /root/.composer /tmp/* /var/lib/apt/lists/*
