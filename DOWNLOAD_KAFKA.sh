#!/usr/bin/bash
# @brief Download Kafka's binary.

# Get the path for the 'benchmark_flink' directory
DIR="$(git rev-parse --show-toplevel)"

if [[ ! -d "$DIR/bin" ]]; then
  mkdir "$DIR/bin" || exit
fi
cd "$DIR/bin" || exit

wget https://dlcdn.apache.org/kafka/3.8.1/kafka_2.13-3.8.1.tgz
tar -xzf kafka_2.13-3.8.1.tgz

