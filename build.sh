#!/bin/bash
set -e

read -p "Version: " version

sudo podman pull oraclelinux:8
sudo podman build --rm --no-cache -t pritunl-zero .

sudo podman tag pritunl-zero:latest iad.ocir.io/pritunl8472/pritunl-zero:"$version"
sudo podman tag pritunl-zero:latest iad.ocir.io/pritunl8472/pritunl-zero:latest
sudo podman push --authfile=/etc/containers/auth.json iad.ocir.io/pritunl8472/pritunl-zero:"$version"
sudo podman push --authfile=/etc/containers/auth.json iad.ocir.io/pritunl8472/pritunl-zero:latest

sudo podman build --rm --no-cache --format docker -t pritunl-zero .

sudo podman tag pritunl-zero:latest docker.io/pritunl/pritunl-zero:"$version"
sudo podman tag pritunl-zero:latest docker.io/pritunl/pritunl-zero:latest
sudo podman push --authfile=/etc/containers/auth.json docker.io/pritunl/pritunl-zero:"$version"
sudo podman push --authfile=/etc/containers/auth.json docker.io/pritunl/pritunl-zero:latest

echo $version
