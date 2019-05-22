# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   "Jason Clark" <jclark@redhat.com>

FROM centos:centos7.1.1503
MAINTAINER The CentOS Project <cloud-ops@centos.org>

WORKDIR /

RUN yum -y update; yum clean all
RUN yum -y install wget; yum clean all
RUN yum install -y hostname; yum clean all
RUN yum install -y net-tools; yum clean all
RUN yum install -y git; yum clean all
RUN yum install -y sysvinit-tools; yum clean all
RUN yum install -y nano; yum clean all
RUN wget https://www.apachefriends.org/xampp-files/7.1.15/xampp-linux-x64-7.1.15-0-installer.run
RUN chmod +x xampp-linux-x64-7.1.15-0-installer.run
RUN ./xampp-linux-x64-7.1.15-0-installer.run

EXPOSE 22
EXPOSE 80
EXPOSE 3306

# write a startup script
RUN echo '/opt/lampp/lampp start && tail -f /dev/null' >> /startup.sh

COPY httpd-xampp.conf /opt/lampp/etc/extra/httpd-xampp.conf
COPY composer.phar /opt/lampp/htdocs/

CMD ["sh", "/startup.sh"]
