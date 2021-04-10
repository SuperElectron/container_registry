#!/bin/bash

# You want to run this with sudo, if not then update the sed commands for klvdata!
# Example usage: sudo ./install_edge.sh
echo "INSTALLATION STEP 1: klvdata (python3.9)"

python3 -m pip install klvdata
sed -i '116,117 s/^/#/' /usr/local/lib/python3.9/site-packages/klvdata/common.py
sed -i '122,123 s/^/#/' /usr/local/lib/python3.9/site-packages/klvdata/common.py


echo "INSTALLATION STEP 2: mist-alpha dependencies"
python3 -m pip install fastavro
python3 -m pip install avro-python3

echo "INSTALLATION STEP 3: kafkacat "
apt-get install -y kafkacat
/usr/bin/kafkacat -V

echo "INSTALLATION STEP 4: GDAL (python) "
apt-get update -y
apt-get install -y libssl-dev zlib1g-dev gcc g++ git software-properties-common ffmpeg libgdal-dev libgdal20
apt-get install -y gdal-bin

export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal
GDAL_VERSION=$(gdal-config --version)
echo "Detecting GDAL version (gdal-config --version) as $GDAL_VERSION and attempting install ..."
python3 -m pip install GDAL==$GDAL_VERSION
echo "successful install: python3 -m pip install GDAL==$GDAL_VERSION\n\n"

echo "INSTALLATION STEP 5: Mist Alpha dependencies for arm64 (python) "
apt-get update
apt-get install -y build-essential libssl-dev libffi-dev libblas3 libc6 liblapack3 gcc python3-dev python3-pip cython3 python3-numpy
python3 -m pip install Cython==0.29.21
python3 -m pip install pandas
python3 -m pip install homography
python3 -m pip install pymap3d
apt-get install -y python3-confluent-kafka
