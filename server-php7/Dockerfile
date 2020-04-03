# Version: 1.0.0
FROM local/centos7-base
MAINTAINER RBDG <rbdg@envionsoftware.com>

# [ Common]
RUN yum install -y git \
  mailx \
  mysql \
  ; yum clean all
# [/Common]

# [ PHP]
RUN yum install -y php72-php-fpm \
  php72-php-cli \
  php72-php-opcache \
  php72-php-intl \
  php72-php-gd \
  php72-php-mbstring \
  php72-php-mysqlnd \
  php72-php-pecl-geoip \
  php72-php-pecl-memcache \
  php72-php-pecl-solr \
  php72-php-odbc \
  php72-php-pdo \
  php72-php-bcmath \
  php72-php-dom \
  ; yum clean all

RUN chkconfig --levels 235 php72-php-fpm on ; yum clean all
ADD php/www.conf /etc/opt/remi/php72/php-fpm.d/www.conf
ADD php/php.ini /etc/opt/remi/php72/php.ini
# [/PHP]

# [ NGINX]
RUN yum install -y nginx ; yum clean all
RUN chkconfig --levels 235 nginx on
RUN rm -f /etc/nginx/conf.d/*.conf
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/gateway-app.conf /etc/nginx/conf.d/gateway-app.conf
ADD nginx/gateway_ssl /etc/nginx/gateway_ssl
ADD nginx/gateway_fastcgi_params /etc/nginx/gateway_fastcgi_params
ADD nginx/gateway_access_control /etc/nginx/gateway_access_control
ADD nginx/gateway_perfomance /etc/nginx/gateway_perfomance
ADD ssl/rbdigitaldev_com.key /etc/nginx/ssl/rbdigitaldev_com.key
ADD ssl/rbdigitaldev_com.crt /etc/nginx/ssl/rbdigitaldev_com.crt
ADD ssl/ssl_ca_bundle.pem /etc/nginx/ssl/ssl_ca_bundle.pem
ADD ssl/gateway_ca_bundle.pem /etc/nginx/ssl/gateway_ca_bundle.pem
ADD ssl/ssl_password /etc/nginx/ssl/ssl_password
ADD ssl/dhparams.pem /etc/nginx/ssl/dhparams.pem
# [/NGINX]

# [ PDF]
RUN yum install -y libpng \
  libjpeg \
  openssl \
  icu \
  libX11 \
  libXext \
  libXrender \
  xorg-x11-fonts-75dpi \
  xorg-x11-fonts-Type1 \
  ; yum clean all
RUN cd /tmp && wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.2.1/wkhtmltox-0.12.2.1_linux-centos7-amd64.rpm && yum localinstall -y /tmp/wkhtmltox-0.12.2.1_linux-centos7-amd64.rpm ; yum clean all && ln -s /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
# [/PDF]

RUN mkdir /var/www && mkdir /var/www/projects && mkdir /var/www/projects/gateway && mkdir /var/www/projects/gateway/app && chmod 775 /var/www/projects/gateway/app && chown -R apache:apache /var/www/projects/gateway/app
VOLUME ["/var/www/projects/gateway/app"]

ADD start.sh /var/infrastructure/start.sh
RUN chmod a+rx /var/infrastructure/start.sh
ENTRYPOINT ["/bin/bash", "-c", "/var/infrastructure/start.sh"]

USER root
EXPOSE 80
EXPOSE 443

#docker build --rm -t local/server-php7 .
#docker run --name=gateway-server -v <data-folder>:/var/infrastructure/storage/data -v <app-folder>:/var/www/projects/gateway/app -p 80:80 -p 443:443 -i -t -d local/server-php7
#docker attach gateway-server
#docker stop gateway-server
#docker start gateway-server
#docker rm gateway-server