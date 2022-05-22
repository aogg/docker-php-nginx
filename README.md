# docker-php-nginx

[![对应容器](http://dockeri.co/image/adockero/php-nginx)](https://hub.docker.com/r/adockero/php-nginx)


php-nginx image based on [webdevops/php-nginx](https://hub.docker.com/r/webdevops/php-nginx) (Contains mysql.so php extensions) （如：增加mysql.so，支持旧框架）

> 1、基础镜像[webdevops/php-nginx](https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-nginx.html)官方文档  
> 2、php镜像也可以参考官方文档：[webdevops/php](https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php.html)  
> 3、大部分都是nginx和fpm在一个容器内的镜像
> 4、7.4-php这类标签是只有php没有nginx的镜像，不特定标识php都是php+nginx



# 镜像tag
> 1、**5.6-mysql**是php5.6版本增加mysql扩展，内部nginx+fpm的组合。用于支持ecshop这类版本低只用mysql原生类库的  
> 2、**5.6-mysql-php**是php5.6版本增加mysql扩展，内部只有fpm。用于支持ecshop这类版本低只用mysql原生类库的，并使用其他nginx容器指向fpm  
> 3、**7.2-lua-host-dir**, **7.2-dev-lua-host-dir**是7.2版本，通过lua脚本实现根据将域名的.切换/，实现自动的不同项目文件夹不同域名。而且支持xip.io和特定框架(ThinkPHP)  
> 4、**7.2-git-auto**是php7.2版本，实现git自动更新代码
> 5、**7.2-thinkphp6**是ThinkPHP6的，解决location问题




# 7.2-git-auto使用
> 1、需要主机准备私钥，并设置好git的公钥下载

```bash
docker run -d --restart=always --name php-production \
-e GIT_URL=https://github.com/aogg/docker-php-nginx \
-e SSH_KEY="$(cat ~/.ssh/id_rsa | base64)" \
-v /data/php:/app/  \
-p 80:80 -p 443:443 \
--network common-all adockero/php-nginx:7.2-git-auto

```

# 7.2-thinkphp6

```bash
docker run -d --restart=always -e WEB_DOCUMENT_ROOT=/app/public --name php-nginx-7.2 \
 -v /data/php/72/:/app/ --network common-all adockero/php-nginx:7.2-thinkphp6

```


# 7.2-dev-lua-host-dir, 7.4-dev-lua-host-dir（支持xip.io, sslip.io）
1、**curl http://local_dir.local_name.thinkphp.169.254.208.1.sslip.io**  
2、url名称对应文件夹名称，url只支持小写和下划线，所以文件夹也只支持小写和下划线  

```bash
docker run -d --restart=always --name dev-php-lua-host \
--network common-all \
-e XDEBUG_REMOTE_HOST=169.254.208.2 \
-p 80:80 -p 443:443 \
-v /data/www:/app/ \
adockero/php-nginx:7.2-dev-lua-host-dir
```


