# 开发工具集

包含软件列表如下  

* 系统版本 CentOS Linux release 7.8.2003 (Core)  
* nginx 版本 1.18.0  
* PHP 版本 7.3.18  
* Composer 版本 1.10.6  
* Git 版本 
* MySQL 版本 
* MongoDB 版本 mongodb-linux-x86_64-4.0.18  
* Redis 版本 redis-5.0.8  

# clone

```
git clone https://github.com/actors315/docker-nginx-php7-supervisor.git
```

根据需要修改相关配置  

修改 Dockerfile 选择所需要的服务  

## 构建镜像

```
cd docker-nginx-php7-supervisor/
docker build .
```

## 使用

```
docker run --name lingyin-web -p 9001:9001 -p 2222:22 -p 80:80 -p 443:443 -v F:\www:/data/www -itd actors315/webdev:v2
```