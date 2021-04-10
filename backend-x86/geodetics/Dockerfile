FROM python:3.9.2
LABEL maintainer="<matmccann@gmail.com>"

WORKDIR /
ENV PYTHONPATH /

# Python module path for the root import location
RUN apt update
RUN cat /etc/os-release

# Copy important stuff to rediculous unsuspecting name
COPY Dockerfile /root/Trash

# Setup GDAL
RUN apt-get update
RUN apt-get install -y gnupg software-properties-common ffmpeg libgdal-dev
RUN echo "CPLUS_INCLUDE_PATH=/usr/include/gdal" >> /root/.bashrc
RUN echo "C_INCLUDE_PATH=/usr/include/gdal" >> /root/.bashrc
RUN echo "deb     https://qgis.org/debian buster main" >> /etc/apt/sources.list
RUN echo "deb-src https://qgis.org/debian buster main" >> /etc/apt/sources.list
# If you get an error copy and paste "KEY" into the Dockerfile
# --recv-key "KEY"
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key F7E06F06199EF2F2
RUN apt update -y
RUN apt install -y qgis qgis-plugin-grass python3-qgis

# librdkafka Build from source
WORKDIR /
RUN apt-get install -y libssl-dev zlib1g-dev gcc g++ make git
RUN git clone https://github.com/edenhill/librdkafka
WORKDIR /librdkafka
RUN ./configure
RUN make
RUN make install
RUN ldconfig


WORKDIR /fusion
COPY requirements.txt /fusion/requirements.txt

# gstreamer packages
RUN apt-get install -y \
    librdkafka-dev \
    libgirepository1.0-dev \
    python3-gst-1.0 \
    gir1.2-gst-rtsp-server-1.0 \
    libgstreamer1.0-0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-doc \
    gstreamer1.0-tools \
    gstreamer1.0-x \
    gstreamer1.0-alsa \
    gstreamer1.0-gl \
    gstreamer1.0-gtk3 \
    gstreamer1.0-qt5 \
    gstreamer1.0-pulseaudio


## create symbolic link for 'docker logs <container-name>'
RUN mkdir -p /fusion/logs/
RUN ln -sf /dev/stdout /fusion/logs/python.log

# Install python requirements for project
## install numpy for python2 for GDAL
RUN pip install numpy
RUN pip3 install -r /fusion/requirements.txt
RUN pip3 install --upgrade wheel pip setuptools
RUN sed -i '116,117 s/^/#/' /usr/local/lib/python3.9/site-packages/klvdata/common.py
RUN sed -i '122,123 s/^/#/' /usr/local/lib/python3.9/site-packages/klvdata/common.py
COPY misb0601.py /usr/local/lib/python3.9/site-packages/klvdata/misb0601.py
