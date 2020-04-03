# Version: 1.0.0
FROM centos:7.4.1708
MAINTAINER RBDG <rbdg@envionsoftware.com>

RUN yum install -y wget ; yum clean all

# [ REPOS]
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN rpm -ivh https://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm

ADD repo/epel.repo /etc/yum.repos.d/epel.repo
ADD repo/remi.repo /etc/yum.repos.d/remi.repo
ADD repo/nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum install -y yum-priorities & yum update -y ; yum clean all
# [/REPOS]

# [ Common]
RUN yum install -y unzip \
  tar \
  telnet \
  patch \
  gcc \
  ; yum clean all
# [/Common]

# [ storage]
RUN mkdir /var/infrastructure && mkdir /var/infrastructure/storage && mkdir /var/infrastructure/storage/data && mkdir /var/infrastructure/storage/source
VOLUME ["/var/infrastructure/storage/data"]
VOLUME ["/var/infrastructure/storage/source"]
# [/storage]

RUN cd /etc && cat hosts > hosts.back && ln -s /var/infrastructure/storage/data/host/srv-hosts

ADD baseinit.sh /var/infrastructure/baseinit.sh
RUN chmod a+rx /var/infrastructure/baseinit.sh
ENTRYPOINT ["/bin/bash", "-c", "/var/infrastructure/baseinit.sh"]

# docker build --rm -t local/centos7-base .
# docker run --name=centos7-base-test -v h:\Work\programs\Docker\centos7\www.rbdigital.test\data:/var/infrastructure/storage/data -i -t -d local/centos7-base
# docker attach centos7-base-test
# docker stop centos7-base-test
# docker start centos7-base-test
# docker rm centos7-base-test