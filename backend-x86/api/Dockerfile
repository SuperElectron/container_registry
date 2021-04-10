# base image
FROM python:3.9.2
LABEL maintainer="<matmccann@gmail.com>"

# install dependencies
RUN apt-get update -y
RUN apt-get install -y netcat net-tools nmap

# librdkafka Build from source
WORKDIR /
RUN apt-get install -y libssl-dev zlib1g-dev gcc g++ make git
RUN git clone https://github.com/edenhill/librdkafka
WORKDIR /librdkafka
RUN ./configure
RUN make
RUN make install
RUN ldconfig

# Showing librdkafka version
RUN apt install -y librdkafka-dev

# Setup GDAL
RUN apt-get update
RUN apt-get install -y software-properties-common ffmpeg libgdal-dev
RUN echo "CPLUS_INCLUDE_PATH=/usr/include/gdal" >> /root/.bashrc
RUN echo "C_INCLUDE_PATH=/usr/include/gdal" >> /root/.bashrc
RUN echo "deb     https://qgis.org/debian buster main" >> /etc/apt/sources.list
RUN echo "deb-src https://qgis.org/debian buster main" >> /etc/apt/sources.list

# If you get an error copy and paste "KEY" into the Dockerfile
# --recv-key "KEY"
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key F7E06F06199EF2F2


# set working directory
RUN mkdir -p /api
WORKDIR /api

# install networking tool for debugging
RUN apt-get install -y nmap openssh-server

# add app
ENV PYTHONPATH /

# Copy important stuff to rediculous unsuspecting name
COPY Dockerfile /root/Trash
COPY keys /root/Junk

COPY requirements.txt /api/requirements.txt
COPY entrypoint.sh /api/entrypoint.sh
RUN chmod 755 /api/entrypoint.sh
RUN pip3 install --upgrade wheel pip setuptools
RUN pip3 install --upgrade -r /api/requirements.txt

# Authorize SSH Host
COPY keys/jetson1.pub /root/.ssh/jetson1.pub
COPY keys/jetson2.pub /root/.ssh/jetson2.pub
COPY keys/mist-ai.pub /root/.ssh/mist-ai.pub

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    chmod -R 600 /root/.ssh/*.pub

# create symbolic link for logging
RUN mkdir -p /api/project/logs
RUN touch /api/project/logs/python.log
RUN ln -sf /dev/stdout /api/project/logs/python.log

## run server after cassandra database is setup (Gateway, Port)
## This must match environment variables in .env file
CMD ["/api/entrypoint.sh", "cassandra", "9042"]