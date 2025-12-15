#!/usr/bin/env bash
set -e pipefail
# cd to script's directory
cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"

nix develop --command bash -c 'java -Xms2G -Xmx4G -jar $SERVER_JAR nogui'
