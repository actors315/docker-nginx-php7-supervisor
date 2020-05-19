FROM actors315/nginx-fpm:v1
MAINTAINER actors315 "actors315@gmail.com"
EXPOSE 22
EXPOSE 80 443
EXPOSE 9001

# simple conf file
# COPY https.sso.lingyin99.com.conf /usr/local/nginx/conf/conf.d/https.sso.lingyin99.com.conf

ENTRYPOINT ["/usr/bin/supervisord","--nodaemon"]