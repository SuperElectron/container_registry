FROM python:3.6
LABEL maintainer="<matmccann@gmail.com>"

WORKDIR /gstreamer

RUN apt-get update
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

# Python module path for the root import location
ENV PYTHONPATH /

# Create symbolic link for 'docker logs <container-name>'
RUN mkdir -p /gstreamer/logs/
RUN ln -sf /dev/stdout /gstreamer/logs/python.log


# Install klvdata package and fix bug
RUN python3 -m pip install klvdata
RUN sed -i '116,117 s/^/#/' /usr/local/lib/python3.6/site-packages/klvdata/common.py
RUN sed -i '122,123 s/^/#/' /usr/local/lib/python3.6/site-packages/klvdata/common.py
# Install python requirements for project
RUN touch /gstreamer/__init__.py
COPY requirements.txt /gstreamer/requirements.txt
RUN pip3 install --upgrade wheel pip setuptools
RUN pip3 install --upgrade -r /gstreamer/requirements.txt
