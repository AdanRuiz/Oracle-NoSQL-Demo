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

#JDK INSTALL
RUN wget https://javadl.oracle.com/webapps/download/AutoDL?BundleId=248218_ce59cff5c23f4e2eaf4e778a117d4c5b -O jdk8.rpm
RUN yum install -y jdk8.rpm

#ONS
RUN mkdir -p /u02/setup
RUN mkdir -p /u02/nosql
RUN mkdir -p /u03/nosql
RUN mkdir -p /u04/nosql
RUN chown -R ons:ons /u02
RUN chown -R ons:ons /u03
RUN chown -R ons:ons /u04


EXPOSE 22/tcp 137/udp 138/udp 139/tcp 445/tcp 5000 8000 8984 8985

CMD ["/bin/bash"]