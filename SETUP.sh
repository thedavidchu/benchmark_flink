#!/usr/bin/bash
### @brief	Setup the environment to start developing (compile,run,etc) Apache Flink.

# Activate Docker
sudo docker run flink:latest jobmanager

# Build Apache Flink (quickly)
mvn clean install -DskipTests -Dfast -Pskip-webui-build -T 1C

