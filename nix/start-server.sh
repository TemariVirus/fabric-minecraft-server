#!/usr/bin/env bash
set -e pipefail
# Exit on Ctrl+C
trap 'exit 130' INT

java -Xms2G -Xmx4G -jar $SERVER_JAR nogui
