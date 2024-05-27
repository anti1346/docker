FROM ubuntu:22.04

LABEL website="sangchul.kr"

ARG DEBIAN_FRONTEND=noninteractive
ARG SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD:-root}

ENV SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD}

USER root

RUN apt-get update -qq \
    && apt-get install -qq -y sudo \
        curl \
        wget \
        ssh \
        vim \
        procps \
        net-tools \
        iputils-ping \
        dnsutils \
        git \
        locales \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get update -qq

RUN echo "root:$SSH_ROOT_PASSWORD" | chpasswd \
    && cp -rf /etc/skel/.bash* /root/. \
    && echo 'export PS1="\\[\\033[01;32m\\]\\u\\[\\e[m\\]\\[\\033[01;32m\\]@\\[\\e[m\\]\\[\\033[01;32m\\]\\h\\[\\e[m\\]:\\[\\033[01;34m\\]\\W\\[\\e[m\\]\\$ "' >> ~/.bashrc

CMD ["/usr/bin/bash"]
