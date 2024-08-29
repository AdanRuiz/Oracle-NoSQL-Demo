FROM oraclelinux:8
LABEL maintainer="Adan <adan0001@gmail.com>"

#### Required software
RUN yum -v -y install wget
RUN yum -v -y install sudo
RUN yum -v -y install git
RUN yum -v -y install unzip
RUN yum -v -y install hostname

### OS ons user support
ARG LINUX_GRP=ons
ARG LINUX_USR=ons
ARG LINUX_PASS=Linux8Pass

RUN useradd -m ${LINUX_USR}
RUN usermod -a -G ${LINUX_GRP} ${LINUX_USR}
RUN echo "$LINUX_USR ALL=(ALL:ALL) ALL" | EDITOR='tee -a' visudo
RUN echo "${LINUX_USR}:${LINUX_PASS}" | chpasswd
RUN echo "root:${LINUX_PASS}" | chpasswd

#JDK INSTALL x86
#RUN wget https://javadl.oracle.com/webapps/download/AutoDL?BundleId=248218_ce59cff5c23f4e2eaf4e778a117d4c5b -O jdk8.rpm
#RUN yum install -y jdk8.rpm

#JDK INSTALL AARCH64
RUN wget https://download.oracle.com/java/22/latest/jdk-22_linux-aarch64_bin.rpm
RUN yum install -y jdk-22_linux-aarch64_bin.rpm


RUN wget https://download.oracle.com/graalvm/22/latest/graalvm-jdk-22_linux-aarch64_bin.tar.gz

#ONS
RUN mkdir -p /u02/setup
RUN mkdir -p /u02/elk
RUN mkdir -p /u02/nosql
RUN mkdir -p /u03/nosql
RUN mkdir -p /u04/nosql

RUN chown -R ons:ons /u02
RUN chown -R ons:ons /u03
RUN chown -R ons:ons /u04

#RUN (cd /u02/elk; wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.0-linux-x86_64.tar.gz)
#RUN (cd /u02/elk; wget https://artifacts.elastic.co/downloads/kibana/kibana-7.15.0-linux-x86_64.tar.gz)
#RUN (cd /u02/elk; wget https://artifacts.elastic.co/downloads/logstash/logstash-7.15.0-linux-x86_64.tar.gz)
#RUN (cd /u02/elk; wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.15.0-linux-x86_64.tar.gz)
#RUN (cd /u02/elk; tar -xzvf elasticsearch-7.15.0-linux-x86_64.tar.gz)
#RUN (cd /u02/elk; tar -xzvf kibana-7.15.0-linux-x86_64.tar.gz)
#RUN (cd /u02/elk; tar -xzvf logstash-7.15.0-linux-x86_64.tar.gz)
#RUN (cd /u02/elk; tar -xzvf filebeat-7.15.0-linux-x86_64.tar.gz)

#RUN (cd /u02/elk; wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.7.0-linux-x86_64.tar.gz)
#RUN (cd /u02/elk; wget https://artifacts.elastic.co/downloads/kibana/kibana-8.7.0-linux-x86_64.tar.gz)
#RUN (cd /u02/elk; wget https://artifacts.elastic.co/downloads/logstash/logstash-8.7.0-linux-x86_64.tar.gz)
#RUN (cd /u02/elk; wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.7.0-linux-x86_64.tar.gz)

#RUN (sudo -u ons (cd /u02/elk; tar -xzvf elasticsearch-8.7.0-linux-x86_64.tar.gz))
#RUN (su - ons; cd /u02/elk; tar -xzvf kibana-8.7.0-linux-x86_64.tar.gz)
#RUN (su - ons; cd /u02/elk; tar -xzvf logstash-8.7.0-linux-x86_64.tar.gz)
#RUN (su - ons; cd /u02/elk; tar -xzvf filebeat-8.7.0-linux-x86_64.tar.gz)



#RUN sysctl -q -w vm.max_map_count=262144;


EXPOSE 22/tcp 137/udp 138/udp 139/tcp 445/tcp 8000 8984 8985

CMD ["/bin/bash"]