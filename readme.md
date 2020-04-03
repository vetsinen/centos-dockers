# Requirements:
# - git
# - composer
# - docker
#
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
# site should now come: http://www.rbdigital.local/rbdigitalinternal/admin (creds as you are in DEV zone)