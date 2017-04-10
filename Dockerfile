FROM ubuntu:xenial
MAINTAINER Dave Hensley <github@sendtodave.com>

# Install/update software
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y dist-upgrade

RUN apt-get install -y apache2 composer libapache2-mod-php mysql-server php-bcmath php-bz2 php-curl php-gd php-geoip \
    php-gmp php-intl php-mbstring php-mcrypt php-mysql php-readline php-recode php-soap php-sqlite3 php-xdebug php-xml \
    php-xmlrpc php-zip

# Copy configurations + startup script so it can be executed when the container starts
COPY container/apache2/conf-available/htaccess.conf /etc/apache2/conf-available/
COPY container/startup.sh /usr/local/sbin/

# Expose the container's http port
EXPOSE 80

# Run the container's startup script
CMD "/usr/local/sbin/startup.sh"
