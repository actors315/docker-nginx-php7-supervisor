# docker-nginx-php7-supervisor

系统版本 CentOS Linux release 7.8.2003 (Core)  
nginx 版本 1.18.0  
PHP 版本 PHP 7.3.18  

## 使用

```
docker run --name lingyin-web -p 9001:9001 -p 2222:22 -p 80:80 -p 443:443 -v F:\www:/data/www -itd actors315/nginx-fpm:v1
```