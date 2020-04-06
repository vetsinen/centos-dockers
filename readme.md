docker run -it local/xebug /bin/bash

docker run --name=xdebug01 -v /home/pydev/gatewayphp/www:/var/www/projects/gateway/app -p 80:80 -p 443:443 -i -t -d xdebug01

docker run --name=xdebug -v /home/pydev/gatewayphp/www:/var/www/projects/gateway/app -p 80:80 -p 443:443 -i -t -d local/xdebug
docker build  --no-cache --rm -t local/xdebug .
- stop all containers delete all containers
docker stop $(docker ps -a -q) ; docker rm $(docker ps -a -q) 

To additionally remove any stopped containers and all unused images (not just dangling images), add the -a flag to the command:
docker system prune -a

docker build --rm -t local/xebug .

docker stop $(docker ps -a -q) - stop all containers
docker rm $(docker ps -a -q)  -delete all containers

# clone GatewayPHP into e.g. h:\Work\Projects\RBDG\GIT\sourcetree\rbdg1
git checkout develop
cd h:\Work\Projects\RBDG\GIT\sourcetree\rbdg1\www
composer install
# use www.rbdigital.local.zip pack
# unpack it into e.g. h:\Work\Projects\RBDG\Docker
cd h:\Work\Projects\RBDG\Docker
cd base
docker build --rm -t local/centos7-base .
сd ..
cd server-php7
docker build --rm -t local/server-php7 .
docker run --name=gateway-server -v h:\Work\Projects\RBDG\GIT\sourcetree\rbdg1\www:/var/www/projects/gateway/app -p 80:80 -p 443:443 -i -t -d local/server-php7
# edit your hosts file: add
# 127.0.0.1 www.rbdigital.local
# site should now come: http://www.rbdigital.local/    rbdigitalinternal/admin (creds as you are in DEV zone)

service apache2 restart