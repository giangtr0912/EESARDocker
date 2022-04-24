# Dockerfile with Jupyter widget interface for 
# Sequential SAR on Earth Engine
 
# FROM     debian:stretch
FROM osgeo/gdal:ubuntu-small-3.4.1 


MAINTAINER Giang Tran "giangde0912@gmail.com"

ENV     REFRESHED_AT 2022-04-24
 
RUN apt-get update && apt-get install -y \
    python3 \
    build-essential \
    pandoc \
    python3-dev \
    python3-pygments \
    libssl-dev \
    libffi-dev \
    gdal-bin \
    libgdal-dev \
    python3-pip  
    
RUN     pip3 install --upgrade pip   

EXPOSE 8888

# Labels
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="gingtran/geotools"
LABEL org.label-schema.description="GEO Data Sciences"
LABEL org.label-schema.version="1.0.0"
LABEL org.label-schema.vendor="Giang Tran"

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update \
    && apt install -y software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install ffmpeg libsm6 libxext6  -y \
    && apt -y install python3.8 curl \
    && apt-get install -y python3-pip \
    && apt-get install -y gdal-bin \
    && apt-get install -y	python3-gdal \
	&& apt-get install -y python3-geopandas

RUN     pip3 install earthengine-api

COPY    requirements.txt /home 
RUN     pip3 install -r /home/requirements.txt
RUN     pip3 install --global-option=build_ext --global-option="-I/usr/include/gdal" GDAL==2.1.3

RUN     jupyter nbextension enable --py --sys-prefix ipyleaflet

# setup the prov_means library
COPY    prov_means.c /home/prov_means.c
WORKDIR /home
RUN     gcc -shared -Wall -g -o libprov_means.so -fPIC prov_means.c
RUN     mv libprov_means.so /usr/lib/
RUN     rm prov_means.c

# install auxil
COPY    dist/auxil-1.0.tar.gz /home/auxil-1.0.tar.gz
WORKDIR /home
RUN     tar -xzvf auxil-1.0.tar.gz
WORKDIR /home/auxil-1.0
RUN     python3 setup.py install  
WORKDIR /home
RUN     rm -rf auxil-1.0
RUN     rm auxil-1.0.tar.gz

ENV     REFRESHED_AT 2022-04-24

COPY    interface.ipynb /home/interface.ipynb
COPY    dynearthnet.ipynb /home/dynearthnet.ipynb

ADD     scripts /home/scripts
ADD     crc4docker /home/crc4docker
ADD     notebooks /home/notebooks

# ipython notebook startup script
COPY    notebook.sh /
RUN     chmod u+x /notebook.sh

WORKDIR /home  
CMD     ["/notebook.sh"]
