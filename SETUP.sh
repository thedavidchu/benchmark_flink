#!/usr/bin/bash
### @brief	Setup the environment to start developing (compile,run,etc) Apache Flink.

# Get the path for the 'benchmark_flink' directory
DIR="$(git rev-parse --show-toplevel)"

# Build Apache Flink
cd "${DIR}/flink"
# NOTE  The following fails if you have even a slightly different version of Maven!
#mvn clean install -DskipTests
# Or build it QUICKLY:
mvn clean install -DskipTests -Dfast -Pskip-webui-build -T 1C

# Build Apache PyFlink
# NOTE  The following fails because of some errors. Ugh.
#python3.11 -m pip install -r flink-python/dev/dev-requirements.txt