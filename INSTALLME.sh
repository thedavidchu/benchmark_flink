#!/usr/bin/bash
### @brief	This file is designed to easily set up all of our dependencies to benchmark Apache Flink.
###		Therefore, modify it as necessary.
###		It's hard to test because it modifies system configurations.
### @note	This file is meant for Ubuntu systems.
###		Linux Mint requires at least a different method for installing Docker.

# Get the path for the 'benchmark_flink' directory
DIR="$(git rev-parse --show-toplevel)"

# Update apt
sudo apt update
sudo apt upgrade

# Docker installation
# Source: https://docs.docker.com/engine/install/ubuntu/
# 1. Remove any existing Docker packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
	sudo apt-get remove $pkg
done
# 2. Set up Docker's apt repository
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
# 3. Install the latest version of Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# 4. (OPTIONAL) Test by running some simply program (not included)

# Git clone Apache Flink (or clone this directory with 'git clone --recurse-submodules <link-to-this-repo>'
git submodule update --init --recursive

# Download Docker for Apache Flink
sudo docker pull flink

# (OPTIONAL) Run Docker
sudo docker run flink:latest jobmanager


# # Install Java and Maven
# sudo apt install default-jre
# sudo apt install maven
#
# # Install Python and Pip
# sudo apt install python3
# sudo apt install python3-pip
#
# # Build Apache Flink
# cd "${DIR}/flink"
# ./mvnw clean package -DskipTests
# mvn clean install -DskipTests -Dfast -Pskip-webui-build -T 1C
#
# python -m pip install -r flink-python/dev/dev-requirements.txt

