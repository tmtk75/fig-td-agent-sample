FROM centos:7
MAINTAINER Tomotaka Sakuma

RUN rpm --import https://packages.treasuredata.com/GPG-KEY-td-agent

RUN echo > /etc/yum.repos.d/td.repo
RUN echo "[treasuredata]"    >> /etc/yum.repos.d/td.repo
RUN echo "name=TreasureData" >> /etc/yum.repos.d/td.repo
RUN echo "baseurl=http://packages.treasuredata.com/2/redhat/\$releasever/\$basearch" >> /etc/yum.repos.d/td.repo
RUN echo "gpgcheck=1" >> /etc/yum.repos.d/td.repo
RUN echo "gpgkey=https://packages.treasuredata.com/GPG-KEY-td-agent" >> /etc/yum.repos.d/td.repo

RUN yum check-update | echo ; echo $?
RUN  yes | yum install -y td-agent

RUN /usr/sbin/td-agent-gem install fluent-plugin-elasticsearch

ENTRYPOINT ["td-agent"]
