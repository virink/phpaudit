FROM alpine:3.5

MAINTAINER Virink "virink@outlook.com"

LABEL Email="virink@outlook.com"
LABEL Blog="https://www.virzz.com"
LABEL Github="https://github.com/virink"
LABEL description="openssh-server on ubuntu"

LABEL Usage="docker run -d -it -e virink_host={your ip} -p 80:80 -v /{ yourpath }:/www --name=audit virink/phpaudit"

RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.5/main/">/etc/apk/repositories

RUN apk add --update --no-cache \
nginx \
php5 \
php5-dev \
php5-mysql \
php5-mysqli \
php5-pdo \
php5-pdo_mysql \
php5-sqlite3 \
php5-curl \
php5-openssl \
php5-mcrypt \
php5-zlib \
php5-gd \
php5-exif \
php5-zip \
php5-json \
php5-iconv \
php5-gettext \
php5-xml \
php5-phar

COPY . /

RUN mv xdebug.so /usr/lib/php5/modules/xdebug.so \
&& echo "[XDebug]">>/etc/php5/php.ini \
&& echo "zend_extension=xdebug.so">>/etc/php5/php.ini \
&& echo "xdebug.remote_enable=1">>/etc/php5/php.ini \
&& echo "xdebug.remote_port=9090">>/etc/php5/php.ini \
&& echo "xdebug.remote_host=virink_host">>/etc/php5/php.ini \
&& chmod u+x /start.sh \
&& mv /nginx.conf /etc/nginx/conf.d/default.conf \
&& rm -rf xdebug*

EXPOSE 80
VOLUME ["/www"]

CMD ["sh","/start.sh"]
