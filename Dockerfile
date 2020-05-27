FROM actors315/webdev:v1
MAINTAINER actors315 "actors315@gmail.com"

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

# supervisor 配置文件，拷贝需要启动的服务
# COPY supervisor/supervisord.conf /etc/supervisord.conf
# COPY supervisor/supervisord.d/sshd.ini /etc/supervisord.d/sshd.ini
# COPY supervisor/supervisord.d/nginx.ini /etc/supervisord.d/nginx.ini
# COPY supervisor/supervisord.d/php-fpm.ini /etc/supervisord.d/php-fpm.ini
# COPY supervisor/supervisord.d/mysqld.ini /etc/supervisord.d/mysqld.ini
# COPY supervisor/supervisord.d/mongodb.ini /etc/supervisord.d/mongodb.ini

ENTRYPOINT ["/usr/bin/supervisord","--nodaemon"]