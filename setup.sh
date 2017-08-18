#!/bin/bash

DEBIAN_FRONTEND=noninteractive

apt-get update && \
apt-get install -y python3-minimal python3-pip

pip3 install --no-cache-dir -r requirements.txt

apt-get -y autoremove && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/* && \
  rm -rf /var/tmp/*
