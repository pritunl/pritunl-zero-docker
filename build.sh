#!/bin/bash
set -e

sudo docker pull oraclelinux:7
sudo docker build --rm --no-cache -t pritunl-zero .

export version="1.0.1781.40"

sudo docker tag pritunl-zero:latest iad.ocir.io/pritunl8472/pritunl-zero:"$version"
sudo docker tag pritunl-zero:latest iad.ocir.io/pritunl8472/pritunl-zero:latest
sudo docker push --authfile=/etc/containers/auth.json iad.ocir.io/pritunl8472/pritunl-zero:"$version"
sudo docker push --authfile=/etc/containers/auth.json iad.ocir.io/pritunl8472/pritunl-zero:latest

sudo docker build --rm --no-cache --format docker -t pritunl-zero .

sudo docker tag pritunl-zero:latest docker.io/pritunl/pritunl-zero:"$version"
sudo docker tag pritunl-zero:latest docker.io/pritunl/pritunl-zero:latest
sudo docker push --authfile=/etc/containers/auth.json docker.io/pritunl/pritunl-zero:"$version"
sudo docker push --authfile=/etc/containers/auth.json docker.io/pritunl/pritunl-zero:latest

echo $version
