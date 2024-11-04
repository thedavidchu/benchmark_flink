#!/usr/bin/bash
### @brief  Download Flink Binary (version 1.20.0).

# Get the path for the 'benchmark_flink' directory
DIR="$(git rev-parse --show-toplevel)"

mkdir "$DIR/bin" || exit
cd "$DIR/bin" || exit

wget https://dlcdn.apache.org/flink/flink-1.20.0/flink-1.20.0-bin-scala_2.12.tgz
tar -xzf flink-*.tgz
