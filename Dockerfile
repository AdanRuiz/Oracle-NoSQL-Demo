FROM oraclelinux:8
LABEL maintainer="Adan <adan0001@gmail.com>"

#### Required software
RUN yum -v -y install wget
RUN yum -v -y install sudo
RUN yum -v -y install git

### OS ons user support
ARG LINUX_GRP=ons
ARG LINUX_USR=ons
ARG LINUX_PASS=Linux8Pass

RUN useradd -m ${LINUX_USR}
RUN usermod -a -G ${LINUX_GRP} ${LINUX_USR}
RUN echo "$LINUX_USR ALL=(ALL:ALL) ALL" | EDITOR='tee -a' visudo
RUN echo "${LINUX_USR}:${LINUX_PASS}" | chpasswd
RUN echo "root:${LINUX_PASS}" | chpasswd

EXPOSE 22/tcp 137/udp 138/udp 139/tcp 445/tcp 5000 8000 8984 8985

CMD ["/bin/bash"]