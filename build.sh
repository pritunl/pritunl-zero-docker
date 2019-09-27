#!/bin/bash
set -e

sudo docker pull oraclelinux:7
sudo docker build --rm -t pritunl-zero .

export version="1.0.1403.26"
sudo docker tag pritunl-zero:latest docker.io/pritunl/pritunl-zero:"$version"
sudo docker tag pritunl-zero:latest docker.io/pritunl/pritunl-zero:latest
sudo docker push docker.io/pritunl/pritunl-zero:"$version"
sudo docker push docker.io/pritunl/pritunl-zero:latest
echo $version
