FROM plexinc/pms-docker:plexpass

MAINTAINER Ryan Parrish <ryan@stickystyle.net>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y build-essential \
    git \
    python3 \
    python-pip \
    software-properties-common

WORKDIR /opt

ADD . . 

RUN pip install --no-cache-dir -r requirements.txt

# Cleanup
RUN apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*
