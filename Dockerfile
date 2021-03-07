FROM centos:7

MAINTAINER actors315 "actors315@gmail.com"

RUN yum install -y epel-release

RUN yum install -y wget gcc make bzip2 supervisor autoconf automake libtool \
	openssl-devel pcre-devel zlib-devel libcurl-devel libxml2-devel sqlite-devel \
	&& cd /usr/local/src \
	&& wget http://nginx.org/download/nginx-1.18.0.tar.gz \
	&& wget https://www.php.net/distributions/php-7.3.18.tar.bz2 \
	&& wget https://github.com/kkos/oniguruma/archive/v6.9.4.tar.gz -O oniguruma-6.9.4.tar.gz \
# 安装 nginx
	&& cd /usr/local/src && tar -xvf nginx-1.18.0.tar.gz \
	&& cd /usr/local/src/nginx-1.18.0 \
	&& ./configure --prefix=/usr/local/nginx --with-http_ssl_module && make && make install \
	&& echo 'export PATH=/usr/local/nginx/sbin:$PATH' >> /etc/profile \
# 安装 oniguruma
	&& cd /usr/local/src && tar -xvf oniguruma-6.9.4.tar.gz \
	&& cd /usr/local/src/oniguruma-6.9.4 \
	&& export LANGUAGE="en_US.UTF-8" && export LANG=en_US:zh_CN.UTF-8 && export LC_ALL=C \
	&& ./autogen.sh && ./configure --prefix=/usr \
# 安装 php
	&& cd /usr/local/src && tar -xvf php-7.3.18.tar.bz2 \
	&& cd /usr/local/src/php-7.3.18 \
	&& ./configure --prefix=/usr/local/php --enable-fpm --with-fpm-user=www-data \
	--with-fpm-group=www-data --enable-shared --enable-pdo --with-pdo-mysql \
	--with-openssl --with-curl --enable-mbstring \
	&& make && make install \
	&& cp /usr/local/src/php-7.3.18/php.ini-production /usr/local/php/lib/php.ini \
	&& echo 'export PATH=/usr/local/php/bin:$PATH' >> /etc/profile \
	&& mkdir -p /var/run/supervisor && chmod -R 666 /var/run/supervisor \
# 清理
	&& rm -rf /usr/local/src/* \
	&& yum remove -y gcc make wget autoconf automake libtool \
	&& yum remove -y epel-release \
	&& yum clean all
	

# 根据需要开放端口，打开前面的注释
# ssh
# EXPOSE 22

# nginx
# EXPOSE 80 443

# php-fpm
# EXPOSE 9001

# mysql
# EXPOSE 3306

# redis
# EXPOSE 6379

# mongodb
# EXPOSE 27017

# nginx 配置文件,若未变更就不需要另外复制
# COPY nginx/nginx.conf /usr/local/nginx/conf/nginx.conf
# COPY nginx/conf.d/default.conf /usr/local/nginx/conf/conf.d/default.conf
# COPY nginx/conf.d/ssl.conf /usr/local/nginx/conf/conf.d/ssl.conf

# php-fpm 配置文件,若未变更就不需要另外复制
# COPY php-fpm/php-fpm.conf /usr/local/php/etc/php-fpm.conf
# COPY php-fpm/php-fpm.d/www.conf /usr/local/php/etc/php-fpm.d/www.conf

# mysql 配置文件，拷贝需要启动的服务
# COPY mysql/my.cnf /etc/my.cnf

# redis 配置文件,若未变更就不需要另外复制
# COPY redis/redis.conf /usr/local/redis/etc/redis.conf

# mongodb 配置文件,若未变更就不需要另外复制
# COPY mongodb/mongodb.conf /usr/local/mongodb/mongodb.conf

# supervisor 配置文件，拷贝需要启动的服务
# COPY supervisor/supervisord.conf /etc/supervisord.conf
# COPY supervisor/supervisord.d/sshd.ini /etc/supervisord.d/sshd.ini
# COPY supervisor/supervisord.d/nginx.ini /etc/supervisord.d/nginx.ini
# COPY supervisor/supervisord.d/php-fpm.ini /etc/supervisord.d/php-fpm.ini
# COPY supervisor/supervisord.d/mysqld.ini /etc/supervisord.d/mysqld.ini
# COPY supervisor/supervisord.d/mongodb.ini /etc/supervisord.d/mongodb.ini

ENTRYPOINT ["/usr/bin/supervisord","--nodaemon"]