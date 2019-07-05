#!/bin/bash
set -e

sudo docker pull oraclelinux:7
sudo docker build --rm -t pritunl-zero .

export version="v1.0.1317.75"
sudo docker tag pritunl-zero:latest pritunl/pritunl-zero:"$version"
sudo docker tag pritunl-zero:latest pritunl/pritunl-zero:latest
sudo docker push pritunl/pritunl-zero:"$version"
sudo docker push pritunl/pritunl-zero:latest
echo $version
