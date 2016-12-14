FROM centos:7
MAINTAINER Tomotaka Sakuma

ADD td-agent.repo /etc/yum.repos.d/td-agent.repo
RUN rpm --import http://packages.treasuredata.com/GPG-KEY-td-agent; \
    yum -y install td-agent-2.3.0 && yum clean all
RUN /usr/sbin/td-agent-gem install fluent-plugin-elasticsearch

ENTRYPOINT ["td-agent"]
