FROM cassandra:3.11.9
LABEL maintainer="<matmccann@gmail.com>"

WORKDIR /

# Setup for Cassandra
COPY entrypoint-wrap.sh .
COPY schema.cql .
COPY cqlsh /root/.cassandra/cqlsh

# Install Python 3.6.9
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository 'ppa:deadsnakes/ppa'
RUN apt-get update
RUN apt-get install -y python3.6 python3-pip

# librdkafka Build from source
RUN apt-get install -y \
    libssl-dev \
    zlib1g-dev \
    gcc \
    g++ \
    make \
    git

RUN git clone https://github.com/edenhill/librdkafka.git
WORKDIR librdkafka
RUN ./configure --prefix /usr
RUN make
RUN make install

WORKDIR /
COPY requirements.txt /database/requirements.txt
RUN pip3 install --upgrade wheel pip setuptools
RUN pip3 install --upgrade -r /database/requirements.txt
ENV PYTHONPATH /

ENTRYPOINT ["/database/entrypoint-wrap.sh"]