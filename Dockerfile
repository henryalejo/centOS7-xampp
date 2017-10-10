
# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   "Jason Clark" <jclark@redhat.com>

FROM centos:centos7.1.1503
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install wget
RUN wget https://www.apachefriends.org/xampp-files/5.6.31/xampp-linux-x64-5.6.31-0-installer.run
RUN chmod +x xampp-linux-x64-5.6.31-0-installer.run
RUN ./xampp-linux-x64-5.6.31-0-installer.run
#RUN echo "/opt/lampp/lampp start" >> /etc/rc.local

#ADD . /src

#RUN cd /src/ && npm install

RUN yum -y install python-setuptools
RUN easy_install supervisor


EXPOSE 80
EXPOSE 3306

# write a startup script
RUN echo '/opt/lampp/lampp start' >> /startup.sh
RUN echo '/usr/bin/supervisord -n' >> /startup.sh

COPY supervisord.conf /etc/supervisord.conf


#CMD ["opt/lampp/lampp", "start"]

#CMD ["node", "/src/index.js"]


CMD ["sh", "/startup.sh"]

