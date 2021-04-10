FROM ubuntu:18.04
MAINTAINER Wurstmeister
RUN apt-get update
RUN apt-get install -y unzip openjdk-11-jre-headless wget supervisor openssh-server

# Installing docker
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && apt-key fingerprint 0EBFCD88
RUN add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-arm64/
RUN echo 'root:terrasense' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22