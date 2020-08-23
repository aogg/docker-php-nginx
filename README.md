# docker-php-nginx

[![对应容器](http://dockeri.co/image/adockero/php-nginx)](https://hub.docker.com/r/adockero/php-nginx)


php-nginx image based on [webdevops/php-nginx](https://hub.docker.com/r/webdevops/php-nginx) (Contains mysql.so php extensions) （如：增加mysql.so，支持旧框架）

> 1、基础镜像[webdevops/php-nginx](https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-nginx.html)官方文档  
> 2、php镜像也可以参考官方文档：[webdevops/php](https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php.html)  



# 镜像tag
> 1、**5.6-mysql**是php5.6版本增加mysql扩展，内部nginx+fpm的组合。用于支持ecshop这类版本低只用mysql原生类库的  
> 2、**5.6-mysql-php**是php5.6版本增加mysql扩展，内部只有fpm。用于支持ecshop这类版本低只用mysql原生类库的，并使用其他nginx容器指向fpm  
> 3、**7.2-php-lua-host-dir**是php7.2版本，通过lua脚本实现根据将域名的.切换/，实现自动的不同项目文件夹不同域名  
> 4、**7.2-git-auto**是php7.2版本，实现git自动更新代码
