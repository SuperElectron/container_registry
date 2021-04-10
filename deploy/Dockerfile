FROM ubuntu:18.04
LABEL maintainer="<matmccann@gmail.com>"

# Install deploy dependencies
RUN apt-get update -qq
RUN apt-get install -y -qq \
    software-properties-common \
    sshpass \
    rsync \
    ssh \
    openssh-client


# Install Python 3.6.9
RUN apt-get update
RUN apt-get install -y \
    software-properties-common \

RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y \
    python3.6 \
    python3-pip \


WORKDIR /
COPY requirements.txt /deploy/requirements.txt
RUN pip3 install --upgrade wheel pip setuptools
RUN pip3 install --upgrade -r /deploy/requirements.txt
ENV PYTHONPATH /

RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh
